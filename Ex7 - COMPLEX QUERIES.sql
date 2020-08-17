-- Find employees that earn more than average
/*USE sql_hr;
SELECT *
FROM employees
WHERE salary > 
	(SELECT
		AVG(salary)
	FROM employees);

USE sql_store;
SELECT *
FROM products
WHERE product_id NOT IN(
	SELECT DISTINCT product_id
	FROM order_items
    )
    

USE sql_invoicing;
SELECT *
FROM clients
WHERE client_id NOT IN	(
	SELECT DISTINCT
		client_id
	FROM invoices
	);


-- Find customers who have ordered lettuce
-- 1) Using WHERE and IN and SUBQUERIES
USE sql_store;
SELECT customer_id, first_name, last_name
FROM customers
WHERE customer_id IN (
	SELECT customer_id
	FROM orders
	WHERE order_id IN (
		SELECT order_id
		FROM order_items
		WHERE product_id = 3
		)
	);

-- Using JOINS
SELECT DISTINCT c.customer_id, c.first_name, c.last_name
FROM order_items oi
JOIN orders o USING(order_id)
JOIN customers c USING(customer_id)
WHERE oi.product_id = 3
*/