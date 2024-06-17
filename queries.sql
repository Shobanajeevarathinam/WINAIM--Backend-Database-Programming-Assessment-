-- Query 1: Find all employees who have been hired in the last year

-- For MySQL
SELECT employee_id, first_name, last_name, hire_date
FROM employees
WHERE hire_date >= NOW() - INTERVAL 1 YEAR;

-- For SQL Server
SELECT employee_id, first_name, last_name, hire_date
FROM employees
WHERE hire_date >= DATEADD(year, -1, GETDATE());

-- For PostgreSQL
SELECT employee_id, first_name, last_name, hire_date
FROM employees
WHERE hire_date >= CURRENT_DATE - INTERVAL '1 year';

-- Query 2: Calculate the total salary expenditure for each department
SELECT d.department_id, d.department_name, SUM(s.salary) AS total_salary_expenditure
FROM departments d
JOIN employees e ON d.department_id = e.department_id
JOIN salaries s ON e.employee_id = s.employee_id
WHERE s.to_date = '9999-01-01' -- Assuming '9999-01-01' is used to indicate current salary
GROUP BY d.department_id, d.department_name;

-- Query 3: Find the top 5 highest-paid employees along with their department names
SELECT e.employee_id, e.first_name, e.last_name, d.department_name, s.salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN salaries s ON e.employee_id = s.employee_id
WHERE s.to_date = '9999-01-01' -- Assuming '9999-01-01' is used to indicate current salary
ORDER BY s.salary DESC
LIMIT 5;
