﻿-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/JLW7Qo
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- EmployeeSQL Physical_schema.txt

CREATE TABLE  employees  (
     emp_no  INT   NOT NULL,
     emp_title_id  CHAR(5)   NOT NULL,
     birth_date  DATE   NOT NULL,
     first_name  VARCHAR(30)   NOT NULL,
     last_name  VARCHAR(30)   NOT NULL,
     sex  VARCHAR(1)   NOT NULL,
     hire_date  DATE   NOT NULL,
    CONSTRAINT  pk_employees  PRIMARY KEY (
         emp_no 
     )
);

CREATE TABLE  departments  (
     dept_no  CHAR(4)   NOT NULL,
     dept_name  VARCHAR(30)   NOT NULL,
    CONSTRAINT  pk_departments  PRIMARY KEY (
         dept_no 
     )
);

CREATE TABLE  dept_emp  (
     emp_no  INT   NOT NULL,
     dept_no  CHAR(4)   NOT NULL,
    CONSTRAINT  pk_dept_emp  PRIMARY KEY (
         emp_no , dept_no 
     )
);

CREATE TABLE  dept_manager  (
     dept_no  CHAR(4)   NOT NULL,
     emp_no  INT   NOT NULL,
    CONSTRAINT  pk_dept_manager  PRIMARY KEY (
         dept_no , emp_no 
     )
);

CREATE TABLE  titles  (
     title_id  CHAR(5)   NOT NULL,
     title  VARCHAR(30)   NOT NULL,
    CONSTRAINT  pk_titles  PRIMARY KEY (
         title_id 
     )
);

CREATE TABLE  salaries  (
     emp_no  INT   NOT NULL,
     salary  INT   NOT NULL,
    CONSTRAINT  pk_salaries  PRIMARY KEY (
         emp_no 
     )
);

ALTER TABLE  employees  ADD CONSTRAINT  fk_employees_emp_title_id  FOREIGN KEY( emp_title_id )
REFERENCES  titles  ( title_id );

ALTER TABLE  dept_emp  ADD CONSTRAINT  fk_dept_emp_emp_no  FOREIGN KEY( emp_no )
REFERENCES  employees  ( emp_no );

ALTER TABLE  dept_emp  ADD CONSTRAINT  fk_dept_emp_dept_no  FOREIGN KEY( dept_no )
REFERENCES  departments  ( dept_no );

ALTER TABLE  dept_manager  ADD CONSTRAINT  fk_dept_manager_dept_no  FOREIGN KEY( dept_no )
REFERENCES  departments  ( dept_no );

ALTER TABLE  dept_manager  ADD CONSTRAINT  fk_dept_manager_emp_no  FOREIGN KEY( emp_no )
REFERENCES  employees  ( emp_no );

ALTER TABLE  salaries  ADD CONSTRAINT  fk_salaries_emp_no  FOREIGN KEY( emp_no )
REFERENCES  employees  ( emp_no );

