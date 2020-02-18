# Write your MySQL query statement below
SELECT x.Name as Employee 
FROM 
    Employee as x,
    Employee as y
WHERE 
    x.ManagerId = y.Id AND x.Salary > y.Salary
    
