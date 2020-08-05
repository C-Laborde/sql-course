SELECT
	"First half of 2019" AS "Date range",
	SUM(invoice_total) AS "Total Sales",
    SUM(payment_total) AS "Total payments",
    SUM(invoice_total - payment_total) AS "What we expect"
FROM invoices
WHERE invoice_date BETWEEN "2019-01-01" AND "2019-06-30"

UNION

SELECT
	"Second half of 2019" AS "Date range",
	SUM(invoice_total) AS "Total Sales",
    SUM(payment_total) AS "Total payments",
    SUM(invoice_total - payment_total) AS "What we expect"
FROM invoices
WHERE invoice_date BETWEEN "2019-07-01" AND "2019-12-31"

UNION

SELECT
	"Total" AS "Date range",
	SUM(invoice_total) AS "Total Sales",
    SUM(payment_total) AS "Total payments",
    SUM(invoice_total - payment_total) AS "What we expect"
FROM invoices