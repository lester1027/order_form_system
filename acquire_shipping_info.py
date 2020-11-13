from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support import expected_conditions as EC 
from selenium.webdriver.support.ui import WebDriverWait as wait
from selenium.webdriver.common.by import By


import regex as re
import time
import tkinter as tk

import pymysql.cursors

chrome_options = Options()

def acquire_shipping_info(parcel_id,driver):
    parcel_id = parcel_id
    max_delay = 10
    details = None



    # find the parcel ID entering text field
    #yq_num = wait(driver, max_delay).until(EC.presence_of_element_located((By.ID, 'YQNum')))
    yq_num = driver.find_element_by_id("YQNum")
    # clear the text field
    yq_num.clear()
    # enter the parcel number
    yq_num.send_keys(f'{parcel_id}')
    yq_num.send_keys(Keys.RETURN)

    #find the 'Track' button
    track_button = driver.find_element_by_id('trackBtn')
    # click the 'Track' button
    track_button.click()



    # wait for the iframe containing the information needed to load
    # and swtich to it
    wait(driver, max_delay).until(EC.frame_to_be_available_and_switch_to_it(driver.find_element_by_xpath("//*[starts-with(@id, 'trackIframe')]")))

    # while the details variable is empty
    while details==None:
        # find the 'Copy details' hyperlink
        copy_details_elem = driver.find_element_by_xpath(f'//*[@id="tn-{parcel_id}"]/div[3]/div[1]/ul/li[1]/a')
        details = copy_details_elem.get_attribute('data-clipboard-text')

    # switch back to the default content(frame)
    driver.switch_to.default_content()
    
    # Parse the information

    # use control characters \r and \n to separate each line
    info = re.findall(r'\r\n(.+?)\r\n',str(details),overlapped=True)
    status = info[0]
    status = status.replace('Package status: ','')

    origin_idx = 3
    # if there is status update after the 'Destination: ' line
    if info[origin_idx] != 'Origin:':
        last_update = info[3]
    # if there is no status update after the 'Destination: ' line
    elif info[origin_idx] == 'Origin:':
        last_update = 'N/A'

    return status, last_update



# GUI password input
window = tk.Tk() 
window.title("Database password input")  # to define the title
tk.Label(window, text="Database password: ").grid(row=0)
pw = tk.StringVar()
e1 = tk.Entry(window, textvariable = pw)
e1.grid(row=0, column=1)

tk.Button(window, 
        text='Enter', 
        command=window.quit).grid(row=1, 
                                    column=0, 
                                    sticky=tk.W, 
                                    pady=4)

window.mainloop()
window.destroy()


# Connect to the database
connection = pymysql.connect(host='localhost',
                             user='root',
                             password=pw.get(),
                             db='order_form',
                             charset='utf8mb4',
                             cursorclass=pymysql.cursors.DictCursor)



with connection.cursor() as cursor:
    # select all the sales records with arrived = 0
    sql = "SELECT * FROM sales WHERE arrived = 0"
    cursor.execute(sql)
    result = cursor.fetchall()

driver = webdriver.Chrome('chromedriver.exe', chrome_options=chrome_options)
driver.get("https://extcall.17track.net/en")


for idx,record in enumerate(result):
    print(f'{idx+1}/{len(result)}')
    # parcel_id of the unarrived parcels
    parcel_id = record['parcel_id']
    purchase_id = record['purchase_id']
    
    # use the parcel_id to acquire the status and last_update info.
    status, last_update = acquire_shipping_info(parcel_id,driver)
    with connection.cursor() as cursor:
        sql = f"UPDATE sales SET shipping_info = '{status} {last_update}' WHERE purchase_id = {purchase_id}"
        cursor.execute(sql)
        connection.commit()

driver.close()



