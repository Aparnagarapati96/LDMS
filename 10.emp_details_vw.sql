/*Write a report to show all Employees for a Department */
CREATE OR REPLACE VIEW emp_details_vw AS
    SELECT
        d.dept_id,
        emp_id,
        emp_name,
        dept_name,
        location
    FROM
        employees   e,
        departments d
    WHERE
        e.dept_id = d.dept_id
WITH READ ONLY;
