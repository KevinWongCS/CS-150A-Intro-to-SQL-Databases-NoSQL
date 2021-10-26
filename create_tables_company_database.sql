
/* ****************************************************************************/
/*	                                                		                  */
/*									                                          */
/*	                       The Company Database                               */
/*									                                          */
/*	                                            			                  */
/* ****************************************************************************/

CREATE DATABASE IF NOT EXISTS company;


/* drop the tables */

USE company;
DROP TABLE IF EXISTS dependent;
DROP TABLE IF EXISTS dept_locations;
DROP TABLE IF EXISTS works_on;
DROP TABLE IF EXISTS project;
DROP TABLE IF EXISTS department;
DROP TABLE IF EXISTS employee;

/* create the EMPLOYEE table */
CREATE TABLE employee (
  fname    VARCHAR(15) NOT NULL, 
  minit    VARCHAR(1),
  lname    VARCHAR(15) NOT NULL,
  ssn      CHAR(9),
  bdate    DATETIME,
  address  VARCHAR(50),
  sex      CHAR(10),
  salary   DECIMAL(10,2),
  superssn CHAR(9),
  dno      INT(4),
  PRIMARY KEY (ssn),
  FOREIGN KEY (superssn) REFERENCES employee(ssn)
)ENGINE = INNODB;


/* create the DEPARTMENT table */
CREATE TABLE department (
  dname        VARCHAR(25) NOT NULL,
  dnumber      INT(4),
  mgrssn       CHAR(9) NOT NULL, 
  mgrstartdate DATETIME,
  PRIMARY KEY (dnumber),
  UNIQUE (dname),
  FOREIGN KEY (mgrssn) REFERENCES employee(ssn)
)ENGINE = INNODB ;

/* create the DEPT_LOCATIONS table */
CREATE TABLE dept_locations (
  dnumber   INT(4),
  dlocation VARCHAR(15), 
  PRIMARY KEY (dnumber,dlocation),
  FOREIGN KEY (dnumber) REFERENCES department(dnumber)
)ENGINE = INNODB;

/* create the DEPT_PROJECT table */
CREATE TABLE project (
  pname      VARCHAR(25) NOT NULL,
  pnumber    INT(4),
  plocation  VARCHAR(15),
  dnum       INT(4) NOT NULL,
  PRIMARY KEY (pnumber),
  UNIQUE (pname),
  FOREIGN KEY (dnum) REFERENCES department(dnumber)
)ENGINE = INNODB;

/* create the WORKS_ON table */
CREATE TABLE works_on (
  essn   CHAR(9),
  pno    INT(4),
  hours  DECIMAL(4,1),
  PRIMARY KEY (essn,pno),
  FOREIGN KEY (essn) REFERENCES employee(ssn),
  FOREIGN KEY (pno) REFERENCES project(pnumber)
)ENGINE = INNODB;

/* create the DEPENDENT table */
CREATE TABLE dependent (
    essn CHAR(9),
    dependent_name VARCHAR(15),
    sex CHAR,
    bdate DATE,
    relationship VARCHAR(8),
    PRIMARY KEY (essn , dependent_name),
    FOREIGN KEY (essn)
        REFERENCES employee (ssn)
)  ENGINE=INNODB;
