
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
 



 --CHECK CONDITION
 SYNTAX:CREATE TABLE table_name
 ( column_name data types
 column_name data types 
 column_name data types check condition
 
 CREATE DATABASE persondb
 use persondb


 CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CHECK (Age>=18)
);

CREATE TABLE Per
(
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int CHECK (Age>=18)
);

 CREATE TABLE person
 (
 Per_id int
 Per_name varchar(30)
 Peradd varchar(50)P
 Per_age CHECK (per_age>18)
 )

 --DEFAULT CONDITION
 SYNTAX:CREATE TABLE table_name  --The default value will be added to all new records, if no other value is specified.


 ( column_name data types
 column_name data types  DEFAULT 'Pokhara'
 column_name data types check condition
 )


 CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255) DEFAULT 'Pokhara'
);
CREATE TABLE Orders (
    ID int NOT NULL,
    OrderNumber int NOT NULL,
    OrderDate date DEFAULT GETDATE()
);
 CREATE TABLE person
 (
 Per_id int
 Per_name varchar(30)
 Per_add varchar(50)DEFAULT 'Pokhara'
 Per_age  int CHECK (per_age>18)
 )

 INSERT INTO PERSON (P_name ,Per_age)
 VALUES ('Bikram',20)

