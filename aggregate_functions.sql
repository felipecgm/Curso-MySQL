USE employees;

SELECT 
    COUNT(DISTINCT dept_no)
FROM
    dept_emp;
    
SELECT 
    SUM(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';

SELECT 
    MIN(emp_no)
FROM
    employees;
    
SELECT 
    MAX(emp_no)
FROM
    employees;
    
SELECT 
    ROUND(AVG(salary), 2)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
    
CREATE TABLE departments_dup (
    dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(40)
);

INSERT INTO departments_dup 
(
	dept_no,
    dept_name
)
SELECT 
	* 
FROM 
	departments;

INSERT INTO departments_dup 
	(dept_no) 
VALUES 
	('d010'), 
	('d011');
    
SELECT 
    *
FROM
    departments_dup;
    
 
ALTER TABLE 
	employees.departments_dup 
ADD COLUMN 
	dept_manager varchar(255) AFTER dept_name;
    
SELECT
   dept_no,
   dept_name,
   COALESCE(dept_no, dept_name) AS dept_info
FROM
   departments_dup
ORDER BY dept_no ASC;

SELECT
   IFNULL(dept_no, 'N/A') as dept_no,
   IFNULL(dept_name, 'Department name not provided') AS dept_name,
   COALESCE(dept_no, dept_name) AS dept_info
FROM
   departments_dup
ORDER BY dept_no ASC;





    
