CREATE VIEW v_sales_price_history AS
    SELECT 
        s.*,
        p.update_date,
        p.price_record_cny,
        DATEDIFF(s.purchase_date, p.update_date) as date_diff
    FROM
        sales s
            INNER JOIN
        price_history p ON s.item_id = p.item_id
    WHERE
        s.purchase_date >= p.update_date;