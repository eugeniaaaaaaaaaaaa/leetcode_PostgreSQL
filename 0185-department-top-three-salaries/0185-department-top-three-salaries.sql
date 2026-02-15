-- Write your PostgreSQL query statement below
SELECT Department, Employee, Salary
FROM (SELECT id, name AS Department FROM Department) d
INNER JOIN (SELECT  DENSE_RANK() OVER(PARTITION BY departmentId ORDER BY salary DESC) AS place, 
                    name AS Employee, salary AS Salary, departmentId 
            FROM Employee) e
ON e.departmentID = d.id
WHERE e.place < 4
