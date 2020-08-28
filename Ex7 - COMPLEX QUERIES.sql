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
WHERE oi.product_id = 3;


-- Select employees whose salary is above the average in their office
USE sql_hr;
SELECT *
FROM employees e
JOIN (
	SELECT office_id, AVG(salary) AS "avg_salary"
	FROM employees
	GROUP BY office_id) AS avg_salary
    ON avg_salary.office_id = e.office_id
WHERE salary > avg_salary;

-- ANOTHER WAY: CORRELATED SUBQUERIES (subquery correlated with the outer
-- query). The subquery gets executed for each row in the outer query so they
-- can be very slow.
SELECT *
FROM employees e
WHERE salary > (
	SELECT AVG(salary)
    FROM employees
	WHERE office_id = e.office_id
)


-- Get invoices that are larger than the client's average invoice amount
USE sql_invoicing;
SELECT *
FROM invoices i
WHERE invoice_total > (
	SELECT AVG(invoice_total)
    FROM invoices
    WHERE client_id = i.client_id
)


-- Find the products that have never been ordered
USE sql_store;
SELECT *
FROM products p
WHERE NOT EXISTS (
	SELECT oi.product_id
    FROM order_items oi
    WHERE oi.product_id = p.product_id
    );
    

-- Write a query to return client_id, name, total_sales, average sales
-- and difference between total_sales and average_sales
USE sql_invoicing;
SELECT
	client_id,
    name,
    (SELECT
		SUM(invoice_total)
	FROM invoices
	WHERE client_id = c.client_id) AS total_sales,
    (SELECT
		AVG(invoice_total)
	FROM invoices) AS average,
    (SELECT total_sales - average)
FROM clients c
*/