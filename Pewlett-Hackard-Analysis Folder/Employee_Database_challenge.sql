-- Retrieve the emp_no, first_name, and last_name columns from Employees table

SELECT emp_no, first_name, last_name, birth_date
FROM employees;

-- Retrieve the title, from_date, and to_date columns from the Titles table
SELECT title, from_date, to_date
FROM titles;

-- Create a new table using the INTO clause 
SELECT employees.emp_no, employees.first_name, employees.last_name, employees.birth_date,
		titles.title, titles.from_date, titles.to_date
INTO retirement_titles
FROM employees
LEFT JOIN titles
ON employees.emp_no = titles.emp_no
WHERE (employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY employees.emp_no

ALTER TABLE retirement_titles
DROP COLUMN birth_date;

SELECT * FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles;

-- Retrieve the number of employees by their most recent job title who are about to retire
SELECT title, COUNT(title)
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;


-- Deliverable 2
-- Retrieve columns from Employees table 
SELECT employees.emp_no, employees.first_name, employees.last_name, employees.birth_date,
dept_employees.from_date, dept_employees.to_date
INTO prep_table
FROM employees
LEFT JOIN dept_employees
ON employees.emp_no = dept_employees.emp_no

DROP TABLE mentorship_eligibility;

SELECT DISTINCT ON (prep_table.emp_no) prep_table.emp_no, prep_table.first_name, prep_table.last_name, prep_table.birth_date,
prep_table.from_date, prep_table.to_date, titles.title
INTO mentorship_eligibility
FROM prep_table
LEFT JOIN titles 
ON prep_table.emp_no = titles.emp_no
WHERE (prep_table.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND prep_table.to_date = '9999-01-01'
ORDER BY prep_table.emp_no;

SELECT * FROM mentorship_eligibility; 
