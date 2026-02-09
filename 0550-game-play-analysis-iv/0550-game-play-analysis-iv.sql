-- Write your PostgreSQL query statement below
SELECT ROUND(COUNT(*) / (SELECT COUNT(DISTINCT player_id)::NUMERIC FROM Activity), 2) AS fraction
FROM Activity
WHERE (player_id, event_date - 1) IN (SELECT player_id, MIN(event_date) FROM Activity GROUP BY player_id)