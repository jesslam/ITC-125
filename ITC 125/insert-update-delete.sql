USE AP;
-- inserting row values with columns specified
INSERT invoices
	(vendor_id, invoice_number, invoice_date, invoice_total, 
    payment_total, credit_total, terms_id, invoice_due_date)
VALUES
	(97, 456789, '2016-01-21', 4394.18, 0.00, 0.00, 3, '2016-02-21');
    
-- inserting row values without columns specified
INSERT invoices
VALUES (DEFAULT, 11, '567890', '2016-1-21', 1729.13, 500.00, 1229.13, 4, '2016-3-21', NULL);

-- update the first Invoices row added today (115)
UPDATE invoices
SET invoice_total = 1729.14
WHERE invoice_id = 115;

-- delete the Invoice table row you added today (115)
DELETE FROM invoices
WHERE invoice_id = 115;

-- if deleting multiple rows, you could use
-- WHERE invoice_id > 114;