

/* ****************************************************************************/
/*                                                                            */
/*                                                                            */
/*      The Reataurant Database                                               */
/*                                                                            */
/*                                                                            */
/* ****************************************************************************/

/*  Insert data into the tables */


USE restaurant;

-- Drop all tables if they exist
DROP TABLE IF EXISTS shift_assignments;
DROP TABLE IF EXISTS shifts;
DROP TABLE IF EXISTS order_lines;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS staff;
DROP TABLE IF EXISTS food_items;
DROP TABLE IF EXISTS regular_menus;
DROP TABLE IF EXISTS promotional_menus;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS jobs;
DROP TABLE IF EXISTS departments;

-- Create departments table
CREATE TABLE departments (
    department_id DECIMAL(4 , 0 ),
    department_name VARCHAR(30) NOT NULL,
    manager_id DECIMAL(6 , 0 ),
    CONSTRAINT dept_id_pk PRIMARY KEY (department_id)
);

-- Create jobs table
CREATE TABLE jobs (
    job_id VARCHAR(10),
    job_title VARCHAR(35) NOT NULL,
    min_salary DECIMAL(6 , 0 ),
    max_salary DECIMAL(6 , 0 ),
    CONSTRAINT job_id_pk PRIMARY KEY (job_id)
);
-- Create customers table
CREATE TABLE customers (
    customer_id DECIMAL(5 , 0 ),
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(35) NOT NULL,
    address VARCHAR(50) NOT NULL,
    city VARCHAR(30) NOT NULL,
    state VARCHAR(20) NOT NULL,
    zip DECIMAL(10 , 0 ) NOT NULL,
    phone_number VARCHAR(25) NOT NULL,
    CONSTRAINT csr_id_pk PRIMARY KEY (customer_id)
);

-- Create promotional_menus table
CREATE TABLE promotional_menus (
    code VARCHAR(3),
    name VARCHAR(30) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    give_away VARCHAR(80),
    CONSTRAINT pmu_code_pk PRIMARY KEY (code)
);

-- Create regular_menus table
CREATE TABLE regular_menus (
    code VARCHAR(3),
    type VARCHAR(30) NOT NULL,
    hours_served VARCHAR(30) NOT NULL,
    CONSTRAINT rmu_code_PK PRIMARY KEY (code)
);

CREATE TABLE categories (
    category_id VARCHAR(5),
    category_name VARCHAR(50) NOT NULL,
    CONSTRAINT category_id_pk PRIMARY KEY (category_id)
);

-- Create food_items table
CREATE TABLE food_items (
    item_number DECIMAL(5 , 0 ),
	category_id VARCHAR(5),
    description VARCHAR(100) NOT NULL,
    price DECIMAL(8 , 2 ) NOT NULL,
    regular_code VARCHAR(3),
    promo_code VARCHAR(3),
    CONSTRAINT fim_item_number_pk PRIMARY KEY (item_number),
     CONSTRAINT category_fk FOREIGN KEY (category_id)
        REFERENCES categories( category_id),
    CONSTRAINT fim_promo_code_fk FOREIGN KEY (promo_code)
        REFERENCES promotional_menus (CODE),
    CONSTRAINT fim_regular_code_fk FOREIGN KEY (regular_code)
        REFERENCES regular_menus (CODE)
);

-- Create staff table
CREATE TABLE staff (
    staff_id DECIMAL(5 , 0 ),
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(35) NOT NULL,
    email VARCHAR(35) NOT NULL,
    birthdate DATE NOT NULL,
    salary DECIMAL(8 , 2 ) NOT NULL,
    overtime_rate DECIMAL(5 , 2 ),
    training VARCHAR(50),
    job_id VARCHAR(10) NOT NULL,
    manager_id DECIMAL(5 , 0 ),
    dept_id DECIMAL(4 , 0 ),
    hire_date DATE NOT NULL,
    CONSTRAINT emp_salary_min CHECK (salary > 0),
    CONSTRAINT emp_email_uk UNIQUE (email),
    CONSTRAINT stf_id_pk PRIMARY KEY (staff_id),
    CONSTRAINT staff_dept FOREIGN KEY (dept_id)
        REFERENCES departments (department_id),
    CONSTRAINT dept_mgr_fk FOREIGN KEY (manager_id)
        REFERENCES staff (staff_id),
         CONSTRAINT staff_job FOREIGN KEY (job_id)
        REFERENCES jobs (job_id)
);

-- Create orders table
CREATE TABLE orders (
    order_number DECIMAL(5 , 0 ),
    order_date DATE NOT NULL,
    cust_id DECIMAL(5 , 0 ) NOT NULL,
    staff_id DECIMAL(5 , 0 ) NOT NULL,
    CONSTRAINT odr_order_number_pk PRIMARY KEY (order_number),
    CONSTRAINT odr_cust_id_fk FOREIGN KEY (cust_id)
        REFERENCES customers (customer_id),
    CONSTRAINT odr_staff_id_fk FOREIGN KEY (staff_id)
        REFERENCES staff (staff_id)
);

-- Create order_lines table
CREATE TABLE order_lines (
    order_number DECIMAL(5 , 0 ),
    item_number DECIMAL(5 , 0 ),
    quantity DECIMAL(3 , 0 ) NOT NULL,
    CONSTRAINT ole_pk PRIMARY KEY (order_number , item_number),
    CONSTRAINT ole_item_number_fk FOREIGN KEY (item_number)
        REFERENCES food_items (item_number),
    CONSTRAINT ole_order_number_fk FOREIGN KEY (order_number)
        REFERENCES orders (order_number)
);

-- Create shifts table
CREATE TABLE shifts (
    Code DECIMAL(5 , 0 ),
    description VARCHAR(100) NOT NULL,
    CONSTRAINT sft_code_pk PRIMARY KEY (code)
);

-- Create shift_assignments table
CREATE TABLE shift_assignments (
    code DECIMAL(5 , 0 ),
    id DECIMAL(5 , 0 ),
    shift_assign_date DATE NOT NULL,
    CONSTRAINT sat_pk PRIMARY KEY (Code , id),
    CONSTRAINT sat_code_fk FOREIGN KEY (code)
        REFERENCES shifts (Code),
    CONSTRAINT sat_id_fk FOREIGN KEY (id)
        REFERENCES staff (staff_id)
);

-- Populate customers table
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number) 
VALUES (1, 'Ervin', 'James', '44 Kedzie Parkway', 'San Francisco', 'CA', '94110', '415-738-9986');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number) 
VALUES (2, 'Mary', 'Robert', '2 Gale Lane', 'Corona', 'CA', '92878', '951-146-4432');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number) 
VALUES (3, 'Michael', 'John', '845 Superior Street', 'Sacramento', 'CA', '95823', '916-755-3797');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number) 
VALUES (4, 'Susan', 'William', '42 Grover Place', 'San Francisco', 'CA', '94137', '415-434-2340');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number) 
VALUES (5, 'Jessica', 'Joseph', '10 Crownhardt Point', 'Riverscustomer_ide', 'CA', '92519', '951-971-3942');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number) 
VALUES (6, 'Christi', 'Thomas', '8315 Norway Maple Terrace', 'Burbank', 'CA', '91505', '818-562-5116');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number) 
VALUES (7, 'Charles', 'Christopher', '94 Londonderry Junction', 'Van Nuys', 'CA', '91406', '310-106-4710');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number) 
VALUES (8, 'Daniel', 'Matthew', '23 Sugar Point', 'San Bernardino', 'CA', '92405', '909-434-7688');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number) 
VALUES (9, 'Anthony', 'Josephsen', '5830 Hovde Alley', 'Glendale', 'CA', '91210', '818-618-2610');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number) 
VALUES (10, 'Thomas', 'Rolston', '63 Bobwhite Parkway', 'Bakersfield', 'CA', '93381', '661-402-4612');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number)
 VALUES (11, 'Mark', 'Donald', '5 Riverscustomer_ide Drive', 'Brea', 'CA', '92822', '714-462-0156');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number) 
VALUES (12, 'Steven', 'Abbay', '11 Jay Terrace', 'Glendale', 'CA', '91205', '323-755-4050');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number) 
VALUES (13, 'Jasmine', 'Paul', '5 Waubesa Circle', 'Inglewood', 'CA', '90305', '323-937-0499');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number) 
VALUES (14, 'Andrew', 'Joshua', '3909 Claremont Hill', 'Long Beach', 'CA', '90840', '562-594-4031');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number) 
VALUES (15, 'Kenneth', 'Kevin', '527 Pearson Pass', 'Sacramento', 'CA', '94263', '916-699-7096');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number) 
VALUES (16, 'Brian', 'George', '121 Dennis Parkway', 'Sunnyvale', 'CA', '94089', '650-273-7925');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number) 
VALUES (17, 'Edward', 'Ronald', '8 Butterfield Trail', 'Torrance', 'CA', '90505', '310-929-1593');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number) 
VALUES (18, 'Timothy', 'Jason', '9729 Park Meadow Road', 'Pasadena', 'CA', '91117', '626-351-0029');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number) 
VALUES (19, 'Jeffrey', 'Enderson', '719 Almo Plaza', 'Pasadena', 'CA', '91199', '626-636-9576');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number) 
VALUES (20, 'Ryan', 'Jacob', '3 Forster Court', 'Anaheim', 'CA', '92825', '714-436-2324');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number) 
VALUES (21, 'Gary', 'Nicholas', '139 Schmedeman Alley', 'Long Beach', 'CA', '90840', '562-855-6774');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number) 
VALUES (22, 'Eric', 'Jonathan', '35715 Waywood Avenue', 'San Francisco', 'CA', '94132', '415-574-0173');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number) 
VALUES (23, 'Stephen', 'Larry', '3051 Susan Hill', 'San Diego', 'CA', '92176', '619-290-9456');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number) 
VALUES (24, 'Justin', 'Scott', '56247 Kinsman Junction', 'San Diego', 'CA', '92110', '949-405-1236');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number) 
VALUES (25, 'Brandon', 'Benjamin', '2 Marquette Park', 'Sacramento', 'CA', '94297', '916-407-8916');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number) 
VALUES (26, 'Samuel', 'Gregory', '9 East Crossing', 'San Diego', 'CA', '92115', '619-298-2489');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number) 
VALUES (27, 'Rebbecca', 'Frank', '28274 Sutteridge Street', 'Sacramento', 'CA', '95894', '916-982-8641');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number) 
VALUES (28, 'Alexander', 'Raymond', '12648 Aberg Point', 'Riverscustomer_ide', 'CA', '92513', '951-506-2377');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number) 
VALUES (29, 'Patrick', 'Jack', '8 Kings Crossing', 'Los Angeles', 'CA', '90050', '213-899-0200');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number) 
VALUES (30, 'Philip', 'Dennis', '0 Hallows Alley', 'Palmdale', 'CA', '93591', '661-579-3899');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number) 
VALUES (31, 'Jerry', 'Tyler', '4341 Dexter Point', 'Long Beach', 'CA', '90831', '562-448-4422');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number) 
VALUES (32, 'Aaron', 'Jose', '37 Arapahoe Drive', 'San Diego', 'CA', '92170', '619-161-6053');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number) 
VALUES (33, 'Sela', 'Adam', '241 Schmedeman Street', 'Sacramento', 'CA', '95894', '916-505-8929');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number) 
VALUES (34, 'Henry', 'Nathan', '5107 Blackbird Trail', 'Sunnyvale', 'CA', '94089', '408-517-8563');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number)
VALUES (35, 'Zachary', 'Peter', '78 Park Meadow Street', 'San Jose', 'CA', '95150', '408-488-8723');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number) 
VALUES (36, 'Keith', 'Ethan', '96498 Caliangt Center', 'Santa Monica', 'CA', '90410', '310-947-9828');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number) 
VALUES (37, 'Sean', 'Austin', '68 Emmet Street', 'San Francisco', 'CA', '94154', '415-339-8025');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number) 
VALUES (38, 'Dylan', 'Bryan', '9738 Nelson Way', 'Fresno', 'CA', '93709', '559-900-4178');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number) 
VALUES (39, 'Fred', 'Jordan', '6465 Corben Parkway', 'San Diego', 'CA', '92115', '619-948-9355');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number) 
VALUES (40, 'Billy', 'Marilyn', '72554 La Follette Hill', 'Los Angeles', 'CA', '90076', '323-267-0587');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number) 
VALUES (41, 'Albert', 'Donna', '63 New Castle Place', 'San Bernardino', 'CA', '92410', '951-455-9874');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number) 
VALUES (42, 'Shanda', 'Patillo', '50 Monterey Point', 'Inglewood', 'CA', '90310', '310-421-9679');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number)
 VALUES (43, 'Evita', 'Hodcroft', '3 Ludington Terrace', 'San Jose', 'CA', '95155', '408-579-5107');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number) 
VALUES (44, 'Katharyn', 'Gabby', '270 Coolcustomer_idge Street', 'Moreno Valley', 'CA', '92555', '951-621-1909');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number) 
VALUES (45, 'Willie', 'Bruce', '70 Kenwood Hill', 'San Francisco', 'CA', '94142', '415-760-4670');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number) 
VALUES (46, 'Roy', 'Ralph', '58842 Algoma Center', 'Oakland', 'CA', '94622', '510-225-1987');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number) 
VALUES (47, 'Louis', 'Diana', '577 Sutteridge Way', 'San Francisco', 'CA', '94137', '415-163-8413');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number) 
VALUES (48, 'Leo', 'Galletly', '9 Waxwing Point', 'Los Angeles', 'CA', '90015', '213-598-4949');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number) 
VALUES (49, 'Ramon', 'Bobby', '193 Bartillon Pass', 'Redwood City', 'CA', '94064', '650-192-1413');
INSERT INTO customers(customer_id, first_name, last_name, address, city, state, zip, phone_number)
VALUES (50, 'Philip', 'Judy', '016 Fulton Hill', 'Bakersfield', 'CA', '93311', '805-924-8761');

-- Populate promotional_menus table
INSERT INTO promotional_menus(code,name,start_date,end_date,give_away)
VALUES('100','Back to School',STR_TO_DATE('2020-08-01', '%Y-%m-%d'),STR_TO_DATE('2020-08-31', '%Y-%m-%d'),'ballpen and highlighter');
INSERT INTO promotional_menus(code,name,start_date,end_date,give_away)
VALUES('110','Valentines Special',STR_TO_DATE('2020-02-03', '%Y-%m-%d'),STR_TO_DATE('2020-02-23', '%Y-%m-%d'),'small box of chocolates');

-- Populate regular_menus table
INSERT INTO regular_menus(code,type,hours_served)
VALUES('10','Breakfast','6-11am');
INSERT INTO regular_menus(code,type,hours_served)
VALUES('20','Lunch/Dinner','11-9pm');

-- Populate categories table
INSERT INTO categories(category_id,category_name)
VALUES('100','Burger & Sandwiches‎');
INSERT INTO categories(category_id,category_name)
VALUES('200','Chicken‎');
INSERT INTO categories(category_id,category_name)
VALUES('300','Salads‎‎');
INSERT INTO categories(category_id,category_name)
VALUES('400','Snack and Sides‎');
INSERT INTO categories(category_id,category_name)
VALUES('500','Mccafe‎‎');
INSERT INTO categories(category_id,category_name)
VALUES('600','Desserts & Shakes‎‎');


-- Populate food_items table
INSERT INTO food_items(item_number,category_id, description,price,regular_code,promo_code)
VALUES(80, 100, 'Cheeseburger',8.09,'20',NULL);
INSERT INTO food_items(item_number,category_id, description,price,regular_code,promo_code)
VALUES(81,100, 'Double Cheeseburger',13.59,NULL,'110');
INSERT INTO food_items(item_number,category_id, description,price,regular_code,promo_code)
VALUES(82,200, 'Spicy Chicken McBite',10.09,'20',NULL);
INSERT INTO food_items(item_number,category_id, description,price,regular_code,promo_code)
VALUES(83,200, 'Chicken Sandwich',9.59,NULL,'110');
INSERT INTO food_items(item_number,category_id, description,price,regular_code,promo_code)
VALUES(84,300, 'Side Sala',1.09,'20',NULL);
INSERT INTO food_items(item_number,category_id, description,price,regular_code,promo_code)
VALUES(85,400, 'Apple Slices',3.59,NULL,'110');
INSERT INTO food_items(item_number,category_id, description,price,regular_code,promo_code)
VALUES(86,500, 'SRoast Coffee',5.75,'20',NULL);
INSERT INTO food_items(item_number,category_id, description,price,regular_code,promo_code)
VALUES(87, 200, 'BBQ Snack Wrap',3.59,NULL,'110');
INSERT INTO food_items(item_number,category_id, description,price,regular_code,promo_code)
VALUES(90,100, 'Hamburger',1.09,'20',NULL);
INSERT INTO food_items(item_number,category_id, description,price,regular_code,promo_code)
VALUES(93,200, 'Chicken McNuggets',3.59,NULL,'110');
INSERT INTO food_items(item_number,category_id, description,price,regular_code,promo_code)
VALUES(95,600, 'Baked Apple Pie',1.09,'20',NULL);
INSERT INTO food_items(item_number,category_id, description,price,regular_code,promo_code)
VALUES(96,600, 'Sugar Cookie',3.59,NULL,'110');
INSERT INTO food_items(item_number,category_id, description,price,regular_code,promo_code)
VALUES(91,200, 'Spicy Chicken Sandwich',1.09,'20',NULL);
INSERT INTO food_items(item_number,category_id, description,price,regular_code,promo_code)
VALUES(92,500, 'Iced Latte',3.59,NULL,'110');
INSERT INTO food_items(item_number,category_id, description,price,regular_code,promo_code)
VALUES(94,400, 'Fruit & Walnuts',5.25,'20',NULL);
INSERT INTO food_items(item_number,category_id, description,price,regular_code,promo_code)
VALUES(97,300, 'Caesar Salad',3.59,NULL,'110');
 
 
-- populate departments table
INSERT INTO departments (department_id, department_name, manager_id)
VALUES(10,'Administration',200);
INSERT INTO departments (department_id, department_name, manager_id)
VALUES(20,'Kitchen Staff',201);
INSERT INTO departments (department_id, department_name, manager_id)
VALUES(30,'Delivery Staff',124);
INSERT INTO departments (department_id, department_name, manager_id)
VALUES(40,'IT',103);
INSERT INTO departments (department_id, department_name, manager_id)
VALUES(50,'Floor Staff',100);
INSERT INTO departments (department_id, department_name, manager_id)
VALUES(60,'Accounting',205);

-- populate jobs table
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES('S_MGR','General Managert',8000,12000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES('S_MAN','Assistant Manager',5000,8000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES('S_SER','Server',3000,6000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES('S_AMGR','Accounting Manager',8200,16000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES('S_ACCOUNT','Public Accountant',4200,9000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES('S_CASH','Cashier',2000,4000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES('S_COOK','Cook',2000,35000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES('L_COOK','Line Cook',1500,3000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES('S_KIT','Dishwasher',1000,2500);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES('S_KMAN','Kitchen Manager',3700,6700);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES('S_DEL','Delivery person',2000,4000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES('S_PROG','Programmer',4000,10000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES('S_MMAN','Marketing Manager',9000,15000);


-- populate staff table
INSERT INTO   staff(staff_id, first_name, last_name, email,  birthdate , salary, overtime_rate, training, job_id, manager_id, dept_id, hire_date) 
VALUES (200, 'Jayden', 'Nolan', 'kkeunemann0gmail.com', STR_TO_DATE('1989-01-17', '%Y-%m-%d'), 9646, 2, NULL, 'S_MGR', NULL, 10, STR_TO_DATE('2012-02-11', '%Y-%m-%d'));
INSERT INTO   staff(staff_id, first_name, last_name, email,  birthdate , salary, overtime_rate, training, job_id, manager_id, dept_id, hire_date) 
VALUES (125, 'Colton', 'Landon', 'cferreira1@yahoo.com', STR_TO_DATE('1969-12-28', '%Y-%m-%d'), 2973, 2, NULL, 'S_MAN', 200, 10, STR_TO_DATE('2002-02-11', '%Y-%m-%d'));
INSERT INTO   staff(staff_id, first_name, last_name, email,  birthdate , salary, overtime_rate, training, job_id, manager_id, dept_id, hire_date) 
VALUES (1180, 'Maxwell', 'Cooper', 'ldmitrievn@gmail.com', STR_TO_DATE('1986-07-02', '%Y-%m-%d'), 6267, 1, NULL, 'S_KMAN', 200, 10, STR_TO_DATE('2010-03-11', '%Y-%m-%d'));
INSERT INTO   staff(staff_id, first_name, last_name, email,  birthdate , salary, overtime_rate, training, job_id, manager_id, dept_id, hire_date) 
VALUES (1361, 'Mark', 'Calvin', 'tors2@yahoo.com', STR_TO_DATE('1971-05-09', '%Y-%m-%d'), 6479, 1, NULL, 'S_KIT', 200, 20, STR_TO_DATE('2001-08-12', '%Y-%m-%d'));
INSERT INTO   staff(staff_id, first_name, last_name, email,  birthdate , salary, overtime_rate, training, job_id, manager_id, dept_id, hire_date) 
VALUES (1330, 'Ivan', 'Diego', 'jgreenhouse3@yahoo.com', STR_TO_DATE('1997-06-19', '%Y-%m-%d'), 6578, 2, NULL, 'S_COOK', 1361, 20, STR_TO_DATE('2015-07-05', '%Y-%m-%d'));
INSERT INTO   staff(staff_id, first_name, last_name, email,  birthdate , salary, overtime_rate, training, job_id, manager_id, dept_id, hire_date) 
VALUES (300, 'Arthur', 'Luka', 'eshoebottom4@yahoo.com', STR_TO_DATE('1991-08-22', '%Y-%m-%d'), 4266, 1, NULL, 'S_KIT', 1361, 20, STR_TO_DATE('2012-05-11', '%Y-%m-%d'));
INSERT INTO   staff(staff_id, first_name, last_name, email,  birthdate , salary, overtime_rate, training, job_id, manager_id, dept_id, hire_date) 
VALUES (1066, 'Layla', 'Justin', 'bbosson5@yahoo.com', STR_TO_DATE('1988-10-19', '%Y-%m-%d'), 5168, 1, 'SSP', 'S_COOK',1361,  20, STR_TO_DATE('2018-02-14', '%Y-%m-%d'));
INSERT INTO   staff(staff_id, first_name, last_name, email,  birthdate , salary, overtime_rate, training, job_id, manager_id, dept_id, hire_date) 
VALUES (1185, 'Alex', 'Zayden', 'cbinham6@godaddy.com', STR_TO_DATE('1972-04-06', '%Y-%m-%d'), 9661, 2, NULL, 'L_COOK', 1361, 20, STR_TO_DATE('2004-09-15', '%Y-%m-%d'));
INSERT INTO   staff(staff_id, first_name, last_name, email,  birthdate , salary, overtime_rate, training, job_id, manager_id, dept_id, hire_date) 
VALUES (246, 'Nicolas', 'Patrick', 'hlooks7@yahoo.com', STR_TO_DATE('1981-04-11', '%Y-%m-%d'), 2128, 2, 'MMSC', 'L_COOK', 1361, 20, STR_TO_DATE('2008-10-24', '%Y-%m-%d'));
INSERT INTO   staff(staff_id, first_name, last_name, email,  birthdate , salary, overtime_rate, training, job_id, manager_id, dept_id, hire_date) 
VALUES (515, 'Peter', 'Steven', 'rpoge8@yahoo.com', STR_TO_DATE('1978-07-12', '%Y-%m-%d'), 3108, 2, 'Supporting Others', 'S_COOK', 1361, 20, STR_TO_DATE('2000-02-11', '%Y-%m-%d'));
INSERT INTO   staff(staff_id, first_name, last_name, email,  birthdate , salary, overtime_rate, training, job_id, manager_id, dept_id, hire_date) 
VALUES (1611, 'Marcus', 'Jeremy', 'rbuardp@gmail.com', STR_TO_DATE('1985-04-02', '%Y-%m-%d'), 1160, 2, 'Cook', 'S_COOK',1361, 20, STR_TO_DATE('2013-12-11', '%Y-%m-%d'));
INSERT INTO   staff(staff_id, first_name, last_name, email,  birthdate , salary, overtime_rate, training, job_id, manager_id, dept_id, hire_date) 
VALUES (209, 'Katrine', 'Griffin', 'kgarreltsq@yahoo.com', STR_TO_DATE('1979-02-12', '%Y-%m-%d'), 1136, 1, 'Cook', 'L_COOK', 1361, 20, STR_TO_DATE('2001-02-11', '%Y-%m-%d'));
INSERT INTO  staff(staff_id, first_name, last_name, email,  birthdate , salary, overtime_rate, training, job_id, manager_id, dept_id, hire_date) 
VALUES (939, 'Rayna', 'Rafael', 'riwanicki9@wisc.edu', STR_TO_DATE('1986-05-03', '%Y-%m-%d'), 7061, 1, 'Driving', 'S_DEL', 125, 30, STR_TO_DATE('2014-08-09', '%Y-%m-%d'));
INSERT INTO  staff(staff_id, first_name, last_name, email,  birthdate , salary, overtime_rate, training, job_id, manager_id, dept_id, hire_date) 
VALUES (227, 'Omar', 'Lane', 'tbardwalla@yahoo.com', STR_TO_DATE('1975-01-07', '%Y-%m-%d'), 3767, 2, 'Driving', 'S_DEL', 125, 30, STR_TO_DATE('2002-06-28', '%Y-%m-%d'));
INSERT INTO  staff(staff_id, first_name, last_name, email,  birthdate , salary, overtime_rate, training, job_id, manager_id, dept_id, hire_date) 
VALUES (1582, 'Louis', 'Zayn', 'mabeaur@blogger.com', STR_TO_DATE('1994-04-25', '%Y-%m-%d'), 7615, 2, 'Driving', 'S_DEL', 125, 30, STR_TO_DATE('2012-02-11', '%Y-%m-%d'));
INSERT INTO   staff(staff_id, first_name, last_name, email,  birthdate , salary, overtime_rate, training, job_id, manager_id, dept_id, hire_date) 
VALUES (745, 'Derek', 'Raymond', 'srickardssons@facebook.com', STR_TO_DATE('1983-08-31', '%Y-%m-%d'), 9808, 1, 'Driving', 'S_DEL', 125, 30, STR_TO_DATE('2012-08-11', '%Y-%m-%d'));
INSERT INTO  staff(staff_id, first_name, last_name, email,  birthdate , salary, overtime_rate, training, job_id, manager_id, dept_id, hire_date) 
VALUES (1162, 'Jake', 'Manuel', 'sgeroldinib@gmail.com', STR_TO_DATE('1980-09-12', '%Y-%m-%d'), 4400, 1, 'Oracle SQL Developer', 'S_PROG', 200, 40, STR_TO_DATE('2015-02-11', '%Y-%m-%d'));
INSERT INTO  staff(staff_id, first_name, last_name, email,  birthdate , salary, overtime_rate, training, job_id, manager_id, dept_id, hire_date) 
VALUES (1005, 'Maya', 'Spurman', 'sspurmanc@europa.eud', STR_TO_DATE('1982-07-01', '%Y-%m-%d'), 7537, 1, 'Oracle SQL Developerd', 'S_PROG', 200, 40, STR_TO_DATE('2002-03-11', '%Y-%m-%d'));
INSERT INTO  staff(staff_id, first_name, last_name, email,  birthdate , salary, overtime_rate, training, job_id, manager_id, dept_id, hire_date) 
VALUES (417, 'Rylan', 'Ricardo', 'walderwickd@twitpic.com', STR_TO_DATE('1978-05-30', '%Y-%m-%d'), 6604, 1, NULL, 'S_SER', 125, 50, STR_TO_DATE('2000-03-11', '%Y-%m-%d'));
INSERT INTO  staff(staff_id, first_name, last_name, email,  birthdate , salary, overtime_rate, training, job_id, manager_id, dept_id, hire_date) 
VALUES (975, 'Jere', 'Colson', 'jvasilieve@purevolume.com',STR_TO_DATE('1980-06-07', '%Y-%m-%d'), 5804, 2, NULL, 'S_CASH', 125, 50, STR_TO_DATE('2014-08-14', '%Y-%m-%d'));
INSERT INTO   staff(staff_id, first_name, last_name, email,  birthdate , salary, overtime_rate, training, job_id, manager_id, dept_id, hire_date) 
VALUES (524, 'Emilia', 'Nasir', 'nsinneyf@gmail.com', STR_TO_DATE('1976-11-21', '%Y-%m-%d'), 2453, 2, NULL, 'S_SER', 125, 50, STR_TO_DATE('2000-04-21', '%Y-%m-%d'));
INSERT INTO  staff(staff_id, first_name, last_name, email,  birthdate , salary, overtime_rate, training, job_id, manager_id, dept_id, hire_date) 
VALUES (1597, 'Marco', 'Andy', 'egronog@yahoo.com', STR_TO_DATE('1979-06-28', '%Y-%m-%d'), 7789, 2, NULL , 'S_SER', 125, 50, STR_TO_DATE('2002-02-11', '%Y-%m-%d'));
INSERT INTO   staff(staff_id, first_name, last_name, email,  birthdate , salary, overtime_rate, training, job_id, manager_id, dept_id, hire_date) 
VALUES (1403, 'Erik', 'Emanuel', 'nsilverstoneh@yahoo.com', STR_TO_DATE('1983-11-12', '%Y-%m-%d'), 6593, 2, NULL, 'S_CASH', 125, 50, STR_TO_DATE('2003-03-11', '%Y-%m-%d'));
INSERT INTO   staff(staff_id, first_name, last_name, email,  birthdate , salary, overtime_rate, training, job_id, manager_id, dept_id, hire_date) 
VALUES (1321, 'Frank', 'Milan', 'tmilmorei@yahoo.com', STR_TO_DATE('1980-05-09', '%Y-%m-%d'), 9090, 2, NULL , 'S_SER', 125, 50, STR_TO_DATE('2012-02-11', '%Y-%m-%d'));
INSERT INTO   staff(staff_id, first_name, last_name, email,  birthdate , salary, overtime_rate, training, job_id, manager_id, dept_id, hire_date) 
VALUES (1465, 'Reed', 'Ayaan', 'sdevotej@gmail.com', STR_TO_DATE('1976-03-03', '%Y-%m-%d'), 5230, 2, NULL, 'S_SER', 125, 50, STR_TO_DATE('2005-08-11', '%Y-%m-%d'));
INSERT INTO   staff(staff_id, first_name, last_name, email,  birthdate , salary, overtime_rate, training, job_id, manager_id, dept_id, hire_date) 
VALUES (676, 'Baylor', 'Collin', 'jcamelint@nyu.edu', STR_TO_DATE('1976-07-30', '%Y-%m-%d'), 6136, 2, NULL, 'S_SER', 125, 50, STR_TO_DATE('2010-06-11', '%Y-%m-%d'));
INSERT INTO   staff(staff_id, first_name, last_name, email,  birthdate , salary, overtime_rate, training, job_id, manager_id, dept_id, hire_date) 
VALUES (1544, 'Marvin', 'Edison', 'bpharrowu@biblegateway.com', STR_TO_DATE('1980-06-07', '%Y-%m-%d'), 2459, NULL, NULL, 'S_SER', 125, 50, STR_TO_DATE('2002-07-11', '%Y-%m-%d'));
INSERT INTO   staff(staff_id, first_name, last_name, email,  birthdate , salary, overtime_rate, training, job_id, manager_id, dept_id, hire_date) 
VALUES (1292, 'Nora', 'Marcos', 'mstanlockk@cisco.com', STR_TO_DATE('1986-12-31', '%Y-%m-%d'), 1879, 1, 'Record Keeping', 'S_ACCOUNT', 200, 60, STR_TO_DATE('2002-02-11', '%Y-%m-%d'));
INSERT INTO   staff(staff_id, first_name, last_name, email,  birthdate , salary, overtime_rate, training, job_id, manager_id, dept_id, hire_date) 
VALUES (1559, 'Taylor', 'Yusuf', 'aotteridgel@gmail.com', STR_TO_DATE('1989-04-19', '%Y-%m-%d'), 3582, 1, 'Record Keeping', 'S_ACCOUNT', 200, 60, STR_TO_DATE('2015-03-11', '%Y-%m-%d'));
INSERT INTO   staff(staff_id, first_name, last_name, email,  birthdate , salary, overtime_rate, training, job_id, manager_id, dept_id, hire_date) 
VALUES (553, 'Sarah', 'Phillip', 'lferierm@net.com', STR_TO_DATE('1988-07-14', '%Y-%m-%d'), 3437, NULL, 'Record Keeping', 'S_ACCOUNT', 200, 60, STR_TO_DATE('2002-06-17', '%Y-%m-%d'));

-- Populate orders table
INSERT INTO orders(order_number,order_date,cust_id,staff_id)
VALUES(5798,STR_TO_DATE('2020-03-03', '%Y-%m-%d'),10,417);
INSERT INTO orders(order_number,order_date,cust_id,staff_id)
VALUES(5799,STR_TO_DATE('2020-04-03', '%Y-%m-%d'),20,1597);
INSERT INTO orders(order_number,order_date,cust_id,staff_id)
VALUES(5791,STR_TO_DATE('2020-05-09', '%Y-%m-%d'),40,417);
INSERT INTO orders(order_number,order_date,cust_id,staff_id)
VALUES(5792,STR_TO_DATE('2020-05-09', '%Y-%m-%d'),50,417);
INSERT INTO orders(order_number,order_date,cust_id,staff_id)
VALUES(5783,STR_TO_DATE('2020-04-05', '%Y-%m-%d'),3,1544);
INSERT INTO orders(order_number,order_date,cust_id,staff_id)
VALUES(5773,STR_TO_DATE('2020-04-21','%Y-%m-%d'),6,417);
INSERT INTO orders(order_number,order_date,cust_id,staff_id)
VALUES(5794,STR_TO_DATE('2020-07-03', '%Y-%m-%d'),30,524);
INSERT INTO orders(order_number,order_date,cust_id,staff_id)
VALUES(5793,STR_TO_DATE('2020-08-03', '%Y-%m-%d'),45,417);
INSERT INTO orders(order_number,order_date,cust_id,staff_id)
VALUES(5343,STR_TO_DATE('2020-01-03', '%Y-%m-%d'),35,1544);
INSERT INTO orders(order_number,order_date,cust_id,staff_id)
VALUES(5363,STR_TO_DATE('2020-10-03', '%Y-%m-%d'),20,417);
INSERT INTO orders(order_number,order_date,cust_id,staff_id)
VALUES(5679,STR_TO_DATE('2020-04-03', '%Y-%m-%d'),20,1597);
INSERT INTO orders(order_number,order_date,cust_id,staff_id)
VALUES(5681,STR_TO_DATE('2020-04-04', '%Y-%m-%d'),23,1544);
INSERT INTO orders(order_number,order_date,cust_id,staff_id)
VALUES(5682,STR_TO_DATE('2020-05-09', '%Y-%m-%d'),40,417);
INSERT INTO orders(order_number,order_date,cust_id,staff_id)
VALUES(5683,STR_TO_DATE('2020-05-09', '%Y-%m-%d'),50,417);
INSERT INTO orders(order_number,order_date,cust_id,staff_id)
VALUES(5623,STR_TO_DATE('2020-04-05', '%Y-%m-%d'),3,1544);
INSERT INTO orders(order_number,order_date,cust_id,staff_id)
VALUES(5690,STR_TO_DATE('2020-04-21','%Y-%m-%d'),6,417);
INSERT INTO orders(order_number,order_date,cust_id,staff_id)
VALUES(5693,STR_TO_DATE('2020-08-19', '%Y-%m-%d'),7,1544);
INSERT INTO orders(order_number,order_date,cust_id,staff_id)
VALUES(5691,STR_TO_DATE('2020-07-03', '%Y-%m-%d'),29,417);
INSERT INTO orders(order_number,order_date,cust_id,staff_id)
VALUES(5694,STR_TO_DATE('2020-07-03', '%Y-%m-%d'),30,524);
INSERT INTO orders(order_number,order_date,cust_id,staff_id)
VALUES(5393,STR_TO_DATE('2020-08-03', '%Y-%m-%d'),45,417);
INSERT INTO orders(order_number,order_date,cust_id,staff_id)
VALUES(7693,STR_TO_DATE('2020-10-03', '%Y-%m-%d'),20,417);
INSERT INTO orders(order_number,order_date,cust_id,staff_id)
VALUES(6693,STR_TO_DATE('2020-10-03', '%Y-%m-%d'),43,676);
INSERT INTO orders(order_number,order_date,cust_id,staff_id)
VALUES(7383,STR_TO_DATE('2020-10-03', '%Y-%m-%d'),43,676);


-- Populate order_lines table
INSERT INTO order_lines(order_number,item_number,quantity)
VALUES(5798,80,2);
INSERT INTO order_lines(order_number,item_number,quantity)
VALUES(5798,87,1);
INSERT INTO order_lines(order_number,item_number,quantity)
VALUES(5799,82,1);
INSERT INTO order_lines(order_number,item_number,quantity)
VALUES(5791,83,3);
INSERT INTO order_lines(order_number,item_number,quantity)
VALUES(5792,85,2);
INSERT INTO order_lines(order_number,item_number,quantity)
VALUES(5792,80,1);
INSERT INTO order_lines(order_number,item_number,quantity)
VALUES(5793,85,1);
INSERT INTO order_lines(order_number,item_number,quantity)
VALUES(5793,83,2);
INSERT INTO order_lines(order_number,item_number,quantity)
VALUES(5793,81,2);
INSERT INTO order_lines(order_number,item_number,quantity)
VALUES(5793,82,1);
INSERT INTO order_lines(order_number,item_number,quantity)
VALUES(5783,80,2);
INSERT INTO order_lines(order_number,item_number,quantity)
VALUES(5773,80,2);
INSERT INTO order_lines(order_number,item_number,quantity)
VALUES(5783,85,1);
INSERT INTO order_lines(order_number,item_number,quantity)
VALUES(5791,86,2);
INSERT INTO order_lines(order_number,item_number,quantity)
VALUES(5791,82,2);
INSERT INTO order_lines(order_number,item_number,quantity)
VALUES(5794,87,2);
INSERT INTO order_lines(order_number,item_number,quantity)
VALUES(5794,80,2);

INSERT INTO order_lines(order_number,item_number,quantity)
VALUES(5343,80,2);
INSERT INTO order_lines(order_number,item_number,quantity)
VALUES(5343,85,1);
INSERT INTO order_lines(order_number,item_number,quantity)
VALUES(5363,83,1);

INSERT INTO order_lines(order_number,item_number,quantity)
VALUES(7383,80,2);
INSERT INTO order_lines(order_number,item_number,quantity)
VALUES(7383,83,1);


INSERT INTO order_lines(order_number,item_number,quantity)
VALUES(5682,95,2);
INSERT INTO order_lines(order_number,item_number,quantity)
VALUES(5682,90,1);
INSERT INTO order_lines(order_number,item_number,quantity)
VALUES(5683,95,1);
INSERT INTO order_lines(order_number,item_number,quantity)
VALUES(5683,93,2);
INSERT INTO order_lines(order_number,item_number,quantity)
VALUES(5623,91,2);
INSERT INTO order_lines(order_number,item_number,quantity)
VALUES(5623,92,1);
INSERT INTO order_lines(order_number,item_number,quantity)
VALUES(5623,90,2);
INSERT INTO order_lines(order_number,item_number,quantity)
VALUES(5693,90,2);
INSERT INTO order_lines(order_number,item_number,quantity)
VALUES(5693,95,1);
INSERT INTO order_lines(order_number,item_number,quantity)
VALUES(5691,96,2);
INSERT INTO order_lines(order_number,item_number,quantity)
VALUES(5691,92,2);
INSERT INTO order_lines(order_number,item_number,quantity)
VALUES(5694,97,2);
INSERT INTO order_lines(order_number,item_number,quantity)
VALUES(5694,90,2);
INSERT INTO order_lines(order_number,item_number,quantity)
VALUES(5393,95,4);
INSERT INTO order_lines(order_number,item_number,quantity)
VALUES(5793,90,2);
INSERT INTO order_lines(order_number,item_number,quantity)
VALUES(5793,95,1);
INSERT INTO order_lines(order_number,item_number,quantity)
VALUES(5793,93,1);
INSERT INTO order_lines(order_number,item_number,quantity)
VALUES(7693,90,2);
INSERT INTO order_lines(order_number,item_number,quantity)
VALUES(6693,93,1);

-- Populate shifts table
INSERT INTO shifts(code,description)
VALUES(1,'8am to 12pm');
INSERT INTO shifts(code,description)
VALUES(2,'6pm to 10pm');

-- Populate shift_assignments table
INSERT INTO shift_assignments(code,id,shift_assign_date)
VALUES(1,1361,STR_TO_DATE('2020-02-03', '%Y-%m-%d'));
INSERT INTO shift_assignments(code,id,shift_assign_date)
VALUES(2,1330,STR_TO_DATE('2020-03-03', '%Y-%m-%d'));
INSERT INTO shift_assignments(code,id,shift_assign_date)
VALUES(1,300,STR_TO_DATE('2020-03-03' , '%Y-%m-%d'));
INSERT INTO shift_assignments(code,id,shift_assign_date)
VALUES(2,1066,STR_TO_DATE('2020-04-03',  '%Y-%m-%d'));
INSERT INTO shift_assignments(code,id,shift_assign_date)
VALUES(2,975,STR_TO_DATE('2020-04-03', '%Y-%m-%d'));
INSERT INTO shift_assignments(code,id,shift_assign_date)
VALUES(1,524,STR_TO_DATE('2020-04-03','%Y-%m-%d'));
INSERT INTO shift_assignments(code,id,shift_assign_date)
VALUES(1,227,STR_TO_DATE('2020-08-03','%Y-%m-%d'));
INSERT INTO shift_assignments(code,id,shift_assign_date)
VALUES(1,515,STR_TO_DATE('2020-05-03','%Y-%m-%d'));

