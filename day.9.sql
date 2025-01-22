--Day 9

--Between : it list out data from certain range
--The BETWEEN operator selects values within a given range. The values can be numbers, 
	--text, or dates.
		--BETWEEN Syntax
			--SELECT column_name(s)
			--FROM table_name
			--WHERE column_name BETWEEN value1 AND value2;

-- Example 
--find the name of the sailor who are between 25 and 35 age.
use Fewa_Boating_DB
SELECT sailor_name, sailor_age FROM Sailor WHERE sailor_age BETWEEN 25 AND 35
SELECT sailor_name, sailor_age  FROM sailor WHERE sailor_age BETWEEN 30 and 35


--QSN
--FIND THE NUMBER OF CUSTOMER WHO HAVE SAILED IN 2016 
 WHO HAVE SAILED IN JAN  DEC


 --GROUP
 --THE GROUP BY statement groups rows that have the same values into summary  rows--kun sailor le kun customer sanga sail garyo

	--GROUP BY Syntax
		--SELECT column_name(s)
		--FROM table_name
		--WHERE condition
		--GROUP BY column_name(s)
		--ORDER BY column_name(s

	--Example
		--FIND THE TOTAL NUMBER OF SAILOR WHO HAS SAME RATING.	

		SELECT cus_rating, COUNT(Boating_ID)  FROM Boating		
		GROUP BY cus_rating

		SELECT cus_rating, COUNT(Boating_ID) AS [Total Sailor] FROM Boating		
		GROUP BY cus_rating
		
 SELECT COUNT (Boating_ID ) AS [total Sailor] from boating  group by cus_rating


 --JOIN 
 --A JOIN clause is used to combine rows from two or more tables, based on a related column between them.

 --INNER JOIN 
 --The INNER JOIN keyword selects records that have matching values in both tables.

 

	--Example
		--14.	Find all the information of the sailors who have reserved boat.
		
		SELECT * FROM Sailor
			INNER JOIN reserve
			ON Sailor.sailor_id = reserve.Sailor_id

		SELECT Sailor.sailor_name,reserve.Reserve_date FROM Sailor
			INNER JOIN reserve
			ON Sailor.sailor_id = reserve.Sailor_id

		SELECT S.sailor_name,R.Reserve_date FROM Sailor S
			INNER JOIN reserve R
			ON S.sailor_id = R.Sailor_id

 --SELECT  column_name(s)
 --FROM table1
 --INNER JOIN table2
 --ON table1.column_name = table2.column_name;
 use Fewa_Boating_DB
 SELECT * FROM Sailor 
 INNER  JOIN reserve
 ON Sailor.sailor_id= reserve.sailor_id -- 2 ota table bata info lina we need  common column


 --The LEFT JOIN keyword returns all records from the left table (table1), 
	--and the matching records from the right table (table2). 
	--The result is 0 records from the right side, if there is no match.

	--	LEFT JOIN Syntax
		--SELECT column_name(s)
		--FROM table1
		--LEFT JOIN table2
		--ON table1.column_name = table2.column_name;

	--The RIGHT JOIN keyword returns all records from the right table (table2),
	--and the matching records from the left table (table1). 
	--The result is 0 records from the left side, if there is no match.
	--RIGHT JOIN Syntax
		--SELECT column_name(s)
		--FROM table1
		--RIGHT JOIN table2
		--ON table1.column_name = table2.column_name;

	--The FULL OUTER JOIN keyword returns all records 
	--when there is a match in left (table1) or right (table2) table records.
	
	--FULL OUTER JOIN Syntax
		--SELECT column_name(s)
		--FROM table1
		--FULL OUTER JOIN table2
		--ON table1.column_name = table2.column_name
		--WHERE condition;

		
	--A self join is a regular join, but the table is joined with itself.

	--Self Join Syntax
		--SELECT column_name(s)
		--FROM table1 T1, table1 T2
		--WHERE condition;

	--Example
		--FIND THE NAME OF A CUSTOMER WHO ARE FROM THE SAME ADDRESS.
		SELECT  customer_name  FROM  Customer   WHERE  customer_add in (SELECT  distinct customer_add from  customer )
 
 --LIST OUT SAILOR NAME AND RESERVED DATE
 SELECT  Sailor.sailor_name ,reserve.Reserve_date FROM Sailor
 INNER  JOIN reserve
 ON Sailor.sailor_id= reserve.sailor_id 
 
 
 ---USE OF ALIAS
 SELECT  S.sailor_name ,R.Reserve_date  FROM Sailor S  -- IT CHANGE NAME IN TABLE
 INNER  JOIN reserve  R ON S.sailor_id= R.sailor_id 


  SELECT  S.sailor_name as [S],R.Reserve_date as [R] FROM Sailor S --IT CHANGE SHOWN COLUMN NAME
 INNER  JOIN reserve  R ON S.sailor_id= R.sailor_id 

 --UNION
 --The UNION operator is used to combine the result-set of two or more SELECT statements.

		--UNION Syntax
			--SELECT column_name(s) FROM table1
			--UNION
			--SELECT column_name(s) FROM table2;

			SELECT sailor_name FROM Sailor
			UNION
			SELECT customer_name FROM Customer
 --RULES: we  use union  for 2 tables  , no of columns should be same and respective domain datatype   (varchar,varchar)should be same


 
	-- Example 
		-- List all the address of the persons who were there in boating.
			SELECT customer_add FROM Customer UNION SELECT customer_add FROM Customer
	
	--The SQL INTERSECT clause/operator is used to combine two SELECT statements, 
	--but returns rows only from the first SELECT statement that are identical to 
	--a row in the second SELECT statement. 

		--INTERSECT Syntax
			--SELECT column_name(s) FROM table1
			--INTERSECT
			--SELECT column_name(s) FROM table2;

		--EXAMPLE
			--List the address where customer and sailor are from same place. 
			
			SELECT  customer_add  FROM Customer INTERSECT  SELECT  sailor_add FROM Sailor
 
 --show 
 SELECT sailor_name AS NAME  FROM sailor  
 UNION
 SELECT customer_name FROM customer

 SELECT sailor_name  ,sailor_add AS NAME  FROM sailor  --error as adderess is int and name is varchar
 UNION
 SELECT customer_name FROM customer
