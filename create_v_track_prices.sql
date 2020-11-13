CREATE VIEW v_track_prices AS
    SELECT 
        *
    FROM
        v_sales_price_history vsp1
    WHERE
        date_diff = (SELECT 
                MIN(vsp2.date_diff)
            FROM
                v_sales_price_history vsp2
            WHERE
                vsp1.purchase_id = vsp2.purchase_id);