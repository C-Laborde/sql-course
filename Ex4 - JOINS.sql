-- JOIN order_items with products
USE sql_store;
SELECT order_id, oi.product_id, quantity, oi.unit_price
FROM order_items oi
JOIN products p
	ON oi.product_id = p.product_id;


-- JOIN MULTIPLE tables
USE sql_invoicing;

SELECT *
FROM payments p
JOIN payment_methods pm
	ON p.payment_method = pm.payment_method_id
JOIN clients c
	ON p.client_id = c.client_id