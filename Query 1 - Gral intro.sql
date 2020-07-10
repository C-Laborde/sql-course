/* Order of clauses
SELECT
FROM
WHERE
ORDER BY
LIMIT
*/


USE sql_store;

/*
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
-- WHERE state = "VA";
-- operators =, != (same as <>), >, <, enclose dates with quotes!
WHERE birth_date > "1990-01-01" OR 
	(points > 1000 AND	state = "VA");
-- logical operators order: 1) (), 2) AND, 3) OR,


SELECT *
FROM customers
WHERE state IN ("VA", "FL", "GA");
-- the above is a better alternative for the line below
-- WHERE state = "VA" OR state = "FL" OR state = "GA";


SELECT *
FROM customers
WHERE points BETWEEN 1000 AND 3000;


-- retrieve rows that match a specific string pattern
SELECT *
FROM customers
-- % indicates any nr of characters
-- WHERE last_name LIKE 'b%';
-- WHERE last_name LIKE '%b%';
-- _ indicates exact number of characters, single character
WHERE last_name LIKE 'b____y';


-- ----  REgular EXpressions ----

SELECT *
FROM customers
WHERE last_name REGEXP 'field';
-- the above is the same as the line below
-- WHERE last_name LIKE '%field%';


SELECT *
FROM customers
-- ^ indicates the beginning of a string.
-- Below, the last_name must begin with field
-- WHERE last_name REGEXP '^field';
-- $ indicates the end of a string
-- WHERE last_name REGEXP 'field$';
-- | pipe indicates OR, multiple search patterns. 
-- Below, field or mac should be in the string
-- WHERE last_name REGEXP 'field|mac';
-- In the case below, last_name should begin with field, mac or rose
-- WHERE last_name REGEXP 'field$|caf|rose|^bet';
-- Below, string contains e and char before e is either g, i or m
-- WHERE last_name REGEXP '[gim]e';
-- Also a range of chars before/after a char can be searched for:
WHERE last_name REGEXP 'e[a-h]';


-- Missing values
SELECT *
FROM customers
WHERE phone IS NULL;


-- ORDER BY
SELECT first_name, last_name
FROM customers
-- we can sort by columns that are not selected 
ORDER BY state DESC, first_name


SELECT first_name, last_name, 10 AS points
FROM customers
ORDER BY points, first_name;

-- LIMIT
SELECT *
FROM customers
-- the first number is an offset
LIMIT 6, 3;



-- ---- JOINS ----
-- INNER JOIN on same DB
SELECT order_id, o.customer_id, first_name, last_name
FROM orders o
JOIN customers c
	ON o.customer_id = c.customer_id;
*/    

-- JOINS ACROSS DIFFERENT DBs
SELECT *
FROM sql_store.order_items oi
JOIN sql_inventory.products p
	ON oi.product_id = p.product_id