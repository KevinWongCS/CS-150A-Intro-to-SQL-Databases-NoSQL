/* ****************************************************************************/
/*                                                                            */
/*                                                                            */
/*                  The residenceHalls Database                               */
/*                                                                            */
/*                                                                            */
/* ****************************************************************************/

/* This script creates the sports retail store database */

DROP DATABASE IF EXISTS residenceHalls;
CREATE DATABASE  residenceHalls;

USE residenceHalls;

/* drop the tables */
DROP TABLE IF EXISTS service_request; 
DROP TABLE IF EXISTS service_category;
DROP TABLE IF EXISTS residents;
DROP TABLE IF EXISTS property;  
DROP TABLE IF EXISTS owners;
DROP TABLE IF EXISTS office;

/* create the tables for the database */

CREATE TABLE owners (
    owner_num CHAR(5) PRIMARY KEY NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    address VARCHAR(100) NOT NULL,
    city VARCHAR(20) NOT NULL,
    state CHAR(2) NOT NULL,
    zip_code CHAR(5) NOT NULL
);

CREATE TABLE office (
    office_num INT PRIMARY KEY NOT NULL,
    office_name VARCHAR(50) NOT NULL,
    address VARCHAR(100) NOT NULL,
    area VARCHAR(50) NOT NULL,
    city VARCHAR(20) NOT NULL,
    state CHAR(2) NOT NULL,
    zip_code CHAR(5) NOT NULL
);

CREATE TABLE property (
    property_id INT PRIMARY KEY NOT NULL,
    office_num INT NOT NULL,
    address VARCHAR(100) NOT NULL,
    sqr_ft INT NOT NULL,
    bdrms INT NOT NULL,
    floors INT NOT NULL,
    monthly_rent INT,
    owner_num CHAR(5) NOT NULL,
    CONSTRAINT owner_prop_fk FOREIGN KEY (owner_num)
        REFERENCES owners (owner_num),
    CONSTRAINT office_prop_fk FOREIGN KEY (office_num)
        REFERENCES office (office_num)
);

CREATE TABLE service_category (
    category_num INT PRIMARY KEY NOT NULL,
    category_description VARCHAR(100) NOT NULL
);

CREATE TABLE service_request (
    service_id INT PRIMARY KEY NOT NULL,
    property_id INT NOT NULL,
    category_number INT NOT NULL,
    office_id TINYINT NOT NULL,
    description VARCHAR(200) NOT NULL,
    status VARCHAR(200) NOT NULL,
    est_hours TINYINT NOT NULL,
    spent_hours TINYINT NOT NULL,
    next_service_date DATE,
    CONSTRAINT property_serv_fk FOREIGN KEY (property_id)
        REFERENCES property (property_id),
    CONSTRAINT service_category_fk FOREIGN KEY (category_number)
        REFERENCES service_category (category_num)
);

CREATE TABLE residents (
    resident_id INT PRIMARY KEY NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    surname VARCHAR(20) NOT NULL,
    property_id INT NOT NULL,
    CONSTRAINT resi_property_fk FOREIGN KEY (property_id)
        REFERENCES property (property_id)
);
