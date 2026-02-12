-- Write your PostgreSQL query statement below
WITH people AS 
    (SELECT requester_id AS id FROM RequestAccepted
    UNION ALL SELECT accepter_id AS id FROM RequestAccepted)

SELECT DISTINCT *, COUNT(*) AS num
FROM people
GROUP BY id
ORDER BY num DESC
LIMIT 1;
