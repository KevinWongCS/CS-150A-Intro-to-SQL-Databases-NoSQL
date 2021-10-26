/*	Assignment5.sql
	Kevin Wong 
	CS150A Fall 2021 */
    
USE restaurant;
DROP TABLE IF EXISTS computer_staff;
DROP TABLE IF EXISTS computer;

-- The International Foods Restaurant has decided to keep track of the computers used by staff. To complete 
-- this task, three new tables will be added to the database. You can see all the tables and their descriptions 
-- listed below.
-- Table Name: computer
-- Serial_number: serial number of computer
-- make: make of computer
-- model: model of computer
-- process_type: process type of computer
-- speed: speed of computer
-- main_memory: main memory of com
-- disk_size: disk size of computer
-- Table Name: computer_staff
-- Serial_number: serial number of computer
-- Staff_id: ID of staff
-- Date_assigned: date assigned for staff
-- A computer’s serial number never changes, so there is no need to cascade updates. When a computer is 
-- at the end of its life, the record in the computer table for that specific computer as well as all associated 
-- records in the computer_staff table are deleted from the database.
-- The schema has the following foreign keys:
-- 1. The attribute serial_number of relation computer_staff to reference relation computer.
-- 2. The attribute staff_id in relation computer_staff to reference relation staff.

-- Question 1: Write SQL statements to perform the following queries:
-- Create the following two tables:
-- the computer_staff table
-- the computer table
-- Since you will be creating tables, the first SQL statements will drop the tables.
-- DROP TABLE IF EXISTS computer_staff;
DROP TABLE IF EXISTS computer;
CREATE TABLE computer(
	serial_number INT(9),
    make VARCHAR(50),
    model VARCHAR(50),
    process_type VARCHAR(50),
    speed DECIMAL(3, 2),
    main_memory VARCHAR(50),
    disk_size VARCHAR(50)
);

CREATE TABLE computer_staff(
	serial_number INT(9),
    staff_id INT(9),
    date_assigned DATE
);

DESCRIBE computer;
DESCRIBE computer_staff;

-- Question 2: Specify the primary keys constraints.
-- note: got question wrong should have been a composite primary key.
ALTER TABLE computer
MODIFY serial_number INT(9) NOT NULL UNIQUE PRIMARY KEY;

ALTER TABLE computer_staff
MODIFY serial_number INT(9) NOT NULL UNIQUE PRIMARY KEY;

DESCRIBE computer;
DESCRIBE computer_staff;

-- Question 3: Write the syntax to create a foreign key (serial_number) in the computer_staff table that 
-- has a corresponding primary-key reference in the computer table. 
-- Write the syntax to create a foreign key (staff_id) in the computer_staff table that has a corresponding 
-- primary-key reference in the staff table.
-- ALTER TABLE computer
-- ADD CONSTRAINT serial_number 
-- FOREIGN KEY (serial_number) 
-- REFERENCES computer (serial_number);

-- ALTER TABLE computer_staff
-- ADD CONSTRAINT staff_id 
-- FOREIGN KEY (staff_id) 
-- REFERENCES computer_staff (serial_number);

CREATE TABLE computer_staff (
staff_id DECIMAL(5 , 0 ) NOT NULL,
serial_number INT NOT NULL,
date_assigned DATE,
CONSTRAINT computer_staff_pk PRIMARY KEY (serial_number, staff_id), -- correct answer
CONSTRAINT computer_staff_serial_number_fk FOREIGN KEY (serial_number)
REFERENCES computer (serial_number),
CONSTRAINT computer_staff_staff_id_fk FOREIGN KEY (staff_id)
REFERENCES staff (staff_id)
);

DESCRIBE computer_staff;
DROP TABLE IF EXISTS computer_staff;
DROP TABLE IF EXISTS computer;

-- Question 4: The script insert_data_computer.sql contains the SQL to populate the tables needed for this 
-- part of the assignment. Run the SQL script to populate the tables.
-- Use the \. command to run the script. (You can run it via copy and paste techniques.)
CREATE TABLE computer(
	serial_number INT(9) NOT NULL UNIQUE PRIMARY KEY,
    make VARCHAR(50),
    model VARCHAR(50),
    process_type VARCHAR(50),
    speed DECIMAL(3, 2),
    main_memory VARCHAR(50),
    disk_size VARCHAR(50)
);

CREATE TABLE computer_staff(
	serial_number INT(9) NOT NULL UNIQUE PRIMARY KEY,
    staff_id INT(9),
    date_assigned DATE
);

USE restaurant;

INSERT INTO computer VALUES(
		9871234, 'HP', 'Pavilion 500-210qe', 'Intel i5-4530', 3.00,
		'6.0 GBytes', '1.0 TBytes');
INSERT INTO computer VALUES(
		9871245, 'HP', 'Pavilion 500-210qe', 'Intel i5-4530', 3.00,
		'6.0 GBytes', '1.0 TBytes');
INSERT INTO computer VALUES(
		9871256, 'HP', 'Pavilion 500-210qe', 'Intel i5-4530', 3.00,
		'6.0 GBytes', '1.0 TBytes');
INSERT INTO computer VALUES(
		9871267, 'HP', 'Pavilion 500-210qe', 'Intel i5-4530', 3.00,
		'6.0 GBytes', '1.0 TBytes');
INSERT INTO computer VALUES(
		9871278, 'HP', 'Pavilion 500-210qe', 'Intel i5-4530', 3.00,
		'6.0 GBytes', '1.0 TBytes');
INSERT INTO computer VALUES(
		9871289, 'HP', 'Pavilion 500-210qe', 'Intel i5-4530', 3.00,
		'6.0 GBytes', '1.0 TBytes');
INSERT INTO computer VALUES(
		6541001, 'Dell', 'OptiPlex 9020', 'Intel i7-4770', 3.40,
		'8.0 GBytes', '1.0 TBytes');
INSERT INTO computer VALUES(
		6541002, 'Dell', 'OptiPlex 9020', 'Intel i7-4770', 3.40,
		'8.0 GBytes', '1.0 TBytes');
INSERT INTO computer VALUES(
		6541003, 'Dell', 'OptiPlex 9020', 'Intel i7-4770', 3.40,
		'8.0 GBytes', '1.0 TBytes');
INSERT INTO computer VALUES(
		6541004, 'Dell', 'OptiPlex 9020', 'Intel i7-4770', 3.40,
		'8.0 GBytes', '1.0 TBytes');
INSERT INTO computer VALUES(
		6541005, 'Dell', 'OptiPlex 9020', 'Intel i7-4770', 3.40,
		'8.0 GBytes', '1.0 TBytes');
INSERT INTO computer VALUES(
		6541006, 'Dell', 'OptiPlex 9020', 'Intel i7-4770', 3.40,
		'8.0 GBytes', '1.0 TBytes');

		
INSERT INTO computer_staff(serial_number, staff_id, date_assigned)
		VALUES(9871256, 1559, '2016-09-14');
INSERT INTO computer_staff (serial_number, staff_id, date_assigned)
		VALUES(9871267, 1403, '2015-09-14');
INSERT INTO computer_staff(serial_number, staff_id, date_assigned)
		VALUES(9871278, 1292, '2015-09-14');
INSERT INTO computer_staff(serial_number, staff_id, date_assigned)
	    VALUES(9871289, 1180, '2015-09-21');
INSERT INTO computer_staff(serial_number, staff_id, date_assigned)
		VALUES(6541001, 1162, '2015-10-14');
INSERT INTO computer_staff (serial_number, staff_id, date_assigned)
		VALUES(6541002, 1005, '2015-10-14');

INSERT INTO computer_staff(serial_number, staff_id, date_assigned)
		VALUES(6541003, 552, '2015-10-21');

INSERT INTO computer_staff (serial_number, staff_id, date_assigned)
		VALUES(6541004, 200, '2015-10-14');
INSERT INTO computer_staff(serial_number, staff_id, date_assigned)
		VALUES(9871234, 209, '2015-11-14');
INSERT INTO computer_staff (serial_number, staff_id, date_assigned)
		VALUES(9871245, 1597, '2015-11-14');
		

		
-- Question 5: Execute a SELECT * statement to verify your input.
SELECT *
FROM computer;

SELECT *
FROM computer_staff; 

-- Question 6: Display the serial numbers and models of all the computers.
SELECT serial_number,
	model
FROM computer