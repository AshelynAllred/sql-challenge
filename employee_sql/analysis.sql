-- MAKE SURE SCHEMAS HAVE BEEN SET UP FIRST
-- MAKE SURE CSV DATA HAS BEEN IMPORTED TO SQL DATABASE FIRST

-- question 1
-- employee number, last name, first name, sex, and salary of all employees
-- see 10-result head of 300,024 rows in "output table heads/q1.tsv"
SELECT s.emp_no, last_name, first_name, sex, salary
FROM employees as e
INNER JOIN salaries as s
ON e.emp_no = s.emp_no;

-- question 2
-- first name, last name, and hire date of employees hired in 1986
-- ChatGPT 3.5 consulted for year extraction from a date using PostgreSQL
-- see 10-result head of 36,150 rows in "output table heads/q2.tsv"
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- question 3
-- department number, department name, employee number, last name, first name of department managers
-- (there were multiple managers per department, but the question wording is 'list the manager of each department' oddly)
-- Done as left joins to ensure no manager info was lost in the resulting data. 
-- Appears to match well with 24 results, the number of non-header rows in dept_manager.csv
-- see 10-result head of 24 rows in "output table heads/q3.tsv"
SELECT dm.dept_no, dept_name, dm.emp_no, last_name, first_name
FROM dept_manager as dm
LEFT JOIN departments as d
ON dm.dept_no = d.dept_no
LEFT JOIN employees as e
ON dm.emp_no = e.emp_no;

-- question 4
-- department number, employee number, last name, first name, department name of employees
-- see 10-result head of 331,603 rows in "output table heads/q4.tsv"
SELECT de.dept_no, de.emp_no, last_name, first_name, dept_name
FROM dept_emp as de
INNER JOIN employees as e
ON de.emp_no = e.emp_no
INNER JOIN departments as d
on de.dept_no = d.dept_no;

-- question 5
-- first name, last name, sex of each employee where first name is Hercules and last name has B as the first letter
-- Chat GPT 3.5 consulted for substring commands
-- see 10-result head of 20 rows in "output table heads/q5.tsv"
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND SUBSTRING(last_name, 1, 1) = 'B';

-- question 6
-- employee number, last name, first name of employees in Sales dept
-- see 10-result head of 52245 rows in "output table heads/q6.tsv"
SELECT emp_no, last_name, first_name
FROM employees
WHERE emp_no IN (
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no = (
		SELECT dept_no
		FROM departments
		WHERE dept_name = 'Sales'
		LIMIT 1
	)
);

-- question 7
-- employee number, last name, first name, department name of employees in Sales, Development depts
-- see 10-result head of 137,952 rows in "output table heads/q7.tsv"
SELECT e.emp_no, last_name, first_name, dept_name
FROM employees as e
INNER JOIN (
	SELECT *
	FROM dept_emp
	INNER JOIN (
		SELECT *
		FROM departments 
		WHERE dept_name = 'Sales'
		OR dept_name = 'Development'
	) d
	ON dept_emp.dept_no = d.dept_no
) de
ON e.emp_no = de.emp_no;

-- question 8
-- frequency counts of all employee last names, descending order
-- ChatGPT 3.5 consulted for general method to get frequency counts
-- see 10-result head of 1638 rows in "output table heads/q8.tsv"
SELECT last_name, COUNT(last_name) as frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;