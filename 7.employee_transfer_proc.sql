/*Create an appropriate executable database object to allow the transfer of an Employee to a different Department*/

CREATE OR REPLACE PROCEDURE employee_transfer_proc (
    l_dept_id employees.dept_id%TYPE,
    l_emp_id  employees.emp_id%TYPE
) AS
    lv_dept_id employees.dept_id%TYPE;
BEGIN
    SELECT
        d.dept_id
    INTO lv_dept_id
    FROM
        employees   e,
        departments d
    WHERE
            d.dept_id = e.dept_id
        AND e.emp_id = l_emp_id;

    UPDATE employees
    SET
        dept_id = employee_transfer_proc.l_dept_id
    WHERE
        emp_id = employee_transfer_proc.l_emp_id;

    COMMIT;
EXCEPTION
    WHEN no_data_found THEN
        raise_application_error(-20006, 'Updating emp record error out due to data missing');
    WHEN OTHERS THEN
        raise_application_error(-20007, 'Upadting process encountered with unhandled exception error'
                                        || sqlcode
                                        || ' '
                                        || sqlerrm);
END employee_transfer_proc;
/

