--storedprocedure
/*
A stored procedure is a prepared SQL code that you can save,
so that code can be reused over and over again
*/

USE Fewa_Boating_DB
GO
/* GO  signals  the end of a batch of Transact -SQL statements
to the  SQL Server utilities.
*/


--CREATING A STORE PROCEDURE

--SYNTAX
/* CREATE PROCEDURE<ProcedureName>
  AS 
  BEGIN
   statement (s)
   END
   GO
   */
   --NOTE : INSTEAD OF PROCEDURE you can write PROC

   CREATE PROC sp_customer_details
   AS
   BEGIN
   SELECT customer_name ,customer_email
   FROM Customer
   ORDER BY Customer_name ASC
   END 
   GO

   --RUNNING THE STORE PROCEDURE
   --SYNTAX
   --EXECUTE <ProcedureName>
   EXECUTE sp_customer_details;
   GO



--UPDATING THE STORE PROCEDURE
ALTER PROC sp_customer_details
AS
BEGIN 
SELECT customer_name ,customer_email
	FROM Customer
	ORDER BY customer_email DESC
	END
	GO

	--DELETING THE EXISTING STORE PROCEDURE
	  --SYNTAX
	   --DROP PROC <ProcedureName>
	   DROP PROC sp_customer_details
	   GO

	--CREATING  STORE PROCEDURE WITH PARAMETERS
	--SYNTAX
	/* CREATE PROCEDURE <ProcedureName>

	@<Parameter Name1> <datatype>,
	@<Parameter Name2> <datatype>
	AS
	statement(s)
	GO

	*/

	CREATE PROC  sp_sailor_rating (@rating AS INT)
	AS
	BEGIN
	 SELECT * FROM SAILOR
	 WHERE sailor_rating >@rating
	 END
	 GO

	 --RUNNING THE STORE PROCEDURE
	 EXECUTE sp_sailor_rating 7;
	 GO

	 --DELETING THE EXISTING STORE PROCEDURE
	 DROP PROC sp_sailor_rating
	 GO

	 --CREATING STORE  PROCEDURE  WITH TWO OR MORE PARAMETERS
	 CREATE PROC  sp_sailor_rating_age(@rating AS INT,@age AS INT)
	AS
	BEGIN
	 SELECT * FROM SAILOR
	 WHERE sailor_rating > @rating
	 AND sailor_age> @age
	 END
	 GO

	  --RUNNING THE STORE PROCEDURE WITH TWO PARAMETER passing values only
	 EXECUTE sp_sailor_rating_age 3, 35;
	 GO

	  --RUNNING THE STORE PROCEDURE WITH TWO PARAMETER passing  names and values 
	 EXECUTE sp_sailor_rating_age  @rating =5,@age =25;
	 GO


	 ---CREATING STORE PROCEDURE WITH TWO OR MORE PARAMETERS
	 CREATE PROC sp_sailor_rating_age_name 
	 ( @rating AS INT =0,      ---	optional
	  @age AS INT,
	  @name AS VARCHAR (MAX)
	  )

	  AS
	  BEGIN
	  SELECT * FROM Sailor
	  WHERE sailor_rating = @rating AND
	  sailor_age >@age
	  AND sailor_name like '%' + @name + '%'
	  END
	  GO

	 
 --RUNNING THE STORE  PROCEDURE WITH TWO OR MORE PARAMETERS passing name and values
	   EXECUTE sp_sailor_rating_optional__age @rating =3,@age =35;
	 GO

	   
	   EXECUTE sp_sailor_rating_age_name  @rating =5,@age =25,@name='in';
	 GO


	 ---CREATING STORE PROCEDURE WITH TWO OR MORE PARAMETERS WITH OPTIONAL VALUES BY SETTING DEFAULT VALUES
CREATE PROC
sp_sailor_rating_optional_age (@rating AS INT =0,
@age AS INT 
--,@name AS VARCHAR
(MAX)
AS
BEGIN
SELECT * FROM Sailor WHERE sailor_rating  =@rating  AND
 sailor_age >@age --AND sailor_name like '%' + @name  + '%'
 END
 GO
  
 --RUNNING  THE STORE PROCEDUREB  WITH TWO PARAMETER PASSING name and values
 EXECUTE
 sp_sailor_rating_optional_age  @rating=3 , @age=35;
 GO

 


 ---CREATING STORE PROCEDURE WITH TWO OR MORE PARAMETERS  WITH OPTIONAL  VALUES BY SETTING NULL VALUE
 CREATE PROC
sp_sailor_rating_optional_null_age 
( @rating  AS INT =NULL,
 @age AS INT
 --,@name AS VARCHAR
 (MAX)
 )
 AS
  BEGIN




	  --PL/SQL working  with variable

	  DECLARE @rev_date AS DATTETIME

