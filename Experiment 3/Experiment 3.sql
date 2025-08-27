USE ADBMS;


-- Medium level Problem Experiment 3
CREATE TABLE department3 (
    id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- Create Employee Table
CREATE TABLE employee3 (
    id INT,
    name VARCHAR(50),
    salary INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES department3(id)
);


-- Insert into Department Table
INSERT INTO department3 (id, dept_name) VALUES
(1, 'IT'),
(2, 'SALES');

-- Insert into Employee Table
INSERT INTO employee3 (id, name, salary, department_id) VALUES
(1, 'JOE', 70000, 1),
(2, 'JIM', 90000, 1),
(3, 'HENRY', 80000, 2),
(4, 'SAM', 60000, 2),
(5, 'MAX', 90000, 1);

SELECT * FROM department3;
SELECT * FROM employee3;

SELECT D.dept_name, E.name, E.salary, D.id
FROM
department3 AS D
INNER JOIN
employee3 AS E
ON
D.id = E.department_id
WHERE E.salary IN
(
    SELECT MAX(E2.salary)
    FROM employee3 AS E2
    WHERE E2.department_id = E.department_id
    GROUP BY E2.department_id
)
ORDER BY D.dept_name




---Hard Level problem--
CREATE TABLE EmployeeA(
    emp_id int,
    emp_name VARCHAR(10),
    salary int
);

CREATE TABLE EmployeeB(
    emp_id int,
    emp_name VARCHAR(10),
    salary int
);

INSERT INTO EmployeeA VALUES
(1, 'AA', 1000),
(2, 'BB', 300);

INSERT INTO EmployeeB VALUES
(2, 'BB', 400),
(3, 'CC', 100);

SELECT * FROM EmployeeA;
SELECT * FROM EmployeeB;

SELECT emp_id, emp_name, MIN(SALARY)
FROM(
    SELECT * FROM EmployeeA
    UNION
    SELECT * FROM EmployeeB
)AS Intermediate_result
GROUP BY emp_id, emp_name;