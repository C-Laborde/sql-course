-- Find employees that earn more than average
SELECT *
FROM employees
WHERE salary > 
	(SELECT
		AVG(salary)
	FROM employees)