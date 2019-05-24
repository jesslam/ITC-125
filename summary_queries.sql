USE ap;

# Demonstrate all the common aggregate functions
SELECT COUNT(*) AS InvCount,
		SUM(invoice_total) AS Total,
        ROUND(AVG(invoice_total),2) AS Average,
        MIN(invoice_total) AS Lowest,
        MAX(invoice_total) AS Highest
FROM Invoices;

#Summary by vendor
SELECT vendor_id AS Vendor,
		COUNT(invoice_id) AS InvCount,
		SUM(invoice_total) AS Total,
        ROUND(AVG(invoice_total),2) AS Average,
        MIN(invoice_total) AS Lowest,
        MAX(invoice_total) AS Highest
FROM Invoices
GROUP BY vendor_id;

#This is an example of using unnecessarily using aggregate functions by 
#invoice date when you're grouping by vendor id
SELECT invoice_date AS InvDate,
		COUNT(invoice_id) AS InvCount,
		SUM(invoice_total) AS Total,
        ROUND(AVG(invoice_total),2) AS Average,
        MIN(invoice_total) AS Lowest,
        MAX(invoice_total) AS Highest
FROM Invoices
GROUP BY vendor_id;

#This includes both the summary by vendor AND the grand total at the end
SELECT vendor_id AS Vendor,
		COUNT(invoice_id) AS InvCount,
		SUM(invoice_total) AS Total,
        ROUND(AVG(invoice_total),2) AS Average,
        MIN(invoice_total) AS Lowest,
        MAX(invoice_total) AS Highest
FROM Invoices
GROUP BY vendor_id WITH ROLLUP;

#Filtering already summarized data further 
#(first by vendor, then by vendors with >= 3 invoices)
SELECT vendor_id AS Vendor,
		COUNT(*) AS InvCount,
		SUM(invoice_total) AS Total,
        ROUND(AVG(invoice_total),2) AS Average,
        MIN(invoice_total) AS Lowest,
        MAX(invoice_total) AS Highest
FROM Invoices
GROUP BY vendor_id WITH ROLLUP
HAVING InvCount >= 3;

#ORDER BY is incompatible with WITH ROLLUP
SELECT vendor_id AS Vendor,
		COUNT(*) AS InvCount,
		SUM(invoice_total) AS Total,
        ROUND(AVG(invoice_total),2) AS Average,
        MIN(invoice_total) AS Lowest,
        MAX(invoice_total) AS Highest
FROM Invoices
GROUP BY vendor_id
HAVING InvCount >= 3
ORDER BY InvCount DESC;

SELECT city, COUNT(*)
FROM customer
		JOIN address USING (address_id)
        JOIN city USING (city_id)
GROUP BY city
HAVING COUNT(*) > 1;
    
