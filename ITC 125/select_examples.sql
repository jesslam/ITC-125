USE ex;

SELECT *
FROM active_invoices;

SELECT invoice_number, invoice_date, invoice_total
FROM active_invoices;

SELECT invoice_number, invoice_total - credit_total
FROM active_invoices;

SELECT invoice_number AS 'Invoice', invoice_total - credit_total AS 'Cash Total'
FROM active_invoices;

SELECT DISTINCT vendor_id
FROM active_invoices;

SELECT customer_last_name, customer_first_name
FROM customers;

SELECT CONCAT(customer_last_name, ', ', customer_first_name) AS 'Full Name'
FROM customers;

SELECT customer_first_name, customer_last_name, customer_state
FROM customers
WHERE customer_state = 'IL';

SELECT customer_first_name, customer_last_name, customer_state
FROM customers
WHERE customer_state = 'WA' OR customer_state = 'OR';

SELECT customer_last_name
FROM customers
WHERE customer_last_name > 'Jones';

SELECT customer_first_name, customer_last_name, customer_phone
FROM customers
WHERE customer_phone LIKE '(503%';

SELECT customer_first_name, customer_last_name, customer_state
FROM customers
WHERE customer_state IN ('WA', 'ID', 'WY');

SELECT *
FROM active_invoices
WHERE invoice_date LIKE '2014-04%' AND invoice_total > 1500
ORDER BY invoice_date DESC;

SELECT DISTINCT vendor_id
FROM active_invoices
WHERE terms_id = 4 OR terms_id = 5
ORDER BY vendor_id;

SELECT invoice_number
FROM active_invoices
WHERE invoice_number LIKE '%-%'
ORDER BY invoice-number;

SELECT invoice_number, invoice_total * 0.015 AS 'Total 




