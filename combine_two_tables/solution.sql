# Write your MySQL query statement below
SELECT a.FirstName, a.LastName, b.City, b.State 
    FROM Person as a 
    LEFT JOIN Address as b
    ON a.PersonId = b.PersonId
