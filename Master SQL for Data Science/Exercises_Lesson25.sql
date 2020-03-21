-- Exercise 1
-- departments with more than 38 employees
-- Uncorrelated subqueries
SELECT department FROM (
	SELECT department, COUNT(*) AS cuenta
	FROM employees
	GROUP BY department) sub
WHERE sub.cuenta > 38

-- Tambien
SELECT department FROM (
	SELECT department, COUNT(*) AS cuenta
	FROM employees
	GROUP BY department
	HAVING COUNT(*) > 38)

-- Correlated subqueries (me funciona como un for loop)
SELECT department, 
(SELECT COUNT(*) FROM employees e WHERE d.department = e.department)
FROM departments d
WHERE 38 < (SELECT COUNT(*) FROM employees e 
			WHERE d.department = e.department) 

-- Exercise 2
-- Highest paid employee salary for department
SELECT department, MAX(salary)
FROM employees
GROUP BY department
ORDER BY department

-- With correlated subqueries
SELECT department,
(SELECT MAX(salary) FROM employees e WHERE d.department = e.department)
FROM departments d
ORDER BY department

-- Diferencia: no están los mismos departamentos


