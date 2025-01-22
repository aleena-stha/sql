DROP DATABASE bit23c
 CREATE TABLE customer
   (cust_id int,cust_name varchar(50),cust_gender varchar(10));
   


 use ParlourDb
/*	inserting values in the existing tables.
	Syntax: INSERT INTO table_name (column1 , column2, column3, ...)
			values(value1, value2, value3, ...)
*/  
	  INSERT INTO customer(cust_id,cust_name, cust_gender)
	  VALUES(101,'Deepak Thakur','Male' );

	--inserting data only in specified columns
	  INSERT INTO customer(cust_name, cust_gender)
	  VALUES('Deepa Thakur','Female' );

	--Inserting values into the tabls without specifying columns name, 
	--	but make sure that the value should align with the order of column present in the table.
	INSERT INTO customer 
	VALUES(102, 'Susmita',  'Female');
 
 --inserting values in a bulk
  INSERT INTO customer
  VALUES (103,'Ram Krishna Dhugana', 'Male'),
		 (104,'Dolraj Pradhan','Male'),
		 (105,'Zenith Acharya', 'Male');
	

--view sorted data from the table
/*	SYNTAX: SELECT * FROM table_name; [* means all of the columns in a table]
			SELECT  column_name(s) FROM table_name;
*/
	 --view all information  from the table, here 
		SELECT * FROM customer;

	 --view only selected column from the table
		SELECT cust_name, cust_id FROM customer;

	--select data from the table by applying some condition
		SELECT * FROM customer where cust_gender='female';
		SELECT * FROM customer where cust_id > 102;
		SELECT * FROM customer where cust_id > 102 AND cust_gender='female'; 

--updating datas in the table
/*	SYNTAX: UPDATE table_name
			SET column1 = value1, column2 = value2, ...
			WHERE condition; 
*/

UPDATE customer 
	SET cust_id  = 106
	WHERE cust_name = 'Deepa Thakur'

INSERT INTO customer (cust_id,cust_name,cust_gender)
VALUES(101,'Deepak Thakur', 'Male');

-- inserting data only in specified column
INSERT INTO customer (cust_name ,cust_gender)
VALUES ('Deepa Thakur','Female');

-
--viust_id>102 AND cust_gender='female'; 


	UPDATE customer SET cust_id =106 
	WHERE cust_name ='Deepa Thakur';







 