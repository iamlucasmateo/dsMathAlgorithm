-- Exercise 1
-- Employees by department, Total at the end
SELECT department, COUNT(*)
FROM employees
GROUP BY department
UNION ALL
SELECT 'TOTAL', SUM(1) FROM employees
