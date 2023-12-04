/*Write a report to show the total of Employee Salary for a Department */

CREATE OR REPLACE VIEW dept_sal_details_vw AS
    SELECT
        d.dept_id   "Dept Id",
        dept_name   "Department Name",
        COUNT(*)    "No of Emps",
        SUM(salary) "Total Salary",
        MAX(salary) "Maximum Salary",
        MIN(salary) "Minimum salary",
        round(AVG(salary)) "Average Salary"
    FROM
        employees   e,
        departments d
    WHERE
        e.dept_id = d.dept_id
    GROUP BY
        d.dept_id,
        dept_name;