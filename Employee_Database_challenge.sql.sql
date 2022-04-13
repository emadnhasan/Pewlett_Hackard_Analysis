--Retrieve columns from employees and titles tables
SELECT emp_no, first_name, last_name
FROM Employees
SELECT title, from_date, to_date
FROM titles

--Create a Retirement Titles table
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
---Create a Unique Titles table
INTO unique_titles
FROM retirement_titles
WHERE to_date ='9999-01-01'
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles

--Create a Retiring Titles table
SELECT COUNT (emp_no), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT DESC;

SELECT * FROM retiring_titles

--Create a Mentorship Eligibility table

SELECT DISTINCT ON (e.emp_no, de.emp_no, t.emp_no) e.emp_no, 
e.first_name,
e.last_name,
e.birth_date, 
de.from_date,
de
t.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON de.emp_no = e.emp_no
INNER JOIN titles as t
ON de.emp_no = t.emp_no
WHERE de.to_date ='9999-01-01'
AND
birth_date BETWEEN '1965-01-01' and '1965-12-31'
ORDER BY e.emp_no
SELECT * FROM mentorship_eligibility
