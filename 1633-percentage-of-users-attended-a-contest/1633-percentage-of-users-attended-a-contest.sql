-- Write your PostgreSQL query statement below
SELECT contest_id, 
        COALESCE(ROUND(COUNT(u.user_id) / (SELECT COUNT(*) FROM Users)::NUMERIC * 100, 2), 0) AS percentage
FROM Users u
INNER JOIN Register r
ON u.user_id = r.user_id
GROUP BY contest_id
ORDER BY percentage DESC, contest_id;