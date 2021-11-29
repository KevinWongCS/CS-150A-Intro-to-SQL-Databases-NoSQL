/*	Assignment8.sql
	Kevin Wong 
	CS150A Fall 2021 */
    
USE restaurant;

-- Question 1: Write a SELECT statement that finds the average salary for International Foods Restaurant (IFR) 
-- employees whose manager ID is 200.
SELECT AVG(salary) AS Average
FROM staff
WHERE manager_id = 200;

-- Question 2: Write a SELECT statement that finds the lowest salary, the last name who is first in an alphabetical 
-- list of employees, and the last name who is last of an alphabetical list of employees. Select only employees who 
-- are in departments 30 or 60. 
SELECT dept_id, MIN(salary), MAX(last_name), MIN(last_name)
FROM staff
WHERE dept_id = 30 OR dept_id = 60
ORDER BY last_name; 

-- Question 3: Write a SELECT statement that finds what the most recent hire date of an IFR employee was.
SELECT MAX(hire_date) AS "most recent hire date"
FROM staff;

-- instructor correction
-- SELECT MAX(hire_date) AS Most_Recent_Hire_Date
-- FROM staff;

-- Question 4: Write a SQL statement that creates a list including each employee's first name concatenated to a 
-- space as well as the employee's last name, and the salary of all employees whose last name contains the string 
-- 'ar'
SELECT CONCAT(first_name, ' ', last_name) AS 'employee name', 
	salary
FROM staff
WHERE last_name REGEXP 'ar';

-- /* Query 4 */
-- /* Display first and last name and salary of all employees
-- whose last name contains 'ar' */
-- SELECT CONCAT(first_name , ' ' , last_name) AS "Employee Name", salary AS "Salary" 
-- FROM staff
-- WHERE last_name LIKE '%ar%' 
-- ORDER BY last_name;

-- Question 5: Write a SQL statement that lists the item number and item description for all items. The item 
-- descriptions should appear in uppercase letters.
SELECT item_number,
	UPPER(description) AS "item description"
FROM food_items;

-- Question 6: IFR is running a promotion that is valid for up to 20 days after an order is placed. Write a SQL 
-- statement that lists the order ID, customer ID, first name, and last name. The promotion date is 20 days after 
-- the order was placed.
SELECT order_number,
	cust_id,
    first_name,
    last_name,
    order_date,
	DATE_ADD(order_date, INTERVAL 20 DAY) AS promotion_date
FROM orders AS o 
	JOIN customers AS c
    ON o.cust_id = c.customer_id;

-- Question 7: List the last names and birthdays of IFR employees. Convert the birth dates to character data.
SELECT last_name,
	CONVERT(DATE_FORMAT(birthdate, '%W %M %D %Y'), CHAR) AS Birthdate
FROM staff;

-- Question 8: Layla Justin is an employee who has received a $2,000 raise. Display her first name, last name, 
-- current salary, and new salary. Display both salaries with a $ and two decimal places. Label his new salary 
-- column AS New Salary.
SELECT first_name,
	last_name,
    CONCAT('$', salary)AS 'Current Salary',
    CONCAT('$', salary + 2000)AS 'New Salary'
FROM staff
WHERE first_name = 'Layla' AND last_name = 'Justin';

-- Question 9: Create a report listing the first and last names and month of hire for all employees in the staff table.
SELECT CONCAT(first_name, ' ', last_name) AS Name,
    CONVERT(DATE_FORMAT(hire_date, '%c'), CHAR) AS "Anniversary Month"
FROM staff;

-- Question 10: Write a SELECT statement that displays the item number and the number of orders placed for each 
-- item. Show the results in decreasing order and label result column NumOrders.
SELECT item_number,
	quantity AS NumOrders
FROM order_lines
ORDER BY NumOrders DESC; 

-- SELECT item_number AS Item_Number, 
--        COUNT(order_number) AS NumOrders
-- FROM order_lines
-- GROUP BY item_number
-- ORDER BY NumOrders DESC;

-- Question 11: Write a SQL statement that creates a list of monthly salaries from the staff table where the salary is 
-- between $700 and $3,000. The salaries should be formatted to include a $-sign and have two decimal points like: 
-- $9999.99. 
SELECT staff_id,
	CONCAT('$', CONVERT(salary, DECIMAL(9, 2))) AS 'Monthly Salary'
FROM staff
WHERE salary BETWEEN 700 and 3000;
