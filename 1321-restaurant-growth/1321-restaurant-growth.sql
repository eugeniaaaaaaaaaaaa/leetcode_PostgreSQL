-- Write your PostgreSQL query statement below
WITH result AS 
    (SELECT DISTINCT visited_on,
            SUM(amount) OVER w AS amount,
            ROUND(SUM(amount) OVER w / 7::NUMERIC, 2) AS average_amount
    FROM Customer
    WINDOW w AS (ORDER BY visited_on RANGE BETWEEN '6 days' PRECEDING AND CURRENT ROW)
    ORDER BY visited_on)

SELECT *
FROM result
WHERE visited_on > 5 + (SELECT MIN(visited_on) FROM Customer)