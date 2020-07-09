-- Get the orders placed this year
USE sql_store;
SELECT *
FROM orders
WHERE order_date >= "2019-01-01";


-- From the order_items_table, get the items
--	for order 6
-- 	where the total price is greater than 30
SELECT *
FROM order_items
WHERE order_id = 6 AND quantity * unit_price > 30;


-- Return products with
-- 	quanity in stock equal to 49, 38, 72
USE sql_inventory;
SELECT *
FROM products
WHERE quantity_in_stock IN (49, 38, 72);


-- Return customers born between 1/1/1990 and 1/1/2000
USE sql_store;
SELECT *
FROM customers
WHERE birth_date BETWEEN "1990-01-01" AND "2000-01-01";


-- Get the customers whose addresses contain TRAIL or AVENUE
SELECT *
FROM customers
WHERE address LIKE '%TRAIL%' OR 
	  address LIKE '%AVENUE%';


-- Get the customers whose phone number end with 9
SELECT *
FROM customers
WHERE phone LIKE '%9';


-- Get the orders that are not shipped yet
SELECT *
FROM orders
WHERE shipped_date IS NULL;

-- Get orders with order id 2 sorted by total price
SELECT *, quantity * unit_price AS total_price
FROM order_items
WHERE order_id = 2
ORDER BY total_price DESC;

-- Get the top three customers
SELECT *
FROM customers
ORDER BY points DESC
LIMIT 3
