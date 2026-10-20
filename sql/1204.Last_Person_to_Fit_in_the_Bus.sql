# Write your MySQL query statement below
/* Write your T-SQL query statement below */
WITH weight_ AS (SELECT
    person_name,
    SUM(weight) OVER (ORDER BY turn) as Total_Weight
from Queue
),

weight_flag AS (
    SELECT 
        *,
        CASE
            WHEN Total_Weight <= 1000 THEN 1 ELSE 0 END AS flag
    FROM weight_
)

SELECT person_name FROM weight_flag
WHERE flag = 1
ORDER BY Total_Weight DESC
LIMIT 1




