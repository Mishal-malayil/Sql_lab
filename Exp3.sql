#1
INSERT INTO Department (dept_no, dept_name)
       VALUES
       ('D01', 'Human Resources'),
       ('D02', 'Finance'),
       ('D03', 'Information Technology'),
       ('D04', 'Marketing'),
       ('D05', 'Sales'),
       ('D06', 'Research and Development'),
       ('D07', 'Customer Support'),
       ('D08', 'Administration'),
       ('D09', 'Operations'),
       ('D10', 'Quality Assurance');



 INSERT INTO Employee (emp_no, emp_name, Mobile_no, salary, dept_no, Designation)VALUES
       ('E001', 'Arjun Kumar', 987654321, 4500, 'D01', 'HR Executive'),
       ('E002', 'Priya Sharma', 987654322, 4800, 'D02', 'Accountant'),
       ('E003', 'Ravi Patel', 987654323, 5200, 'D01', 'HR Manager'),
       ('E004', 'Neha Singh', 987654324, 4700, 'D03', 'Software Engineer'),
       ('E005', 'Amit Verma', 987654325, 6000, 'D02', 'Senior Accountant'),
       ('E006', 'Sneha Iyer', 987654326, 5500, 'D03', 'System Analyst'),
       ('E007', 'Karan Mehta', 987654327, 4300, 'D01', 'HR Assistant'),
       ('E008', 'Pooja Nair', 987654328, 5000, 'D02', 'Finance Analyst'),
       ('E009', 'Rahul Das', 987654329, 6200, 'D03', 'Project Manager'),
       ('E010', 'Anjali Gupta', 987654330, 5800, 'D01', 'Recruitment Lead');
#2
select * from Employee;
select * from Department
#3
select emp_no,emp_name from Employee where dept_no ='D02';
#4
SELECT emp_no, emp_name, designation, dept_no, salary
     FROM employee
     ORDER BY salary DESC;
#5
SELECT emp_no, emp_name
     FROM employee
     WHERE salary BETWEEN 2000 AND 5000;
#6
SELECT DISTINCT designation
FROM employee;

#7
UPDATE employee
SET salary = 45000
WHERE designation = 'HR Manager';

#8
UPDATE employee
SET mobile_no = 999568302
WHERE emp_name = 'Rahul Das';

#9
DELETE FROM employee
WHERE salary = 2500;

#10
SELECT emp_name, mobile_no
FROM employee
WHERE emp_name LIKE 'A%';

#11
SELECT *
FROM employee
WHERE LENGTH(emp_name) >= 3
  AND salary > 30000;

#12
SELECT *
FROM employee
WHERE emp_no IN ('E001', 'E002', 'E006');

#13
SELECT emp_no, emp_name
FROM employee
WHERE salary BETWEEN 20000 AND 30000;

#14
SELECT *
FROM employee
WHERE designation = 'HR Manager'
   OR designation = 'System Analyst';

#15
SELECT dept_no, COUNT(*) AS total_employees
FROM employee
GROUP BY dept_no;

#16
SELECT dept_no, AVG(salary) AS avg_salary
FROM employee
GROUP BY dept_no;

#17
SELECT dept_no, SUM(salary) AS total_salary
FROM employee
GROUP BY dept_no;

#18
SELECT dept_no,
       MAX(salary) AS highest_salary,
       MIN(salary) AS lowest_salary
FROM employee
GROUP BY dept_no;

#19
SELECT dept_no, AVG(salary)
FROM employee
WHERE dept_no != 'D01'
GROUP BY dept_no;

#20
SELECT dept_no, AVG(salary) AS avg_salary
FROM employee
WHERE dept_no != 'D03'
GROUP BY dept_no
HAVING AVG(salary) > 20000
ORDER BY avg_salary ASC;
