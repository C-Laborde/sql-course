-- Create a view to see the balance for each client
USE sql_invoicing;
CREATE OR REPLACE VIEW clients_balance AS
SELECT
	c.client_id,
	c.name,
    SUM(i.invoice_total - i.payment_total) AS balance
FROM invoices i
JOIN clients c
	USING(client_id)
GROUP BY c.client_id, c.name

