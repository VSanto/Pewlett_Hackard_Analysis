-- Create new table for retiring employees
SELECT employees.emp_no,
    employees.first_name,
    employees.last_name,
    titles.title,
    titles.from_date,
    titles.to_date
   
 INTO retirement_titles
 from employees
 INNER JOIN titles
 ON employees.emp_no = titles.emp_no
 WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
 ORDER BY employees.emp_no;
 
 -- Check table
 SELECT * FROM retirement_titles;


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_titles
WHERE to_date = ('9999-01-01')
ORDER BY emp_no ASC;

SELECT * FROM unique_titles;

-- Number of unique titles
-- SELECT COUNT (title)
-- FROM unique_titles

-- Create table for retiring titles

SELECT COUNT (unique_titles.title),title
INTO retiring_titles
FROM unique_titles
GROUP BY unique_titles.title
ORDER BY count DESC;

SELECT * FROM retiring_titles
ORDER BY count DESC

-- Create Mentorship Eligibility table

SELECT  distinct on (employees.emp_no) employees.emp_no,
    employees.first_name,
    employees.last_name,
    employees.birth_date,
    dept_emp.from_date,
    titles.to_date,
	titles.title
	
INTO mentorship_eligibility
FROM employees
INNER JOIN titles
ON employees.emp_no = titles.emp_no
Inner Join dept_emp
ON employees.emp_no=dept_emp.emp_no
Where dept_emp.to_date='9999-01-01'
AND employees.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY employees.emp_no ASC;

SELECT * FROM mentorship_eligibility
SELECT * FROM employees
    




