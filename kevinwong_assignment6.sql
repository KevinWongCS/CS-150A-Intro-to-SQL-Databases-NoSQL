/*	Assignment6.sql
	Kevin Wong 
	CS150A Fall 2021*/

USE restaurant;

-- Question 1: Run the DESCRIBE command on the orders table to view its structure. Add a default 
-- constraint that will use today's date to assign a value to the order_date column of the orders table if no 
-- date is provided. Run the DESCRIBE command again to verify the command was successful.
ALTER TABLE orders
MODIFY order_date DATE NOT NULL DEFAULT '2021-10-11';
DESCRIBE orders;

-- Question 2: The customer has decided that they would like a separate column for the customer’s phone 
-- number. This is an optional column that will be required to store 11 digits.
-- Run the DESCRIBE command on the customers table to view its structure. Add column that will satisfy 
-- the customer requirements. Run the DESCRIBE command on the customers table to view its structure.
ALTER TABLE customers
ADD customers_phone_number BIGINT(8);
DESCRIBE customers;

-- Question 3: The customer has decided that they do not need the phone number column as most 
-- customers only provide a single contact number and that is already catered for with the existing phone 
-- number column.
-- Run the DESCRIBE command on the customer table to view its structure. Drop the column that was 
-- created to store the phone number. Run the DESCRIBE command on the customer table to view its 
-- structure.
ALTER TABLE customers
DROP COLUMN customers_phone_number;
DESCRIBE customers;

-- Question 4: Write an INSERT statement that adds this row to the customers table:
-- customer_ID: 60
-- first_name: brian
-- last_name: rogers
-- phone_number: 01654564898'
-- address: 820 Bounty Drive
-- city: Palo Alto
-- state: CA
-- zip: 94342
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number) 
VALUES (60, 'brian', 'rogers', '820 Bounty Drive', 'Palo Alto', 'CA', '94342', ' 01654564898');
SELECT *
From customers
WHERE customer_ID = 60;

-- Question 5: Create the three o_tables (jobs, staff, and departments) using this syntax:
-- CREATE TABLE o_jobs AS (SELECT * FROM jobs);
-- CREATE TABLE o_staff AS (SELECT staff_id, first_name, last_name, email, 
-- hire_date, job_id FROM staff);
-- CREATE TABLE o_departments AS (SELECT * FROM departments);
CREATE TABLE o_jobs AS (SELECT * FROM jobs);
CREATE TABLE o_staff AS (SELECT staff_id, first_name, last_name, email, 
hire_date, job_id FROM staff);
CREATE TABLE o_departments AS (SELECT * FROM departments);

-- Question 6: Write an INSERT statement that adds the Human Resources job to the o_jobs table:
-- job_id: hr_man
-- job_title: human resources manager
-- min_salary: 4500
-- max_salary: 5500
INSERT INTO o_jobs(job_id, job_title, min_salary, max_salary)
VALUES ('hr_man', 'human resources manager', 4500, 5500);
SELECT *
FROM o_jobs
WHERE job_id = 'hr_man';

-- Question 7: Rename the o_jobs table to o_job_description.
RENAME TABLE o_jobs TO o_job_description;
SHOW TABLES;

-- Question 8: Create a copy of the staff table and call it your_initials_emp. 
-- Add a column to the new table called department_name and make this column the same data type and 
-- length as the department_name column in the departments table. 
CREATE TABLE your_initials_emp AS
	SELECT * 
    FROM staff;
ALTER TABLE your_initials_emp
ADD department_name VARCHAR(30);
DESCRIBE your_initials_emp;

-- Question 9: Drop the o_staff table. 
DROP TABLE o_staff;
SHOW TABLES;