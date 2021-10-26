/*	Assignment7.sql
	Kevin Wong 
	CS150A Fall 2021 */
    
USE restaurant;
    
-- Question 1: For each order, write a SQL statement that displays the order ID and order date along with the 
-- customer ID, first name, and last name of the customer for which the order was created.
SELECT o.order_number,
	o.order_date,
    c.customer_id,
    c.first_name,
    c.last_name
FROM orders AS o 
	JOIN customers AS c
		ON o.cust_id = c.customer_id;

-- Question 2: For each order placed on 04/24/2020, write a SQL statement that lists the order number, customer 
-- ID, first name, and last name of the customer for which the order was created.
SELECT o.order_number,
	c.customer_id,
    c.first_name,
    c.last_name
FROM orders AS o
	JOIN customers AS c
		ON o.cust_id = c.customer_id
	WHERE order_date = '2020-04-24';

-- Question 3: For each order, write a SQL statement that lists the item number, order date, order ID, quantity 
-- ordered, and price for each food item that makes up an order.
SELECT fi.item_number,
	o.order_date,
	o.order_number,
    ol.quantity,
    fi.price
FROM food_items AS fi
	JOIN order_lines AS ol
		ON fi.item_number = ol.item_number
	JOIN orders AS o
		ON ol.order_number = ol.order_number;

-- Question 4: For each order, write a SQL statement that lists the food item number, order date, order number, and 
-- description for each food item that makes up an order. Order the rows by category and then by order number.
SELECT fi.item_number,
	o.order_date,
    ol.order_number,
    fi.description
FROM food_items AS fi
	JOIN order_lines as ol
		ON fi.item_number = ol.item_number
	JOIN orders AS o
		ON ol.order_number = o.order_number
ORDER BY fi.category_id, o.order_number;

-- Question 5: Write a SQL statement that lists the order number and order date for each order that contains the 
-- food item description 'Chicken Sandwich'.
SELECT o.order_number,
	o.order_date
FROM orders AS o
	JOIN order_lines AS ol
		ON o.order_number = ol.order_number
	JOIN food_items AS fi
		ON ol.item_number = fi.item_number
WHERE description = 'Chicken Sandwich';

-- Question 6: Write a SQL statement that lists the order number and order date for each order that was created for 
-- Philip Dennis but does not contain the food item description 'Shack Burger'.
SELECT o.order_number,
	o.order_date
FROM orders AS o
	JOIN customers AS c
		ON o.cust_id = c.customer_id
	JOIN order_lines AS ol
		ON o.order_number = ol.order_number
	JOIN food_items AS fi
		ON ol.item_number = fi.item_number
WHERE fi.description != 'Shack Burger'
AND c.first_name = 'Philip'
AND c.last_name = 'Dennis';

-- Question 7: Return the first name, last name, and department name for all employees including those employees 
-- not assigned to a department.
SELECT s.first_name,
	s.last_name,
    d.department_name
FROM staff AS s
	LEFT JOIN departments AS d
		ON s.dept_id = d.department_id;

-- Question 8: Using the International Foods Restaurant database, show all shift descriptions and shift assignment 
-- dates (even if there is no date assigned for each shift description).
SELECT s.description,
	sa.shift_assign_date
FROM shifts AS s
	RIGHT JOIN shift_assignments AS sa
		ON s.code = sa.code;

-- Question 9: You need to produce a report for International Foods Restaurant showing customers and orders. A 
-- customer must be included on the report even if the customer has had no orders.
SELECT c.customer_id,
	c.last_name,
    o.order_date
FROM customers AS c
	LEFT JOIN orders AS o
		ON c.customer_id = o.cust_id;

-- Question 11: Create a query of the database that shows employee last names, department IDs, and department 
-- names. Include all employees even if they are not assigned to a department.
SELECT s.last_name,
	d.department_id,
    department_name
FROM staff AS s
	LEFT JOIN departments AS d
		ON s.dept_id = d.department_id;
        

