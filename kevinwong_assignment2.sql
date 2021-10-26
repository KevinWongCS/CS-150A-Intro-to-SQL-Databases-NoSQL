/*	Assignment2.sql
	Kevin Wong 
	CS150A Fall 2021 */

USE restaurant;

-- Question 1: Write a SQL query that lists the food item number, description, and price for all food items.
SELECT item_number, 
	description, 
    price
FROM food_items;

-- Question 2: Write a query that lists all details of all items. Order the output by food item number within price. 
-- (That is, order the output by price and then by food item number.) 
SELECT *
FROM food_items
ORDER BY price, item_number;

-- Question 3: Write a SQL statement that lists all rows and columns for the complete orders table.
SELECT * 
FROM orders;

-- Question 4: Write a SQL statement that lists the order number for each order placed by customer ID 30 on 07/03/2020.
SELECT *
FROM orders
WHERE cust_id = 30 
	AND order_date = '2020-07-03';

-- Question 5: Write a query that displays the order number, date of all orders that were placed before 
-- 05/28/2020. Use an appropriate alias for your column headings.
Select order_number AS 'Order Number', order_date AS 'Order Date'
FROM orders
WHERE order_date < '2020-05-28';

-- Question 6: Write a query that displays the customer ID from the orders table for each customer 
-- who has placed an order with the restaurant. Display each customer number only once.
SELECT DISTINCT cust_id
FROM orders
WHERE order_number != 0;

-- Question 7: The manager of International Foods Restaurant would like to send out coupons for the 
-- upcoming sale. He wants to send one coupon to each household. Create the SELECT statement that returns the 
-- customer’s last name and a mailing address. 
SELECT last_name, address, city, state, zip
FROM customers;

-- Question 8: Write a SQL statement that displays the customer ID, first name, last name, and phone number of each customer.
 
SELECT customer_id, first_name last_name, phone_number
FROM customers;

-- Question 9: Write a SQL statement that displays the customer ID, first name, and last name for all customers 
-- who live in San Francisco City.
SELECT customer_id, first_name, last_name
FROM customers
WHERE city = 'San Francisco';

-- Question 10: Write a query that displays the rows from the customers table where the values in 
-- the customer ID column is 36. Display the customer’s last name, first name, ID, and phone number.
SELECT last_name, first_name, customer_id, phone_number
FROM customers
WHERE customer_id = 36;