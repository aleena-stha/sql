
--Day 10

Use Fewa_Boating_DB

--The SQL Server EXCEPT compares the result sets of two queries and returns the 
--distinct rows from the first query that are not output by the second query. 
--In other words, the EXCEPT subtracts the result set of a query from another.	


-- EXCEPT SYNTAX  1st query ma vako second query ma navako operator dinxa
--EXCEPT Syntax
		--SELECT column_name(s) FROM table1
		--EXCEPT
		--SELECT column_name(s) FROM table2;

	--EXAMPLE
--Find the sailors name of all sailors who have reserved red boats but not green boats..		
SELECT S.sailor_name
FROM Sailor S,reserve R,Boat B
WHERE S.sailor_id  = R.Sailor_id AND R.Boat_id = B.boat_id AND B.boat_color='RED'
EXCEPT

SELECT S.sailor_name
FROM Sailor S,reserve R,Boat B
WHERE S.sailor_id  = R.Sailor_id AND R.Boat_id = B.boat_id AND B.boat_color='GREEN'



--HAVING CLAUSE  was added to SQL because  the WHERE keyboard cannot be used with aggregrate functions (COUNT() ,SUM(),AVG(),MIN(),MAX()).
		--HAVING Syntax
			--SELECT column_name(s)
			--FROM table_name
			--WHERE condition
			--GROUP BY column_name(s)
			--HAVING condition
			--ORDER BY column_name(s);
		--EXAMPLE
			--List the number of sailor and its place, where sailor are more then 2 from same place.
			SELECT COUNT(sailor_id) AS [Number of sailor] , sailor_add as [Sailor Address]
			FROM Sailor
			GROUP BY sailor_add
			HAVING COUNT(sailor_id) > 2;

--EXISTS
--The EXISTS operator is a logical operator that allows you to check whether a subquery returns 
	--any row. The EXISTS operator returns TRUE if the subquery returns one or more rows.
	--The SQL EXISTS operator executes the outer SQL query if the subquery is not NULL

	--EXISTS Syntax
		--SELECT column_name(s)
		--FROM table_name
		--WHERE EXISTS
		--(SELECT column_name FROM table_name WHERE condition);

--EXAMPLE
		-- List the reserve date, if the boat have been reserved and color is blue.

			SELECT Reserve_date
			FROM reserve
			WHERE EXISTS (SELECT * FROM Boat WHERE reserve.Boat_id= Boat.boat_id AND boat_color = 'BLUE');

			
--FInd the  name of sailors which have reserved boat number 301
use Fewa_Boating_DB
SELECT  Sailor_name
FROM Sailor
WHERE EXISTS (SELECT *FROM reserve WHERE Sailor.sailor_id =reserve.sailor_id AND boat_id='301');
SELECT *  FROM Sailor
SELECT * FROM Boating
SELECT * FROM Boat


	/*SQL ANY compares a value of the first table with all values of the second table and returns the 
	row if there is a match with any value.*/
	--ANY Syntax
		--SELECT column_name(s)
		--FROM table_name
		--WHERE column_name operator ANY
		--  (SELECT column_name
		--  FROM table_name
		--  WHERE condition);

	-- Find sailors whose rating is better than some sailor called Arjun.
		SELECT S1.sailor_name
		FROM Sailor S1
		WHERE S1.sailor_rating > ANY (SELECT S2.sailor_rating 
									 FROM  Sailor S2 
									 WHERE S2.sailor_name = 'Arjun');

									 
	--SQL ALL compares a value of the first table with all values of the second table 
	--and returns the row if there is a match with all values.

	--ALL Syntax With WHERE or HAVING
		--SELECT column_name(s)
		--FROM table_name
		--WHERE column_name operator ALL
		--  (SELECT column_name
		--  FROM table_name
		--  WHERE condition);

--EXAMPLE
--Find the sailors name with the highest rating.

		SELECT S1.sailor_name, s1.sailor_rating
		FROM Sailor S1
		WHERE S1.sailor_rating >= ALL (SELECT S2.sailor_rating 
									  FROM Sailor S2);

SELECT s1.sailor_name ,s1.sailor_rating
FROM Sailor s1 WHERE s1.sailor_rating >= ALL (SELECT s2.sailor_rating FROM Sailor s2);

--Find oldest sailor
SELECT sailor_age
 FROM Sailor
WHERE sailor_age>=ALL (SELECT sailor_age  FROM sailor)

--oldest sailor name

SELECT s1.sailor_name
FROM sailor S1	
WHERE S1.Sailor_age >= ALL  (SELECT sailor_age FROM sailor)

-- CASE expression it check the conditions and returns a value or statement when the conditions is meet.
	-- if no conditions is meet it will return the else block statement  .

		-- Display if the sailor is eligible to caste vote
		SELECT sailor_name, sailor_age, 
		CASE
			WHEN sailor_age >= 18 THEN 'Eligible'
			ELSE 'Not Eligible'
		END AS IsEligible
		FROM Sailor;

		

	/*A wildcard character is used to substitute one or more characters in a string.

	Wildcard characters are used with the LIKE operator. The LIKE operator is used 
	in a WHERE clause to search for a specified pattern in a column.*/

	--list name of the sailor whose name starts with 'A'
	SELECT * FROM Sailor
	WHERE sailor_name LIKE 'A%'

	--list name of the sailor whose name has'A' in second position
	SELECT * FROM Sailor
	WHERE sailor_name LIKE '__n%'


	SELECT * FROM Sailor
	WHERE sailor_name LIKE '%N'

	SELECT * FROM Sailor
	WHERE sailor_name LIKE '[alh]%'

	SELECT * FROM Sailor
	WHERE sailor_name LIKE '[a-h]%'

	/*

	%	Represents zero or more characters
	_	Represents a single character
	[]	Represents any single character within the brackets 
	^	Represents any character not in the brackets
	-	Represents any single character within the specified range

	*/