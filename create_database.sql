# create schema
create schema if not exists order_form;
# use the schema
use order_form;

#################################################################

# create the tables

drop table if exists sales;

CREATE TABLE sales (
    purchase_id INT AUTO_INCREMENT,
    purchase_date DATE,
    customer_id INT,
    item_id INT,
    quantity INT,
    parcel_id VARCHAR(255),
    arrived BOOLEAN DEFAULT 0,
    shipping_info VARCHAR(255),
    PRIMARY KEY (purchase_id)
);

drop table if EXISTS price_history;

CREATE TABLE price_history (
    history_id INT AUTO_INCREMENT,
    item_id INT,
    update_date DATE,
    price_record_cny DECIMAL(13 , 3 ),
    PRIMARY KEY (history_id)
);

drop table if exists customers;

CREATE TABLE customers (
    customer_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    gender enum('M','F'),
    address VARCHAR(255),
    email_address VARCHAR(255),
    remarks VARCHAR(255),
    PRIMARY KEY (customer_id)
);

drop table if exists items;

CREATE TABLE items (
    item_id INT AUTO_INCREMENT,
    item_name VARCHAR(255),
    price_cny DECIMAL(13 , 3 ),
    company_id INT,
    PRIMARY KEY (item_id)
);


drop table if exists companies;

CREATE TABLE companies (
    company_id INT AUTO_INCREMENT,
    company_name VARCHAR(255) UNIQUE,
    headquarters_phone_num INT(12),
    PRIMARY KEY (company_id)
);

#################################################################
# add foreign keys

alter TABLE sales
add foreign key (customer_id) references customers(customer_id),
add foreign key (item_id) references items(item_id);


alter table items
add foreign key (company_id) references companies(company_id);



#################################################################

# create triggers

delimiter $$

create trigger price_update_update
after update on items
for each row
begin
if new.price_cny != old.price_cny then
	insert into price_history(item_id,update_date,price_record_cny)
    values
    (old.item_id,DATE_FORMAT(SYSDATE(), '%Y-%m-%d'),new.price_cny);
end if;
end $$


create trigger price_update_insert
after insert on items
for each row
begin
	insert into price_history(item_id,update_date,price_record_cny)
    values
    (new.item_id,DATE_FORMAT(SYSDATE(), '%Y-%m-%d'),new.price_cny);
end $$
