-- Create new table for retiring employees
SELECT employee.emp_no,
    employees.first_name,
    employees.last_name,
    titles.title,
    titles.from_date,
    titles.to_date
   
 INTO retirement_titles
 from employees
 INNER JOIN titles
 ON employees.emp_no = title.emp_no
 WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
 ORDER BY employees.emp_no;
 
 -- Check table
 SELECT * FROM retirement_titles;


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO current_title
FROM retirement_titles;
WHERE to_date = ('9999-01-01')
ORDER BY emp_no, title DESC;

SELECT * FROM current_title

-- Create new table for unique titles

SELECT retirement_titles.emp_no,
    retirement_titles.first_name,
    retirement_titles.last_name,
    current_title.title
    
INTO unique_titles
FROM retirement_titles
ON retirement_titles.emp_no = current_title.emp_no
WHERE to_date ('9999-01-01')
ORDER BY retirement_titles.to_date DESC, retirement_titles.emp_no ASC;

SELECT * FROM unique_titles;

-- Number of unique titles
SELECT COUNT (title)
FROM unique_titles

-- Create table for retiring titles

SELECT COUNT (unique_titles.title),title
INTO retiring_titles
FROM unique_titles
GROUP BY unique_titles.title
ORDER BY unique_titles.title.DESC;

SELECT * FROM retiring_titles
ORDER BY count DESC

-- Create Mentorship Eligibility table

SELECT  eligible_employee.emp_no,
    eligible_employees.first_name,
    eligible_employees.last_name,
    eligible_employees.birth_date,
    eligible_titles.title,
    eligible_titles.from_date,
    eligible_titles.to_date
INTO mentorship_eligibility
FROM eligible_employees
INNER JOIN eligible_titles
ON eligible_employee.emp_no = eligible_titles.emp_no
WHERE eligible_employees.birth_date BETWEEN ('1965-01-01' AND '1965-12-31')
ORDER BY eligible_titles.emp_no ASC, eligible_employees.birth_date DESC;

SELECT * FROM mentorship_eligibility

    




