# Write your MySQL query statement below
# SELECT IFNULL(MAX(Salary),null) as SecondHighestSalary FROM Employee as t1
# WHERE (SELECT COUNT(*) FROM Employee as t2 WHERE t2.Salary <= t1.Salary) = 2


SELECT IFNULL((SELECT DISTINCT Salary  FROM Employee
ORDER BY Salary DESC 
LIMIT 1 OFFSET 1), null) as SecondHighestSalary

