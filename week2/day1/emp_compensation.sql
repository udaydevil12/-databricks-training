**Schema (MySQL v5.7)**

    
    CREATE TABLE employee_payments (
    
    emp_id INT PRIMARY KEY,
    
    emp_name VARCHAR(50),
    
    department VARCHAR(30),
    
    base_salary DECIMAL(10,2),
    
    bonus DECIMAL(10,2),
    
    joining_date DATE
    
    );
    
    INSERT INTO employee_payments VALUES
    
    (1,'karthik','Data',75000.75,5000.50,'2019-03-15'),
    
    (2,'veena','HR',65000.40,4000.25,'2021-06-20'),
    
    (3,'ravi','Data',85000.90,6000.75,'2016-01-10'),
    
    (4,'anil','Finance',70000.10,NULL,'2020-09-01'),
    
    (5,'suresh','HR',60000.55,3000.30,'2022-11-25');
    

---

**Query #1**

    SELECT UPPER(emp_name)AS upper_case,LOWER(emp_name) AS lower_case, CONCAT(UPPER(LEFT(emp_name,1)),SUBSTRING(emp_name,2)) AS InitCap
    FROM employee_payments;

| upper_case | lower_case | InitCap |
| ---------- | ---------- | ------- |
| KARTHIK    | karthik    | Karthik |
| VEENA      | veena      | Veena   |
| RAVI       | ravi       | Ravi    |
| ANIL       | anil       | Anil    |
| SURESH     | suresh     | Suresh  |

---
**Query #2**

    SELECT emp_name,department,base_salary+IFNULL(bonus,0) AS total_salary
    FROM employee_payments;

| emp_name | department | total_salary |
| -------- | ---------- | ------------ |
| karthik  | Data       | 80001.25     |
| veena    | HR         | 69000.65     |
| ravi     | Data       | 91001.65     |
| anil     | Finance    | 70000.1      |
| suresh   | HR         | 63000.85     |

---
**Query #3**

    SELECT emp_name,department,ROUND(base_salary+IFNULL(bonus,0),0) AS total_salary
    FROM employee_payments;

| emp_name | department | total_salary |
| -------- | ---------- | ------------ |
| karthik  | Data       | 80001        |
| veena    | HR         | 69001        |
| ravi     | Data       | 91002        |
| anil     | Finance    | 70000        |
| suresh   | HR         | 63001        |

---
**Query #4**

    SELECT emp_name,DATE_FORMAT(joining_date,'%Y') AS joining_year FROM employee_payments;

| emp_name | joining_year |
| -------- | ------------ |
| karthik  | 2019         |
| veena    | 2021         |
| ravi     | 2016         |
| anil     | 2020         |
| suresh   | 2022         |

---
**Query #5**

    SELECT emp_name, CASE WHEN (DATE_FORMAT(NOW(),'%Y')-DATE_FORMAT(joining_date,'%Y'))>7 THEN 'Senior' WHEN (DATE_FORMAT(NOW(),'%Y')-DATE_FORMAT(joining_date,'%Y'))  BETWEEN 4 AND 7 THEN 'Mid' ELSE 'Junior'  END AS label FROM employee_payments;

| emp_name | label  |
| -------- | ------ |
| karthik  | Mid    |
| veena    | Mid    |
| ravi     | Senior |
| anil     | Mid    |
| suresh   | Mid    |

---

[View on DB Fiddle](https://www.db-fiddle.com/)
