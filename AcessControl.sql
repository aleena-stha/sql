CREATE LOGIN user_login WITH PASSWORD= '123'


--login is created in system level
--user is created in database level

USE Demo 

SELECT name FROM SYS.tables

--Note:To grant 

--CREATE USER FOR LOGIN
--SYNTAX: CREATE USER <user_name> FOR LOGIN <login_name>

--SYNTAX: CREATE  LOGIN <login_name > with PASSWORD =< login_password>


---Example  --access control
CREATE USER  user_1 FOR LOGIN user_login


--To grant permission to the user
--SYNTAX:GRANT   <pivilege_name> ON object :: <object_name> TO <user_name>
--EXAMPLE :
GRANT SELECT ON OBJECT::customer to user_1
GRANT SELECT,UPDATE ,DELETE  ON OBJECT::customer to user_1

select * FROM employee

--TO remove permision from the user
--SYNTAX: REVOKE <privilege_name > ON OBJECT ::<object_name> FROM <user_name>
--EXAMPLE
REVOKE  SELECT,UPDATE,DELETE ON OBJECT :: customer From user_1  --msc or user role we cannot give up  the right privilege
GRANT SELECT ON OBJECT::customer to user_1

select * from customer

update customer  set customer_name ='Smriti' where customer_id = 101

--DROP user from the Database
--SYNTAX: DROP user <user_name>

--EXAMPLE
DROP USER user_1

--DROP LOGIN 
DROP LOGIN user_login

