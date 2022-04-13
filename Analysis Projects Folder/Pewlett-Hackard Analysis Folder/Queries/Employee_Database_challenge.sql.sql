--Retrieve columns from employees and titles tables
SELECT emp_no, first_name, last_name
FROM Employees
SELECT title, from_date, to_date
FROM titles

--Join the employees and titles tables
SELECT e.emp_no, e.first_name, e.last_name,
t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON e.emp_no = t.emp_no
WHERE birth_date BETWEEN '1952-01-01' and '1955-31-12'
ORDER BY e.emp_no

SELECT * FROM retirement_titles

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_titles
WHERE to_date ='9999-01-01'
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles

--Retrieve the number of employees by their most recent job title
SELECT COUNT (emp_no), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT DESC;

SELECT * FROM retiring_titles
