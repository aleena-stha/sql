

--DAY-1
-- create a database
-- SYNTAX: CREATE DATABASE database_name

CREATE DATABASE salonDB

-- changinga a database 
-- SYNTAX: USE database_name

USE salonDB

-- renaming a existing database
-- SYNTAX: ALTER DATABSE old_database_name MODIFY NAME = new_database_name
ALTER DATABASE salonDB MODIFY NAME =ParlourDb

--deliting an existing database
-- SYNTAX: DROP DATABASE database_name

CREATE DATABASE bit23a
CREATE DATABASE bit23b
CREATE DATABASE bit23c




DROP DATABASE bit23a
DROP DATABASE bit23b
DROP DATABASE bit23c


--DAY-2


--To list out all the existing database in the server
select name from sys.databases

--To use database / change database
use ParlourDb

--To list out all the existing table in a database.
select name from sys.tables

/*	---SYNTAX TO CREATE A TABLE	
	CREATE TABLE (
			column_name1 datat_ypes,
			column_name2 data_types,
			column_name3 data_types,
			...
*/
CREATE TABLE customer 
(	cust_id int,	
	cust_name varchar(50),
	c_gendar varchar(10)
)
--To add column in an existing table
	--SYNTAX: ALTER TABLE table_name ADD column_name data_types
ALTER TABLE customer 
	ADD cust_add varchar(100)

--to modify the existing column in a table
	--SYNTAX: ALTER TABLE table_name ALTER COLUMN column_name data_types
ALTER TABLE customer
	ALTER COLUMN cust_add varchar(80)

-- to list the discription of a table 
	--Syntax EXEC sp_help 'table_name'
EXEC sp_help 'customer'


--to rename the column name in a table
	--Syntax: EXEC sp_rename 'table_name.Old_Column_name', 'new_column_name'
EXEC sp_rename 'customer.c_gender', 'cust_gender'
-- to remove the existing column from a table
	--SYNTAAX: ALTER TABLE table_name DROP COLUMN column_name
ALTER TABLE customer DROP COLUMN cust_add

--to delete existinf table from the Database
	--SYNTAX: DROP TABLE table_name
DROP TABLE customer

--DAY-3

 use ParlourDb
/*	inserting values in the existing tables.
	Syntax: INSERT INTO table_name (column1 , column2, column3, ...)
			values(value1, value2, value3, ...)
*/  
	  INSERT INTO customer(cust_id,cust_name, cust_gender)
	  VALUES(101,'Deepak Thakur','Male' );

	--inserting data only in specified columns
	  INSERT INTO customer(cust_name, cust_gendar)
	  VALUES('Deepa Thakur','Female' );

	--Inserting values into the tabls withouth specifying columns name, 
		--	but make sure that the value should align with the order of column present in the table.
	INSERT INTO customer 
	VALUES(102, 'Susmita',  'Female');
 
 --inserting values in a bulk
  INSERT INTO customer
  VALUES (103,'Ram Krishna Dhugana', 'Male'),
		 (104,'Dolraj Pradhan','Male'),
		 (105,'Zenith Acharya', 'Male');
	

--view sotred data from the table
/*	SYNTAX: SELECT * FROM table_name; [* means all of the columns in a table]
			SELECT  column_name(s) FROM table_name;
*/
	 --view all information the table, here 
		SELECT * FROM customer;

	 --view only selected column from the table
		SELECT cust_name, cust_id FROM customer;

	--selcet data from the table by applying some condition
		SELECT * FROM customer where cust_gendar='female';
		SELECT * FROM customer where cust_id > 102;
		SELECT * FROM customer where cust_id > 102 AND cust_gendar='female'; 

--updating datas in the table
/*	SYNTAX: UPDATE table_name
			SET column1 = value1, column2 = value2, ...
			WHERE condition; 
*/

UPDATE customer 
	SET cust_id  = 106
	WHERE cust_name = 'Deepa Thakur'


--DAY-4

	USE ParlourDb

select * from customer

-- while updating, if we dont provide the conditions it will change the entire records of the column
update customer set cust_name = 'Saran'

-- To delete existing records in a table
-- SYNTAX: DELETE FROM table_name WHERE condition;

DELETE FROM customer WHERE cust_id = 102

SELECT * FROM customer

DELETE FROM customer

select * from customer	--delete all the records from the table

TRUNCATE TABLE customer --delete all the records from the table



-- To sort the result in ascending or decending order
/*	SELECT column1, column2, ...
	FROM table_name
	ORDER BY column1, column2, ... ASC|DESC;
*/
SELECT * FROM customer;

SELECT * FROM customer
	ORDER BY cust_id   --BY DEFAULT IT DISPLAY RECORDS IN ASCENDING ORDER

SELECT cust_name, cust_gendar FROM customer
		ORDER BY cust_id DESC

SELECT cust_name, cust_gendar FROM customer
		ORDER BY cust_id DESC, cust_gendar ASC


/* CONSTRAINTS : define rules in column on what values to accept
				 constraints be like 
	NOT NULL  - cannot keep the value of the culmn null
	UNIQUE - ever value in the column should be different
	PRIMARY KEY - define unqueness of records in the table.
	FOREIGN KEY - links between the tables
	CHECK - accept value in the column if the condition is satisfied
	DEFAULT - set a default value if no data provided.
 */

/* Syntax:
	CREATE TABLE table_ name(
		column1 datatypes constraint,
		column2 datatypes constraint,
		column3 datatypes constraint,
		....);
*/

DROP TABLE customer

CREATE TABLE customer 
(	cus_id int unique,
	cus_name varchar(30) NOT NULL,
	cus_gendar varchar(10)
)

INSERT INTO customer (cus_id, cus_name, cus_gender)
		VALUES(101, 'Bigyan','Male')

INSERT INTO customer (cus_id, cus_name, cus_gender)
		VALUES(101, 'Bigyan Poudel','Male')

INSERT INTO customer (cus_name, cus_gender)
		VALUES('Smriti', 'Female')


		--DAY-5
/* CONSTRAINTS : define rules in column on what values to accept
				 constraints be like 
	NOT NULL  - cannot keep the value of the culmn null
	UNIQUE - ever value in the column should be different
	PRIMARY KEY - define unqueness of records in the table.
	FOREIGN KEY - links between the tables
	CHECK - accept value in the column if the condition is satisfied
	DEFAULT - set a default value if no data provided.
 */

/* Syntax:
	CREATE TABLE table_ name(
		column1 datatypes CONSTRAINT_TYPE,
		column2 datatypes CONSTRAINT_TYPE,
		column3 datatypes CONSTRAINT_TYPE,
		....);
*/


use ParlourDb
DROP TABLE customer

CREATE TABLE customer 
(	cus_id int ,
	cus_name varchar(30),
	cus_gendar varchar(10)
)


--	adding contraint in existing table's column

		--ALTER TABLE table_name ALTER COLUMN column_name DATA_TYPE CONSTRAINT_TYPE;

		ALTER TABLE customer ALTER COLUMN cus_name VARCHAR(30) NOT NULL;

		--ALTER TABLE tabl_name ADD CONSTRAINT_TYPE (column_name);

		ALTER TABLE customer ADD UNIQUE(cus_name)
		

		--ALTER TABLE table_name ADD CONSTRAINT constraint_name CONSTRAINT_TYPE (column_name);

		ALTER TABLE customer ADD CONSTRAINT UK_CUS_ID UNIQUE (cus_id)

		--NOTE:  
/* Droping a constraints
	SYNTAX: ALTER TABLE table_name DROP CONSTRAINT constraint_name;
*/
ALTER TABLE customer DROP CONSTRAINT UQ__customer__E84D41E9B81C82F4
ALTER TABLE customer DROP CONSTRAINT UK_CUS_ID

--Making column nullable 
ALTER TABLE customer ALTER COLUMN CUS_NAME VARCHAR(30) NULL

--PRIMARY KEY
	--NOTE: To add primary key in the existing column of a 
	--table make sure that the column is decleared as NOT NULL
	ALTER TABLE customer ADD CONSTRAINT PK_CUS_ID PRIMARY KEY (CUS_ID) 

	ALTER TABLE customer ALTER COLUMN cus_id int NOT NULL
	ALTER TABLE customer ADD CONSTRAINT PK_CUS_ID PRIMARY KEY (CUS_ID)

	--PRIMARY KEY IS THE COMBINATION OF NOT NULL AND UNIQUE CONSTRAINT
	INSERT INTO customer (cus_id, cus_name, cus_gendar)
		VALUES(101, 'Bigyan','Male')

	INSERT INTO customer (cus_id, cus_name, cus_gendar)
		VALUES(101, 'Bigyan Poudel','Male')

	INSERT INTO customer (cus_name, cus_gendar)
		VALUES( 'Bigyan Poudel','Male')

drop table customer

CREATE TABLE customer
(
	cus_id int PRIMARY KEY,
	cus_name varchar(30)
)

DROP TABLE customer

CREATE TABLE customer
(	cus_id int,
	cus_name varchar(30),
	CONSTRAINT PK_CUS_ID PRIMARY KEY (cus_id)
)

--Auto Increment
/* Syntax:
	CREATE TABLE table_ name(
		column1 data_types IDENTITY(starting_value,increment_value) PRIMARY KEY,
		column2 data_types ,
		column3 datat_ypes ,
		....);
*/

drop table customer

CREATE TABLE customer
(
	cus_id int identity(101,1) PRIMARY KEY,
	cus_name varchar(30)
)

INSERT INTO  customer VALUES('saran')
select * from customer
INSERT INTO  customer VALUES('Susang')
select * from customer

--DAY-6

/*Foreign key link between two or more tables
	syntax: 
		CREATE TABLE table_name
		(	Column1 Datatypes,
			Column2 Datatypes,
			Column3 Datatypes FOREIGN KEY REFERENCES referenced_Table_name(referenced_column_name)
		);
*/

use ParlourDb

select name from sys.tables

exec sp_help 'customer'

CREATE TABLE staff 
(	staff_id int identity(201,1) PRIMARY KEY,
	staff_name varchar(30) NOT NULL,
	cus_id int FOREIGN KEY REFERENCES customer(cus_id)	
)

SELECT * FROM customer

INSERT INTO staff VALUES ('Billu',102)

INSERT INTO staff VALUES ('Sila',502)

-- Remove a foreign key constraint

ALTER TABLE staff DROP CONSTRAINT FK__staff__cus_id__5AEE82B9

SELECT * FROM staff

-- Adding foreign key in existing column.
ALTER TABLE staff ADD CONSTRAINT FK_STAFF_CUS FOREIGN KEY (cus_id)
REFERENCES customer(cus_id)	

/*
Note:
	1.	Before creating a foreign key constraint, Ensure that the referenced table is created.
	2.	The reference column in the referencing table should be either a Primary Key or a Unique Constraint.
	3.	The data type of the foreign key column(s) must match the data type of the primary key column(s) that they reference.
	4.	The values in the foreign key column(s) must match the values in the primary key column(s) of the referenced table. 
*/

