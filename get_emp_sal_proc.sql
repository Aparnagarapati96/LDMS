/* Create an appropriate executable database object to return the Salary for an Employee*/
--Method 2:
CREATE OR REPLACE PROCEDURE get_emp_sal_proc (
    p_emp_id employees.emp_id%TYPE
) AS
    l_emp_rec employees%rowtype;
    CURSOR c1 IS
    SELECT
        *
    FROM
        employees
    WHERE
        emp_id = get_emp_sal_proc.p_emp_id;

BEGIN
    dbms_output.put_line(lpad('-', 60, '-'));
    dbms_output.put_line(rpad('Employee Name', 20)
                         || rpad('Designation', 20)
                         || lpad('Salary', 10));

    dbms_output.put_line(lpad('-', 60, '-'));
    OPEN c1;
    LOOP
        FETCH c1 INTO l_emp_rec;
        EXIT WHEN c1%notfound;
        dbms_output.put_line(rpad(l_emp_rec.emp_name, 20)
                             || rpad(l_emp_rec.job_title, 20)
                             || lpad(l_emp_rec.salary, 10));

    END LOOP;

    CLOSE c1;
END get_emp_sal_proc;
/