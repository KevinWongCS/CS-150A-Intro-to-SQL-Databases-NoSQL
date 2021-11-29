/*	Assignment10.sql
	Kevin Wong 
	CS150A Fall 2021 */
    
USE restaurant;
    
-- Question 1: Construct an inline view from the restaurant database that lists the last name, salary, department ID, 
-- and maximum salary for each department. Hint: One query will need to calculate maximum salary by department 
-- ID.
SELECT a.last_name, 
	a.salary, 
	a.dept_id,
	b.maximumSalary AS "maximum salary"
FROM staff AS a,
	(SELECT dept_id, 
		MAX(salary) AS maximumSalary
	FROM staff
	GROUP BY dept_id) AS b
WHERE a.dept_id = b.dept_id
;

-- Question 2: Create a new table called my_departments and add all columns and all rows to it using a subquery 
-- from the departments table. Do a SELECT statement to confirm that you have all the columns and rows.
-- Create or enable the department_id column as the primary key.
DROP TABLE IF EXISTS my_departments;
CREATE TABLE my_departments AS
SELECT b.department_id,
	a.department_name,
	a.manager_id
FROM departments AS a,
	(SELECT department_id
    FROM departments) AS b
WHERE a.department_id = b.department_id
;

SELECT * 
FROM my_departments AS copy
	JOIN departments AS original
		ON copy.department_id = original.department_id
;

ALTER TABLE my_departments
ADD PRIMARY KEY (department_id)
;

DESCRIBE my_departments;

-- Question 3: Create a view called view_my_departments that includes: department_id and department_name.
-- Add the following data to the my_departments table using view_my_departments.
-- department_id department_name
-- 105 Advertising
-- 120 Custodial
-- 130 Planning
CREATE OR REPLACE VIEW view_my_departments AS
	SELECT department_id,
		department_name
	FROM my_departments
;

INSERT INTO view_my_departments
	(department_id, department_name)
VALUES 
	(105, 'Advertising'),
	(120, 'Custodial'),
	(130, 'Planning')
;

-- Question 4: Add the Human Resources department, department ID 220 to my_departments using 
-- view_my_departments.
-- Verify that the new additions to my_departments were added using view_my_departments.
INSERT INTO view_my_departments
	(department_id, department_name)
VALUES 
	(220, 'Human Resources')
;

SELECT * 
FROM view_my_departments;

-- Question 5: Create a view named item_ordered. It consists of the food item number, item description, price, order 
-- number, order date, quantity, and price for all ordered food items currently on file. Write and execute the CREATE 
-- VIEW command to create the item_ordered view.
CREATE OR REPLACE VIEW item_ordered AS
	SELECT a.item_number,
		a.description,
        a.price,
        b.order_number,
		c.order_date,
        b.quantity,
        quantity * price AS "totalPrice"
	FROM food_items AS a
		JOIN order_lines AS b
			ON a.item_number = b.item_number
		JOIN orders AS c
			ON b.order_number = c.order_number
;

SELECT * 
FROM item_ordered;

-- Question 6: Write and execute the command to retrieve the item number, description, order number, and quoted 
-- price for all orders in the item_ordered view for food items with prices that exceed $5.
SELECT item_number,
	price,
	description,
    order_number,
    totalPrice AS "total price"
FROM item_ordered
WHERE price > 5
;

-- Question 7: Create a view named salary_view that returns the highest salary, lowest salary, average salary, and 
-- department name.
CREATE OR REPLACE VIEW salary_view AS
	SELECT 	department_name,
		dept_id,
		MAX(salary),
		MIN(salary),
		AVG(salary)
	FROM staff
    JOIN departments
		ON staff.dept_id = departments.department_id
    GROUP BY dept_id;
    
SELECT * 
FROM salary_view;

-- Question 8: Create a view named dept_managers_view that returns a listing of department names along with the 
-- manager initial and surname for that department. Test the view by returning all the rows from it. Make sure no 
-- rows can be updated through the view.
CREATE OR REPLACE VIEW dept_managers_view AS
	SELECT b.department_name,
		CONCAT(LEFT(a.first_name, 1) , ".", LEFT(a.last_name, 1), ".") AS initials,
        a.last_name AS surname,
        a.manager_id
	FROM staff AS a
		JOIN departments AS b
			ON a.dept_id = b.department_id
    WHERE a.manager_id IS NOT NULL
WITH CHECK OPTION
;

-- instructor correction:
/* Q8: Create a view named dept_managers_view that returns a
   listing of department names and manager initial and surname.
*/
CREATE OR REPLACE VIEW depts_managers_view 
(Department_name, Mgr_Initial, Mgr_Surname)
	AS SELECT d.department_name, SUBSTR(f.first_name,1,1), f.last_name 
    FROM staff s
		JOIN departments d ON (s.dept_id = d.department_id)
        JOIN staff f ON (f.staff_id = s.manager_id)
GROUP BY s.dept_id;

SELECT *
FROM dept_managers_view;


    
    
