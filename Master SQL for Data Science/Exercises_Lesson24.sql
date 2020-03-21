-- Exercise 1, transposition
-- Total employees for each department as column
SELECT 
SUM(CASE WHEN department = 'Sports' THEN 1 ELSE 0 END) sports, 
SUM(CASE WHEN department = 'Tools' THEN 1 ELSE 0 END) tools,
SUM(CASE WHEN department = 'Clothing' THEN 1 ELSE 0 END) clothing,
SUM(CASE WHEN department = 'Computers' THEN 1 ELSE 0 END) computers
FROM employees

-- Exercise 2
-- Region_id as columns
SELECT first_name, 
(CASE WHEN region_id = 1 THEN (SELECT country FROM regions WHERE region_id = 1) END) region_1,
(CASE WHEN region_id = 2 THEN (SELECT country FROM regions WHERE region_id = 2) END) region_2,
(CASE WHEN region_id = 3 THEN (SELECT country FROM regions WHERE region_id = 3) END) region_3,
(CASE WHEN region_id = 4 THEN (SELECT country FROM regions WHERE region_id = 4) END) region_4,
(CASE WHEN region_id = 5 THEN (SELECT country FROM regions WHERE region_id = 5) END) region_5,
(CASE WHEN region_id = 6 THEN (SELECT country FROM regions WHERE region_id = 6) END) region_6,
(CASE WHEN region_id = 7 THEN (SELECT country FROM regions WHERE region_id = 7) END) region_7
FROM employees

-- Exercise 3
-- Total employees for each country
-- As rows
SELECT country, COUNT(*) FROM (	
	SELECT first_name,
	CASE 
		WHEN region_id = 1 THEN (SELECT country FROM regions WHERE region_id = 1)
		WHEN region_id = 2 THEN (SELECT country FROM regions WHERE region_id = 2)
		WHEN region_id = 3 THEN (SELECT country FROM regions WHERE region_id = 3)
		WHEN region_id = 4 THEN (SELECT country FROM regions WHERE region_id = 4)
		WHEN region_id = 5 THEN (SELECT country FROM regions WHERE region_id = 5)
		WHEN region_id = 6 THEN (SELECT country FROM regions WHERE region_id = 6)
		ELSE (SELECT country FROM regions WHERE region_id = 6)
	END country
	FROM employees) a
GROUP BY a.country

-- As columns
SELECT 
SUM(CASE WHEN a.country = 'Asia' THEN 1 ELSE 0 END) Asia,
SUM(CASE WHEN a.country = 'Canada' THEN 1 ELSE 0 END) Canada,
SUM(CASE WHEN a.country = 'United States' THEN 1 ELSE 0 END) united_states
FROM (SELECT first_name,
	  CASE 
		WHEN region_id = 1 THEN (SELECT country FROM regions WHERE region_id = 1)
		WHEN region_id = 2 THEN (SELECT country FROM regions WHERE region_id = 2)
		WHEN region_id = 3 THEN (SELECT country FROM regions WHERE region_id = 3)
		WHEN region_id = 4 THEN (SELECT country FROM regions WHERE region_id = 4)
		WHEN region_id = 5 THEN (SELECT country FROM regions WHERE region_id = 5)
		WHEN region_id = 6 THEN (SELECT country FROM regions WHERE region_id = 6)
		ELSE (SELECT country FROM regions WHERE region_id = 6)
      END country
	  FROM employees) a

-- With correlated subqueries
SELECT first_name,
(SELECT country FROM regions e2 WHERE e1.region_id = e2.region_id) country
FROM employees e1


