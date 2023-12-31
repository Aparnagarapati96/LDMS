INSERT INTO employees (
    emp_id,
    emp_name,
    job_title,
    manager_id,
    hire_date,
    salary,
    dept_id
)
    WITH dept_details AS (
        SELECT
            90001,
            'John Smith',
            'CEO',
            NULL,
            '01/01/95',
            100000,
            1
        FROM
            dual
        UNION ALL
        SELECT
            90002,
            'Jimmy Willis',
            'Manager',
            90001,
            '23/09/03',
            52500,
            4
        FROM
            dual
        UNION ALL
        SELECT
            90003,
            'Roxy Jones',
            'Salesperson',
            90002,
            '11/02/17',
            35000,
            4
        FROM
            dual
        UNION ALL
        SELECT
            90004,
            'Selwyn Field',
            'Salesperson',
            90003,
            '20/05/15',
            32000,
            4
        FROM
            dual
        UNION ALL
        SELECT
            90005,
            'David Hallett',
            'Engineer',
            90006,
            '17/04/18',
            40000,
            2
        FROM
            dual
        UNION ALL
        SELECT
            90006,
            'Sarah Phelps',
            'Manager',
            90001,
            '21/03/15',
            45000,
            2
        FROM
            dual
        UNION ALL
        SELECT
            90007,
            'Louise Harper',
            'Engineer',
            90006,
            '01/01/13',
            47000,
            2
        FROM
            dual
        UNION ALL
        SELECT
            90008,
            'Tina Hart',
            'Engineer',
            90009,
            '28/07/14',
            45000,
            3
        FROM
            dual
        UNION ALL
        SELECT
            90009,
            'Gus Jones',
            'Manager',
            90001,
            '15/05/18',
            50000,
            3
        FROM
            dual
        UNION ALL
        SELECT
            90010,
            'Mildred Hall',
            'Secretary',
            90001,
            '12/10/96',
            35000,
            1
        FROM
            dual
    )
    SELECT
        *
    FROM
        dept_details;

COMMIT;