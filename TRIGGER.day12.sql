
--TRIGGERS
--DAY-12
 





	/*
	Trigger

	A trigger is a special kind of stored procedure that automitacally executes when 
	an event occurs in the database server.

	there are three types of triggers
	1. DML TRIGGERS INSERT, UPDATE, DELETE
	2. DDL TRIGGERS CREATE ALTER
	3. LOGON TRIGGERS

	DML TRIGGERS ARE FRIED AUTOMATICALLY IN RESPONSE TO DML EVENTS (INSERT, UPDATE AND DELETE)

	DML TRIGGERS CAN BE OF TWO TYPES
	1. AFTER TRIGGERS (FOR TRIGGERS)
		DML triggers is a special type of stored procedure that automatically takes effect when a 
		data manipulation language (DML) event takes place that affects the table or view defined 
		in the trigger (Insert, Update, Delete).

	2. INSTEAD OF TRIGGERS /BEFORE
		INSTEAD OF triggers override the standard actions of the triggering statement. Therefore, 
		they can be used to perform error or value checking on one or more columns and perform additional
		actions before inserting, updating or deleting the row or rows.


	---AFTER TRIGGERS SYNTAX---
	CREATE TRIGGER trigger_name
	ON table_name
	AFTER INSERT/UPDATE/DELETE
	AS
	BEGIN
		statement(s)
	END

*/

	USE Fewa_Boating_DB

	CREATE TRIGGER tr_sailor_insert
	ON sailor
	AFTER INSERT
	AS
	BEGIN
		PRINT'A sailor is inserted in the SAILOR table'
	END 

	select * from Sailor

	insert into Sailor values ('Darpan', 985602397, 'Massbar', 36, 9)  -- we can use same information in audit table


	--altering the existing trigger
	/*
		---SYNTAX---
			CREATE TRIGGER trigger_name
			ON table_name
			AFTER INSERT/UPDATE/DELETE
			BEGIN
				statement(s)
			END
	*/

	ALTER TRIGGER tr_sailor_insert
	ON sailor
	AFTER INSERT
	AS
	BEGIN
		PRINT'a sailor is inserted in the SAILOR table'
		SELECT * FROM INSERTED
	END 

	insert into Sailor values ('Sijan', 985242397, 'Hallan Cowk', 39, 5)

	CREATE TRIGGER tr_sailor_delete
	ON sailor
	AFTER DELETE
	AS
	BEGIN
		PRINT'a sailor is DELETED in the SAILOR table'
		SELECT * FROM deleted
	END


	DELETE FROM Sailor WHERE sailor_id = 114

	-- deleting a trigger 

	--SYNTAX
		--DROP TRIGGER trgger_name

		DROP TRIGGER tr_sailor_audit_insert

	--Audit table for SAILOR
	DROP TABLE sailor_audit 
	CREATE TABLE sailor_audit 
	(	audit_id INT IDENTITY(5001,1),
		audit_info VARCHAR(max)
		CONSTRAINT pk_sailor_audit PRIMARY KEY(audit_id)
	)
	use Fewa_Boating_DB

	CREATE TRIGGER tri_sailor_audit_insert
	on sailor
	AFTER INSERT
	AS 
	BEGIN
		DECLARE @id INT
		SELECT @id = sailor_id FROM inserted

		INSERT INTO sailor_audit
		VALUES ('A Sailor with ' + CAST(@id AS VARCHAR(50)) +'is inserted on ' + CAST(GETDATE() AS VARCHAR(30))) -- typecasting (CAST)  change value from database to string
	END

	INSERT into Sailor values('Sijan',985744234,'Halan Chowk',30,5)
	DROP TRIGGER tr_sailor_audit_insert
	use Fewa_Boating_DB

	--UPDATING TRIGGER SAILOR AUDIT
	CREATE TRIGGER tri_sailor_audit_update
	on sailor
	AFTER UPDATE
	AS 
	BEGIN
		DECLARE @id INT
		SELECT @id = sailor_id FROM inserted

		INSERT INTO sailor_audit
		VALUES ('A Sailor with ' + CAST(@id AS VARCHAR(50)) +'is updated on ' + CAST(GETDATE() AS VARCHAR(30))) -- typecasting (CAST)  change value from database to string
	END

UPDATE Sailor set  sailor_add='Chipledhunga',sailor_rating =10 where sailor_id =125

	select *from sailor_audit
	DROP   TRIGGER tr_sailor_audit_update
	

	--CREATING AFTER DELETE TRIGGER FOR SAILOR TABLE
	CREATE TRIGGER tri_sailor_audit_delete
	on sailor
	AFTER DELETE
	AS 
	BEGIN
		DECLARE @id INT
		SELECT @id = sailor_id FROM deleted

		INSERT INTO sailor_audit
		
		VALUES ('A Sailor with ' + CAST(@id AS VARCHAR(50)) +'is deleted on ' +CAST(GETDATE() AS VARCHAR(30)) ) -- typecasting (CAST)  change value from database to string
	END
	DELETE Sailor WHERE sailor_id=125
	DROP TRIGGER tr_sailor_audit_delete
	

	select * from sailor_audit

	--CREATING TRIGGER WITH UPDATE
	CREATE TRIGGER tr_sailor_update
	ON sailor
	AFTER UPDATE
	AS 
	BEGIN
		SELECT * FROM inserted   -- magic table only has insert/ delete and  not  update
		SELECT * FROM deleted
	END

	SELECT * FROM SAILOR

	UPDATE Sailor SET sailor_name ='Safal', sailor_contact = 98564721 where sailor_id = 119 

	


	--Trigger2

	/*
	TRIGGER fire before execution of action query

	--SYNTAX:

	--CAN ONLY TAKE ONLY ONE INSTEAD TRIGGER

	*/
	USE DEMO

	CREATE TABLE PERSON
	(per_id int identity (1001,1),
	per_name varchar(50),
	per_dob date,
	per_age int
	CONSTRAINT pk_person_id PRIMARY KEY (per_id)
	)

	INSERT INTO  person VALUES ('DEEPA','2000-01-01',24)
	USE Fewa_Boating_DB
	CREATE TRIGGER tri_instead_person_insert
	ON PERSON
	INSTEAD OF INSERT
	AS
	BEGIN
	print'No more person can be inserted in the the table'
	END

	INSERT INTO  person VALUES ('DEEPAK','2001-01-01',23) --- 

	SELECT *FROM PERSON

	DROP trigger

	
	CREATE TRIGGER tri_instead_person_update
	ON PERSON
	INSTEAD OF INSERT
	AS
	BEGIN
	print'No more person can be update in the the table'
	END

	INSERT INTO  person VALUES ('DEEPAK','2001-01-01',23) --- 

	SELECT *FROM PERSON

	
	ALTER TRIGGER tri_instead_person_insert
	ON PERSON
	INSTEAD OF INSERT
	AS
	BEGIN
	SELECT * FROM inserted
	print'No more person can be inserted in the the table'  -- updated table 

	END
	INSERT INTO  person VALUES ('DEEPAK','2001-01-01',23) 


	--DROP
	DROP TRIGGER tri_instead_person_insert
	--TO KNOW 

	CREATE TRIGGER TRI_INSTEAD_AGE_CALCULATION
	ON person
	INSTEAD OF INSERT
	AS
	BEGIN
	  INSERT INTO  person (per_name , per_dob,per_age) --per_id is in autoincrement
	  SELECT per_name,
	  per_dob,
	  DATEDIFF(YEAR,per_dob , GETDATE()) AS per_age  --DATEDIFF HELPS TO KNOW PRESENT DATE
	  From inserted
	  END
	  INSERT INTO  person (per_name ,per_dob) VALUES ('DEEPAK','2001-01-01') --it is insert into trigger and person

	  SELECT * FROM PERSON