# Write your MySQL query statement below
SELECT Name as Employee FROM Employee as x
WHERE x.Salary > (
    SELECT Salary FROM Employee as y 
    WHERE x.ManagerId = y.Id
) 
