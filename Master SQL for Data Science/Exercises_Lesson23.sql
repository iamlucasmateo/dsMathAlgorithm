-- Add categories  based on criteria to table
SELECT first_name,
CASE
    WHEN salary <= 100000 THEN 'underpaid'
    WHEN salary > 100000 THEN 'wellpaid'
    END AS category
FROM employees


-- Average salary per category (alternative)
SELECT a.category, SUM(salary) FROM (
	SELECT salary,
		CASE
			WHEN salary < 100000 THEN 'Underpaid'
			WHEN  salary < 100000 AND salary < 160000 THEN 'Paid Well'
			ELSE 'Executive'
		END AS category
	FROM employees) a
GROUP BY a.category


-- Average salary per category (tranposed)
SELECT ROUND(AVG(CASE WHEN salary < 100000 THEN salary ELSE 0 END)) as "Underpaid Total",
ROUND(AVG(CASE WHEN salary >= 100000 THEN salary ELSE 0 END)) as Wellpaid
FROM employees

