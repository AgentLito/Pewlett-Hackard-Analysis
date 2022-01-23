--Creating table for "PH-EmployeesDB"
	create table departments (
		dept_no VARCHAR(4) NOT NULL,
		dept_name VARCHAR(40) NOT NULL,
		PRIMARY KEY(dept_no),
		UNIQUE(dept_name)
	);
	create table employees(
	     emp_no INT NOT NULL,
	     birth_date DATE NOT NULL,
	     first_name VARCHAR NOT NULL,
	     last_name VARCHAR NOT NULL,
	     gender VARCHAR NOT NULL,
	     hire_date DATE NOT NULL,
	     PRIMARY KEY (emp_no)
	);
	

	CREATE TABLE dept_manager (
	    dept_no VARCHAR(4) NOT NULL,
	    emp_no INT NOT NULL,
	    from_date DATE NOT NULL,
	    to_date DATE NOT NULL,
	    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	    PRIMARY KEY (emp_no, dept_no)
	);
	

	CREATE TABLE salaries (
	  emp_no INT NOT NULL,
	  salary INT NOT NULL,
	  from_date DATE NOT NULL,
	  to_date DATE NOT NULL,
	  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	  PRIMARY KEY (emp_no)
	);
	

	CREATE TABLE titles (
		emp_no INT NOT NULL,
		title VARCHAR NOT NULL,
		from_date DATE NOT NULL,
		to_date DATE NOT NULL,
		FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
		PRIMARY KEY (emp_no,title,from_date)
	);
	

	CREATE TABLE dept_emp (
		dept_no VARCHAR(4) NOT NULL,
		emp_no INT NOT NULL,
		from_date DATE NOT NULL,
	  	to_date DATE NOT NULL,
		FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
		FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	    PRIMARY KEY (emp_no, dept_no)
	);
	

	select * from departments;
	select * from employees;
	select * from dept_manager;
	select * from salaries;
	select * from titles;
	select * from dept_emp;
	drop table dept_manager CASCADE;
	drop table dept_emp CASCADE;
	

	

	CREATE TABLE dept_manager (
	    dept_no VARCHAR(4) NOT NULL,
	    emp_no INT NOT NULL,
	    from_date DATE NOT NULL,
	    to_date DATE NOT NULL,
	    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	    PRIMARY KEY (emp_no, dept_no)
	);
	CREATE TABLE dept_emp (
		emp_no INT NOT NULL,
		dept_no VARCHAR(4) NOT NULL,
		from_date DATE NOT NULL,
	  	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	    PRIMARY KEY (emp_no, dept_no)
	);
	


