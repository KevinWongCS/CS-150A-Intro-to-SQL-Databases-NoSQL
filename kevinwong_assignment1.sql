/*	Assignment1.sql
	Kevin Wong 
	CS150A Fall 2021*/

/* Query 1: Creates a database with the name university */

CREATE DATABASE IF NOT EXISTS university;

/* Query 2: Display's databases */
SHOW DATABASES;

/* Query 3: Selects the university database */
USE university;

/* Query 4: Displays all tables in university database */
SHOW TABLES;

/* Query 5: Creates table "student" in university database */
DROP TABLE IF EXISTS  student;
CREATE TABLE student(
    student_id INT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    reg_year DATE NOT NULL,
    email VARCHAR(50) NOT NULL,
    CONSTRAINT student_pk PRIMARY KEY (student_id),
    CONSTRAINT student_email_uk UNIQUE (email)
    );

/* Query 6: Displays query that created student table */
SHOW CREATE TABLE student;


/* Query 7: The DESCRIBE command will show the column names and data types for a table */
DESCRIBE student;

/* Query 8: Fills the student table from the university database with data */
INSERT INTO student VALUES(720, 'jack','smith', '2012-01-12','jsmith@school.edu');
INSERT INTO student VALUES(730, 'noah', 'audry', '2012-01-01','naudry@school.edu');
INSERT INTO student VALUES(740, 'rhonda','taylor', '2012-09-01','rtaylor@school.edu');
INSERT INTO student VALUES(750, 'robert','ben', '2012-03-01','rben@school.edu');
INSERT INTO student VALUES(760, 'jeanne','ben', '2012-03-01','jben@school.edu');
INSERT INTO student VALUES(770, 'mills','carmen', '2013-04-01','mcarmen@school.edu');

/* Query 9: Displays all information in the STUDENT table. */
SELECT *
FROM student;
