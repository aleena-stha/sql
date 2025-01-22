
--define rules in column on what values to accept constraints be like
	/* CONSTRAINTS :NOT NULL  - cannot keep the value of the column null
	UNIQUE - every value in the column should be different
	PRIMARY KEY - define uniqueness of records in the table.
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

--adding contraint in existing table's column
--ALTER TABLE table_name ALTER COLUMN column_name DATA_TYPE CONSTRAINT_TYPE;


use ParlourDb
DROP TABLE customer

CREATE TABLE customer 
(	cus_id int ,
	cus_name varchar(30),
	cus_gendar varchar(10)
)

--	adding constraint in existing table's column

		--ALTER TABLE table_name ALTER COLUMN column_name DATA_TYPE CONSTRAINT_TYPE;

 ALTER TABLE customer ALTER COLUMN cus_name VARCHAR(30) NOT NULL;

 --ALTER TABLE tabl_name ADD CONSTRAINT_TYPE (column_name);

		ALTER TABLE customer ADD UNIQUE(cus_name)

		
--ALTER TABLE table_name ADD CONSTRAINT constraint_name CONSTRAINT_TYPE (column_name);


ALTER TABLE customer ADD CONSTRAINT UK_CUS_ID UNIQUE (cus_id)


--ALTER TABLE table_name 
ALTER TABLE customer ADD CONSTRAINT UK_Cus_ID UNIQUE (cus_ID)
ALTER TABLE customer ALTER COLUMN 



--Note
/* Dropping a constraints
SYNTAX: ALTER TABLE table_name DROP Constraint constraint_name;
*/

ALTER TABLE customer DROP CONSTRAINT UQ__customer__95C0A0454927F2
ALTER TABLE customer DROP CONSTRAINT  UK_Cus_ID 



--Making column nullable 
ALTER TABLE customer ALTER COLUMN cus_name VARCHAR(30) null


--PRIMARY KEY
	--NOTE: To add primary key in the existing column of a 
	--table make sure that the column is declared as NOT NULL
	ALTER TABLE customer ADD CONSTRAINT PK_CUS_ID PRIMARY KEY (CUS_ID) -- error since cus_id  constraint in customer table is not declared

	ALTER TABLE customer ALTER COLUMN cus_id int NOT NULL
	ALTER TABLE customer ADD CONSTRAINT PK_CUS_ID PRIMARY KEY (CUS_ID)

	--PRIMARY KEY IS THE COMBINATION OF NOT NULL AND UNIQUE CONSTRAINT
	INSERT INTO customer (cus_id, cus_name, cus_gender)
		VALUES(101, 'Bigyan','Male')

	INSERT INTO customer (cus_id, cus_name, cus_gender) --error since primary key is define in cus_id ,cus_id cannot be repeat again
		VALUES(101, 'Bigyan Poudel','Male')

	INSERT INTO customer (cus_name, cus_gender) --error since cus_id is null and cus_id is not null so value cannot be insert
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
		column1 data_types IDENTITY(starting_value, increment_value) PRIMARY KEY,
		column2 data_types ,
		column3 data_types ,
		....);
*/

DROP table customer

CREATE TABLE customer
(
	cus_id int identity(101,1) PRIMARY KEY,
	cus_name varchar(30)
)

INSERT INTO  customer VALUES('saran')
select * from customer
INSERT INTO  customer VALUES('Susang')
select * from customer





	