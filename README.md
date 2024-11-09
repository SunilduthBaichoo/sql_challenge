# sql_challenge
SQL challenge as data engineer at Pewlett Hackard (fictional company)


# Data Modeling

## Entity Relationship Diagram



![ERD](https://github.com/user-attachments/assets/ad12898f-15e1-4038-a4c1-b366f5e9c08b)

# Data Engineering

The physical schema is given below. The  EmployeeSQL_DB Documentation can also be viewed from the file [EmployeeSQL_DB_Physical_schema.pdf](https://github.com/SunilduthBaichoo/sql_challenge/blob/main/EmployeeSQL_DB_Physical_schema.pdf)

## EmployeeSQL Physical_schema.txt

employees 
-
emp_no INT PK <br>
emp_title_id CHAR(5) FK >- titles.title_id <br>
birth_date DATE <br>
first_name VARCHAR(30) <br>
last_name VARCHAR(30) <br>
sex VARCHAR(1) <br>
hire_date DATE <br>

salaries
-
emp_no INT FK - employees.emp_no <br>
salary INT <br>


titles
-
title_id CHAR(5) PK <br>
title VARCHAR(30) <br>


departments
-
dept_no CHAR(4) PK  <br>
dept_name VARCHAR(30) <br>


dept_emp 
-
emp_no INT FK >- employees.emp_no <br>
dept_no CHAR(4) FK >- departments.dept_no <br>


dept_manager
-
dept_no CHAR(4) FK >- departments.dept_no <br>
emp_no INT FK - employees.emp_no <br>


# EmployeeSQL.sql

-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/ <br>
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/JLW7Qo
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
    "emp_title_id" CHAR(5)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(30)   NOT NULL,
    "last_name" VARCHAR(30)   NOT NULL,
    "sex" VARCHAR(1)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL
);

CREATE TABLE "titles" (
    "title_id" CHAR(5)   NOT NULL,
    "title" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "departments" (
    "dept_no" CHAR(4)   NOT NULL,
    "dept_name" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" CHAR(4)   NOT NULL
);

CREATE TABLE "dept_manager" (
    "dept_no" CHAR(4)   NOT NULL,
    "emp_no" INT   NOT NULL
);

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");




## 2. Importing CSV files into its corresponding SQL table.

Due to the presence of Foreign Keys (FK) in many tables, the titles and departments tables were first populated as these have definition for the FKs, followed by the tables employees, salaries, dept_emp and dept_manager.<br>
The date format had to be altered to allow for import of data for the employees table as follows:
SET DATESTYLE TO "ISO, MDY"; <br>
alter database "EmployeeSQL_DB" set datestyle='MDY';


# Data Analysis

The .sql file for all the following queries can be accessed from [here](https://github.com/SunilduthBaichoo/sql_challenge/blob/main/data_analysis.sql)

1. List the employee number, last name, first name, sex, and salary of each employee.

2. List the first name, last name, and hire date for the employees who were hired in 1986.

3. List the manager of each department along with their department number, department name, employee number, last name, and first name.

4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

6. List each employee in the Sales department, including their employee number, last name, and first name.

7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).


