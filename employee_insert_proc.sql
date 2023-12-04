/**Create an appropriate executable database object to allow an Employee to be created**/

CREATE OR REPLACE PROCEDURE employee_insert_proc (
    p_emp_id     employees.emp_id%TYPE,
    p_emp_name   employees.emp_name%TYPE,
    p_job_title  employees.job_title%TYPE,
    p_manager_id employees.manager_id%TYPE,
    p_hire_date  employees.hire_date%TYPE,
    p_salary     employees.salary%TYPE,
    p_dept_id    employees.dept_id%TYPE
) AS
BEGIN
    INSERT INTO employees (
        emp_id,
        emp_name,
        job_title,
        manager_id,
        hire_date,
        salary,
        dept_id
    ) VALUES (
        p_emp_id,
        p_emp_name,
        p_job_title,
        p_manager_id,
        p_hire_date,
        p_salary,
        p_dept_id
    );

    dbms_output.put_line(p_emp_name || ' employee record inserted');
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        raise_application_error(-20005, 'An error occured while inserting the employee data '
                                        || sqlcode
                                        || 'error msg- '
                                        || sqlerrm);
END;
/