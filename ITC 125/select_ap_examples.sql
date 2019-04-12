#This is a comment
-- This is also a comment

/* This is another form of commenting */

-- select all columns (all rows by default)
SELECT *
FROM invoices;

-- specify certain columns
SELECT invoice_id, invoice_total
FROM invoices;

-- renaming output columns
SELECT invoice_id AS Id, invoice_total AS 'Inv Total'
FROM invoices;

-- you can do math
SELECT invoice_id AS Id, invoice_total * 1.02 AS 'New Inv Total'
FROM invoices;

-- formatting to display two decimal places, but turns them into STRINGS (not required for course)
SELECT invoice_id AS Id, FORMAT(invoice_total * 1.02, 2) AS 'New Inv Total'
FROM invoices;

-- display rows to suppress duplicates
SELECT DISTINCT vendor_id
FROM invoices;

-- display rows to suppress duplicates, but more columns listed 
-- means combinations suppress less duplication
SELECT DISTINCT vendor_id, invoice_total
FROM invoices;
