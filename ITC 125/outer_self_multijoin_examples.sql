-- OUTER JOINS
USE ap;
SELECT vendor_name AS "Vendor", account_description AS "Account"
FROM vendors v
	LEFT JOIN general_ledger_accounts g
		ON v.default_account_number = g.account_number
WHERE account_description != "State Corporation Income Taxes"
ORDER BY account_description, vendor_name;
-- OUTER JOINS

-- SELF JOIN
USE ex;
SELECT emps.last_name, emps.first_name, mgrs.last_name, mgrs.first_name
FROM employees emps JOIN employees mgrs
	ON emps.manager_id = mgrs.employee_id;
-- SELF JOIN

-- JOIN MORE THAN TWO TABLES
USE ap;
SELECT DISTINCT vendor_name, line_item_description
FROM vendors JOIN invoices USING (vendor_id)
			 JOIN invoice_line_items USING (invoice_id)
WHERE vendor_name NOT IN ('postmaster', 'united parcel service')
ORDER BY 1, 2;
-- JOIN MORE THAN TWO TABLES
    
