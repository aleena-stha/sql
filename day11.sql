


	

--Day 11
--Date Datatypes
--Format

/*
DATE -format YYYY-MM-DD	
DATETIME -format : YYYY-MM-DD HH:MI:SS
SMALLDATETIME - format : YYYY-MM-DD HH:MI:SS
TIMESTAMP -FORMAT : A UNIQUE number
*/

CREATE database demo
use demo
CREATE  TABLE employee
(emp_id int identity (1001,1) primary key ,
 emp_name varchar(30),
 emp_join date,
 )

 
 INSERT INTO employee values
 ('Saran Karki' ,'2020-11-15'),
 ('Sandip Adhikari' ,'2018-03-02'),
 ('Shushma Ranjit' ,'2019-02-15')

 Select * from employee


-- extract date from the date
	--SYNTAX : DAY(date)
	--Example
	select emp_name, DAY(emp_join) as [Join Day] from employee

--extract month from the date
	--SYNTAX: MONTH(date)
	--ExaMPLE
		select emp_name, MONTH(emp_join) as [Join Month]  from employee

--extract year from the date
	--SYSNTAX: YEAR(date)
	--Example
		select emp_name, year(emp_join) as [Join Year] from employee

--find the difference day, time, year between two dates
	--DATEDIFF ( datepart , startdate , enddate )  

	--HERE datepart can be YEAR, QUARTER, MONTH, DAYOFYEAR, DAY, WEEK, WEEKDAY, HOUR, 
		--MINUTE, SECOND, MILLISECOND, MICROSECOND, NANOSECOND, ...

	select emp_name,emp_join, DATEDIFF(DAY, emp_join, GETDATE()) as [Number of working days] 
		from employee
	--or
	SELECT emp_name,emp_join,
		CONCAT(DATEDIFF(DAY, emp_join, GETDATE()), ' days'
		) as [Number of working Days] FROM employee;

			FROM employee;
	select emp_name,emp_join, DATEDIFF(MONTH, emp_join, GETDATE()) as [Number of working days] 
		from employee
	select emp_name,emp_join, DATEDIFF(YEAR, emp_join, GETDATE()) as [Number of working days] 
		from employee

	select emp_name,emp_join, DATEDIFF(WEEKDAY, emp_join, GETDATE()) as [Number of working days] 
		from employee

	select emp_name,emp_join, DATEDIFF_BIG(MILLISECOND, emp_join, GETDATE()) as [Number of working days] 
		from employee

		SELECT 
		emp_name,
		emp_join,
		CONCAT(
			DATEDIFF(YEAR, emp_join, GETDATE()), ' years, ',
			DATEDIFF(MONTH, emp_join, GETDATE()) % 12, ' months, ',
			DATEDIFF(DAY, emp_join, GETDATE()) % 30, ' days'
		) as [Number of working days]
	FROM employee;
 
 
 

--The DATEADD() function adds a time/date interval to a date and then returns the date.

-- SYNTAX: DATEADD (datepart , number , date )
--EXAMPLE
	SELECT DATEADD(month, 1, '2024-03-07');

	SELECT DATEADD(day, 1, '2024-03-07');

--The DATENAME() function returns a specified part of a date.
--SYNTAX: DATENAME ( datepart , date )  
--EXAMPLE

	SELECT DATENAME (YEAR,GETDATE())

	SELECT DATENAME (MONTH,GETDATE())

	SELECT DATENAME (DAY,GETDATE())

	SELECT DATENAME (DAYOFYEAR,GETDATE())

  --CONCATINATION :JOINS TWO STRING TOGETHER
  select emp_name ,CONCAT(MONTH (emp_join),'Month') as [join Month] from employee


	--DATEADD(Datepart, number, date)
	--EXAMPLE
	SELECT DATEADD(DAY ,5, GETDATE())


	--DATENAME(Datepart,Date)
	--EXAMPLE
	SELECT DATENAME (MONTH,GETDATE())
	SELECT DATENAME (WEEKDAY, GETDATE())  --DATE IN SQL SERVER FOR QUERIES