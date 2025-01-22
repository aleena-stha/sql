DROP TABLE
Use ParlourDb

select * from customer

--While updating if we don't provide the conditions it will change the entire records of the column

update customer set cust_name ='Saran'

--	To delete existing records in a table
--SYNTAX: DELETE FROM table_name WHERE condition;

DELETE FROM customer  WHERE cust_id =102  --It delete cust_id 102 from customer


SELECT * FROM customer

DELETE FROM customer

select * from customer --delete all records from the table

TRUNCATE TABLE customer --delete  all the records from the table

--To sort the result in ascending or descending order
/* SELECT  column1, column2,....
 FROM table_name
  ORDER BY column1, column2 ,...ASC\DESC;

	*/
	SELECT* FROM customer;

	SELECT * FROM  customer
	ORDER BY cust_id  --BY DEFAULT IT DISPLAY RECORDS IN ASCENDING ORDER

	SELECT cust_name cust_gender FROM customer
	 ORDER BY cust_id DESC;

	 SELECT cust_name, cust_gender from customer 
	  ORDER BY cust_id DESC ,cust_gender ASC;
	
	 /* CONSTRAINTS : define rules in column on what values to accept
				    constraints be like 
	NOT NULL  - cannot keep the value of the column null
	UNIQUE - every value in the column should be different
	PRIMARY KEY - define uniqueness of records in the table.
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
 ( cus_id int unique, --UNIQUE CREATE 
  cus_name  varchar (30) NOT NULL,
  cus_gender varchar(10)
  )

  INSERT INTO customer (cus_id, cus_name, cus_gender)
  VALUES (101, 'Bigyan' ,'Male')

  INSERT INTO customer (cus_id, cus_name, cus_gender) --wrong since we have create a unique cus_id it cannot be repeated and identify by two data only need to be identify by single  unique data
  VALUES (101, 'Bigyan Poudel' ,'Male')

  INSERT INTO customer (cus_name, cus_gender)
  VALUES ('Smriti' ,'Female')

  /*	CREATE TABLE table_name(
		column1 datatypes,
		column2 datatypes,
		column3 datatypes,
		...,
		CONSTRAINT constraint_name CONSTRAINT_TYPE (column_name));
*/

DROP TABLE customer

CREATE TABLE customer 
(	cus_id int,
	cus_name varchar(30),
	cus_gender varchar(10),
	CONSTRAINT UN_customer_id UNIQUE (cus_id)
	)