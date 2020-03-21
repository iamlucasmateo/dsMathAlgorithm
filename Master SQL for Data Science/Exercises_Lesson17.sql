-- Exercise 1
SELECT first_name, COUNT(*) how_many
FROM employees
GROUP BY first_name
HAVING COUNT(*) > 1
ORDER BY how_many DESC

-- Exercise 2 (without DISTINCT)
SELECT department
FROM employees
GROUP BY department

-- with DISTINCT
SELECT DISTINCT department
FROM employees

-- Exercise 3
SELECT SUBSTRING(email,(POSITION('@' IN email)+1)) domain_name,COUNT(*)
FROM employees
GROUP BY domain_name

-- Exercise 4
SELECT SUBSTRING(email,(POSITION('@' IN email)+1)) domain_name,COUNT(*)
FROM employees
WHERE email IS NOT NULL
-- where clause is not asked for in the exercise
GROUP BY domain_name
ORDER BY COUNT(*) DESC
-- ordering not asked for

-- Exercise 5
SELECT gender, region_id, MIN(salary), MAX(salary), AVG(salary)
FROM employees
GROUP BY gender,region_id
ORDER BY gender, region_id


