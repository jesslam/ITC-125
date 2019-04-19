SELECT vendor_name AS "Vendor", terms_description AS "Default Terms"
FROM vendors JOIN terms ON default_terms_id = terms_id
ORDER BY terms_description, vendor_name;

SELECT vendor_name, invoice_number, invoice_date
	FROM vendors 
		JOIN invoices USING (vendor_id)
WHERE invoice_date >= "2014-06-01" AND invoice_date <= "2014-07-31"
#WHERE invoice_date BETWEEN "2014-06-01" AND "2014-07-31";
ORDER BY invoice_date DESC, vendor_name;

SELECT vendors.vendor_id, vendor_name, invoice_number, invoice_date
FROM vendors 
	INNER JOIN invoices 
		ON vendors.vendor_id = invoices.vendor_id
WHERE invoice_date >= "2014-06-01" AND invoice_date <= "2014-07-31"
#WHERE invoice_date BETWEEN "2014-06-01" AND "2014-07-31";
ORDER BY vendors.vendor_id, invoice_date DESC;

SELECT v.vendor_id, vendor_name, invoice_number, invoice_date
FROM vendors v
	INNER JOIN invoices i
		ON v.vendor_id = i.vendor_id
WHERE invoice_date >= "2014-06-01" AND invoice_date <= "2014-07-31"
#WHERE invoice_date BETWEEN "2014-06-01" AND "2014-07-31";
ORDER BY v.vendor_id, invoice_date DESC;

-- Implicit Join
SELECT invoice_number, credit_total, terms_description
FROM invoices, terms
WHERE terms.terms_id = invoices.terms_id AND credit_total > 0
ORDER BY credit_total DESC;
-- Implicit Join


