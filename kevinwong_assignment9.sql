/*	Assignment9.sql
	Kevin Wong 
	CS150A Fall 2021 */
    
USE restaurant;
-- Question 1: What are the names of the International Foods Restaurant employees whose salaries are greater than 
-- that of employees whose ID is 125? Use a subquery.
SELECT last_name, 
	first_name,
	salary
FROM staff
WHERE salary >
	(SELECT salary 
    FROM staff 
    WHERE staff_id = 125)
;

-- Question 2: What are the names of the International Foods Restaurant employees whose staff job ID is not the 
-- same as Nicolas Patrick? Use a subquery.
SELECT first_name, 
	last_name,
	job_id
FROM staff
WHERE job_id !=
	(SELECT job_id
    FROM staff
    WHERE first_name = 'Nicolas' AND last_name = 'Patrick')
;

-- Question 3: Which employees have the same department ID as the IT department? Use a subquery.
SELECT first_name,
	last_name
FROM staff 
WHERE dept_id = 
	(SELECT department_id
    FROM departments
    WHERE department_name = 'IT')
;

-- Question 4: Write a query that returns all employees whose salary is greater than that of Lane (last name) and 
-- are in the same department as Zayn. Use a subquery.
SELECT staff_id,
	first_name,
	last_name,
    email
FROM staff
WHERE salary > 
	(SELECT salary
    FROM staff
    WHERE last_name = 'Lane')
AND
	dept_id =
    (SELECT dept_id
    FROM staff
    WHERE last_name = 'Zayn')
;

-- Question 5: Write a query that returns all employees who have the same job ID as Emilia Nasir and were hired 
-- after Baylor Collin. Use a subquery. 
SELECT staff_id,
	first_name,
    last_name,
    salary,
    dept_id
FROM staff
WHERE job_id =
	(SELECT job_id
    FROM staff
    WHERE first_name = 'Emilia' AND last_name = 'Nasir')
AND
hire_date >
	(SELECT hire_date
    FROM staff
    WHERE first_name = 'Baylor' AND last_name = 'Collin')
;

-- Question 6: What is the job ID for International Foods Restaurant jobs that have a salary greater than those of any 
-- S_Cook job ID? Use a subquery.
SELECT job_id, 
	dept_id
FROM staff
WHERE salary > 
	(SELECT Max(salary)
    FROM staff
    WHERE job_id = 'S_cook')
;

-- Question 7: Write a query that returns a list of department IDs and average salaries where the department’s 
-- average salary is greater than Marcus Jeremy’s salary. Use a subquery.
SELECT dept_id, 
	AVG(salary) AS 'Average Salary'
FROM staff
GROUP BY dept_id
HAVING AVG(salary) >
	(SELECT salary
    FROM staff
    WHERE first_name = 'Marcus'
    AND last_name = 'Jeremy')
;

-- Question 8: Write a query that returns a list of department IDs with employees whose minimum salary is greater 
-- than the lowest salary of employees whose department ID is not equal to 50. Use a subquery.
SELECT dept_id,
	MIN(salary) AS "minimum salary"
FROM staff
GROUP BY dept_id
HAVING MIN(salary) >
	(SELECT MIN(salary)
    FROM staff
    WHERE dept_id != 50)
;

-- Question 9: Find the last names of all employees whose salaries are the same as the minimum salary for any 
-- department. Use a subquery.
SELECT last_name,
	first_name
FROM staff
WHERE salary =
	(SELECT MIN(salary)
    FROM staff
    WHERE dept_id = 10)
OR salary =
	(SELECT MIN(salary)
    FROM staff
    WHERE dept_id = 20)
OR salary =
	(SELECT MIN(salary)
    FROM staff
    WHERE dept_id = 30)
OR salary =
	(SELECT MIN(salary)
    FROM staff
    WHERE dept_id = 40)
OR salary =
	(SELECT MIN(salary)
    FROM staff
    WHERE dept_id = 50)
OR salary =
	(SELECT MIN(salary)
    FROM staff
    WHERE dept_id = 60)
;

-- Question 10: The goal of the following query is to display the minimum salary for each department that is less 
-- than the lowest salary of the employees in department 30. However, the subquery does not execute because it 
-- has five errors. Find and correct them. Then, run the query.
SELECT dept_id, MIN(salary) As  "minimum salary" 
FROM staff 
GROUP BY dept_id
HAVING MIN(salary) <
    (SELECT MIN(salary)  
    FROM staff
    WHERE dept_id = 30)
;

-- Question 11: Write a non-pair-wise subquery that lists the last_name, first_name, department_id, and 
-- manager_id for all employees with the same department_ id and manager_id as employee 745. Use a subquery.
SELECT last_name, 
	first_name,
    dept_id,
    manager_id
FROM staff
WHERE dept_id =
	(SELECT dept_id
    FROM staff
    WHERE staff_id = 745)
AND manager_id =
	(SELECT manager_id
    FROM staff
    WHERE staff_id = 745)
;

-- Question 12: Write a SQL statement that uses the IN operator to find the customer ID, first name, and last name 
-- of each customer who made an order on 05/09/2020. Use a subquery.
SELECT cust.customer_id,
	cust.first_name,
    cust.last_name
    FROM customers AS cust
		JOIN orders AS ord
			ON cust.customer_id = ord.cust_id
WHERE order_date IN
	(SELECT order_date
    FROM orders
    WHERE order_date = "2020-05-09")
;

-- Question 13: Write a SQL statement that displays the order ID and order date for each order created for the 
-- customer Evita Hodcroft. Use a subquery.
SELECT order_number,
	order_date
FROM orders AS ord
	JOIN customers AS cust
		ON ord.cust_id = cust.customer_id
WHERE (first_name, last_name) IN
	(SELECT first_name, 
		last_name
	FROM customers
    WHERE first_name = "Evita"
    AND last_name = "Hodcroft")
;

-- Question 14: Write a SQL statement that lists the highest earners for each department. Include the last name, 
-- department ID, and the salary for each employee.
SELECT last_name, 
	dept_id, 
    salary
FROM staff a
WHERE (dept_id, salary) IN 
	(SELECT dept_id, 
		MAX(salary) 
	FROM staff b
	GROUP BY dept_id)
;