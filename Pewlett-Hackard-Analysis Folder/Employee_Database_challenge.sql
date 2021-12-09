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

