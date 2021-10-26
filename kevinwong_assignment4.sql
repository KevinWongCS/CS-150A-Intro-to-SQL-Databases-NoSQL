/*	Assignment4.sql
	Kevin Wong 
	CS150A Fall 2021 */

USE restaurant;
DROP TABLE IF EXISTS global_locations;
DROP TABLE IF EXISTS global_locations_backup;
DROP TABLE IF EXISTS animals;

-- Question 1: Write the CREATE TABLE statement for the International Foods Restaurant global locations 
-- table. Define the constraints at the column level.
-- Execute the CREATE TABLE statement. Use a single SQL statement to create that table. If you use more 
-- than one statement to do this part, you will receive no points for this query.
-- Execute a DESCRIBE command to view the Table Summary information.
CREATE TABLE global_locations (
	id INT(4) PRIMARY KEY,
    loc_name VARCHAR(20),
    address VARCHAR(20),
    city VARCHAR(20),
    zip_postal_code VARCHAR(20),
    phone VARCHAR(15),
    email VARCHAR(15) UNIQUE,
    manager_id INT(4),
    emergency_contact VARCHAR(20)
);

-- Question 2: Rewrite the CREATE TABLE statement for the International Foods Restaurant locations table 
-- to define the UNIQUE constraints at the table level. Do not execute this statement.
-- CREATE TABLE global_locations (
-- 	id INT(4) PRIMARY KEY,
--     loc_name VARCHAR(20),
--     address VARCHAR(20),
--     city VARCHAR(20),
--     zip_postal_code VARCHAR(20),
--     phone VARCHAR(15),
--     email VARCHAR(15),
--     manager_id INT(4),
--     emergency_contact VARCHAR(20),
-- 	CONSTRAINT global_locations_email_uq UNIQUE (email)
-- );

-- Question 3: Alter the global_locations table to add a column that stores the date of open location. 
-- Name this column date_opened and use an appropriate data type specification. You do not need to 
-- store any data to this column.
ALTER TABLE global_locations
ADD date_opened DATE;

-- Question 4: Display column names and datatypes for the global_locations table.
DESCRIBE global_locations;

-- Question 5: Delete the date_opened column from the global_locations table.
ALTER TABLE global_locations
DROP COLUMN date_opened;

-- Question 6: Rename the global_locations table as global_locations_backup.
RENAME TABLE global_locations TO global_locations_backup;

-- Question 7: Using the column information for the animals table below, create the animals table. Write 
-- the syntax you will use to create the table. 
-- Define the primary key (animal_id). 
-- The license_tag_number must be unique. 
-- The admit_date and vaccination_date columns cannot contain null values. 
-- animal_id INT(6) 
-- name VARCHAR(25) 
-- license_tag_number INT(10) 
-- admit_date DATE 
-- adoption_id INT(5)
-- vaccination_date DATE
CREATE TABLE animals (
	animal_id INT(6),
	name VARCHAR(25),
	license_tag_number INT(10),
	admit_date DATE NOT NULL,
	adoption_id INT(5),
	vaccination_date DATE NOT NULL,
	CONSTRAINT animals_id_pk PRIMARY KEY (animal_id),
    CONSTRAINT animals_license_tag_number_uq UNIQUE (license_tag_number)
    );
    
-- Question 8: Enter one row into the table. Execute a SELECT * statement to verify your input. Refer to 
-- the graphic below for input.
INSERT INTO animals (animal_id, name, license_tag_number, admit_date, adoption_id, vaccination_date)
VALUES (101, 'Spot', 35540, STR_TO_DATE('10-Oct-2004', '%d-%b-%Y'), 205, STR_TO_DATE('12-Oct-2004', '%d-%b-%Y'));

SELECT animal_id,
	name,
    license_tag_number,
    DATE_FORMAT(admit_date, '%d-%b-%Y') AS admit_date,
    adoption_id,
    DATE_FORMAT(vaccination_date, '%d-%b-%Y') AS vaccination_date
FROM animals;
 
-- Question 9: Display the names of the tables in your current database.
SHOW TABLES;
 
-- Question 10: Remove the global_locations_backup table from the database. Display the names of the 
-- tables in your current database.
DROP TABLE global_locations_backup;
SHOW TABLES;