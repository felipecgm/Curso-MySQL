USE employees;
COMMIT;

DELETE FROM departments
WHERE
	dept_no = 'd010';

SELECT 
    *
FROM
    departments
ORDER BY dept_no;