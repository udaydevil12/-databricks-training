**Schema (MySQL v5.7)**

    CREATE TABLE Employees (
        emp_id INT,
        emp_name VARCHAR(50),
        department VARCHAR(50),
        salary INT,
        city VARCHAR(50),
        experience INT
    );
    
    INSERT INTO Employees VALUES
    (101, 'Rahul', 'IT', 75000, 'Hyderabad', 5),
    (102, 'Anjali', 'HR', 45000, 'Chennai', 3),
    (103, 'Kiran', 'IT', 82000, 'Bangalore', 6),
    (104, 'Sneha', 'Finance', 67000, 'Hyderabad', 4),
    (105, 'Aman', 'HR', 39000, 'Pune', 2),
    (106, 'Ravi', 'Finance', 91000, 'Mumbai', 8),
    (107, 'Divya', 'IT', 55000, 'Chennai', 3),
    (108, 'Meena', 'Sales', 48000, 'Bangalore', 2),
    (109, 'Arjun', 'Sales', 61000, 'Hyderabad', 5),
    (110, 'Pooja', 'IT', 73000, 'Mumbai', 4),
    (111, 'Vikas', 'HR', 52000, 'Pune', 3),
    (112, 'Nisha', 'Finance', 88000, 'Bangalore', 7),
    (113, 'Tarun', 'Sales', 46000, 'Chennai', 2),
    (114, 'Kavya', 'IT', 97000, 'Hyderabad', 9),
    (115, 'Manoj', 'Finance', 58000, 'Mumbai', 4);

---

**Query #1**

    SELECT * FROM Employees;

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |
| 102    | Anjali   | HR         | 45000  | Chennai   | 3          |
| 103    | Kiran    | IT         | 82000  | Bangalore | 6          |
| 104    | Sneha    | Finance    | 67000  | Hyderabad | 4          |
| 105    | Aman     | HR         | 39000  | Pune      | 2          |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |
| 107    | Divya    | IT         | 55000  | Chennai   | 3          |
| 108    | Meena    | Sales      | 48000  | Bangalore | 2          |
| 109    | Arjun    | Sales      | 61000  | Hyderabad | 5          |
| 110    | Pooja    | IT         | 73000  | Mumbai    | 4          |
| 111    | Vikas    | HR         | 52000  | Pune      | 3          |
| 112    | Nisha    | Finance    | 88000  | Bangalore | 7          |
| 113    | Tarun    | Sales      | 46000  | Chennai   | 2          |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |
| 115    | Manoj    | Finance    | 58000  | Mumbai    | 4          |

---
**Query #2**

    SELECT emp_name AS Employee_name,salary FROM Employees;

| Employee_name | salary |
| ------------- | ------ |
| Rahul         | 75000  |
| Anjali        | 45000  |
| Kiran         | 82000  |
| Sneha         | 67000  |
| Aman          | 39000  |
| Ravi          | 91000  |
| Divya         | 55000  |
| Meena         | 48000  |
| Arjun         | 61000  |
| Pooja         | 73000  |
| Vikas         | 52000  |
| Nisha         | 88000  |
| Tarun         | 46000  |
| Kavya         | 97000  |
| Manoj         | 58000  |

---
**Query #3**

    SELECT emp_name AS Employee_name,department FROM Employees;

| Employee_name | department |
| ------------- | ---------- |
| Rahul         | IT         |
| Anjali        | HR         |
| Kiran         | IT         |
| Sneha         | Finance    |
| Aman          | HR         |
| Ravi          | Finance    |
| Divya         | IT         |
| Meena         | Sales      |
| Arjun         | Sales      |
| Pooja         | IT         |
| Vikas         | HR         |
| Nisha         | Finance    |
| Tarun         | Sales      |
| Kavya         | IT         |
| Manoj         | Finance    |

---
**Query #4**

    SELECT emp_name AS Employee_name 
    FROM Employees WHERE department LIKE 'IT';

| Employee_name |
| ------------- |
| Rahul         |
| Kiran         |
| Divya         |
| Pooja         |
| Kavya         |

---
**Query #5**

    SELECT emp_name AS Employee_name,experience FROM Employees;

| Employee_name | experience |
| ------------- | ---------- |
| Rahul         | 5          |
| Anjali        | 3          |
| Kiran         | 6          |
| Sneha         | 4          |
| Aman          | 2          |
| Ravi          | 8          |
| Divya         | 3          |
| Meena         | 2          |
| Arjun         | 5          |
| Pooja         | 4          |
| Vikas         | 3          |
| Nisha         | 7          |
| Tarun         | 2          |
| Kavya         | 9          |
| Manoj         | 4          |

---
**Query #6**

    SELECT emp_name AS Employee_name_salary_gt70k FROM Employees WHERE salary > 70000;

| Employee_name_salary_gt70k |
| -------------------------- |
| Rahul                      |
| Kiran                      |
| Ravi                       |
| Pooja                      |
| Nisha                      |
| Kavya                      |

---
**Query #7**

    SELECT emp_name AS Employee_name_work_in_hyd FROM Employees WHERE city LIKE 'Hyderabad';

| Employee_name_work_in_hyd |
| ------------------------- |
| Rahul                     |
| Sneha                     |
| Arjun                     |
| Kavya                     |

---
**Query #8**

    SELECT emp_name AS Employee_name_exp_Lt4Y FROM Employees WHERE experience<4;

| Employee_name_exp_Lt4Y |
| ---------------------- |
| Anjali                 |
| Aman                   |
| Divya                  |
| Meena                  |
| Vikas                  |
| Tarun                  |

---
**Query #9**

    SELECT emp_name AS Employee_name_dep_finance FROM Employees WHERE department LIKE 'Finance';

| Employee_name_dep_finance |
| ------------------------- |
| Sneha                     |
| Ravi                      |
| Nisha                     |
| Manoj                     |

---
**Query #10**

    SELECT emp_name AS Employee_name FROM Employees WHERE salary= 52000;

| Employee_name |
| ------------- |
| Vikas         |

---
**Query #11**

    SELECT department,SUM(salary) AS Total_salary FROM Employees GROUP BY department;

| department | Total_salary |
| ---------- | ------------ |
| Finance    | 304000       |
| HR         | 136000       |
| IT         | 382000       |
| Sales      | 155000       |

---
**Query #12**

    SELECT department,AVG(salary) AS Average_salary FROM Employees GROUP BY department;

| department | Average_salary |
| ---------- | -------------- |
| Finance    | 76000.0        |
| HR         | 45333.3333     |
| IT         | 76400.0        |
| Sales      | 51666.6667     |

---
**Query #13**

    SELECT city,COUNT(*) AS NO_OF_EMP FROM Employees GROUP BY city;

| city      | NO_OF_EMP |
| --------- | --------- |
| Bangalore | 3         |
| Chennai   | 3         |
| Hyderabad | 4         |
| Mumbai    | 3         |
| Pune      | 2         |

---
**Query #14**

    SELECT department,MAX(salary) AS maximum_salary FROM Employees GROUP BY department;

| department | maximum_salary |
| ---------- | -------------- |
| Finance    | 91000          |
| HR         | 52000          |
| IT         | 97000          |
| Sales      | 61000          |

---
**Query #15**

    SELECT department,MIN(experience) AS MIN_exp FROM Employees GROUP BY department;

| department | MIN_exp |
| ---------- | ------- |
| Finance    | 4       |
| HR         | 2       |
| IT         | 3       |
| Sales      | 2       |

---
**Query #16**

    SELECT department,COUNT(*) AS NO_OF_EMP FROM Employees GROUP BY department HAVING COUNT(*)>3;

| department | NO_OF_EMP |
| ---------- | --------- |
| Finance    | 4         |
| IT         | 5         |

---
**Query #17**

    SELECT department,AVG(salary) AS Average_salary FROM Employees GROUP BY department HAVING Average_salary>60000;

| department | Average_salary |
| ---------- | -------------- |
| Finance    | 76000.0        |
| IT         | 76400.0        |

---
**Query #18**

    SELECT city,COUNT(*) AS NO_OF_EMP FROM Employees GROUP BY city HAVING NO_OF_EMP>2;

| city      | NO_OF_EMP |
| --------- | --------- |
| Bangalore | 3         |
| Chennai   | 3         |
| Hyderabad | 4         |
| Mumbai    | 3         |

---
**Query #19**

    SELECT department,SUM(salary) AS Total_salary FROM Employees GROUP BY department HAVING Total_salary>200000;

| department | Total_salary |
| ---------- | ------------ |
| Finance    | 304000       |
| IT         | 382000       |

---
**Query #20**

    SELECT department,MAX(salary) AS max_salary FROM Employees GROUP BY department HAVING max_salary>90000;

| department | max_salary |
| ---------- | ---------- |
| Finance    | 91000      |
| IT         | 97000      |

---
**Query #21**

    SELECT * FROM Employees ORDER BY salary DESC LIMIT 5;

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |
| 112    | Nisha    | Finance    | 88000  | Bangalore | 7          |
| 103    | Kiran    | IT         | 82000  | Bangalore | 6          |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |

---
**Query #22**

    SELECT * FROM Employees ORDER BY experience DESC LIMIT 3;

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |
| 112    | Nisha    | Finance    | 88000  | Bangalore | 7          |

---
**Query #23**

    SELECT * FROM Employees WHERE department LIKE 'Finance' ORDER BY salary DESC LIMIT 2 ;

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |
| 112    | Nisha    | Finance    | 88000  | Bangalore | 7          |

---
**Query #24**

    SELECT * FROM Employees WHERE city LIKE 'Hyderabad' ORDER BY salary DESC  LIMIT 4;

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |
| 104    | Sneha    | Finance    | 67000  | Hyderabad | 4          |
| 109    | Arjun    | Sales      | 61000  | Hyderabad | 5          |

---
**Query #25**

    SELECT * FROM Employees ORDER BY salary DESC LIMIT 1;

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |

---
**Query #26**

    SELECT DISTINCT(department) FROM Employees ;

| department |
| ---------- |
| IT         |
| HR         |
| Finance    |
| Sales      |

---
**Query #27**

    SELECT DISTINCT(city)
    FROM Employees;

| city      |
| --------- |
| Hyderabad |
| Chennai   |
| Bangalore |
| Pune      |
| Mumbai    |

---
**Query #28**

    SELECT DISTINCT(salary)
    FROM Employees;

| salary |
| ------ |
| 75000  |
| 45000  |
| 82000  |
| 67000  |
| 39000  |
| 91000  |
| 55000  |
| 48000  |
| 61000  |
| 73000  |
| 52000  |
| 88000  |
| 46000  |
| 97000  |
| 58000  |

---
**Query #29**

    SELECT DISTINCT city,department
    FROM Employees;

| city      | department |
| --------- | ---------- |
| Hyderabad | IT         |
| Chennai   | HR         |
| Bangalore | IT         |
| Hyderabad | Finance    |
| Pune      | HR         |
| Mumbai    | Finance    |
| Chennai   | IT         |
| Bangalore | Sales      |
| Hyderabad | Sales      |
| Mumbai    | IT         |
| Bangalore | Finance    |
| Chennai   | Sales      |

---
**Query #30**

    SELECT DISTINCT(experience)
    FROM Employees;

| experience |
| ---------- |
| 5          |
| 3          |
| 6          |
| 4          |
| 2          |
| 8          |
| 7          |
| 9          |

---
**Query #31**

    SELECT emp_name,salary FROM Employees WHERE salary>= 80000;

| emp_name | salary |
| -------- | ------ |
| Kiran    | 82000  |
| Ravi     | 91000  |
| Nisha    | 88000  |
| Kavya    | 97000  |

---
**Query #32**

    SELECT * FROM Employees WHERE experience <= 3;

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 102    | Anjali   | HR         | 45000  | Chennai   | 3          |
| 105    | Aman     | HR         | 39000  | Pune      | 2          |
| 107    | Divya    | IT         | 55000  | Chennai   | 3          |
| 108    | Meena    | Sales      | 48000  | Bangalore | 2          |
| 111    | Vikas    | HR         | 52000  | Pune      | 3          |
| 113    | Tarun    | Sales      | 46000  | Chennai   | 2          |

---
**Query #33**

    SELECT emp_name,salary FROM Employees WHERE salary<>45000;

| emp_name | salary |
| -------- | ------ |
| Rahul    | 75000  |
| Kiran    | 82000  |
| Sneha    | 67000  |
| Aman     | 39000  |
| Ravi     | 91000  |
| Divya    | 55000  |
| Meena    | 48000  |
| Arjun    | 61000  |
| Pooja    | 73000  |
| Vikas    | 52000  |
| Nisha    | 88000  |
| Tarun    | 46000  |
| Kavya    | 97000  |
| Manoj    | 58000  |

---
**Query #34**

    SELECT emp_name,salary FROM Employees WHERE salary< 50000;

| emp_name | salary |
| -------- | ------ |
| Anjali   | 45000  |
| Aman     | 39000  |
| Meena    | 48000  |
| Tarun    | 46000  |

---
**Query #35**

    SELECT * FROM Employees WHERE experience > 5;

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 103    | Kiran    | IT         | 82000  | Bangalore | 6          |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |
| 112    | Nisha    | Finance    | 88000  | Bangalore | 7          |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |

---
**Query #36**

    SELECT * FROM Employees WHERE department LIKE 'IT' AND salary > 70000;

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |
| 103    | Kiran    | IT         | 82000  | Bangalore | 6          |
| 110    | Pooja    | IT         | 73000  | Mumbai    | 4          |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |

---
**Query #37**

    SELECT * FROM Employees WHERE city LIKE 'Hyderabad' OR city LIKE 'Banglore';

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |
| 104    | Sneha    | Finance    | 67000  | Hyderabad | 4          |
| 109    | Arjun    | Sales      | 61000  | Hyderabad | 5          |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |

---
**Query #38**

    SELECT * FROM Employees WHERE department LIKE 'HR' AND experience < 3;

| emp_id | emp_name | department | salary | city | experience |
| ------ | -------- | ---------- | ------ | ---- | ---------- |
| 105    | Aman     | HR         | 39000  | Pune | 2          |

---
**Query #39**

    SELECT * FROM Employees WHERE salary > 60000 AND experience > 6;

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |
| 112    | Nisha    | Finance    | 88000  | Bangalore | 7          |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |

---
**Query #40**

    SELECT * FROM Employees WHERE department NOT LIKE 'Sales';

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |
| 102    | Anjali   | HR         | 45000  | Chennai   | 3          |
| 103    | Kiran    | IT         | 82000  | Bangalore | 6          |
| 104    | Sneha    | Finance    | 67000  | Hyderabad | 4          |
| 105    | Aman     | HR         | 39000  | Pune      | 2          |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |
| 107    | Divya    | IT         | 55000  | Chennai   | 3          |
| 110    | Pooja    | IT         | 73000  | Mumbai    | 4          |
| 111    | Vikas    | HR         | 52000  | Pune      | 3          |
| 112    | Nisha    | Finance    | 88000  | Bangalore | 7          |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |
| 115    | Manoj    | Finance    | 58000  | Mumbai    | 4          |

---
**Query #41**

    SELECT * FROM Employees WHERE city IN ('Hyderabad','Mumbai');

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |
| 104    | Sneha    | Finance    | 67000  | Hyderabad | 4          |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |
| 109    | Arjun    | Sales      | 61000  | Hyderabad | 5          |
| 110    | Pooja    | IT         | 73000  | Mumbai    | 4          |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |
| 115    | Manoj    | Finance    | 58000  | Mumbai    | 4          |

---
**Query #42**

    SELECT * FROM Employees WHERE department IN ('IT','Finance');

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |
| 103    | Kiran    | IT         | 82000  | Bangalore | 6          |
| 104    | Sneha    | Finance    | 67000  | Hyderabad | 4          |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |
| 107    | Divya    | IT         | 55000  | Chennai   | 3          |
| 110    | Pooja    | IT         | 73000  | Mumbai    | 4          |
| 112    | Nisha    | Finance    | 88000  | Bangalore | 7          |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |
| 115    | Manoj    | Finance    | 58000  | Mumbai    | 4          |

---
**Query #43**

    SELECT * FROM Employees WHERE city NOT IN ('Chennai','Pune');

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |
| 103    | Kiran    | IT         | 82000  | Bangalore | 6          |
| 104    | Sneha    | Finance    | 67000  | Hyderabad | 4          |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |
| 108    | Meena    | Sales      | 48000  | Bangalore | 2          |
| 109    | Arjun    | Sales      | 61000  | Hyderabad | 5          |
| 110    | Pooja    | IT         | 73000  | Mumbai    | 4          |
| 112    | Nisha    | Finance    | 88000  | Bangalore | 7          |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |
| 115    | Manoj    | Finance    | 58000  | Mumbai    | 4          |

---
**Query #44**

    SELECT * FROM Employees WHERE salary IN (45000,75000,91000);

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |
| 102    | Anjali   | HR         | 45000  | Chennai   | 3          |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |

---
**Query #45**

    SELECT * FROM Employees WHERE department NOT IN ('HR','Sales');

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |
| 103    | Kiran    | IT         | 82000  | Bangalore | 6          |
| 104    | Sneha    | Finance    | 67000  | Hyderabad | 4          |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |
| 107    | Divya    | IT         | 55000  | Chennai   | 3          |
| 110    | Pooja    | IT         | 73000  | Mumbai    | 4          |
| 112    | Nisha    | Finance    | 88000  | Bangalore | 7          |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |
| 115    | Manoj    | Finance    | 58000  | Mumbai    | 4          |

---
**Query #46**

    SELECT * FROM Employees WHERE salary BETWEEN 50000 AND 80000;

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |
| 104    | Sneha    | Finance    | 67000  | Hyderabad | 4          |
| 107    | Divya    | IT         | 55000  | Chennai   | 3          |
| 109    | Arjun    | Sales      | 61000  | Hyderabad | 5          |
| 110    | Pooja    | IT         | 73000  | Mumbai    | 4          |
| 111    | Vikas    | HR         | 52000  | Pune      | 3          |
| 115    | Manoj    | Finance    | 58000  | Mumbai    | 4          |

---
**Query #47**

    SELECT * FROM Employees WHERE  experience BETWEEN 3 AND 6;

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |
| 102    | Anjali   | HR         | 45000  | Chennai   | 3          |
| 103    | Kiran    | IT         | 82000  | Bangalore | 6          |
| 104    | Sneha    | Finance    | 67000  | Hyderabad | 4          |
| 107    | Divya    | IT         | 55000  | Chennai   | 3          |
| 109    | Arjun    | Sales      | 61000  | Hyderabad | 5          |
| 110    | Pooja    | IT         | 73000  | Mumbai    | 4          |
| 111    | Vikas    | HR         | 52000  | Pune      | 3          |
| 115    | Manoj    | Finance    | 58000  | Mumbai    | 4          |

---
**Query #48**

    SELECT * FROM Employees WHERE emp_id BETWEEN 40000 AND 60000;

There are no results to be displayed.

---
**Query #49**

    SELECT * FROM Employees WHERE experience BETWEEN 2 AND 4;

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 102    | Anjali   | HR         | 45000  | Chennai   | 3          |
| 104    | Sneha    | Finance    | 67000  | Hyderabad | 4          |
| 105    | Aman     | HR         | 39000  | Pune      | 2          |
| 107    | Divya    | IT         | 55000  | Chennai   | 3          |
| 108    | Meena    | Sales      | 48000  | Bangalore | 2          |
| 110    | Pooja    | IT         | 73000  | Mumbai    | 4          |
| 111    | Vikas    | HR         | 52000  | Pune      | 3          |
| 113    | Tarun    | Sales      | 46000  | Chennai   | 2          |
| 115    | Manoj    | Finance    | 58000  | Mumbai    | 4          |

---
**Query #50**

    SELECT * FROM Employees WHERE emp_name LIKE 'R%';

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |

---
**Query #51**

    SELECT * FROM Employees WHERE emp_name LIKE '%a';

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 104    | Sneha    | Finance    | 67000  | Hyderabad | 4          |
| 107    | Divya    | IT         | 55000  | Chennai   | 3          |
| 108    | Meena    | Sales      | 48000  | Bangalore | 2          |
| 110    | Pooja    | IT         | 73000  | Mumbai    | 4          |
| 112    | Nisha    | Finance    | 88000  | Bangalore | 7          |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |

---
**Query #52**

    SELECT * FROM Employees WHERE emp_name LIKE '%v%';

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |
| 107    | Divya    | IT         | 55000  | Chennai   | 3          |
| 111    | Vikas    | HR         | 52000  | Pune      | 3          |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |

---
**Query #53**

    SELECT * FROM Employees WHERE city LIKE 'B%';

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 103    | Kiran    | IT         | 82000  | Bangalore | 6          |
| 108    | Meena    | Sales      | 48000  | Bangalore | 2          |
| 112    | Nisha    | Finance    | 88000  | Bangalore | 7          |

---
**Query #54**

    SELECT * FROM Employees WHERE department LIKE '%s';

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 108    | Meena    | Sales      | 48000  | Bangalore | 2          |
| 109    | Arjun    | Sales      | 61000  | Hyderabad | 5          |
| 113    | Tarun    | Sales      | 46000  | Chennai   | 2          |

---

[View on DB Fiddle](https://www.db-fiddle.com/f/rHK9F3V2TUyfV2ATrSZRjf/1)
