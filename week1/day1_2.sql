**Schema (MySQL v5.7)**

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

---
**Query #36**

    SELECT Project.name AS project_name, Department.name AS Department_name FROM Project JOIN Department ON Project.department_id = Department.department_id;

| project_name    | Department_name |
| --------------- | --------------- |
| Project Alpha   | IT              |
| Project Gamma   | IT              |
| Project Theta   | IT              |
| Project Beta    | HR              |
| Project Delta   | Finance         |
| Project Eta     | Finance         |
| Project Epsilon | Marketing       |
| Project Zeta    | Marketing       |

---
**Query #37**

    SELECT  Employee.name AS Employee_name,Project.name AS project_name FROM Project JOIN Employee ON Project.department_id = Employee.department_id;

| Employee_name | project_name    |
| ------------- | --------------- |
| John Doe      | Project Alpha   |
| Bob Brown     | Project Alpha   |
| Grace Kelly   | Project Alpha   |
| Jane Smith    | Project Beta    |
| Charlie P.    | Project Beta    |
| John Doe      | Project Gamma   |
| Bob Brown     | Project Gamma   |
| Grace Kelly   | Project Gamma   |
| Alice Blue    | Project Delta   |
| Eve Black     | Project Delta   |
| David Green   | Project Epsilon |
| Hannah Lee    | Project Epsilon |
| David Green   | Project Zeta    |
| Hannah Lee    | Project Zeta    |
| Alice Blue    | Project Eta     |
| Eve Black     | Project Eta     |
| John Doe      | Project Theta   |
| Bob Brown     | Project Theta   |
| Grace Kelly   | Project Theta   |

---
**Query #38**

    SELECT Employee.name AS employee_name, Department.name AS Department_name FROM Employee LEFT JOIN Department ON Employee.department_id = Department.department_id;

| employee_name | Department_name |
| ------------- | --------------- |
| John Doe      | IT              |
| Bob Brown     | IT              |
| Grace Kelly   | IT              |
| Jane Smith    | HR              |
| Charlie P.    | HR              |
| Alice Blue    | Finance         |
| Eve Black     | Finance         |
| David Green   | Marketing       |
| Hannah Lee    | Marketing       |
| Frank White   |                 |

---
**Query #39**

    SELECT Employee.name AS employee_name, Department.name AS Department_name FROM Employee RIGHT JOIN Department ON Employee.department_id = Department.department_id;

| employee_name | Department_name |
| ------------- | --------------- |
| John Doe      | IT              |
| Bob Brown     | IT              |
| Grace Kelly   | IT              |
| Jane Smith    | HR              |
| Charlie P.    | HR              |
| Alice Blue    | Finance         |
| Eve Black     | Finance         |
| David Green   | Marketing       |
| Hannah Lee    | Marketing       |

---
**Query #40**

    SELECT Employee.name AS Employee_name  FROM Employee JOIN Project ON Employee.department_id = Project.department_id WHERE Project.department_id IS NULL;

There are no results to be displayed.

---
**Query #41**

    SELECT Employee.name AS Employee_name, COUNT(*) AS no_of_projects  FROM Employee JOIN Project ON Employee.department_id = Project.department_id GROUP BY Employee.name;

| Employee_name | no_of_projects |
| ------------- | -------------- |
| Alice Blue    | 2              |
| Bob Brown     | 3              |
| Charlie P.    | 1              |
| David Green   | 2              |
| Eve Black     | 2              |
| Grace Kelly   | 3              |
| Hannah Lee    | 2              |
| Jane Smith    | 1              |
| John Doe      | 3              |

---
**Query #42**

    SELECT Department.name AS department_name FROM Employee RIGHT JOIN Department ON Employee.department_id = Department.department_id 
    GROUP BY Department.department_id HAVING COUNT(*) =0;

There are no results to be displayed.

---
**Query #43**

    SELECT e2.name AS employee_name FROM Employee e1 JOIN Employee e2 ON e1.department_id = e2.department_id WHERE e1.name LIKE 'John Doe' and e2.name !='John Doe';

| employee_name |
| ------------- |
| Bob Brown     |
| Grace Kelly   |

---
**Query #44**

    SELECT Department.name AS department_name, SUM(Employee.salary) AS Total_salary FROM Department JOIN Employee ON Department.department_id = Employee.department_id GROUP BY Department.department_id ORDER BY Total_salary DESC LIMIT 1  ;

| department_name | Total_salary |
| --------------- | ------------ |
| IT              | 195000       |

---
**Query #45**

    SELECT Employee.name AS employee_name,Employee.salary FROM Employee ORDER BY salary DESC LIMIT 1;

| employee_name | salary |
| ------------- | ------ |
| Bob Brown     | 80000  |

---
**Query #46**

    SELECT name AS employee_name FROM Employee WHERE salary > ( SELECT AVG(salary) FROM Employee);

| employee_name |
| ------------- |
| Jane Smith    |
| Bob Brown     |
| David Green   |
| Grace Kelly   |

---
**Query #47**

    SELECT name,salary FROM Employee ORDER BY salary DESC LIMIT 1 OFFSET 1;

| name        | salary |
| ----------- | ------ |
| David Green | 70000  |

---
**Query #48**

    SELECT name FROM Department WHERE department_id = (SELECT department_id FROM Employee GROUP BY department_id ORDER BY  COUNT(*) DESC LIMIt 1);

| name |
| ---- |
| IT   |

---
**Query #49**

    SELECT e1.name FROM Employee e1 WHERE e1.salary>( SELECT AVG(salary) FROM Employee e2 WHERE e1.department_id = e2.department_id);

| name        |
| ----------- |
| Jane Smith  |
| Bob Brown   |
| David Green |
| Eve Black   |

---
**Query #50**

    SELECT name,salary FROM Employee ORDER BY salary DESC LIMIT 1 OFFSET 2;

| name        | salary |
| ----------- | ------ |
| Grace Kelly | 65000  |

---
**Query #51**

    SELECT *
    FROM Employee
    WHERE age > ALL (
        SELECT age
        FROM Employee
        WHERE department_id = (
            SELECT department_id
            FROM Department
            WHERE name = 'HR'
        )
    );

| emp_id | name        | age | salary | department_id | hire_date  |
| ------ | ----------- | --- | ------ | ------------- | ---------- |
| 3      | Bob Brown   | 45  | 80000  | 1             | 2018-02-12 |
| 6      | David Green | 38  | 70000  | 4             | 2022-05-18 |
| 7      | Eve Black   | 40  | 55000  | 3             | 2021-08-30 |

---

[View on DB Fiddle](https://www.db-fiddle.com/f/j3zr9zzcNJEK2uXXJGtSZa/10)
