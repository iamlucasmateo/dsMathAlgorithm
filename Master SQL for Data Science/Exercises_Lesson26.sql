-- Exercise 1
-- Show department, first_name, salary for highest and lowest salary
-- for each department. Also a columns that clarifies (high/low)
SELECT department, first_name, salary,
CASE WHEN salary = 
				(SELECT MAX(salary) FROM employees e2 
				WHERE e2.department = e1.department GROUP BY department) 
				THEN 'Highest Salary' ELSE 'Lowest Salary' END
FROM employees e1
WHERE salary = (SELECT MAX(salary) FROM employees e2 
				WHERE e2.department = e1.department GROUP BY department)
OR salary = (SELECT MIN(salary) FROM employees e2 
				WHERE e2.department = e1.department GROUP BY department)
ORDER BY department