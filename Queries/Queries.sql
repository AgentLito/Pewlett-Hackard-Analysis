select * from departments
	select * from departments;
	select * from employees;
	select * from dept_manager;
	select * from salaries;
	select * from titles;
	select * from dept_emp;
	drop table dept_manager CASCADE;
	drop table dept_emp CASCADE;
	

	SELECT first_name, last_name
	FROM employees
	WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';
	

	SELECT first_name, last_name
	FROM employees
	WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';
	--skill drill--
	SELECT first_name, last_name
	FROM employees
	WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';
	

	SELECT first_name, last_name
	FROM employees
	WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';
	

	SELECT first_name, last_name
	FROM employees
	WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';
	

	

	

	-- Retirement eligibility
	SELECT first_name, last_name
	FROM employees
	WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
	

	SELECT COUNT(first_name)
	FROM employees
	WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
	

	

	-- Number of employees retiring
	SELECT COUNT(first_name)
	FROM employees
	WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
	

	SELECT * FROM retirement_info;
	

	-- Number of employees retiring
	SELECT COUNT(first_name)
	FROM employees
	WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
	

	SELECT first_name, last_name
	INTO retirement_info
	FROM employees
	WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
	

	SELECT * FROM retirement_info;
	

	-- Create new table for retiring employees
	SELECT emp_no, first_name, last_name
	INTO retirement_info
	FROM employees
	WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
	

	

	-- Check the table
	SELECT * FROM retirement_info;
	

	

	-- Joining departments and dept_manager tables
	SELECT departments.dept_name,
	     dept_manager.emp_no,
	     dept_manager.from_date,
	     dept_manager.to_date
	FROM departments
	INNER JOIN dept_manager
	ON departments.dept_no = dept_manager.dept_no;
	

	--with alias
	SELECT d.dept_name,
	     dm.emp_no,
	     dm.from_date,
	     dm.to_date
	FROM departments as d
	INNER JOIN dept_manager as dm
	ON d.dept_no = dm.dept_no;
	

	

	

	-- Joining retirement_info and dept_emp tables
	SELECT retirement_info.emp_no,
	    retirement_info.first_name,
	retirement_info.last_name,
	    dept_emp.to_date
	FROM retirement_info	
	LEFT JOIN dept_emp
	ON retirement_info.emp_no = dept_emp.emp_no;
	

	--with alias
	SELECT ri.emp_no,
	    ri.first_name,
	ri.last_name,
	    de.to_date
	FROM retirement_info as ri
	LEFT JOIN dept_emp as de
	ON ri.emp_no = de.emp_no;
	

	--create new table which holds retired emp with fname,lname and to date
	SELECT ri.emp_no,
	    ri.first_name,
	    ri.last_name,
	de.to_date
	INTO current_emp
	FROM retirement_info as ri
	LEFT JOIN dept_emp as de
	ON ri.emp_no = de.emp_no
	WHERE de.to_date = ('9999-01-01');
	

	-- Employee count by department number
	SELECT COUNT(ce.emp_no), de.dept_no
	FROM current_emp as ce
	LEFT JOIN dept_emp as de
	ON ce.emp_no = de.emp_no
	GROUP BY de.dept_no
	ORDER BY de.dept_no;
	

	

	-- Employee count by department number
	--Skill drill to create table and export csv 
	create table empCount_By_dept_no as
	(SELECT COUNT(ce.emp_no), de.dept_no
	FROM current_emp as ce
	LEFT JOIN dept_emp as de
	ON ce.emp_no = de.emp_no
	GROUP BY de.dept_no
	ORDER BY de.dept_no);
	

	

	select * from empCount_By_dept_no;
	

	SELECT * FROM salaries;
	

	SELECT * FROM salaries
	ORDER BY to_date DESC;
	---------------------------------------------------------
	-- List 1: Employee Information
	-- List of Emplyoees
	SELECT e.emp_no,
	    e.first_name,
	    e.last_name,
	    e.gender,
	    s.salary,
	    de.to_date
	INTO emp_info
	FROM employees as e
	INNER JOIN salaries as s
	ON (e.emp_no = s.emp_no)
	INNER JOIN dept_emp as de
	ON (e.emp_no = de.emp_no)
	WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	     AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
		 AND (de.to_date = '9999-01-01');
		 
	select * from emp_info;	 
	---------------------------------------------------------------------------------
	-- List 2: Management
	-- List of managers per department
	select  dm.dept_no,
			d.dept_name,
			dm.emp_no,
			ce.last_name,
			ce.first_name,
			dm.from_date,
			dm.to_date
	INTO manager_info
	FROM dept_manager AS dm
		INNER JOIN departments AS d
			ON (dm.dept_no=d.dept_no)
		INNER JOIN current_emp AS ce
			ON (dm.emp_no=ce.emp_no);
			
	SELECT * FROM manager_info;
	-----------------------------------------------------------------------------------
	-- List 3: Department Retirees
	-- Department Retirees
	SELECT  ce.emp_no,
			ce.first_name,
			ce.last_name,
			d.dept_name
	INTO dept_info
	FROM current_emp as ce
	INNER JOIN dept_emp as de
	ON (ce.emp_no=de.emp_no)
	INNER JOIN departments as d
	ON (de.dept_no=d.dept_no);
	

	select * from dept_info;
	

	------------------------------------------------------------------------------------------
	-- List of Retire Employee for deparmants
	

	select  ri.emp_no,
			ri.first_name,
			ri.last_name,
			d.dept_name
	INTO Dept_retirement_info
	FROM retirement_info as ri
	INNER JOIN dept_emp as de
	ON(ri.emp_no=de.emp_no)
	INNER JOIN departments as d
	ON(de.dept_no=d.dept_no);
	

	select *from Dept_retirement_info;
	-----------------------------------------------------------------------------------------
	

	--Tailored List
	--Sales Dept Retiring Employees
	--Sales Department Retiring Employees
	select * 
	INTO sales_info
	from Dept_retirement_info
	where  dept_name = 'Sales';
	

	select * from sales_info;
	

	--Sales Department Retiring Employees
	SELECT *
	--INTO sales_info
	FROM dept_retirement_info
	WHERE dept_name IN ('Sales');
	

	select * from sales_info;
	

	--Sales and Development teams:
	

	select * 
	INTO teams_info
	from Dept_retirement_info
	where  dept_name IN ('Sales','Development');
	select * from teams_info;

