
CREATE DATABASE ASSIGNTDB

USE  ASSIGNTDB



CREATE TABLE caller (
    Caller_Id INT PRIMARY KEY IDENTITY (1,1),
    C_Name VARCHAR(255),
    Email VARCHAR(255),
    Address VARCHAR(255),
    Phone_No1 VARCHAR(20),
    Phone_No2 VARCHAR(20)
);



 



INSERT INTO caller (C_Name, Email, Address, Phone_No1, Phone_No2)
VALUES 
    ('John ', 'john@example.com', 'Rauthahat', '9823454926', '9845688321'),
    ('Jane ', 'jane@example.com', 'Rasuwa', '9823895492', '9844456321'),
    ('Alice ', 'alice@example.com', 'Dolpa', '9809854926','9845006321'),
    ('Bob ', 'bob@example.com', 'Rolpa', '9823445926', '9845600321'),
    ('Sarah ', 'sarah@example.com', 'Ktm' , '982234926', '9845632111'),
    ('Michael ', 'michael@example.com', 'Gorkha', '9823454926', '9845635520'),
    ('Emily ', 'emily@example.com', 'Chitwan', '9823454926', '984563821'),
    ('David ', 'david@example.com', 'Pokhara', '982325434', '984563471'),
    ('Jessica ', 'jessica@example.com', 'Manang', '982344549', '984632111'),
    ('Matthew ', 'matthew@example.com', 'Mustang', '9822249026', '984556310'),
    ('Jennifer ', 'jennifer@example.com', 'Palpa', '9822254926', '984563211'),
    ('Christopher ', 'christopher@example.com', 'Makwanpur', '9823434554', '98456321'),
    ('Amanda ', 'amanda@example.com', 'Mugu','9823454926', '984532375'),
    ('James ', 'james@example.com', 'Janakpur' ,'9823444926', '9845532275'),
    ('Maria ', 'maria@example.com', 'Illam',  '9823455926', '984345323');


	CREATE TABLE operator (
    Operator_Id INT PRIMARY KEY IDENTITY(1001,1),
    Operator_name VARCHAR(255),
    Department VARCHAR(255),
    Caller_Id INT,
    Software_LicenseNo VARCHAR(255),
    Specialist_Id INT
);

INSERT INTO operator (Operator_name, Department, Caller_Id, Software_LicenseNo, Specialist_Id)
VALUES 
    ('Alice', 'Customer Service', 1, 'ABC123', 101),
    ('Bob', 'Technical Support', 2, 'DEF456', 102),
    ('Charlie', 'Billing Department', 3, 'GHI789', 103),
    ('David', 'Customer Service', 4, 'JKL012', 104),
    ('Emma', 'Technical Support', 5, 'MNO345', 105),
    ('Frank', 'Billing Department', 6, 'PQR678', 106),
    ('Grace', 'Customer Service', 7, 'STU901', 107),
    ('Henry', 'Technical Support', 8, 'VWX234', 108),
    ('Ivy', 'Billing Department', 9, 'YZA567', 109),
    ('Jack', 'Customer Service', 10, 'BCD890', 110),
    ('Karen', 'Technical Support', 11, 'EFG123', 111),
    ('Larry', 'Billing Department', 12, 'HIJ456', 112),
    ('Mike', 'Customer Service', 13, 'KLM789', 113),
    ('Nancy', 'Technical Support', 14, 'OPQ012', 114),
    ('Olivia', 'Billing Department', 15, 'RST345', 115);

	SELECT *FROM operator


	CREATE TABLE equipment (
    Equipment_Id INT PRIMARY KEY  IDENTITY(101,1),
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


INSERT INTO equipment (Equipment_Name, Type, Manufacturer, Model_No, Serial_No, Purchase_Date, Warranty_Expiry_Date, Location, Status)
VALUES 
    ('Laptop', 'Computer', 'HP', 'EliteBook 840 G7', '123456789', '2023-01-15', '2025-01-15', 'Office Room 101', 'Active'),
    ('Desktop', 'Computer', 'Dell', 'OptiPlex 7080', '987654321', '2023-02-20', '2025-02-20', 'IT Room 202', 'Active'),
    ('Printer', 'Peripheral', 'Epson', 'WorkForce Pro WF-C5790', '135792468', '2023-03-25', '2025-03-25', 'Copy Room 303', 'Inactive'),
    ('Scanner', 'Peripheral', 'Canon', 'imageFORMULA DR-C225 II', '246813579', '2023-04-30', '2025-04-30', 'Scan Room 404', 'Active'),
    ('Projector', 'Audio/Visual', 'BenQ', 'MH733', '369258147', '2023-05-05', '2025-05-05', 'Conference Room 505', 'Active'),
    ('Router', 'Networking', 'Cisco', 'ISR 1100 4P', '258147369', '2023-06-10', '2025-06-10', 'Server Room 606', 'Active'),
    ('Server', 'Networking', 'HP', 'ProLiant DL380 Gen10', '741852963', '2023-07-15', '2025-07-15', 'Data Center 707', 'Active'),
    ('Switch', 'Networking', 'Juniper Networks', 'EX2300-24T', '963852741', '2023-08-20', '2025-08-20', 'Network Closet 808', 'Active'),
    ('Monitor', 'Peripheral', 'Samsung', 'S27R750QEN', '159357486', '2023-09-25', '2025-09-25', 'Office Room 101', 'Active'),
    ('Telephone', 'Communication', 'Poly', 'Voyager 4200 UC', '9876543210', '2023-10-30', '2025-10-30', 'Reception Desk', 'Active'),
    ('UPS', 'Power Backup', 'APC', 'Smart-UPS 1500VA', '0123456789', '2023-11-05', '2025-11-05', 'Server Room 606', 'Active'),
    ('External Hard Drive', 'Storage', 'Western Digital', 'My Passport 4TB', '9876543210', '2023-12-10', '2025-12-10', 'IT Room 202', 'Active'),
    ('Security Camera', 'Surveillance', 'Hikvision', 'DS-2CD2347G1-LU', '0123456789', '2024-01-15', '2026-01-15', 'Entrance Lobby', 'Active'),
    ('Firewall', 'Networking', 'Fortinet', 'FortiGate 60F', '9876543210', '2024-02-20', '2026-02-20', 'Network Closet 808', 'Active'),
    ('Access Point', 'Networking', 'Ubiquiti Networks', 'UniFi AP AC PRO', '0123456789', '2024-03-25', '2026-03-25', 'Office Room 101', 'Active');

SELECT *FROM  equipment

	CREATE TABLE specialist (
    Specialist_Id INT PRIMARY KEY	IDENTITY(1001,2),
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

	SELECT *FROM specialist









	CREATE TABLE problem (
    Problem_Id INT PRIMARY KEY IDENTITY,
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


