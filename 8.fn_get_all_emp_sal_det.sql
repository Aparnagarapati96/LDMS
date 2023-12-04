/* Create an appropriate executable database object to return the Salary for all Employees*/
--Method 1:
CREATE OR REPLACE TYPE t_emp_sal_det IS
    TABLE OF VARCHAR(2000);
/

CREATE OR REPLACE FUNCTION fn_get_all_emp_sal_det RETURN t_emp_sal_det
    PIPELINED
AS
BEGIN
    FOR i IN (
        SELECT
            emp_id,
            emp_name,
            salary
        FROM
            employees
    ) LOOP
        PIPE ROW ( 'Emp Id ='
                   || i.emp_id
                   || ' Name "'
                   || i.emp_name
                   || '" Sal ='
                   || i.salary );
    END LOOP;

    RETURN;
END fn_get_all_emp_sal_det;
/