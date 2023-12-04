/*Populate the Departments and Employees data structures using the data specified in the Appendix*/
INSERT ALL INTO departments (
    dept_id,
    dept_name,
    location
) VALUES (
    1,
    'Management',
    'London'
) INTO departments (
    dept_id,
    dept_name,
    location
) VALUES (
    2,
    'Engineering',
    'Cardiff'
) INTO departments (
    dept_id,
    dept_name,
    location
) VALUES (
    3,
    'Research and Development',
    'Edinburgh'
) INTO departments (
    dept_id,
    dept_name,
    location
) VALUES (
    4,
    'Sales',
    'Belfast'
) SELECT
      1
  FROM
      dual;

COMMIT;