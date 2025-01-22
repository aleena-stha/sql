
--Creating database
CREATE DATABASE asignDB


use asignDB

--CREATING TABLE FOR CALLER
   CREATE TABLE caller (
   Caller_Id INT PRIMARY KEY Identity ( 101,1),
  
    C_Name	VARCHAR(255) NOT NULL, -- Full name of the caller
     Email	VARCHAR(255),	             --Email address of the caller		
     Address	VARCHAR(255),	    --Physical address of the caller		
     Phone_No1	VARCHAR(15)	 NOT NULL, --Primary contact number of the caller	
    Phone_No2	VARCHAR(15)  NOT NULL ); 








	
	INSERT INTO caller 
	values
    ('Jenny Thapa', 'jane@example.com', 'Pokhara', '9825745334' ,'9847456830'),
    ('Alice Shakya', 'alice@example.com', 'Kathmandu', '9823456790', '9845875350'),
    ('Bobby Rai', 'bob@example.com', 'Rauthahat', '982343698', '9845765556'),
    ('Sarah Magar', 'sarah@example.com', 'Rasuwa', '985658642', '984678923'),
    ('Michael Shrestha', 'michael@example.com', 'Bara', '985677421', '982456588'),
    ('Emily Rai', 'emily@example.com', 'Chitwan', '982456243', '98241638780'),
    ('David Magar', 'david@example.com', 'Gorkha', '98754279400', '9845678471'),
    ('Jessica Gurung', 'jessica@example.com', ' Baitadi', '982456879', '985741859'),
    ('Matthew Magar', 'matthew@example.com', 'Ramechhap', '9824567368', '9845755574'),
    ('Jennifer Tamang', 'jennifer@example.com', 'Dadeldhura',  '9824556898', '984567723'),
    ('Christopher Thapa', 'christopher@example.com', 'Tanahun', '98265423456', '98467858'),
    ('Amanda Rai', 'amanda@example.com', 'Dhoti', '9825432100', '987654234'),
    ('James Shakya', 'james@example.com', 'Sindhupalchowk', '9832474500', '9847434220'),
    ('Maria Thapa', 'maria@example.com', 'Ramechhap',  '9826757654', '9842345678'),
	('Aria Thapa', 'aria@example.com', 'Rolpa',  '9824567654', '9842345678');

	SELECT * FROM Caller


	--Creating  for call
	CREATE TABLE call (
    Caller_Id INT PRIMARY KEY ,
    Date DATE,
    Time TIME,
    FOREIGN KEY (Caller_Id) REFERENCES caller(Caller_Id)
);







INSERT INTO call (  Caller_Id,Date, Time)
VALUES 
    ( '101','2024-05-01', '09:00:00'),
    ( '102','2024-05-02', '10:30:00'),
    ( '103','2024-05-03', '11:45:00'),
    ( '104','2024-05-04', '13:15:00'),
    ( '105','2024-05-05', '14:45:00'),
    (  '106','2024-05-06', '16:00:00'),
    ( '107','2024-05-07', '17:30:00'),
    (  '108','2024-05-08', '18:45:00'),
    ( '109','2024-05-09', '20:00:00'),
    ( '110','2024-05-10', '21:15:00'),
    (  '111','2024-05-11', '22:30:00'),
    ( '112','2024-05-12', '09:30:00'),
    ( '113','2024-05-13', '10:45:00'),
    ( '114','2024-05-14', '12:00:00'),
    ('115','2024-05-15', '13:15:00');

	SELECT * FROM call


	CREATE TABLE operator (
    Operator_Id INT PRIMARY  ( 1001,1)
    Operator_name VARCHAR(255),
    Department VARCHAR(255),
    Caller_Id INT,
    Software_LicenseNo VARCHAR(255),
    Specialist_Id INT
);

INSERT INTO operator (Operator_name, Department, Caller_Id, Software_LicenseNo, Specialist_Id)
VALUES 
    ('Alice', 'Customer Service', 1, 'ABC123' )
    ('Bob', 'Technical Support', 2, 'DEF456')
    ('Charlie', 'Billing Department', 3, 'GHI789') 
    ('David', 'Customer Service', 4, 'JKL012')
    ('Emma', 'Technical Support', 5, 'MNO345',)
    ('Frank', 'Billing Department', 6, 'PQR678') 
    ('Grace', 'Customer Service', 7, 'STU901')
    ('Henry', 'Technical Support', 8, 'VWX234') 
    ('Ivy', 'Billing Department', 9, 'YZA567') 
    ('Jack', 'Customer Service', 10, 'BCD890')
    ('Karen', 'Technical Support', 11, 'EFG123') 
    ('Larry', 'Billing Department', 12, 'HIJ456') 
    ('Mike', 'Customer Service', 13, 'KLM789') 
    ('Nancy', 'Technical Support', 14, 'OPQ012')
    ('Olivia', 'Billing Department', 15, 'RST345');




	CREATE TABLE equipment (
    Equipment_Id INT PRIMARY KEY IDENTITY(1001,1)
    Equipment_Name VARCHAR(255),
    Type VARCHAR(100),
    Manufacturer VARCHAR(100),
    Model_No VARCHAR(100),
    Serial_No VARCHAR(100),
    Purchase_Date DATE,
    Warranty_Expiry_Date DATE,
    Location VARCHAR(255),
    Status VARCHAR(50)
);


INSERT INTO software (Software_LicenseNo, Equipment_Type, Purchase_Date, Purchase_Price, Software_Expiry_Date)
VALUES 
    ('ABC123', 'Operating System', '2023-01-15', 199.99, '2026-01-15'),
    ('DEF456', 'Productivity Software', '2023-02-20', 299.99, '2025-02-20'),
    ('GHI789', 'Antivirus Software', '2023-03-25', 49.99, '2024-03-25'),
    ('JKL012', 'Database Management System', '2023-04-30', 999.99, '2027-04-30'),
    ('MNO345', 'Graphics Design Software', '2023-05-05', 499.99, '2026-05-05'),
    ('PQR678', 'Accounting Software', '2023-06-10', 399.99, '2025-06-10'),
    ('STU901', 'Project Management Software', '2023-07-15', 199.99, '2025-07-15'),
    ('VWX234', 'Customer Relationship Management Software', '2023-08-20', 599.99, '2024-08-20'),
    ('YZA567', 'Video Editing Software', '2023-09-25', 299.99, '2025-09-25'),
    ('BCD890', 'Audio Editing Software', '2023-10-30', 149.99, '2024-10-30'),
    ('EFG123', 'CAD Software', '2023-11-05', 899.99, '2026-11-05'),
    ('HIJ456', 'Web Development Software', '2023-12-10', 399.99, '2025-12-10'),
    ('KLM789', 'Statistical Analysis Software', '2024-01-15', 599.99, '2027-01-15'),
    ('OPQ012', 'Virtualization Software', '2024-02-20', 799.99, '2026-02-20'),
    ('RST345', 'Backup Software', '2024-03-25', 199.99, '2025-03-25');



	CREATE TABLE specialist (
    Specialist_Id INT PRIMARY KEY AUTO_INCREMENT,
    Specialist_type VARCHAR(255),
    Specialist_name VARCHAR(255),
    Software_LicenseNo VARCHAR(100),
    Operator_id INT
);




INSERT INTO specialist (Specialist_type, Specialist_name, Software_LicenseNo, Operator_id)
VALUES 
    ('Technical Support', 'John Smith', 'ABC123', 1),
    ('Customer Service', 'Jane Doe', 'DEF456', 2),
    ('IT Specialist', 'Michael Johnson', 'GHI789', 3),
    ('Software Engineer', 'Emily Brown', 'JKL012', 4),
    ('Network Administrator', 'David Wilson', 'MNO345', 5),
    ('Database Administrator', 'Sarah Garcia', 'PQR678', 6),
    ('System Analyst', 'Robert Martinez', 'STU901', 7),
    ('Security Specialist', 'Jessica Taylor', 'VWX234', 8),
    ('Web Developer', 'William Lee', 'YZA567', 9),
    ('Application Support', 'Amanda Lopez', 'BCD890', 10),
    ('DevOps Engineer', 'Steven Perez', 'EFG123', 11),
    ('Quality Assurance Specialist', 'Laura Gonzalez', 'HIJ456', 12),
    ('Business Analyst', 'Daniel Rodriguez', 'KLM789', 13),
    ('Cloud Architect', 'Melissa Hernandez', 'OPQ012', 14),
    ('Network Engineer', 'Ryan Flores', 'RST345', 15);


	CREATE TABLE solve (
    Problem_Id INT PRIMARY KEY AUTO_INCREMENT,
    Specialist_Id INT,
    FOREIGN KEY (Specialist_Id) REFERENCES specialist(Specialist_Id)
);


	INSERT INTO problem (Specialist_Id)
VALUES 
    (1),
    (2),
    (3),
    (4),
    (5),
    (6),
    (7),
    (8),
    (9),
    (10),
    (11),
    (12),
    (13),
    (14),
    (15);


	CREATE TABLE problem (
    Problem_Id INT PRIMARY KEY AUTO_INCREMENT,
    Problem_type VARCHAR(255),
    Start_date DATE,
    End_date DATE,
    Operator_id INT
);
INSERT INTO problem (Problem_type, Start_date, End_date, Operator_id)
VALUES 
    ('Network Issue', '2024-01-01', '2024-01-05', 1),
    ('Software Bug', '2024-01-02', '2024-01-06', 2),
    ('Hardware Failure', '2024-01-03', '2024-01-07', 3),
    ('Database Corruption', '2024-01-04', '2024-01-08', 4),
    ('Server Crash', '2024-01-05', '2024-01-09', 5),
    ('Security Breach', '2024-01-06', '2024-01-10', 6),
    ('Application Error', '2024-01-07', '2024-01-11', 7),
    ('System Downtime', '2024-01-08', '2024-01-12', 8),
    ('Performance Issue', '2024-01-09', '2024-01-13', 9),
    ('Data Loss', '2024-01-10', '2024-01-14', 10),
    ('User Error', '2024-01-11', '2024-01-15', 11),
    ('Network Congestion', '2024-01-12', '2024-01-16', 12),
    ('Software Upgrade', '2024-01-13', '2024-01-17', 13),
    ('Hardware Maintenance', '2024-01-14', '2024-01-18', 14),
    ('Database Optimization', '2024-01-15', '2024-01-19', 15);