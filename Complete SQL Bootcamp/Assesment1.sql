
-- 1. Return the customer IDs of customers who have spent at least $110 with 
-- 	the staff member who has an ID of 2.
-- The answer should be customers 187 and 148.

SELECT customer_id suma FROM payment p
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) >= 110

-- 2. How many films begin with the letter J?
-- The answer should be 20.

SELECT COUNT(*) FROM film
WHERE SUBSTRING(title FROM 1 FOR 1) = 'J'

-- 3. What customer has the highest customer ID number whose name starts with an 'E' 
-- 	and has an address ID lower than 500?
-- The answer is Eddie Tomlin

SELECT customer_id,address_id,first_name,last_name FROM customer
WHERE SUBSTRING(first_name FROM 1 FOR 1) = 'E'
AND address_id < 500
AND customer_id = (SELECT MAX(customer_id) FROM customer
				   WHERE SUBSTRING(first_name FROM 1 FOR 1) = 'E'
				  AND address_id < 500)