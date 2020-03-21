-- Exercise: average excluding maximum and minimum
SELECT ROUND(AVG(salary)) FROM employees
WHERE salary > (SELECT MIN(salary) FROM employees)
AND salary < (SELECT MAX(salary) FROM employees)

-- With subqueries
SELECT ROUND(AVG(salary)) FROM employees
WHERE salary NOT IN (
	(SELECT MIN(salary) FROM employees),
	(SELECT MAX(salary) FROM employees)
	);

