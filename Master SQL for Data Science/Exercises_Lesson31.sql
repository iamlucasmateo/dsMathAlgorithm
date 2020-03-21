-- Exercise 1
-- Oldest and newest employee, with department and country
-- No join
SELECT first_name,hire_date,e.department,country
FROM employees e, regions r
WHERE e.region_id = r.region_id
AND (hire_date = (SELECT MIN(hire_date) FROM employees)
	OR hire_date = (SELECT MAX(hire_date) FROM employees))

-- Inner join
SELECT first_name,hire_date,e.department,country
FROM employees e INNER JOIN regions r
ON e.region_id = r.region_id
WHERE hire_date = (SELECT MIN(hire_date) FROM employees)
OR hire_date = (SELECT MAX(hire_date) FROM employees)

-- Exercise 2
-- Salary spending change every 90 days
SELECT hire_date, salary,
(SELECT SUM(salary) FROM employees e2
 WHERE e2.hire_date BETWEEN e.hire_date - 90 AND e.hire_date) as spending_pattern
FROM employees e
ORDER BY hire_date