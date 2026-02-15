-- Write your PostgreSQL query statement below
SELECT MAX(salary) AS SecondHighestSalary
FROM (SELECT DISTINCT salary FROM Employee ORDER BY salary DESC OFFSET 1)