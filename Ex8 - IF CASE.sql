/*SELECT 
	CONCAT(c.first_name, " ", c.last_name) AS "customer",
    IFNULL(phone, "Unknown") AS "phone"
FROM customers c;


SELECT
	p.product_id,
    p.name,
	count(oi.order_id) AS orders,
    IF(count(oi.order_id) > 1, "Many times", "Once") AS frequency
FROM order_items oi
LEFT JOIN products p USING(product_id)
GROUP BY p.product_id, p.name;
*/

SELECT
	CONCAT(c.first_name, " ", c.last_name) AS customer,
    c.points,
	CASE
		WHEN c.points > 3000 THEN "Gold"
        WHEN c.points BETWEEN 2000 AND 3000 THEN "Silver"
        WHEN c.points < 2000 THEN "Bronze"
	END AS "Category"
FROM customers c
ORDER BY points DESC