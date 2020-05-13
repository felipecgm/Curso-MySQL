USE employees;

COMMIT;

ALTER TABLE departments_dup
DROP COLUMN dept_manager;

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;
    
ALTER TABLE departments_dup
CHANGE COLUMN 
	dept_no dept_no CHAR(4) NULL;

ALTER TABLE departments_dup
CHANGE COLUMN
	dept_name dept_name VARCHAR(40) NULL;
    
INSERT INTO departments_dup
	(dept_name)
VALUES
	('Public Relations');

DELETE FROM departments_dup
WHERE 
	dept_no = 'd002';
    
DROP TABLE IF EXISTS dept_manager_dup;
CREATE TABLE dept_manager_dup
(
	emp_no INT(11) NOT NULL,
    dept_no CHAR(4) NULL,
    from_date DATE NOT NULL,
    to_date DATE NULL
);

INSERT INTO dept_manager_dup
SELECT 
	* 
FROM 
	dept_manager;

INSERT INTO dept_manager_dup 
	(emp_no, from_date)
VALUES
(999904, '2017-01-01'),
(999905, '2017-01-01'),
(999906, '2017-01-01'),
(999907, '2017-01-01');

DELETE FROM dept_manager_dup
WHERE
   dept_no = 'd001';
   
SELECT 
    *
FROM
    dept_manager_dup
ORDER BY dept_no;

SELECT 
    *
FROM
    employees
ORDER BY emp_no;

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no;
    
SELECT 
    e.emp_no, e.first_name, e.last_name, dm.dept_no, e.hire_date
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no;

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    dm.dept_no,
    dm.from_date
FROM
    employees e
        LEFT JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
WHERE
    e.last_name = 'Markovitch'
ORDER BY dm.dept_no DESC , e.emp_no;

SELECT 
    e.first_name, e.last_name, dm.dept_no, e.hire_date
FROM
    employees e,
    dept_manager dm
WHERE
    e.emp_no = dm.emp_no
ORDER BY e.emp_no, dm.dept_no;

SELECT 
    e.first_name, e.last_name, e.hire_date, t.title
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    e.first_name = 'Margareta'
        AND e.last_name = 'Markovitch'
ORDER BY e.emp_no;

SELECT
    dm.*, d.*
FROM
   departments d
       CROSS JOIN
   dept_manager dm
WHERE
   d.dept_no = 'd009'
ORDER BY d.dept_name;

SELECT
    e.*, d.*
FROM
   employees e
       CROSS JOIN
   departments d
WHERE
   e.emp_no < 10011
ORDER BY e.emp_no, d.dept_name;

 
 SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    t.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
        JOIN
    titles t ON dm.emp_no = t.emp_no
        JOIN
    departments d ON dm.dept_no = d.dept_no
WHERE
    t.title = 'Manager'
ORDER BY e.emp_no;

SELECT
   e.first_name,
   e.last_name,
   e.hire_date,
   t.title,
   m.from_date,
   d.dept_name
FROM
   employees e
       JOIN
   dept_manager m ON e.emp_no = m.emp_no
       JOIN
   departments d ON m.dept_no = d.dept_no
       JOIN
   titles t ON e.emp_no = t.emp_no
WHERE t.title = 'Manager'
ORDER BY e.emp_no;

SELECT 
    e.gender, COUNT(t.title) AS manager
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    title = 'Manager'
GROUP BY e.gender
ORDER BY manager DESC;

SELECT
   e.gender, COUNT(dm.emp_no)
FROM
   employees e
       JOIN
   dept_manager dm ON e.emp_no = dm.emp_no
GROUP BY gender;

SELECT 
    *
FROM
    (SELECT 
		e.emp_no,
		e.first_name,
		e.last_name,
		NULL AS dept_no,
		NULL AS from_date
    FROM
        employees e
    WHERE
		last_name = 'Denis' UNION SELECT 
		NULL AS emp_no,
		NULL AS first_name,
		NULL AS last_name,
		dm.dept_no,
		dm.from_date
    FROM
        dept_manager dm) AS a
ORDER BY - a.emp_no DESC;



    