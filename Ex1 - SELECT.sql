-- Return all products
-- 	name
-- 	unit price
--  new price (unit price * 1.1)
USE sql_inventory;

SELECT
	name,
    unit_price, 
    unit_price * 1.1 AS new_price
FROM
	products;
