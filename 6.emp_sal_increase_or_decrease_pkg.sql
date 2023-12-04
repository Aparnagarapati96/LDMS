/**Create an appropriate executable database object to allow the Salary for an Employee to be increased or decreased by a percentage**/
CREATE OR REPLACE PACKAGE emp_sal_increase_or_decrease_pkg AS
    PROCEDURE emp_sal_increase_proc (
        l_emp_id   IN employees.emp_id%TYPE,
        l_comm_pct IN NUMBER
    );

    PROCEDURE emp_sal_decrease_proc (
        l_emp_id   IN employees.emp_id%TYPE,
        l_comm_pct IN NUMBER
    );

END emp_sal_increase_or_decrease_pkg;
/

CREATE OR REPLACE PACKAGE BODY emp_sal_increase_or_decrease_pkg AS

    PROCEDURE emp_sal_increase_proc (
        l_emp_id   IN employees.emp_id%TYPE,
        l_comm_pct IN NUMBER
    ) AS
    BEGIN
        UPDATE employees emp
        SET
            emp.salary = emp.salary + ( emp.salary * l_comm_pct / 100 )
        WHERE
            emp.emp_id = emp_sal_increase_proc.l_emp_id;

        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Error occured while attempting update to an employee');
            ROLLBACK;
    END emp_sal_increase_proc;

    PROCEDURE emp_sal_decrease_proc (
        l_emp_id   IN employees.emp_id%TYPE,
        l_comm_pct IN NUMBER
    ) AS
    BEGIN
        UPDATE employees emp
        SET
            emp.salary = emp.salary - ( emp.salary * l_comm_pct / 100 )
        WHERE
            emp.emp_id = emp_sal_decrease_proc.l_emp_id;

        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Error occured while attempting update to an employee');
            ROLLBACK;
    END emp_sal_decrease_proc;

END emp_sal_increase_or_decrease_pkg;
/
