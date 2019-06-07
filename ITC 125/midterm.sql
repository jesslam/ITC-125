-- Jessica Lam
-- 1. Short Answer
/* a. Relationships: One-to-many relationships are the most common relationship type,
where a row in a table relates to one or more in another table.  This relationship is
determined by a foreign key in one table that refers to a primary key in another table.
The foreign key in this relationship exists in the "many" table.
In many-to-many relationships, there is a marriage of two tables that usually creates a
linking table. Each table in this type of relationship has a primary key that will create a 
composite key in the linking table, which will be the result of two or more foreign key
columns.

SQL uses these relationships to enforce referential integrity by ensuring there are no
orphans.  To ensure that data remains in sync, changes made to a foreign key will effect
change to the primary key it refers to, so any changes must reflect consistency in both.
Primary keys must not be duplicated in database tables either or invalid data may be
entered, which would compromise the trustworthiness of how the tables relate to one another
as well as the overall data. 
*/

/* b. Joins: 
An inner join will join two tables using matching data, meaning a table may have a column
with data that exists, but if it doesn't match up with the join conditions laid out, that
unmatched data will not be shown in the resulting values.  
An outer join will join two tables and result in all the rows of one of the tables, even
if that table contains data that is null or does not match with the other table.
An inner join may be used when you want to match up a certain vendor from a vendors table
to all the invoices associated with that vendor in the invoices table, but not include 
unmatched invoices, like those associated with other vendors.
An outer join may be used when you want to search both the vendor and invoices table to find
unpaid invoices which may include null values in an invoice date column.
*/

-- 2. Define Terms
-- a. DBMS: Database Management System manages data that is stored in the system.
-- b. DDL: Data Definition Language is to create databases and work with objects within databases.
-- c. DML: Data Manipulation Language is to use and work with data and objects in databases.
-- d. EER: Enhanced Entity Relationship refers to a diagram that shows the relationships between tables 
--			which are defined by how foreign and primary keys relate to one another. 
-- e. Foreign key: A foreign key refers to a primary key in another table.
-- f. Implicit conversion: SQL will automatically convert an expression's data type when trying to compare 
-- 			and evaluate it with another expression, like comparing an an number to a number contained
--			in a string may mean SQL will try to read the string as a number data type.
-- g. Order of precedence: Unless parentheses are used, the order of precedence is how expressions are
--			evaluated from left to right.  In the case of arithmetic expressions, multiplication, division
--			and modulo operators are also performed first.
-- h. Primary key: A primary key is a unique column in a table that helps define a specific set of values in a row.
-- i. Referential integrity: Referential integrity ensures data is in sync by keeping PKs and FKs in sync and avoiding
--			duplicate PKs.  This is the desired state of the database, where tables and the relationships between them,
--			are considered trustworthy.
-- j. Relational database: A relational database consists of tables based on real-world entities that relate to 
--			one another through the relationship of column PKs to FKs.

-- 3. Write SQL
-- 3.4 Queries
-- a.
SELECT AuthorLName, AuthorFName
FROM Author
WHERE AuthorFName = 'Parker';

-- b.
SELECT AuthorFName, AuthorLName
FROM Author
WHERE AuthorBirthYear >= 1959 AND AuthorBirthYear <= 1974;

-- c.
SELECT AuthorFName, AuthorLName
FROM Author
WHERE AuthorBirthYear IS BETWEEN 1959 AND 1974
ORDER BY AuthorBirthYear DESC;

-- d.
SELECT AuthorFName AS 'First Name', AuthorLName AS 'Last Name'
FROM Author
WHERE AuthorBirthYear IS NULL;

-- e.
SELECT BookTitle
FROM Book
WHERE BookTitle IS LIKE '%SQL%' AND '%beginner%'
ORDER BY BookYear DESC;

-- f.
SELECT BookISBN, BookTitle, FormatPrice
FROM Book 
	JOIN Format ON Book.BookISBN = Format.BookISBN
WHERE FormatType = 'Electronic';

-- g.
SELECT AuthorLName, AuthorFName, BookTitle
FROM Author 
	JOIN BookAuthor ON Author.AuthorId = BookAuthor.AuthorId
	JOIN Book ON Book.BookISBN = BookAuthor.BookISBN
ORDER BY BookTitle;

-- h.
SELECT AuthorLName, AuthorFName, BookTitle, FormatType, FormatPrice
FROM Author 
	JOIN BookAuthor ON Author.AuthorId = BookAuthor.AuthorId
	JOIN Book ON BookAuthor.BookISBN = Book.BookISBN
	JOIN Format ON Book.BookISBN = Format.BookISBN
WHERE FormatPrice <= 10.00 
ORDER BY FormatPrice DESC;

-- 3.5 Add/Edit/Remove Data
-- i.
INSERT INTO Book
	VALUE (8765432109, 'SQL Mastery', 2016);
	
-- j. 
INSERT INTO Author
	(AuthorId, AuthorLName, AuthorFName, AuthorBirthYear)
	VALUE (DEFAULT, 'McDoyle', 'Arthur', 1944);

-- k. 
UPDATE BookAuthor
SET AuthorID = 4567
WHERE BookISBN = 8765432109;

-- l.
UPDATE Author
SET AuthorBirthYear = 1945
WHERE AuthorId = 4567;

-- m.
UPDATE Author
SET AuthorBirthYear + 1
WHERE AuthorId = 4567;

-- n.
DELETE Format.FormatType = 'Paperback'
FROM Format
WHERE BookISBN = 8574635234;

-- o.
DELETE * FROM Book;
	

-- 4.2
SELECT p1.Name AS Person, p2.Name AS Parent
FROM People p1 JOIN People p2
WHERE p1.Id = p2.Id;

-- 4.3 
SELECT p1.Name AS Person, p2.Name AS Parent
FROM People p1 JOIN People p2





