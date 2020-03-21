-- Exercise 1
-- Inner join, no nulls
SELECT first_name, email, division
FROM employees e, departments d
WHERE e.department = d.department
AND e.email IS NOT NULL

-- Exercise 2
SELECT first_name, email, division, country
FROM employees e, departments d, regions r
WHERE e.department = d.department
AND e.region_id = r.region_id
AND e.email IS NOT NULL

-- Exercise 3
-- Total employees by country
SELECT country, COUNT(*)
FROM employees e,regions r
WHERE e.region_id = r.region_id
GROUP BY r.country