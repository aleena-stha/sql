--note
--Foreign key  maintain relation between two tables, the foreign key must be a primary key in reference table
/*Foreign key link between two or more tables
syntax:
CREATE TABLE table_name
(
column1 datatypes,
column2 datatypes,
column3 datatypes FOREIGN KEY REFERNCES  referenced_Table_name (referenced_column_name)
);
*/
use ParlourDB

select name from sys.tables

exec sp_help 'customer'

CREATE TABLE staff
(
staff_id int  identity(201,1) PRIMARY KEY,
staff_name varchar(30) NOT NULL,
cus_id int FOREIGN KEY REFERENCES customer(cus_id)
)

select *from customer

INSERT INTO staff VALUES ('Billu',102)
INSERT INTO staff VALUES ('Sila' ,502) -- erreor as values should be existed in customer as 502 is not existing


-- Remove a foreign key constraint

ALTER TABLE staff DROP CONSTRAINT  FK__staff__cus_id__49C3F6B7 --ERROR since it has relation with  primary key it cannot be directly delete

drop table customer --   error (MCQ)the table cannot be deleted because it is linked with foreign key so to drop table we should delete both table



SELECT * FROM staff



-- Adding foreign key in existing column.
ALTER TABLE staff ADD CONSTRAINT FK_STAFF_CUS FOREIGN KEY (cus_id)
REFERENCES customer(cus_id)


 ALTER table staff DROP CONSTRAINT FOREIGN KEY  cus_id --we should check whether tables are linked or not and there exist  primary key in reference table or not)-
DROP table staff

/*
Note:
	1.	Before creating a foreign key constraint, Ensure that the referenced table is created.
	2.	The reference column in the referencing table should be either a Primary Key or a Unique Constraint.
	3.	The data type of the foreign key column(s) must match the data type of the primary key column(s) that they reference.
	4.	The values in the foreign key column(s) must match the values in the primary key column(s) of the referenced table. 
*/

-Homework:
Create a table with 3 column: std_name,std-add,stdcontact

Now add acolumn  (std__id )  
enter 5 records
and now create a prinmary key  std_id
as aprimary key in a std table