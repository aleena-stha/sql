--Homework:
/*Create a table with 3 column: std_name,std-add,stdcontact

Now add a column  (std__id )  
enter 5 records
and now create a primary key  std_id
as aprimary key in a std table;
*/

--Creating a database
CREATE DATABASE studentDB
DROP  DATABASE student
DROP  TABLE student
--Using a database
use studentDB

--Creating a table with three column
CREATE TABLE student
(std_add varchar(150) ,
std_name varchar(50),
std_contact varchar(10) --std contact can used double int or string and dates can also 
)

--ADDING COLUMN std_id IN TABLE
ALTER TABLE student
	ADD std_id int

	--ENTERING FIVE RECORDS
	INSERT INTO student(std_name, std_add, std_contact)
	  VALUES('Sajina Joshi','Pokhara','9324123450');
	  
	  
	  INSERT INTO student(std_name, std_add, std_contact)
	  VALUES ('Smarika Rana Magar','Kundhar','9824123458'),
	            ('Kajal Kc','Tutunga','9876624190'),
                 ('Bijita Thapa','Jarebar','9832444550'),
	              ('Anjee Shrestha','Zero','9832445780');
	 
	 SELECT *FROM student
	 
	 --CREATE A PRIMARY KEY std_id
	 ALTER TABLE student ADD CONSTRAINT PK_STD_ID PRIMARY KEY (STD_ID) 

	ALTER TABLE student ALTER COLUMN std_name varchar (50)NOT NULL;
	ALTER TABLE student ADD CONSTRAINT PK_STD_ID PRIMARY KEY (std_name);
	
	
	
	
ALTER TABLE student DROP CONSTRAINT PK_STD_ID --can use auto increment/add std_id as primary key



	DROP 
	 ALTER TABLE student ALTER COLUMN std_id int NOT NULL;
	ALTER TABLE student ADD CONSTRAINT PK_STD_ID PRIMARY KEY (std_id);

--Day-7
	--Create table temp_std
	--COLUMN:std_id autoincrement by 1000,make it primary key
	--std_name
	--std_addr

	
	CREATE TABLE temp_std --Copy data from another table
(
std_id int  identity (1000,1) Primary Key,
stud_name varchar(50),
stud_contact varchar(10),
stud_add varchar(100)
)

INSERT INTO  temp_std (stud_name,stud_add,stud_contact)
SELECT  std_name,std_add,std_contact
FROM student

 SELECT * FROM temp_std
 


 --Autoincrement 
 INSERT INTO  temp_std
 (Stud_id  

 --CHECK CONDITION
 SYNTAX:CREATE TABLE table_name
 ( column_name data types
 column_name data types 
 column_name data types check condition
 )

 CREATE TABLE person
 (
 Per_id int
 Per_name varchar(30)
 Peradd varchar(50)P
 Per_age CHECK (per_age>18)
 )

 --DEFAULT CONDITION
 SYNTAX:CREATE TABLE table_name
 ( column_name data types
 column_name data types  DEFAULT 'Pokhara'
 column_name data types check condition
 )


 CREATE TABLE person
 (
 Per_id int
 Per_name varchar(30)
 Per_add varchar(50)DEFAULT 'Pokhara'
 Per_age  int CHECK (per_age>18)
 )

 INSERT INTO PERSON (P_name ,Per_age)
 VALUES ('Bikram',20)
