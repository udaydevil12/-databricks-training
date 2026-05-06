# capgemini-databricks-training

SCHEMA SQL 
CREATE TABLE Department(
  department_id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);


INSERT INTO Department(department_id,name)
VALUES  (1,'IT'),(2,'HR'),(3,'Finance'),(4,'Marketing') ;

CREATE TABLE Employee(
   emp_id INT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
    age INT,
    salary DECIMAL,
    department_id INT,
  hire_date DATE,
  FOREIGN KEY (department_id) REFERENCES Department(department_id) 
                  );
 INSERT INTO  Employee
 VALUES (1, 'John Doe', 28, 50000.00, 1, '2020-01-15'),
(2, 'Jane Smith', 34, 60000.00, 2, '2019-07-23'),
(3, 'Bob Brown', 45, 80000.00, 1, '2018-02-12'),
(4, 'Alice Blue', 25, 45000.00, 3, '2021-03-22'),
(5, 'Charlie P.', 29, 50000.00, 2, '2019-12-01'),
(6, 'David Green', 38, 70000.00, 4, '2022-05-18'),
(7, 'Eve Black', 40, 55000.00, 3, '2021-08-30');

CREATE TABLE Project(
  project_id INT PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  department_id INT,
  FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

INSERT INTO Project 
VALUES (1, 'Project Alpha', 1),
(2, 'Project Beta', 2),
(3, 'Project Gamma', 1),
(4, 'Project Delta', 3),
(5, 'Project Epsilon', 4),
(6, 'Project Zeta', 4),
(7, 'Project Eta', 3);

INSERT INTO Employee (emp_id, name, age, salary, department_id, hire_date) VALUES
(8, 'Frank White', 32, 48000.00, NULL, '2021-07-10'), 
(9, 'Grace Kelly', 27, 65000.00, 1, '2018-11-13'),
(10, 'Hannah Lee', 30, 53000.00, 4, '2020-02-25');

INSERT INTO Project (project_id, name, department_id) VALUES
(8, 'Project Theta', 1),
(9, 'Project Iota', NULL);


QUERY SQL 


SELECT * FROM Employee;

SELECT name,salary FROM Employee;

SELECT * FROM Employee WHERE salary>30;

SELECT name FROM Department;

SELECT * FROM Employee WHERE department_id = 1;


SELECT * FROM Employee WHERE name LIKE 'J%';

SELECT * FROM Employee WHERE name LIKE '%e';

SELECT * FROM Employee WHERE name LIKE '%a%';

SELECT * FROM Employee WHERE LENGTH(name) = 9;

SELECT * FROM Employee WHERE name LIKE '_o%';



SELECT * FROM Employee WHERE 
YEAR(hire_date) = '2020';

SELECT * FROM Employee WHERE 
MONTH(hire_date) = 1;

SELECT * FROM Employee WHERE YEAR(hire_date)< '2019';

SELECT * FROM Employee WHERE YEAR(hire_date)<= '2021' AND MONTH(hire_date)>= '1';

SELECT * 
FROM Employee
WHERE hire_date >= CURDATE() - INTERVAL 2 YEAR;




SELECT SUM(salary) AS Total_EMP_salary FROM Employee;

SELECT AVG(salary) AS Average_EMP_salary FROM Employee;

SELECT MIN(salary) AS Min_EMP_salary FROM Employee;

SELECT department_id,COUNT(*) AS Number_of_Employees FROM Employee GROUP BY department_id;

SELECT department_id,avg(salary) AS Number_of_Employees FROM Employee GROUP BY department_id;


SELECT department_id,SUM(salary) AS total_salary FROM Employee GROUP BY department_id;

SELECT department_id,AVG(age) AS average_age FROM Employee GROUP BY department_id;

SELECT YEAR(hire_date) AS year, COUNT(*) AS no_of_employees_hired FROM Employee GROUP BY YEAR(hire_date);

SELECT department_id,MAX(salary) AS Highest_salary FROM Employee GROUP BY department_id;

SELECT department_id,AVG(salary) AS average_salary FROM Employee GROUP BY department_id
ORDER BY average_salary ASC
LIMIT 1;


SELECT department_id, COUNT(*) AS no_of_employees_hired FROM Employee
GROUP BY department_id HAVING no_of_employees_hired >2 ;

SELECT department_id,AVG(salary) AS average_salary FROM Employee GROUP BY department_id
HAVING average_salary >55000;

SELECT YEAR(hire_date), COUNT(*) AS no_of_employees_hired FROM Employee GROUP BY YEAR(hire_date) HAVING no_of_employees_hired >1 ;

SELECT department_id,SUM(salary) AS total_salary FROM Employee GROUP BY department_id
HAVING total_salary<100000;

SELECT department_id,MAX(salary) AS maximum_salary FROM Employee GROUP BY department_id
HAVING maximum_salary>75000;


SELECT * FROM Employee 
  ORDER BY salary ASC;
  
SELECT * FROM Employee 
  ORDER BY age ASC;
  
SELECT * FROM Employee 
  ORDER BY hire_date ASC;
  
SELECT * FROM Employee 
  ORDER BY department_id ASC,salary ASC;
  
SELECT department_id,SUM(salary) AS total_salary FROM Employee GROUP BY department_id
ORDER BY total_salary ASC ;
