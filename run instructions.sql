Run Instructions:

/*1. I newly installed sql developer 19c db in my pc and create a new user in db*/ 
/*****************---------------------Create user-----------------------------------******/

ALTER SESSION SET "_oracle_script" = true;

CREATE USER ldmsdb IDENTIFIED BY ldmsdb;

/*****************---------------------Granting Privileges---------------------------******/

GRANT
    CREATE SESSION,
    ALTER SESSION,
    CREATE DATABASE LINK,
    CREATE MATERIALIZED VIEW,
    CREATE PROCEDURE,
    CREATE PUBLIC SYNONYM,
    CREATE ROLE,
    CREATE SEQUENCE,
    CREATE SYNONYM,
    CREATE TABLE,
    CREATE TRIGGER,
    CREATE TYPE,
    CREATE VIEW,
    UNLIMITED TABLESPACE
TO ldmsdb;

/* 2. Drop if any existing table contains the table name as "employees and "Departments" */

Drop table employees;
Drop table departments;

/* 3.Copy the Main_sql_run_script.sql file in your local drive and replace "@ C:\Users\aparn\OneDrive\Documents\GitHub\LDMS\" to user local drive path*/
@ C:\Users\aparn\OneDrive\Documents\GitHub\LDMS\Main_sql_run_script.sql;

/* 4. Run the above command by pressing control+enter */

/* 5. After executed the mail_sql_run_script Validate the database objects by running the below statements*/
	---validating tables (expected rows: 2)
SELECT
    COUNT(*)
FROM
    all_tables
WHERE
    table_name IN ( 'EMPLOYEES', 'DEPARTMENTS' );
	
	---validating indexes (expected indexes:3)
SELECT
    COUNT(*)
FROM
    all_indexes
WHERE
    table_name IN ( 'EMPLOYEES', 'DEPARTMENTS' ); 
	
	--Validating views (expected viwes:2)
SELECT
    COUNT(*)
FROM
    all_views
WHERE
    lower(view_name) IN ( 'emp_details_vw', 'dept_sal_details_vw' );

	--Validating procedures,function & package (expected rows:7)
SELECT
    COUNT(*)
FROM
    all_procedures
WHERE
    lower(object_name) IN ( 'employee_insert_proc', 'employee_transfer_proc', 'get_emp_sal_proc', 'fn_get_all_emp_sal_det', 'emp_sal_increase_or_decrease_pkg'
    );

	--Validing the constraints of emp and dept tables

SELECT
    *
FROM
    all_constraints
WHERE
    table_name IN ( 'DEPARTMENTS', 'EMPLOYEES' );

	--Validating the tables data
SELECT
    *
FROM
    departments;

SELECT
    *
FROM
    employees;

/* 6. executing the employee_insert_proc to insert an new employee */
	--pass the employee parameters (emp id,emp_name,job title, manager id, hiring date, salary and dept id)

set serveroutput on;
exec employee_insert_proc(90011,'Aparna Garapati','Engineer',90010,'02/12/2023',45000,3);
	
/* 7.executing the emp_sal_increase_or_decrease_pkg for incresing and decreasing the salary */
	-- for both procedures pass employee id and salary % increment

exec emp_sal_increase_or_decrease_pkg.emp_sal_increase_proc(90011,20);
exec emp_sal_increase_or_decrease_pkg.emp_sal_decrease_proc(90011,20);

/* 8.executing the employee_transfer_proc to transfer the emp to different department*/
	-- pass the intended department id and emp id parameters

set serveroutput on;
exec employee_transfer_proc (1,90011);

/* 9.calling the fn_get_all_emp_sal_det to get the salary details of all the employees*/

SELECT
    fn_get_emp_sal_det
FROM
    dual;
	
/*10. executing the get_emp_sal_proc procedure to get the salary of an employee */
	-- pass the employee ID 
	
set serveroutput on;
exec get_emp_sal_proc(90001);

/*11. validating the emp_details_vw to show all Employees for a Department */
	-- enter the department id in where clause
	
SELECT
    *
FROM
    emp_details_vw
WHERE
    dept_id = 1;

/*12. validating the dept_sal_details_vw to view the total of Employee Salary for  Departments*/

SELECT
    *
FROM
    dept_sal_details_vw;
