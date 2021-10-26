/* ****************************************************************************/
/*	                                                				          */
/*														                      */
/*	                The Library Database            			              */
/*																		      */
/*	                                            			                  */
/* ****************************************************************************/

/*  Insert data into the tables */
/* insert sample data into the CATEGORY table */
INSERT INTO categories (category_id, category_desc) VALUES
(91111,'Family Life'),
(92222,'Cooking'),
(93333,'Science'),
(94444,'Literature'),
(96666,'Fitness'),
(97777,'Children'),
(98888,'Computer Science'),
(95555,'Fiction'),
(99999,'General');

/* insert sample data into the BRANCH table */
INSERT INTO branch (branch_id,branch_name, city, address) VALUES
(91234,'Bayfair', 'San Leandro', '27300 Patrick Ave'),
(92345,'Cal State', 'Hayward', '835 C St'),
(93456,'Downtown', 'Hayward','200 Civic Plaza'),
(94567,'Sharpstown', 'Berekely', '16335 E 14th St'),
(95678,'Berekely Public Library', 'Berekely','395 Paseo Grande'),
(96789,'Fremont Public Library', 'Fremont','2400 Stevenson Blvd'),
(97891,'Union City Library', 'Union City', '34007 Alvarado-Niles Rd');

/* insert sample data into the BORROWER table */


INSERT INTO borrower 
VALUES (1001,'Morales', 'Bonita', 'P.O. BOX 6677', 'Hayward', 'CA', '94304'); 
INSERT INTO borrower 
VALUES (1002,'Thompson', 'Ryan', 'P.O. BOX 6677', 'Hayward', 'CA', '94704'); 
INSERT INTO borrower 
VALUES (1003,'Smith', 'Leila', 'P.O. BOX 66', 'Berekely', 'CA', '94701'); 

INSERT INTO borrower 
VALUES (1004,'Pierson', 'Thomas', '69821 South Avenue', 'Union City', 'CA', '94512'); 
INSERT INTO borrower 
VALUES (1005,'Girard', 'Cindy', 'P.O. BOX 851', 'Hayward', 'CA', '94645'); 
INSERT INTO borrower 
VALUES (1006,'Cruz', 'Meshia', '82 Dirt Road', 'Albany', 'CA', '94234'); 
INSERT INTO borrower 
VALUES (1007,'Giana', 'Tammy', '9153 Main Street', 'Berekely', 'CA', '94703'); 
INSERT INTO borrower 
VALUES (1008,'Jones', 'Kenneth', 'P.O. BOX 137', 'Fremont', 'CA', '94708'); 
INSERT INTO borrower 
VALUES (1009,'Perez', 'Jorge', 'P.O. BOX 8564', 'Oakland', 'CA', '94601'); 
INSERT INTO borrower 
VALUES (1010,'Lucas', 'Jake', '114 East Savannah', 'Alameda', 'CA', '94501'); 
INSERT INTO borrower 
VALUES (1011,'Mcgovern', 'Reese', 'P.O. BOX 18', 'Oakland', 'CA', '94619');  
INSERT INTO borrower 
VALUES (1012,'Mckenzie', 'William', 'P.O. BOX 971', 'Union City', 'CA', '94536'); 
INSERT INTO borrower 
VALUES (1013,'Nguyen', 'Nicholas', '357 White Eagle AVE.', 'Fremont', 'CA', '94545'); 
INSERT INTO borrower 
VALUES (1014,'Lee', 'Jasmine', 'P.O. BOX 2947', 'San Leandro', 'CA', '94414'); 
INSERT INTO borrower 
VALUES (1015,'Schell', 'Steve', 'P.O. BOX 677', 'Hayward', 'CA', '94311'); 
INSERT INTO borrower 
VALUES (1016,'Daum', 'Michell', '9851231 Long Road', 'Alameda', 'CA', '91508'); 
INSERT INTO borrower 
VALUES (1017,'Nelson', 'Becca', 'P.O. BOX 563', 'San Leandro', 'CA', '94006'); 
INSERT INTO borrower 
VALUES (1018,'Montiasa', 'Greg', '1008 Grand Avenue', 'Berekely', 'CA', '91206'); 
INSERT INTO borrower 
VALUES (1019,'Smith', 'Jennifer', 'P.O. BOX 1151', 'Berekely', 'CA', '97962'); 
INSERT INTO borrower 
VALUES (1020,'Falah', 'Kenneth', 'P.O. BOX 335', 'San Leandro', 'CA', '94577');
INSERT INTO borrower  
VALUES  (1021, 'Anders', 'Matt', '123 Summit Court', 'Hayward','CA', '94540');
 
/* insert sample data into the PUBLISHER table */
INSERT INTO publisher VALUES(9000,'Addison Wesley','Tommie Seymour','000-714-8321'); 
INSERT INTO publisher VALUES(9456,'Morgan Kaufmann','Jane Tomlin','010-410-0010'); 
INSERT INTO publisher VALUES(9102,'O''Reilly','David Davidson','800-555-1211'); 
INSERT INTO publisher VALUES(9325,'McGraw Hill','Renee Smith','800-555-9743'); 
INSERT INTO publisher VALUES(9745,'American Publishing',NULL,'800-555-8284');
INSERT INTO publisher VALUES (9725, 'Springer', 'Adams Samuel','800-333-8344' ) ;
INSERT INTO publisher VALUES (9561, 'Houghton Mifflin', 'Edwards Donna','800-444-9723'); 
INSERT INTO publisher VALUES (9902, 'W.W. Norton ', 'Brahms Johnni','888-410-0010') ;
INSERT INTO publisher VALUES (9024, 'Pearson', 'Carlsen Benny','800-987-0000') ;
INSERT INTO publisher VALUES (9776, 'Simon and Schuster', NULL,'888-666-8284' ) ;
  
/* insert sample data into the AUTHOR table */
INSERT INTO author VALUES ('S100','Smith', 'Wilson'); 
INSERT INTO author VALUES ('J100','Jones','Gibson'); 
INSERT INTO author VALUES ('A100','Austin','James'); 
INSERT INTO author VALUES ('M100','Martinez','Weisfeld'); 
INSERT INTO author VALUES ('K100','Kzochsky','Tamara'); 
INSERT INTO author VALUES ('P100','Porter','Lisa'); 
INSERT INTO author VALUES ('A105','Adams','Juan'); 
INSERT INTO author VALUES ('B100','Jackoby','Jack');  
INSERT INTO author VALUES ('P105','Peterson','Tina'); 
INSERT INTO author VALUES ('W100','Allen','William'); 
INSERT INTO author VALUES ('W105','White','Lisa'); 
INSERT INTO author VALUES ('R100','Robinson','Robert'); 
INSERT INTO author VALUES ('F100','Fields','Jesse'); 
INSERT INTO author VALUES ('J211','James','Watson');
INSERT INTO author VALUES ('W110','Wilkinson','Anthony');
INSERT INTO author VALUES ('A210','Steven','Rice');
INSERT INTO author VALUES ('R310','Rajshekhar','Sunderram');
INSERT INTO author VALUES ('J310','Clark','Cottrell');
INSERT INTO author VALUES ('D311','David','Cwalina');
INSERT INTO author VALUES ('R410','Robert','Massie');
INSERT INTO author VALUES ('M410','Mass','Michael');
INSERT INTO author VALUES ('C510','Carolly','Nikos');
INSERT INTO author VALUES ('T610','Jim','Melton');
INSERT INTO author VALUES ('B610','Tim','Carlos');
INSERT INTO author VALUES ('R710','Rasmus','Birkhead');
INSERT INTO author VALUES ('D610','DeLoura','Miller');
INSERT INTO author VALUES ('K910','King','Stephen');
INSERT INTO author VALUES ('R910','Ridley','Scott');
INSERT INTO author VALUES ('K310','Kay','Brodo');
INSERT INTO author VALUES ('P747','Ken', 'Pugh');
INSERT INTO author VALUES ('W343','Matt', 'Weisfeld');
INSERT INTO author VALUES ('S190', 'Baron', 'Schwartz' );
INSERT INTO author VALUES ('G474', 'Graeme', 'Gibson');
INSERT INTO author VALUES ('H314', 'Bert','Holldobler');
INSERT INTO author VALUES ('W314', 'E.O.','Wilson');

/* insert sample data into the BOOKS table */
INSERT INTO books VALUES ('1059831198', '2005-03-08', 'Harry Potter and the goblet of fire', 9000, 25.95, 97777);
INSERT INTO books VALUES ('4981341710', '2006-04-08','Harry Potter and the chambers of secrets',9456, 17.95, 97777);
INSERT INTO books VALUES ('8843172113', '2007-09-09','Harry Potter and the chamber of secrets', 9102, 19.95, 97777);
INSERT INTO books VALUES ('3437212490', '2010-03-08','The mists of avalon', 9325, 12.95, 95555);
INSERT INTO books VALUES ('3957136468', '2002-02-01','George and Martha the complete stories of two best friends', 9000, 25.00, 97777);
INSERT INTO books VALUES ('1915762492', '2005-03-30','Interview with a vampire',9745, 6.99, 95555);
INSERT INTO books VALUES ('9959789321', '2003-03-08','Lasher', 9456, 14.00, 95555);
INSERT INTO books VALUES ('2491748320', NULL,'The vampire lestat', 9776, 6.99, 95555);
INSERT INTO books VALUES ('0299282519', '2005-09-02','The tale of the body thief', 9325, 6.99, 95555);
INSERT INTO books VALUES ('8117949391', '2007-09-01','Oracle8 Programming a primer', 9745, 29.99, 98888);
INSERT INTO books VALUES ('0132149871', '2001-02-03','North Carolina Hiking Trails', 9561, 14.95, 99999);
INSERT INTO books VALUES ('9247381001', '2004-05-06','Skiing Everyone', 9456,  10.00, 99999);
INSERT INTO books VALUES ('2147428890', '2007-08-19','The Mbuti Pygmies', 9000,  15.00, 99999);
INSERT INTO books VALUES ('0201615711','2009-08-07','Network Programming with Perl', 9776, 39.95, 98888);
INSERT INTO books VALUES ('0596000278', '2006-05-04','Programming Perl', 9745, 39.96, 98888);
INSERT INTO books VALUES ('1565922840', '2003-02-11','Learning Perl', 9456, 23.96, 98888);
INSERT INTO books VALUES ('1930110006', NULL,'Data Munging with Perl', 9745,  29.56, 98888);
INSERT INTO books VALUES ('1565926099', '2004-05-16','Perl for System Administration', 9456, 27.96, 98888);
INSERT INTO books VALUES ('0345438310', '2008-03-10','Nicholas and Alexandra', 9561, 14.40, 99999);
INSERT INTO books VALUES ('0345298063', '2004-06-09','Peter the Great : His Life and World',9000, 11.20, 99999);
INSERT INTO books VALUES ('0674003306', '2003-02-01','Lenin: A Biography', 9000,  28.00, 99999);
INSERT INTO books VALUES ('0060959290', NULL,'Among the Russians',9000, 11.20, 99999);
INSERT INTO books VALUES ('0312135033', '2011-05-12','Great Catherine', 9561,  13.56, 99999);
INSERT INTO books VALUES ('0764547161', '2010-11-18','PHP4 Bible', 9902,  27.99, 98888);
INSERT INTO books VALUES ('0534368018', '2009-05-08','A First Book of C++: From Here to There',9024, 60.95, 98888);
INSERT INTO books VALUES ('1584500492', '2009-01-09','Game Programming Gems', 9325, 69.95, 98888);
INSERT INTO books VALUES ('0671032658', '2010-02-18','Green Mile, The', 9456, 7.99, 95555);
INSERT INTO books VALUES ('0935112510', '2015-04-28','Golf Rules Illustrated',9102, 19.95, 92222);
INSERT INTO books VALUES ('0811826848', '2000-05-29','Beatles Anthology, The', 9456,  59.95, 99999);
INSERT INTO books VALUES ('0446310783', '2015-07-20','To Kill a Mockingbird', 9000, 6.99, 95555);
INSERT INTO books VALUES ('0399501487', '2000-03-28','Lord of the Flies: A Novel',9561, 6.95, 95555);
INSERT INTO books VALUES ('1557044287', '2013-03-09','Gladiator', 9902, 26.36,95555);
INSERT INTO books VALUES ('0743215052', '2011-03-08','The Constant Gardener',9024, 28,91111);
INSERT INTO books VALUES ('0401140733', '2015-07-07','The Third Option',9024, 24.95,95555);
INSERT INTO books VALUES ('0505523078', '2004-02-18','Virtual Heaven',9456, 5.99,95555);
INSERT INTO books VALUES ('0821762559', '2015-03-23','Daughter of Camelot',9000, 5.99,95555);
INSERT INTO books VALUES ('0553577476', '2005-03-25','Lady Reckless',9776, 5.50,95555);
INSERT INTO books VALUES ('0201385902', '2010-03-25', 'Intro to DB Systems-7th Ed', 9325, 80.00, 98888);
INSERT INTO books VALUES ('046507135X', '2008-03-25','Why Birds Sing',9725, 20.25,97777);
INSERT INTO books VALUES ('9780071599', '2011-03-25', 'Oracle SQL Fundamentals I Exam Guide', 9725, 90.00, 98888);
INSERT INTO books VALUES ('0679451234', '2010-03-20', 'Sibley Guide to Bird Life and Behavior',9000, 20.00, 99999);
INSERT INTO books VALUES ('0265615357', '2009-03-25', 'ADO and Oracle Workbook', 9000, 59.99, 98888);
INSERT INTO books VALUES ('0852515358', '2005-04-15', 'ADO: the ebook', 9000, 49.99, 98888);
INSERT INTO books VALUES ('0657895157', '2011-03-22', 'Rainbows and Rainbows',9725, 19.99, 99999);


 /* insert sample data into the BOOK_AUTHOR table */
INSERT INTO book_author VALUES ('2147428890','W105');
INSERT INTO book_author VALUES ('1059831198','S100'); 
INSERT INTO book_author VALUES ('0401140733','J100'); 
INSERT INTO book_author VALUES ('4981341710','K100'); 
INSERT INTO book_author VALUES ('3437212490','B100');
INSERT INTO book_author VALUES ('3957136468','A100'); 
INSERT INTO book_author VALUES ('1915762492','W100'); 
INSERT INTO book_author VALUES ('1915762492','W105'); 
INSERT INTO book_author VALUES ('9959789321','J100');
INSERT INTO book_author VALUES ('2491748320','R100'); 
INSERT INTO book_author VALUES ('2491748320','F100'); 
INSERT INTO book_author VALUES ('2491748320','B100'); 
INSERT INTO book_author VALUES ('0299282519','S100');
INSERT INTO book_author VALUES ('8117949391','R100');
INSERT INTO book_author VALUES ('0132149871','S100');
INSERT INTO book_author VALUES ('9247381001','W100'); 
INSERT INTO book_author VALUES ('0553577476','R100'); 
INSERT INTO book_author VALUES ('8843172113','P105'); 
INSERT INTO book_author VALUES ('8843172113','A100'); 
INSERT INTO book_author VALUES ('8843172113','A105'); 
INSERT INTO book_author VALUES ('0201615711','K310');
INSERT INTO book_author VALUES ('0596000278','R310');
INSERT INTO book_author VALUES ('1565922840','R910');
INSERT INTO book_author VALUES ('1930110006','K910');
INSERT INTO book_author VALUES ('1565926099','T610');
INSERT INTO book_author VALUES ('1565926099','D610');
INSERT INTO book_author VALUES ('1565926099','R310');
INSERT INTO book_author VALUES ('0345298063','B610');
INSERT INTO book_author VALUES ('0674003306','C510');
INSERT INTO book_author VALUES ('0060959290','M410');
INSERT INTO book_author VALUES ('0312135033','R410');
INSERT INTO book_author VALUES ('0764547161','A210');
INSERT INTO book_author VALUES ('0534368018','R310');
INSERT INTO book_author VALUES ('0534368018','J211');
INSERT INTO book_author VALUES ('1584500492','J211');
INSERT INTO book_author VALUES ('0671032658','D311');
INSERT INTO book_author VALUES ('0935112510','M410');
INSERT INTO book_author VALUES ('0811826848','B100');
INSERT INTO book_author VALUES ('0446310783','S100');
INSERT INTO book_author VALUES ('0399501487','C510');
INSERT INTO book_author VALUES ('1557044287','K100');
INSERT INTO book_author VALUES ('0743215052','A105');
INSERT INTO book_author VALUES ('0505523078','S100');
INSERT INTO book_author VALUES ('0821762559','C510');
INSERT INTO book_author VALUES ('0201385902','P747');
INSERT INTO book_author VALUES ('046507135X','B100');
INSERT INTO book_author VALUES ('9780071599','S100');
INSERT INTO book_author VALUES ('0399501487','W343');
INSERT INTO book_author VALUES ('9780071599','S190');
INSERT INTO book_author VALUES ('0679451234','G474');
INSERT INTO book_author VALUES ('0265615357','S100');
INSERT INTO book_author VALUES ('0852515358','H314');
INSERT INTO book_author VALUES ('0657895157','W314');

/* insert sample data into the BOOK_COPIES table */
INSERT INTO book_copies VALUES ('2147428890',91234, 5);
INSERT INTO book_copies VALUES ('2147428890',94567, 3);
INSERT INTO book_copies VALUES ('1059831198',92345, 10);
INSERT INTO book_copies VALUES ('1059831198',93456, 5);
INSERT INTO book_copies VALUES ('0401140733',93456, 15);
INSERT INTO book_copies VALUES ('0401140733',97891, 5);
INSERT INTO book_copies VALUES ('4981341710',94567, 9);
INSERT INTO book_copies VALUES ('4981341710',92345, 8);
INSERT INTO book_copies VALUES ('3437212490',95678, 20);
INSERT INTO book_copies VALUES ('3437212490',97891, 10);
INSERT INTO book_copies VALUES ('3957136468',96789, 3);
INSERT INTO book_copies VALUES ('3957136468',94567, 9);
INSERT INTO book_copies VALUES ('3957136468',97891, 2);
INSERT INTO book_copies VALUES ('1915762492',91234, 2);
INSERT INTO book_copies VALUES ('9959789321',91234, 12);
INSERT INTO book_copies VALUES ('2491748320',97891, 4);
INSERT INTO book_copies VALUES ('2491748320',92345, 9);
INSERT INTO book_copies VALUES ('0299282519', 94567, 8);
INSERT INTO book_copies VALUES ('0299282519',96789, 3);
INSERT INTO book_copies VALUES ('8117949391',94567, 5);
INSERT INTO book_copies VALUES ('0132149871',93456, 10);
INSERT INTO book_copies VALUES ('9247381001',97891, 15);
INSERT INTO book_copies VALUES ('9247381001',93456, 14);
INSERT INTO book_copies VALUES ('0553577476',91234, 5);
INSERT INTO book_copies VALUES ('0553577476',94567, 3);
INSERT INTO book_copies VALUES ('8843172113',92345, 10);
INSERT INTO book_copies VALUES ('8843172113',93456, 5);
INSERT INTO book_copies VALUES ('0201615711',93456, 11);
INSERT INTO book_copies VALUES ('0201615711',97891, 5);
INSERT INTO book_copies VALUES ('0596000278',94567, 9);
INSERT INTO book_copies VALUES ('0596000278',92345, 8);
INSERT INTO book_copies VALUES ('1565922840',95678, 20);
INSERT INTO book_copies VALUES ('1565922840',97891, 12);
INSERT INTO book_copies VALUES ('1930110006',96789, 3);
INSERT INTO book_copies VALUES ('1930110006',94567, 9);
INSERT INTO book_copies VALUES ('1930110006',97891, 2);
INSERT INTO book_copies VALUES ('1565926099',91234, 2);
INSERT INTO book_copies VALUES ('0345298063',91234, 10);
INSERT INTO book_copies VALUES ('0674003306',97891, 5);
INSERT INTO book_copies VALUES ('0674003306',92345, 9);
INSERT INTO book_copies VALUES ('0060959290', 94567, 8);
INSERT INTO book_copies VALUES ('0060959290',96789, 3);
INSERT INTO book_copies VALUES ('0312135033',94567, 5);
INSERT INTO book_copies VALUES ('0764547161',93456, 12);
INSERT INTO book_copies VALUES ('0534368018',97891, 15);
INSERT INTO book_copies VALUES ('0534368018',93456, 14);
INSERT INTO book_copies VALUES ('1584500492',94567, 3);
INSERT INTO book_copies VALUES ('1584500492',92345, 5);
INSERT INTO book_copies VALUES ('0671032658',95678, 20);
INSERT INTO book_copies VALUES ('0671032658',97891, 10);
INSERT INTO book_copies VALUES ('0935112510',96789, 4);
INSERT INTO book_copies VALUES ('0935112510',94567, 5);
INSERT INTO book_copies VALUES ('0811826848',97891, 2);
INSERT INTO book_copies VALUES ('0446310783',91234, 2);
INSERT INTO book_copies VALUES ('0399501487',91234, 10);
INSERT INTO book_copies VALUES ('0399501487',97891, 4);
INSERT INTO book_copies VALUES ('0399501487',92345, 3);
INSERT INTO book_copies VALUES ('1557044287', 94567, 7);
INSERT INTO book_copies VALUES ('0743215052',96789, 2);
INSERT INTO book_copies VALUES ('0505523078',94567, 5);
INSERT INTO book_copies VALUES ('0821762559',94567, 5);

/* insert sample data into the BOOKLOANS table */
INSERT INTO book_loans VALUES ('1059831198',93456, 1004, '2017-06-03', '2017-07-03');
INSERT INTO book_loans VALUES ('0401140733',93456, 1003, '2017-01-10', '2017-02-15');
INSERT INTO book_loans VALUES ('4981341710',94567, 1005, '2017-08-13', '2017-09-13');
INSERT INTO book_loans VALUES ('4981341710',94567, 1008, '2017-04-02', '2017-05-02');
INSERT INTO book_loans VALUES ('3437212490',95678, 1010, '2017-10-15', '2017-11-15');
INSERT INTO book_loans VALUES ('3957136468',96789, 1006, '2017-06-03', '2017-07-05');
INSERT INTO book_loans VALUES ('3957136468',97891, 1011, '2017-06-15', '2017-07-15');
INSERT INTO book_loans VALUES ('9959789321',91234, 1007, '2017-08-15', '2017-09-15');
INSERT INTO book_loans VALUES ('2491748320',97891, 1009, '2017-01-09', '2017-02-09');
INSERT INTO book_loans VALUES ('0299282519',94567, 1012, '2017-02-15', '2017-03-15');
INSERT INTO book_loans VALUES ('0299282519',96789, 1005, '2017-10-07', '2017-11-07');
INSERT INTO book_loans VALUES ('9247381001',93456, 1009, '2017-01-15', '2017-01-15');
INSERT INTO book_loans VALUES ('0132149871',93456, 1013, '2017-03-08', '2017-03-10');
INSERT INTO book_loans VALUES ('9247381001',97891, 1011, '2017-04-14', '2017-05-10');
INSERT INTO book_loans VALUES ('0299282519',94567, 1007, '2017-03-07', '2017-04-07');
INSERT INTO book_loans VALUES ('1915762492',91234, 1005, '2017-06-15', '2017-07-15');
INSERT INTO book_loans VALUES ('0446310783',91234, 1021, '2017-07-15', '2017-08-15');
INSERT INTO book_loans VALUES ('0534368018',93456, 1003, '2016-06-03', '2017-01-03');
INSERT INTO book_loans VALUES ('0935112510',94567, 1008, '2017-08-13', '2017-09-13');
INSERT INTO book_loans VALUES ('0935112510',94567, 1005, '2017-04-02', '2017-05-02');
INSERT INTO book_loans VALUES ('0671032658',95678, 1011, '2017-10-15', '2017-11-05');
INSERT INTO book_loans VALUES ('0060959290',96789, 1006, '2017-06-03', '2017-07-05');
INSERT INTO book_loans VALUES ('1565926099',91234, 1007, '2017-06-11', '2017-07-11');
INSERT INTO book_loans VALUES ('0674003306',97891, 1009, '2017-01-09', '2017-02-09');
INSERT INTO book_loans VALUES ('1930110006',94567, 1012, '2017-02-15', '2017-03-15');
INSERT INTO book_loans VALUES ('1930110006',96789, 1003, '2017-10-07', '2017-11-07');
INSERT INTO book_loans VALUES ('0401140733',93456, 1008, '2017-01-15', '2017-02-15');
INSERT INTO book_loans VALUES ('0764547161',93456, 1013, '2017-03-08', '2017-03-10');
INSERT INTO book_loans VALUES ('1930110006',97891, 1011, '2017-04-14', '2017-05-10');
INSERT INTO book_loans VALUES ('0553577476',91234, 1005, '2017-06-15', '2017-07-15');
