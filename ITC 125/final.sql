-- Short Answer
-- 2.1 Views
/* Views act much like virtual tables, but unlike tables, they do not actually store any data themselves.
Instead, they are SELECT statements that refer to data in base tables, which store the actual, current data.
Views are helpful because they help limit exposure of the database to external users and applications,
as well as restricting access to certain types of information, like confidential salary rates, for example.
Views are also much easier read for end users who won't have to parse through complicated joins.  One of the
disadvantages is that in order to update views, they need to fulfill specific parameters, like updating only
one base table at a time and not containing GROUP BY, HAVING, UNION or DISTINCT. */

-- 2.2 Foreign Key CONSTRAINTS
/* When SQL sees a user attempt to violate a constraint by deleting a PK row corresponding to an existing FK row, it
will either perform a RESTRICT, CASCADE, or SET NULL action on the data.
Restrict will generate an error for the user, rendering the user unable to complete the deletion.
Cascade will mean that the deletion in the PK row will actually cascade the deletion to the corresponding FK row
also, so the action takes place in both tables.
Set Null will allow the deletion in PK row, but will set a null value in the corresponding FK row. */

-- 3 Create Tables, Relationships, and Constraints
-- 3.2 Task
DROP DATABASE IF EXISTS Medical;
CREATE DATABASE IF NOT EXISTS Medical;
USE DATABASE Medical;
CREATE TABLE Doctor (
	DoctorID INT PRIMARY KEY,
	DoctorLName VARCHAR(45),
	DoctorFName VARCHAR(45)
	);

CREATE TABLE Patient (
	PatientId INT PRIMARY KEY,
	DoctorId INT
	PatientLName VARCHAR(45),
	PatientFName VARCHAR(45),
	PatientFirstSeen DATE,
	PatientPhone CHAR(10)
	CONSTRAINT DoctorID FOREIGN KEY REFERENCES Doctor(DoctorId)
	);
	
CREATE INDEX patient_phone_idx ON
	Patient(PatientPhone);
	
-- 4 Define Terms
/* a. 1NF: First Normal Form is the first normal form in normalization, where one is organizing data in data
structures into related tables to reduce data redundancy.  This form aims to eliminate duplicate column data.
b. 3NF: Third Normal Form is the third normal form in normalization. A database is considered normalized
if it has gone through the third normal form.  Each row should contain unique values that depend on the PK.
c. Aggregate Function: Also known as a column function, these functions perform calculations on column values.
d. Base Table: A base table is the what is referred to in the FROM clause of a VIEW's SELECT statement.
It is where the actual data that the VIEW refers to is stored.
e. Denormalization: This is where a DBA usually makes the decision to denormalize a database to make it seem
less complicated, particularly in the case of complex joins.  Usually applied to normal forms four and beyond, 
this may involved walking the database back to third normal form.
f. Index: An index is used to point to a specific row rather than parsing through all data rows in order to find
specific information, usually on columns that are updated infrequently and is meant to make data quicker to find
especially when queried often.
g. Nested View: This is a view within another view, where rather than referring to base tables, it actually
calls for data based on the SELECT statement of a VIEW.
h. Summary Query: A query that uses one or more aggregate functions.
i. Table-level Constraint: A constraint that applies to an entire table and helps establish the table's relationship
to other tables.  For example, establishing a FK that relates to the PK table.
j. Updateable View: A VIEW that is able to update data in the corresponding base table but must not update more than 
one base table at a time, cannot have DISTINCT, GROUP BY, HAVING or UNION and cannot violate table constraints. */

-- 5 Summary Queries
-- a 
SELECT SUM(InvAmt) 
FROM Invoice WITH ROLLUP;

-- b
SELECT MIN(CustBal) AS 'LowestCustBal', MAX(CustBal) AS 'HighestCustBal'
FROM Customer;

-- c
SELECT CustId, SUM(InvAmt)
FROM Invoice
GROUP BY CustId
HAVING SUM(InvAmt) > 5000
ORDER BY InvAmt DESC;

-- 6 Write Subqueries
-- a
SELECT DISTINCT CustId, 
FROM Invoice
WHERE AVG(InvAmt) >
	(SELECT AVG(InvAmt)
	FROM Invoice);
	
-- b
SELECT InvNum, InvAmt
FROM Invoice
	JOIN Customer USING (CustId)
WHERE
	(SELECT CustId, CustState
	FROM Customer
	WHERE CustState = TX OR CustState = NM or CustState = AZ
	);
	
-- 7 Construct Views
-- a
CREATE OR REPLACE VIEW CustInvs AS
SELECT CustId AS 'Customer ID', CustBal AS 'Customer Balance', 
	InvNum AS 'Invoice Numbers', InvAmt AS 'Invoice Amounts'
FROM Customer
	JOIN Invoice ON Customer.CustId = Invoice.CustId;
	
-- b
CREATE OR REPLACE VIEW HonorRole AS
SELECT StudId, StudGradeAvg
FROM Student
WHERE StudGradeAvg > 3.8 
WITH CHECK OPTION;	






