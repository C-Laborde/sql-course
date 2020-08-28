SELECT 
	CONCAT(c.first_name, " ", c.last_name) AS "customer",
    IFNULL(phone, "Unknown") AS "phone"
FROM customers c