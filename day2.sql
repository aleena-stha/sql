
--DAY-2	

--To list ot all the existing database in the server.
 select name from sys.databases

 --To use database/change database
 use ParlourDb

 --To list out all the existing table in a database.
 SELECT NAME FROM sys.tables  

 /* ---SYNTAX TO CREATE A TABLE
   CREATE TABLE(column_name1 data_types,  column_name2  data_types , column_name3 data_types ...
   */
   CREATE TABLE customer
   (cust_id int,cust_name varchar(50),c_gender varchar(10))
   
   --TO add column in an existing table
   --SYNTAX: table_name ADD column_name data types
   ALTER TABLE customer ADD cust_add varchar(100)
    
	--To modify the  existing column in a table
	--ALTER TABLE table_name ALTER COLUMN column_name data_types
	ALTER TABLE customer ALTER COLUMN cust_add varchar(80)

	--To list all the description of a table
	--EXEC sp_rename 'table_name.Old_Column_name', 'new_column_name'
	EXEC sp_rename 'customer.c_gender','cust__gender'

	--To remove the existing column from a table
	--SYNTAX:ALTER TABLE table_name DROP  COLUMN column_name
	ALTER TABLE customer DROP COLUMN cust_add

	--To delete exusting table from the Database
	--SYNTAX:DROP TABLE table_name
	DROP TABLE customer