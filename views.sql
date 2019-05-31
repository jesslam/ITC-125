USE world;
-- Do SELECT statement FIRST to ensure everything runs before creating view
-- When duplicate column names create errors, use a column alias
CREATE OR REPLACE VIEW NACityLangs
AS 
	SELECT city.name AS city, country.name AS country, countrylanguage.language
    FROM city JOIN country ON city.countrycode = country.code
			JOIN countrylanguage ON country.code = countrylanguage.countrycode
	WHERE region = 'North America'
    ORDER BY country.name, city.name;
    
SELECT * FROM nacitylangs;

-- This is an alternate way to create aliases for columns
CREATE OR REPLACE VIEW NACityLangs
	(City, Country, Language)
AS 
	SELECT city.name, country.name, countrylanguage.language
    FROM city JOIN country ON city.countrycode = country.code
			JOIN countrylanguage ON country.code = countrylanguage.countrycode
	WHERE region = 'North America'
    ORDER BY country.name, city.name;
    
-- Note that although this joins two tables, insert only applies to one base table
CREATE OR REPLACE VIEW CountryLangs
	(`Code`, Country, `Language`)
AS
    SELECT countrycode, country.name, language
	FROM country JOIN countrylanguage ON country.code = countrylanguage.countrycode;
INSERT INTO CountryLangs
	(`Code`, `Language`)
	VALUES('USA','Norwegian');
    
SELECT * FROM CountryLangs;
	