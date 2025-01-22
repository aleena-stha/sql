
use Fewa_Boating_DB
--Alias		
--SQL aliases are used to give a table, or a column in a table, a temporary name.

	--Alias Column Syntax
		--SELECT column_name AS alias_name
		--FROM table_name;		
		SELECT sailor_add FROM Sailor	--without aliase
		SELECT sailor_add AS ADDRESS FROM Sailor	--with aliase
		
		
		-- Alias Table Syntax
		--SELECT column_name(s)
		--FROM table_name AS alias_name;

		/* Aliases can be useful when:
			-There are more than one table involved in a query
			-Functions are used in the query
			-Column names are big or not very readable
			-Two or more columns are combined together
	
	*/

	--Note: It requires double quotation marks or square brackets if the alias name contains spaces:
		--SELECT column_name AS [alias name]
		--FROM table_name;	

		SELECT sailor_add AS [Sailor Address] FROM Sailor

		SELECT sailor_add AS "Sailor Address" FROM Sailor


		
--The MIN() function returns the smallest value of the selected column.
--MIN() Syntax
	--SELECT MIN(column_name)
	--FROM table_name
	--WHERE condition;

	--Example -> To find the minimum ratings of the sailor

	SELECT MIN(sailor_rating)  from Sailor

	SELECT MIN(sailor_rating) AS [Minmum Rating] from Sailor --as minimum rating  alias is changed as column name

	
--The MAX() function returns the largest value of the selected column.
--MAX() Syntax
	--SELECT MAX(column_name)
	--FROM table_name
	--WHERE condition;
--Example -> Find the maximum age of a sailor.
		SELECT max(sailor_age) AS [ Maximum Age] from Sailor
		

--The COUNT() function returns the number of rows that matches a specified criterion.

--COUNT() Syntax
	--SELECT COUNT(column_name)
	--FROM table_name
	--WHERE condition;

	--Example -> Count the number of a sailor who is older than 35.

	select * from Sailor where sailor_age> 35

	select COUNT(sailor_id) from Sailor where sailor_age> 35
	


--The AVG() function returns the average value of a numeric column. 

--AVG() Syntax
	--SELECT AVG(column_name)
	--FROM table_name
	--WHERE condition;

	--Example -> find the average rating given by the CUSTOMER

	SELECT AVG(cus_rating) FROM Boating 
		


		
--The SUM() function returns the total sum of a numeric column. 

--SUM() Syntax
	--SELECT SUM(column_name)
	--FROM table_name
	--WHERE condition;

	--Find the total rating given by the customer.
	SELECT SUM(cus_rating) FROM Boating 


	--The IN operator allows you to specify multiple values in a WHERE clause.

--IN Syntax
--SELECT column_name(s)
	--FROM table_name
	--WHERE column_name IN (value1, value2, ...);

	SELECT sailor_name FROM Sailor WHERE sailor_rating=1
 
SELECT sailor_name FROM Sailor WHERE sailor_rating=3--Using where it show single value or check a single condition
SELECT sailor_name FROM Sailor WHERE sailor_rating=5 --It allows to compare multiple value 

SELECT sailor_name FROM Sailor WHERE sailor_rating IN (1,3,5) --IN  it show multiple value in a single condition

			--OR
	--SELECT column_name(s)
	--FROM table_name
	--WHERE column_name IN (SELECT STATEMENT);

	--FIND THE NAME OF THE SAILOR WHO ARE FROM 'Lekhnath' AND 'Bijaypur'
		SELECT DISTINCT sailor_name FROM Sailor WHERE sailor_add IN ('Lekhnath', 'Bijaypur')--Distinct  means different since hary are two over there so only one harry is shown
		
	--FIND THE NAME OF THE SAILOR WHO ARE NOT FROM 'Lekhnath' AND 'Bijaypur'
		SELECT DISTINCT sailor_name FROM Sailor WHERE sailor_add NOT IN ('Lekhnath', 'Bijaypur')
	--FIND THE NAME OF THE SAILOR WHO ARE FROM THE SAME PLACE OF CUSTOMER.

	SELECT DISTINCT sailor_name FROM Sailor WHERE sailor_add IN (SELECT customer_add FROM Customer)
		


