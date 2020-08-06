-- BASIC AGGREGATIONS
USE sql_invoicing;
SELECT
	"First half of 2019" AS "Date range",
	SUM(invoice_total) AS "Total Sales",
    SUM(payment_total) AS "Total payments",
    SUM(invoice_total - payment_total) AS "What we expect"
FROM invoices
WHERE invoice_date BETWEEN "2019-01-01" AND "2019-06-30"

UNION

SELECT
	"Second half of 2019" AS "Date range",
	SUM(invoice_total) AS "Total Sales",
    SUM(payment_total) AS "Total payments",
    SUM(invoice_total - payment_total) AS "What we expect"
FROM invoices
WHERE invoice_date BETWEEN "2019-07-01" AND "2019-12-31"

UNION

SELECT
	"Total" AS "Date range",
	SUM(invoice_total) AS "Total Sales",
    SUM(payment_total) AS "Total payments",
    SUM(invoice_total - payment_total) AS "What we expect"
FROM invoices;


-- GROUP BY
SELECT
	date,
    pm.name AS payment_method,
    SUM(amount) AS total_payments
FROM payments p
JOIN payment_methods pm
	ON p.payment_method = pm.payment_method_id
GROUP BY date, payment_method
ORDER BY date;


-- HAVING
USE sql_store;
/*SELECT
	order_id,
    SUM(quantity * unit_price) as total_spent
FROM order_items oi
GROUP BY order_id*/

SELECT
	customer_id,
	SUM(oi.quantity * oi.unit_price) as total_spent
FROM orders o
LEFT JOIN customers c
	USING(customer_id)
JOIN order_items oi
	USING(order_id)
WHERE state="VA"
GROUP BY customer_id
HAVING total_spent > 100

