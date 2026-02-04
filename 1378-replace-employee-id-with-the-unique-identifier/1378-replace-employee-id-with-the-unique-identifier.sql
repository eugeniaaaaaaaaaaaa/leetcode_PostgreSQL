-- Write your PostgreSQL query statement below
SELECT uni.unique_id, empl.name
FROM EmployeeUNI uni RIGHT JOIN Employees empl ON uni.id = empl.id