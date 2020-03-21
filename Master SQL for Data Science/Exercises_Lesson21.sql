-- Exercise 1
SELECT * FROM employees
WHERE department IN 
	(SELECT department FROM departments WHERE division = 'Kids')
AND hire_date > ALL (
	SELECT hire_date FROM employees WHERE department = 'Maintenance')

-- Exercise 2
SELECT salary, COUNT(salary) FROM employees
GROUP BY salary
HAVING COUNT(salary) > 1
ORDER BY COUNT(salary) DESC, salary DESC
LIMIT 1