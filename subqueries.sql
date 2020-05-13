USE employees;

SELECT 
    *
FROM
    dept_manager
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            employees
        WHERE
            hire_date BETWEEN '1990-01-01' AND '1995-01-01'); 
            
SELECT 
    *
FROM
    employees
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            titles
        WHERE
            title = 'Assistant Engineer');
            
SELECT
   *
FROM
   employees e
WHERE
   EXISTS( SELECT
           *
       FROM
           titles t
       WHERE
           t.emp_no = e.emp_no
               AND title = 'Assistant Engineer');
               
