Create Database gymManagemeent;
use  gymManagemeent;

Create table NewCustomer
(MID int NOT NULL IDENTITY (100,1) primary key,
Fname varchar(150) NOT NULL,
Lname varchar(150) NOT NULL,
Dob varchar(100) NOT NULL,
Mobile bigint  NOT NULL,
Email varchar(150) ,
JoinDate varchar(150) NOT NULL,
GymTime varchar(120	) NOT NULL,
Maddress varchar (250) NOT NULL,
MembershipTime varchar (120) NOT NULL,

);

--Fname,Lname,Dob,Mobile,Email,JoinDate,GymTime,Maddress,MembershipTime
Select * From NewCustomer;
