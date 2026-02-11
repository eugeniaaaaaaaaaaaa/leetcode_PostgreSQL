-- Write your PostgreSQL query statement below
WITH last_changes AS 
    (SELECT product_id, MAX(change_date) AS last_change_date
    FROM Products
    WHERE change_date <= '2019-08-16'::DATE
    GROUP BY product_id),

    last_prices AS
    (SELECT p.product_id AS product_id, new_price AS price
    FROM Products p
    JOIN last_changes lc 
    ON p.product_id = lc.product_id AND p.change_date = lc.last_change_date)


SELECT *
FROM last_prices

UNION

SELECT  product_id, 10 AS price
FROM Products
WHERE product_id NOT IN (SELECT product_id FROM last_prices)