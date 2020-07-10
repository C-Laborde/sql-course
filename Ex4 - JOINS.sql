-- JOIN order_items with products
USE sql_store;
SELECT order_id, oi.product_id, quantity, oi.unit_price
FROM order_items oi
JOIN products p
	ON oi.product_id = p.product_id;


-- JOIN MULTIPLE tables
USE sql_invoicing;
SELECT 
	p.date,
    p.invoice_id,
    p.amount,
    c.name,
    pm.name AS payment_method
FROM payments p
JOIN payment_methods pm
	ON p.payment_method = pm.payment_method_id
JOIN clients c
	ON p.client_id = c.client_id;


-- OUTER JOIN
USE sql_store;
SELECT
	p.product_id,
    p.name,
    oi.quantity
FROM products p
LEFT JOIN order_items oi
	ON p.product_id = oi.product_id;
    
SELECT
	o.order_date,
	o.order_id,
    c.first_name AS customer,
    s.name AS shipper,
    os.name as status
FROM orders o
JOIN customers c
	ON o.customer_id = c.customer_id
LEFT JOIN shippers s
	ON o.shipper_id = s.shipper_id
JOIN order_statuses os
	ON o.status = os.order_status_id
ORDER BY o.status;

-- USING clause
USE sql_invoicing;
SELECT
	p.date,
    c.name AS client,
    p.amount,
    pm.name
FROM payments p
JOIN clients c
	USING (client_id)
JOIN payment_methods pm
	ON p.payment_method = pm.payment_method_id;


-- CROSS JOINS
USE sql_store;
SELECT *
-- implicit syntax
-- FROM shippers s, products p
-- explicit syntax
FROM shippers s
CROSS JOIN products p
