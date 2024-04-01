-- SQL CHALLENGE QUERIES

-- List the employee number, last name, first name, sex, and salary of each employee
SELECT E.emp_no, last_name, first_name, sex, salary
FROM "Employees" E
	JOIN "Salaries" S ON E.emp_no = S.emp_no;
	
-- List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM "Employees"
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

/* List the manager of each department along with their department number, department name, 
employee number, last name, and first name */
SELECT M.dept_no, dept_name, M.emp_no, last_name, first_name
FROM "Dept_manager" M
	JOIN "Employees" E ON M.emp_no = E.emp_no
	JOIN "Departments" D ON M.dept_no = D.dept_no;
	
/* List the department number for each employee along with that employee’s employee number, 
last name, first name, and department name */
SELECT DE.dept_no, E.emp_no, last_name, first_name, dept_name
FROM "Employees" E
	JOIN "Dept_emp" DE ON E.emp_no = DE.emp_no
	JOIN "Departments" D ON DE.dept_no = D.dept_no;
	
/* List first name, last name, and sex of each employee whose first name is Hercules and whose 
last name begins with the letter B */
SELECT first_name, last_name, sex
FROM "Employees"
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

/* List each employee in the Sales department, including their employee number, 
last name, and first name */
SELECT E.emp_no, last_name, first_name
FROM "Employees" E
	JOIN "Dept_emp" DE ON E.emp_no = DE.emp_no
	JOIN "Departments" D ON DE.dept_no = D.dept_no
WHERE dept_name = 'Sales';

/* List each employee in the Sales and Development departments, including their employee number, 
last name, first name, and department name */
SELECT E.emp_no, last_name, first_name, dept_name
FROM "Employees" E
	JOIN "Dept_emp" DE ON E.emp_no = DE.emp_no
	JOIN "Departments" D ON DE.dept_no = D.dept_no
WHERE dept_name IN ('Sales', 'Development');

/* List the frequency counts, in descending order, of all the employee last names 
(that is, how many employees share each last name) */
SELECT last_name, COUNT(emp_no) AS "Frequency_of_Last_Names"
FROM "Employees"
GROUP BY last_name
ORDER BY "Frequency_of_Last_Names" DESC;
