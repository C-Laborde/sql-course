SELECT
	customer_id,
	first_name,
    points,
    "Bronze" as type
FROM customers
WHERE points < 2000

UNION

SELECT
	customer_id,
	first_name,
    points,
    "Silver" as type
FROM customers
WHERE points BETWEEN 2000 AND 3000

UNION

SELECT
	customer_id,
	first_name,
    points,
    "Gold" as type
FROM customers
WHERE 3000 <= points 
ORDER BY first_name
