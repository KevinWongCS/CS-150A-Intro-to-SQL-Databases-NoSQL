

/* ****************************************************************************/
/*	                                                				          */
/*														                      */
/*	                The Library Database            			              */
/*																		      */
/*	                                            			                  */
/* ****************************************************************************/
/* This script creates the library database */

CREATE DATABASE IF NOT EXISTS library;

USE library;

/* drop the tables */
DROP TABLE IF EXISTS book_author;
DROP TABLE IF EXISTS book_loans;
DROP TABLE IF EXISTS book_copies;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS author;
DROP TABLE IF EXISTS publisher;
DROP TABLE IF EXISTS borrower;
DROP TABLE IF EXISTS branch;
DROP TABLE IF EXISTS categories;
/* create the tables for the database */

CREATE TABLE IF NOT EXISTS categories (
    category_id INT(10) NOT NULL,
    category_desc VARCHAR(80) NOT NULL DEFAULT '',
    PRIMARY KEY (category_id)
)  ENGINE=INNODB;

/* create BRANCH the table */
CREATE TABLE IF NOT EXISTS branch (
    branch_id INT(8) NOT NULL,
    branch_name VARCHAR(80) NOT NULL DEFAULT '',
    city VARCHAR(80) DEFAULT NULL,
    address VARCHAR(80) DEFAULT NULL,
    PRIMARY KEY (branch_id)
)  ENGINE=INNODB;

/* create the BORROWER table */
CREATE TABLE borrower (
    card_no INT(4),
    last_name VARCHAR(15) NOT NULL,
    first_name VARCHAR(15) NOT NULL,
    address VARCHAR(20),
    city VARCHAR(12),
    state VARCHAR(2),
    zip VARCHAR(5),
    CONSTRAINT borrower_borrower_pk PRIMARY KEY (card_no)
);
 
/* create the PUBLISHER table */
CREATE TABLE publisher (
    pub_id INT,
    name VARCHAR(23),
    contact VARCHAR(15),
    phone VARCHAR(12),
    CONSTRAINT publisher_pubid_pk PRIMARY KEY (pub_id)
);
 
/* create the Author table */
CREATE TABLE author (
    author_id VARCHAR(4),
    last_name VARCHAR(10),
    first_name VARCHAR(10),
    CONSTRAINT author_authorid_pk PRIMARY KEY (author_id)
);
 /* create the BOOKS table */
CREATE TABLE books (
    isbn VARCHAR(10),
     pub_date DATE,
    title VARCHAR(130),
    Pub_id INT,
    list_price DECIMAL(5 , 2 ),
    category_id INT(10),
    CONSTRAINT books_isbn_pk PRIMARY KEY (isbn),
    CONSTRAINT books_category_fk FOREIGN KEY (category_id)
        REFERENCES categories (category_id),
    CONSTRAINT books_pubid_fk FOREIGN KEY (pub_id)
        REFERENCES publisher (pub_id)
);
 
/* create the BOOK_AUTHOR table */
CREATE TABLE book_author (
    isbn VARCHAR(10),
    author_id VARCHAR(4),
    CONSTRAINT bookauthor_pk PRIMARY KEY (isbn , author_id),
    CONSTRAINT bookauthor_isbn_fk FOREIGN KEY (isbn)
        REFERENCES books (isbn),
    CONSTRAINT bookauthor_authorid_fk FOREIGN KEY (author_id)
        REFERENCES author (author_id)
);
  
/* create the BOOKCOPIES table */ 
CREATE TABLE book_copies (
    isbn VARCHAR(10),
    branch_id INT(8) NOT NULL,
    no_of_copies INT,
    PRIMARY KEY (isbn , branch_id),
    FOREIGN KEY (isbn)
        REFERENCES books (isbn),
    FOREIGN KEY (branch_id)
        REFERENCES branch (branch_id)
);
 
/* create the BOOKLOANS table */    
CREATE TABLE book_loans (
    isbn VARCHAR(10),
    branch_id INT(8) NOT NULL,
    card_no INT NOT NULL,
    date_out DATE,
    due_date DATE,
    PRIMARY KEY (isbn , branch_id , card_no),
    FOREIGN KEY (isbn)
        REFERENCES books (isbn),
    FOREIGN KEY (branch_id)
        REFERENCES branch (branch_id),
    FOREIGN KEY (card_no)
        REFERENCES borrower (card_no)
);