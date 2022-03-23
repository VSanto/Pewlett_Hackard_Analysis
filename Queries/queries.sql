select * from departments;
select * from employees;
select * from dept_emp;
select * from dept_manager;
select * from salaries;
select * from titles;
select * from retirement_info;

-- Retirement eligibility 
select emp_no, first_name, last_name
from employees
where (birth_date between '1952-01-01' and '1955-12-31');

select emp_no, first_name, last_name
into retirement_info
from employees
where (birth_date between '1952-01-01' and '1955-12-31')
and (hire_date between '1985-01-01' and '1988-12-31');

-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM retirement_info;

--- Skill Drill
select emp_no, first_name, last_name
from employees
where (birth_date between '1953-01-01' and '1953-12-31');

select emp_no, first_name, last_name
from employees
where (birth_date between '1954-01-01' and '1954-12-31');

select emp_no, first_name, last_name
from employees
where (birth_date between '1955-01-01' and '1955-12-31');

-- Creating table retierment info
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Viewing table
SELECT * FROM retirement_info;