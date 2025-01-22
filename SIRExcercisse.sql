CREATE DATABASE Fewa_Boating_DB;
--1)Create a table with the name Sailor, containing information like its SID starting from 101,

USE Fewa_Boating_DB
--name, Address, age, and contact number rating, where SID is a primary key,
--contact number and name should not be nullable. 

--create Sailor table
	CREATE TABLE Sailor (
		sailor_id int IDENTITY(101,1),
		sailor_name varchar(25) NOT NULL,
		sailor_contact int NOT NULL,
		sailor_add varchar(50) NOT NULL,
		sailor_age int NOT NULL,
		sailor_rating int NOT NULL,
		PRIMARY KEY (sailor_id)
	);

	
--2)Create a table with the name Boat, which has the properties BID starting from 301 is a primary key, name and color are not nullable. 
--CREATE BOAT TABLE
	CREATE TABLE Boat (
		boat_id int IDENTITY(301,1),
		boat_name varchar(20) NOT NULL,
		boat_color varchar(20) NOT NULL,
		PRIMARY KEY (boat_id)
	);
	
--3)Create a table  with  the name  Customer,Which has the properties like CSID as a primary key 
--as  an auto increment starting with the value 10001,name,address,contact number are not nullable
--as well as email and contact number should be unique too.

-- CREATE CUSTOMER TABLE
	CREATE TABLE Customer(
		customer_id int identity(1001,1),
		customer_name varchar (25) NOT NULL,
		customer_add varchar (50) NOT NULL,
		customer_contact int NOT NULL UNIQUE,
		customer_email varchar(30) not null UNIQUE,
		PRIMARY KEY (customer_id)
	);
	
	
--4)Create a table with the name Reserve ,where sailor ID and Boat ID are foreign keys,
--have the day for which is it reserved

-- CREATE RESERVE TABLE
	CREATE TABLE reserve(
		Reserve_id int identity (3001,1),
		Sailor_id int FOREIGN KEY REFERENCES Sailor(sailor_id),
		Boat_id int FOREIGN KEY REFERENCES Boat(boat_id),
		Reserve_date date NOT NULL DEFAULT GETDATE(),
		PRIMARY KEY (Reserve_id)
	);

	--5)Create a table boating which contains information on which boat has been sailed 
--by which sailor and which customer was on it and 
--what rating they have given to the sailor on a particular day. 

--CREATE BOTATING TABLE
	CREATE TABLE Boating (
		Boating_ID int identity (6001, 1),
		Reserv_id int FOREIGN KEY REFERENCES reserve (Reserve_id),
		Cus_id int FOREIGN KEY REFERENCES Customer (customer_id),
		cus_rating int,
		boating_date date DEFAULT GETDATE(),
		PRIMARY KEY (Boating_ID)
	);
	
--6)Insert at least 10 values in all created tables.
	INSERT INTO Sailor values 
		('Deepak', 985605601, 'Begnas', 45, 7 ),
		( 'Bijan', 982387546, 'Lekhnath', 33, 1 ),
		( 'Lakshman', 986503247, 'Chaothe', 55, 8),
		( 'Anjaan', 986547301, 'Begnas', 25, 8),
		( 'Ranjit', 984562301,'Begnas', 35, 10),
		( 'Hari', 987456330, 'Bijaypur', 35, 7),
		( 'Zeeban', 984577722, 'Chaothe', 16, 10),
		( 'Hari', 987456600, 'Lekhnath', 35, 9),
		( 'Amrit', 982744551, 'Chaothe', 25, 3),
		( 'Binod', 954760123, 'Begnas', 63, 3 ),
		( 'Arjun', 985607412, 'Lakeside', 34, 6);

	--INSERTING DATA INTO BOAT TABLE
	INSERT INTO Boat vALUES 
		( 'Interlake', 'Blue'),
		( 'Interlake', 'Red'),
		( 'Clipper', 'Green'),
		( 'marine', 'Red'),
		( 'Clipper', 'Yellow'),
		( 'Marine', 'Green');

	--INSERTING DATA IN THE CUSTOMER TABLE
	INSERT INTO Customer (customer_name, customer_add, customer_contact,customer_email)	
	VALUES	('Junu Lama', 'Baglung', 982314782, 'JunuL@gm.com'),
		('Prithivi Subedi','Lakeside', 985605415, 'prithivi@gm.com'),
		('Roshjen Lalchan', 'Thermal', 984147610, 'roshjen@outlook.com'),
		('saraswati Adhikari', '0 km', 980667616, 'saraswati@hotm.com'),
		('Darpan dhakal', 'Birauta', 981413256, 'ddhakal@gm.cm'),
		('Sandip Giri', 'Lekhnath', 985602424, 'sandip@gm.com'),
		('Sujit Nepali', 'Malepatan', 985612457, 'sujit@gm.com'),
		('Sankhar Pun', 'Gorkha', 985604789, 'shankar@gm.com'),
		('Junu Lama', 'Gorkha', 98564231, 'Junu12@gm.com'),
		('Jadish Sharma', 'Srijana chowk', 981425623, 'jadish@gm.com'),
		('Prithivi Subedi','Lamachaur', 981417895, 'prithiviSu@gm.com'),
		('Sanjana rimal', 'Lakeside', 981410000,'sanjana@gm.com' );
 
 
	--INSERTING DATA INTO RESERVE TABLE
	INSERT INTO  reserve (Sailor_id,Boat_id,Reserve_date)values 
		(103, 301, '2021-10-10'),
		(108, 302, '2021-10-10'),
		(103, 303, '2021-10-08'),
		(103, 304, '2021-07-21'),
		(108, 302, '2021-10-11'),
		(102, 303, '2021-06-11'),
		(102, 304, '2021-12-11'),
		(101, 301, '2021-05-09'),
		(105, 302, '2021-08-09'),
		(106, 305, '2021-10-21');

	--INERTING INTO BOATING TABLE
	INSERT INTO Boating (Reserv_id ,Cus_id, cus_rating,boating_date) VALUES
		(3008, 1004, 6, '2021-10-10'),
		(3008,1003, 5, '2021-10-10'),
		(3008, 1012, 8, '2021-10-10'),
		(3001, 1004, 2,'2021-10-10'),
		(3001, 1005, 5, '2021-10-10'),
		(3010, 1009, 9,'2021-10-11'),
		(3010, 1008, 4, '2021-10-11'),
		(3003, 1011, 8, '2021-06-11'),
		(3004, 1004, 4, '2021-08-09'),
		(3004, 1008, 7, '2021-08-09'),
		(3004, 1005, 8, '2021-06-11');

	--Checking the data in the table
		select * from Sailor;
		select * from Boat;
		select * from Customer;
		select * from reserve;
		select * from Boating;

	--7)Select the name and color from the boat table. 
	SELECT boat_name FROM boat
	SELECT boat_color FROM boat
	SELECT boat_name,boat_color FROM Boat
	use Fewa_Boating_DB

	--8)Select a distinct (not repating value) customer name from the customer table. 
	SELECT DISTINCT customer_name  FROM customer


	--9)Find the name, age and rating of all sailors and arrange the result in ascending order. 
	SELECT sailor_name,sailor_age,sailor_rating  FROM sailor  ORDER BY sailor_name  ASC
		SELECT sailor_name, sailor_age, sailor_rating FROM Sailor ORDER BY sailor_name;


	--10)Find all the information about a sailor whose age is greater than 25. 
	SELECT * FROM sailor WHERE sailor_age>25;


	--11)Find all the information about a sailor whose age is greater than 30 and whose rating is below 5. 
	SELECT * FROM sailor WHERE sailor_age>30 AND sailor_rating <5;


	--12)Change the contact number of the customer whose id is 1003. 
	UPDATE   Customer  set customer_contact =980453325  WHERE customer_id =1003 ; 
	SELECT *FROM customer

	--13)Select the top 5 information of a sailor from a sailor based on their rating. 
	SELECT TOP  5 * FROM sailor  ORDER BY sailor_rating DESC;


	---14)Find all the information about the sailors who have reserved boats. 
	SELECT *FROM  sailor, reserve where  Reserve_id>=1 

	SELECT S.sailor_id, S.sailor_name, S.sailor_age, S.sailor_add, S.sailor_contact, S.sailor_rating
	FROM reserve R INNER JOIN Sailor S ON R.Sailor_id = S.sailor_id;


	--15)Find the name and color of the boat which have been reserved for which day 
	SELECT Boat.boat_name, Boat.boat_color  ,reserve.Reserve_date FROM Boat INNER JOIN  reserve on Boat.Boat_id =Reserve.Boat_id
	
	SELECT B.boat_name, B.boat_color, R.Reserve_date FROM reserve R 
		INNER JOIN Boat B ON R.Boat_id = B.boat_id;


	--16)Find all the information about the sailor and the boat for which the sailor has reserved the boat. 
	SELECT *FROM  Boat, Sailor  INNER JOIN reserve ON  Sailor.sailor_id= reserve.sailor_id --
	 
	 SELECT S.sailor_id, S.sailor_name, S.sailor_age, S.sailor_add, S.sailor_contact, S.sailor_rating, B.boat_name, B.boat_color
	FROM ((reserve R INNER JOIN Sailor S ON R.Sailor_id = S.sailor_id)
	INNER JOIN Boat B ON R.Boat_id = B.boat_id);


	--17)Find the name of the sailor who has reserved boat 103. 
	SELECT  Sailor.sailor_name  FROM Sailor INNER JOIN  reserve ON reserve.sailor_id= Sailor.Sailor_id WHERE reserve.Boat_id = 301;
	
	
	SELECT sailor_name FROM Sailor S
	INNER JOIN reserve R ON R.Sailor_id = S.sailor_id
	WHERE R.Boat_id = 303
	--OR
	SELECT sailor_name FROM Sailor S
	INNER JOIN (SELECT * FROM reserve WHERE Boat_id = 303) R ON R.Sailor_id = S.sailor_id;
	
	SELECT*  FROM reserve

SELECT*FROM Boat
SELECT*FROM Sailor
SELECT * FROM boat

	---18)Find the name of the sailor who has reserved a red boat. 
	SELECT sailor_name ,boat_color FROM sailor,boat WHERE boat_color='red' --

SELECT Sailor.sailor_name FROM Sailor INNER JOIN reserve ON Sailor.sailor_id = reserve.Sailor_id 
JOIN Boat ON reserve.Boat_id = Boat.Boat_id WHERE Boat.Boat_color = 'red';

--OR
	SELECT sailor_name FROM ((Sailor S
	INNER JOIN reserve R ON R.Sailor_id =S.sailor_id)
	INNER JOIN Boat B ON R.Boat_id = B.boat_id)
	WHERE B.boat_color ='RED';
	--OR
	SELECT sailor_name FROM ((Sailor S
	INNER JOIN reserve R ON S.sailor_id = R.Sailor_id)
	INNER JOIN (SELECT * FROM Boat WHERE boat_color ='RED') B ON R.Boat_id = B.boat_id);


	--19)Find the color of the boat reserved by Lakshman. 
		SELECT Boat.boat_color FROM Boat INNER JOIN reserve  ON Boat.boat_id = reserve.Boat_id
	INNER JOIN Sailor ON reserve.sailor_id =Sailor.sailor_id WHERE Sailor.sailor_name = 'Lakshman';
 --OR
 SELECT boat_color FROM ((Boat B
	INNER JOIN reserve R ON B.boat_id = R.Boat_id)
	INNER JOIN Sailor S ON R.Sailor_id = S.sailor_id)
	WHERE S.sailor_name = 'Lakshman';


	--20) Find the name of the sailor who has reserved at least one boat. 
	SELECT DISTINCT Sailor.sailor_name FROM Sailor
INNER JOIN reserve ON Sailor.sailor_id = reserve.Sailor_id;  --
--OR
SELECT S.sailor_name FROM Sailor S
	INNER JOIN reserve R ON S.sailor_id = R.Sailor_id;
 
 SELECT * FROM reserve
 SELECT* FROM sailor
	
	--21)Find the name of the sailor who has reserved a red and a green boat. 
SELECT DISTINCT Sailor.sailor_name FROM Sailor INNER JOIN reserve ON Sailor.sailor_id =reserve.Sailor_id 
   INNER JOIN Boat ON reserve.Boat_id = Boat.boat_id  WHERE Boat.boat_color IN ('red','green')
   --OR

	SELECT S.sailor_name , B.boat_color FROM ((Sailor S
	INNER JOIN reserve R ON R.Sailor_id =S.sailor_id)
	INNER JOIN Boat B ON R.Boat_id = B.boat_id)
	WHERE B.boat_color ='RED' OR B.boat_color='Green';

--22)Find the name of the sailor who has reserved a red and a green boat. 
SELECT Sailor.sailor_name FROM Sailor JOIN reserve ON Sailor.sailor_id = reserve.Sailor_id
JOIN Boat ON reserve.Boat_id = Boat.boat_id WHERE Boat.boat_color = 'red'
AND Sailor.sailor_id IN (
 
 SELECT Sailor.sailor_id FROM Sailor
   INNER JOIN reserve ON Sailor.sailor_id = reserve.sailor_id
   INNER JOIN Boat ON reserve.Boat_id = Boat.boat_id  WHERE Boat.boat_color = 'green');

   --OR
   SELECT sailor_name FROM ((Sailor S
	INNER JOIN reserve R ON R.Sailor_id =S.sailor_id)
	INNER JOIN Boat B ON R.Boat_id = B.boat_id)
	WHERE B.boat_color ='RED'
	INTERSECT
	SELECT sailor_name FROM ((Sailor S
	INNER JOIN reserve R ON R.Sailor_id =S.sailor_id)
	INNER JOIN Boat B ON R.Boat_id = B.boat_id)
	WHERE B.boat_color ='GREEN'

--23)Find the names of sailors aged over 20 who have not reserved a red boat. 
SELECT DISTINCT sailor_name FROM sailor INNER JOIN  reserve on reserve.sailor_id=  Sailor.sailor_id WHERE sailor_age>20 

--OR
SELECT sailor_name FROM ((Sailor S
	INNER JOIN reserve R ON R.Sailor_id =S.sailor_id)
	INNER JOIN Boat B ON R.Boat_id = B.boat_id)
	WHERE NOT B.boat_color ='RED'

SELECT * FROM sailor


