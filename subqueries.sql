#Step 1 - write, test and record results for inner query
USE om;
SELECT AVG(unit_price)
FROM items;
#Result of 16.52 is a scalar value

#Step 2 - write outer query, hard-coding the result
SELECT unit_price
FROM items
WHERE unit_price > 16.52;

#Step 3 - combine
SELECT unit_price
FROM items
WHERE unit_price > (
	SELECT AVG(unit_price)
	FROM items
);

USE ap;

#Step 1
SELECT account_number 
FROM general_ledger_accounts
WHERE account_description LIKE '%account%';

#Step 2
SELECT vendor_name FROM vendors
WHERE default_account_number IN (591, 200, 110);

#Step 3
SELECT vendor_name FROM vendors
WHERE default_account_number IN (
	SELECT account_number 
	FROM general_ledger_accounts
	WHERE account_description LIKE '%account%'
);


