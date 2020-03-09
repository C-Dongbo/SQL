# Write your MySQL query statement below
SELECT S2.new_id AS id, S1.student
FROM seat S1, (
    SELECT id, (CASE 
                WHEN id % 2 = 0 THEN id - 1
                WHEN id % 2 != 0 AND id = (SELECT COUNT(*) FROM seat) THEN id
                ELSE id + 1
                END) AS new_id
    FROM seat) S2
WHERE S1.id = S2.id
Order by S2.new_id
