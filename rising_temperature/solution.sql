# Write your MySQL query statement below
# SELECT Id
# FROM Weather as A
# WHERE A.Temperature > (
#     SELECT B.Temperature 
#     FROM Weather as B 
#     WHERE ABS(DATEDIFF(A.RecordDate, B.RecordDate)) = 1 and A.RecordDate > B.RecordDate) 

SELECT * 
FROM Weather as A JOIN Weather as B
ON A.RecordDate >= B.RecordDate
