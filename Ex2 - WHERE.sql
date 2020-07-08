-- Get the orders placed this year

USE sql_store;

SELECT *
FROM orders
WHERE order_date >= "2019-01-01"