CREATE TABLE employees (
    emp_id     NUMBER(10)
        GENERATED BY DEFAULT ON NULL AS IDENTITY START WITH 90001 INCREMENT BY 1,
    emp_name   VARCHAR2(50) NOT NULL,
    job_title  VARCHAR2(50) NOT NULL,
    manager_id NUMBER(10),
    hire_date  DATE NOT NULL,
    salary     NUMBER(10) NOT NULL,
    dept_id    NUMBER(10) NOT NULL,
    CONSTRAINT emp_id_pk PRIMARY KEY ( emp_id ),
    CONSTRAINT dept_id_pk FOREIGN KEY ( dept_id )
        REFERENCES departments ( dept_id )
            ON DELETE CASCADE
)
    PARTITION BY RANGE (
        hire_date
    )
    ( PARTITION p1990
        VALUES LESS THAN ( TO_DATE('01-JAN-1991', 'DD-MON-YYYY') )
    COMPRESS,
    PARTITION p1991_p1994
        VALUES LESS THAN ( TO_DATE('01-JAN-1995', 'DD-MON-YYYY') ),
    PARTITION p1995_p1999
        VALUES LESS THAN ( TO_DATE('01-JAN-2000', 'DD-MON-YYYY') ),
    PARTITION p2000_p2004
        VALUES LESS THAN ( TO_DATE('01-JAN-2005', 'DD-MON-YYYY') ),
    PARTITION p2005_p2009
        VALUES LESS THAN ( TO_DATE('01-JAN-2010', 'DD-MON-YYYY') ),
    PARTITION p2010_p2014
        VALUES LESS THAN ( TO_DATE('01-JAN-2015', 'DD-MON-YYYY') ),
    PARTITION p2015_p2020
        VALUES LESS THAN ( TO_DATE('01-JAN-2020', 'DD-MON-YYYY') ),
    PARTITION p2021_p2025
        VALUES LESS THAN ( TO_DATE('01-JAN-2025', 'DD-MON-YYYY') ),
    PARTITION p2026_p2030
        VALUES LESS THAN ( TO_DATE('01-JAN-2030', 'DD-MON-YYYY') ),
    PARTITION p_maxvalue
        VALUES LESS THAN ( MAXVALUE )
    );

COMMENT ON COLUMN employees.emp_id IS
    'The unique identifier for the employee';

COMMENT ON COLUMN employees.emp_name IS
    'The name of the employee';

COMMENT ON COLUMN employees.job_title IS
    'The job role undertaken by the employee. Some employees may undertaken the same job role';

COMMENT ON COLUMN employees.manager_id IS
    'Line manager of the employee';

COMMENT ON COLUMN employees.hire_date IS
    'The date the employee was hired';

COMMENT ON COLUMN employees.salary IS
    'Current salary of the employee';

COMMENT ON COLUMN employees.dept_id IS
    'Each employee must belong to a department';

CREATE INDEX emp_id_idx ON
    employees (
        emp_id,
        dept_id
    );
	