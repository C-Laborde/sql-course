-- Get the customers whose first names are ELKA or AMBUR
USE sql_store;
SELECT *
FROM customers
WHERE first_name REGEXP 'ELKA|AMBUR';

-- Get the customers whose last names end with EY or ON
SELECT * 
FROM customers
WHERE last_name REGEXP 'EY$|ON$';

-- Get the customers whose last names start with MY or contains SE
SELECT *
FROM customers
WHERE last_name REGEXP '^MY|SE';

-- Get the customers whose last names contain B followed by R or U
SELECT *
FROM customers
WHERE last_name REGEXP 'B[RU]'	-- alternative 'BR|BU'