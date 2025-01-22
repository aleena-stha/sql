use demo



use Fewa_Boating_DB

--Audit table for SAILOR

	CREATE TABLE sailor_audit 
	(	audit_id INT IDENTITY(5001,1),
		audit_sailor_id int,
		audit_action varchar (10),
		audit_time date,
		audit_info varchar(max)
		CONSTRAINT pk_sailor_audit PRIMARY KEY(audit_id)
	)

--CREATING AFTER INSERT TRIGGER FOR SAILOR TABLE 
	CREATE TRIGGER tr_sailor_audit_insert
	on sailor
	AFTER INSERT
	AS 
	BEGIN
		DECLARE @id INT
		SELECT @id = sailor_id FROM inserted

		INSERT INTO sailor_audit
		VALUES (
					@id,
					'INSERT',
					GETDATE(),
					'A Sailor with ' + CAST(@id AS VARCHAR(50)) + ' is inserted on ' + CAST(GETDATE() AS VARCHAR(30)))
	END


	insert into Sailor values ('Sijan', 985242397, 'Hallan Cowk', 39, 5)

	select * from sailor_audit

--CREATING AFTER UPDATE TRIGGER FOR SAILOR TABLE 

	CREATE TRIGGER tr_sailor_audit_update
	on sailor
	AFTER UPDATE
	AS 
	BEGIN
		DECLARE @id INT
		SELECT @id = sailor_id FROM inserted

		INSERT INTO sailor_audit
		VALUES (
					@id,
					'UPDATE',
					GETDATE(),
					'A Sailor with ' + CAST(@id AS VARCHAR(50)) + ' is updated on ' + CAST(GETDATE() AS VARCHAR(30)))
	END

	
	UPDATE Sailor SET sailor_add = 'Lekhnath', sailor_rating = 7 WHERE sailor_id = 125

	select * from sailor_audit


--CREATING AFTER DELETE TRIGGER FOR SAILOR TABLE 

	CREATE TRIGGER tr_sailor_audit_delete
	on sailor
	AFTER DELETE
	AS 
	BEGIN
		DECLARE @id INT
		SELECT @id = sailor_id FROM deleted

		INSERT INTO sailor_audit
		VALUES (
					@id,
					'DELETE',
					GETDATE(),
					'A Sailor with ' + CAST(@id AS VARCHAR(50)) + ' is deleted on ' + CAST(GETDATE() AS VARCHAR(30)))
	END
		

	DELETE Sailor WHERE sailor_id = 125

	select * from sailor_audit
create table employee
(	emp_id int identity(1001,1),
	emp_name varchar(30),
	emp_add varchar(50)
	constraint pk_emp_id primary key (emp_id)
)

drop table emp_dep_sal
create table emp_dep_sal
(	sd_id int identity(5001,1),
	sd_dep varchar(30),
	sd_salary int,
	emp_id int foreign key references employee(emp_id)
)

insert into employee values
	('Dinesh', 'Birauta'),
	('Sushil','Lekhnath'),
	('Sushila','Syangja'),
	('Gita', 'Tanhau')

select * from employee

insert into emp_dep_sal
	values('Delopment', 85000, 1001),
	('Development', 65000, 1002),
	('Designing',70000, 1003),
	('Quality Assurance', 65000, 1004)

select * from emp_dep_sal

create trigger tr_dep_sal_instead
on emp_dep_sal
instead of delete
as
begin
 delete from emp_dep_sal where emp_id in (select emp_id from deleted)	
 delete from employee where emp_id in (select emp_id from deleted)
 
end

select * from employee E
inner join emp_dep_sal ds
on e.emp_id = ds.emp_id

delete from emp_dep_sal where emp_id = 1001

select * from employee E
inner join emp_dep_sal ds
on e.emp_id = ds.emp_id