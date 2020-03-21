-- Exercise 1
SELECT * FROM employees
WHERE department IN 
	(SELECT department FROM departments 
	 WHERE division = 'Electronics')

-- Exercise 2
SELECT * FROM employees
WHERE region_id IN 
	(SELECT region_id FROM regions WHERE country IN ('Asia','Canada'))

-- Exercise 3
SELECT * FROM employees
WHERE salary > 130000
AND region_id IN 
	(SELECT region_id FROM regions WHERE country IN ('Asia','Canada'))

-- Exercise 4
-- Third column: difference in salary with MAX(salary)
-- The subquery generates a whole column from MAX, which is only one value
SELECT first_name, department, (SELECT MAX(salary) FROM employees) - salary difference
FROM employees
WHERE region_id IN 
	(SELECT region_id FROM regions WHERE country IN ('Asia','Canada'))