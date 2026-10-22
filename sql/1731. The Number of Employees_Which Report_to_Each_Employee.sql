/* Write your T-SQL query statement below */
WITH count_reports_to AS (
    SELECT
        reports_to,
        count(reports_to) as reports_count,
        coalesce(SUM(age) * 1.0 / count(reports_to),0) as average_age
    FROM Employees
    GROUP BY reports_to
)
SELECT
    A.employee_id,
    A.name,
    B.reports_count,
    ROUND((B.average_age),0) AS average_age
FROM Employees A
LEFT JOIN count_reports_to B on A.employee_id = B.reports_to
WHERE reports_count is not null