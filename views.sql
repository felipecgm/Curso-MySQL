USE employees;

/* Create a view that will extract the average salary of all managers registered in the database. Round this value to the nearest cent.

If you have worked correctly, after executing the view from the “Schemas” section in Workbench, you should obtain the value of 66924.27. */

CREATE OR REPLACE VIEW v_manager_avg_salary AS
    SELECT 
        ROUND(AVG(salary), 2) AS manager_avg_salary
    FROM
        dept_manager AS dm
            JOIN
        salaries s ON dm.emp_no = s.emp_no;
