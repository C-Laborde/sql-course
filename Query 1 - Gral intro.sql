USE sql_store;

SELECT
	--  use * to select all columns
    -- AS to define an alias
    -- " " to allow blank space in alias
	last_name,
    first_name,
    points,
    points + 10 AS discount,
    (points + 10) * 10 AS "super discount"
FROM customers
-- WHERE customer_id = 1
ORDER BY last_name;

SELECT *
FROM Customers
WHERE state = "VA";
-- operators =, != (same as <>), >, <, enclose dates with quotes!
-- WHERE birth_date > "1986-04-01"