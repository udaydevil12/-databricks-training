**Schema (MySQL v5.7)**

    
    CREATE TABLE instructors (
        instructor_id INT PRIMARY KEY,
        instructor_name VARCHAR(100),
        department VARCHAR(100)
    );
    
    CREATE TABLE students (
        student_id INT PRIMARY KEY,
        student_name VARCHAR(100),
        email VARCHAR(100)
    );
    
    CREATE TABLE courses (
        course_id INT PRIMARY KEY,
        course_name VARCHAR(100),
        instructor_id INT NULL,
        FOREIGN KEY (instructor_id) REFERENCES instructors(instructor_id)
    );
    
    CREATE TABLE enrollments (
        enrollment_id INT PRIMARY KEY,
        student_id INT,
        course_id INT,
        enrollment_date DATE,
        FOREIGN KEY (student_id) REFERENCES students(student_id),
        FOREIGN KEY (course_id) REFERENCES courses(course_id)
    );
    
    -- Insert instructors
    INSERT INTO instructors VALUES
    (1, 'Sarah Connor', 'Databases'),
    (2, 'Michael Scott', 'Programming'),
    (3, 'Tony Stark', 'Cloud Computing'),
    (4, 'Bruce Wayne', 'Cyber Security');
    
    -- Insert students
    INSERT INTO students VALUES
    (1, 'Alice Johnson', 'alice@email.com'),
    (2, 'Bob Smith', 'bob@email.com'),
    (3, 'Charlie Brown', 'charlie@email.com'),
    (4, 'Diana Prince', 'diana@email.com'),
    (5, 'Ethan Hunt', 'ethan@email.com'),
    (6, 'Fiona Green', 'fiona@email.com');
    
    -- Insert courses
    INSERT INTO courses VALUES
    (101, 'SQL Basics', 1),
    (102, 'Python Fundamentals', 2),
    (103, 'Data Analytics', NULL),
    (104, 'Cloud Computing', 3),
    (105, 'Machine Learning', NULL),
    (106, 'Cyber Security', 4);
    
    -- Insert enrollments
    INSERT INTO enrollments VALUES
    (1, 1, 101, '2024-01-10'),
    (2, 1, 102, '2024-01-12'),
    (3, 2, 101, '2024-01-15'),
    (4, 3, 104, '2024-01-20'),
    (5, 4, 106, '2024-01-25');
    

---

**Query #1**

    SELECT * FROM enrollments;

| enrollment_id | student_id | course_id | enrollment_date |
| ------------- | ---------- | --------- | --------------- |
| 1             | 1          | 101       | 2024-01-10      |
| 2             | 1          | 102       | 2024-01-12      |
| 3             | 2          | 101       | 2024-01-15      |
| 4             | 3          | 104       | 2024-01-20      |
| 5             | 4          | 106       | 2024-01-25      |

---
**Query #2**

    SELECT * FROM courses;

| course_id | course_name         | instructor_id |
| --------- | ------------------- | ------------- |
| 101       | SQL Basics          | 1             |
| 102       | Python Fundamentals | 2             |
| 103       | Data Analytics      |               |
| 104       | Cloud Computing     | 3             |
| 105       | Machine Learning    |               |
| 106       | Cyber Security      | 4             |

---
**Query #3**

    SELECT * FROM instructors;

| instructor_id | instructor_name | department      |
| ------------- | --------------- | --------------- |
| 1             | Sarah Connor    | Databases       |
| 2             | Michael Scott   | Programming     |
| 3             | Tony Stark      | Cloud Computing |
| 4             | Bruce Wayne     | Cyber Security  |

---
**Query #4**

    SELECT s.student_name,c.course_name FROM students s LEFT JOIN enrollments e ON s.student_id=e.student_id LEFT JOIN  courses c ON e.course_id = c.course_id;

| student_name  | course_name         |
| ------------- | ------------------- |
| Alice Johnson | SQL Basics          |
| Alice Johnson | Python Fundamentals |
| Bob Smith     | SQL Basics          |
| Charlie Brown | Cloud Computing     |
| Diana Prince  | Cyber Security      |
| Ethan Hunt    |                     |
| Fiona Green   |                     |

---
**Query #5**

    SELECT 
        c.course_name AS courses_with_no_students
    FROM courses c
    LEFT JOIN enrollments e
        ON c.course_id = e.course_id
    WHERE e.student_id IS NULL;

| courses_with_no_students |
| ------------------------ |
| Data Analytics           |
| Machine Learning         |

---
**Query #6**

    SELECT i.instructor_name,c.course_name FROM instructors i LEFT JOIN courses c ON i.instructor_id = c.instructor_id;

| instructor_name | course_name         |
| --------------- | ------------------- |
| Sarah Connor    | SQL Basics          |
| Michael Scott   | Python Fundamentals |
| Tony Stark      | Cloud Computing     |
| Bruce Wayne     | Cyber Security      |

---
**Query #7**

    SELECT c.course_name AS no_instuctor_for FROM instructors i RIGHT JOIN courses c ON i.instructor_id = c.instructor_id WHERE i.instructor_id IS NULL;

| no_instuctor_for |
| ---------------- |
| Data Analytics   |
| Machine Learning |

---
**Query #8**

    SELECT s.student_name,e.enrollment_date FROM enrollments e RIGHT JOIN students s ON s.student_id=e.student_id;

| student_name  | enrollment_date |
| ------------- | --------------- |
| Alice Johnson | 2024-01-10      |
| Alice Johnson | 2024-01-12      |
| Bob Smith     | 2024-01-15      |
| Charlie Brown | 2024-01-20      |
| Diana Prince  | 2024-01-25      |
| Ethan Hunt    |                 |
| Fiona Green   |                 |

---
**Query #9**

    SELECT s.student_name AS students_not_enrolled  FROM enrollments e RIGHT JOIN students s ON s.student_id=e.student_id WHERE e.course_id IS NULL;

| students_not_enrolled |
| --------------------- |
| Ethan Hunt            |
| Fiona Green           |

---
**Query #10**

    SELECT *
    FROM students s
    LEFT JOIN enrollments e
    ON s.student_id = e.student_id
    UNION
    SELECT *
    FROM students s
    RIGHT JOIN enrollments e
    ON s.student_id = e.student_id;

| student_id | student_name  | email             | enrollment_id | student_id | course_id | enrollment_date |
| ---------- | ------------- | ----------------- | ------------- | ---------- | --------- | --------------- |
| 1          | Alice Johnson | alice@email.com   | 1             | 1          | 101       | 2024-01-10      |
| 1          | Alice Johnson | alice@email.com   | 2             | 1          | 102       | 2024-01-12      |
| 2          | Bob Smith     | bob@email.com     | 3             | 2          | 101       | 2024-01-15      |
| 3          | Charlie Brown | charlie@email.com | 4             | 3          | 104       | 2024-01-20      |
| 4          | Diana Prince  | diana@email.com   | 5             | 4          | 106       | 2024-01-25      |
| 5          | Ethan Hunt    | ethan@email.com   |               |            |           |                 |
| 6          | Fiona Green   | fiona@email.com   |               |            |           |                 |

---
**Query #11**

    SELECT c.course_name AS not_displayed_in_enrollments FROM enrollments e RIGHT JOIN courses c ON e.course_id = c.course_id  WHERE e.enrollment_id IS NULL;

| not_displayed_in_enrollments |
| ---------------------------- |
| Data Analytics               |
| Machine Learning             |

---
**Query #12**

    SELECT *
    FROM courses c
    LEFT JOIN instructors i
    ON c.instructor_id = i.instructor_id
    UNION
    SELECT *
    FROM courses c
    RIGHT JOIN instructors i
    ON c.instructor_id = i.instructor_id;

| course_id | course_name         | instructor_id | instructor_id | instructor_name | department      |
| --------- | ------------------- | ------------- | ------------- | --------------- | --------------- |
| 101       | SQL Basics          | 1             | 1             | Sarah Connor    | Databases       |
| 102       | Python Fundamentals | 2             | 2             | Michael Scott   | Programming     |
| 104       | Cloud Computing     | 3             | 3             | Tony Stark      | Cloud Computing |
| 106       | Cyber Security      | 4             | 4             | Bruce Wayne     | Cyber Security  |
| 103       | Data Analytics      |               |               |                 |                 |
| 105       | Machine Learning    |               |               |                 |                 |

---
**Query #13**

    SELECT s.student_name,c.course_name ,i.instructor_name FROM 
    enrollments e JOIN  students s ON e.student_id=s.student_id
    JOIN courses c ON c.course_id= e.course_id  JOIN
    instructors i ON  i.instructor_id = c.instructor_id;

| student_name  | course_name         | instructor_name |
| ------------- | ------------------- | --------------- |
| Alice Johnson | SQL Basics          | Sarah Connor    |
| Bob Smith     | SQL Basics          | Sarah Connor    |
| Alice Johnson | Python Fundamentals | Michael Scott   |
| Charlie Brown | Cloud Computing     | Tony Stark      |
| Diana Prince  | Cyber Security      | Bruce Wayne     |

---
**Query #14**

    SELECT s.student_name,c.course_name FROM  students s CROSS JOIN  courses c  ;

| student_name  | course_name         |
| ------------- | ------------------- |
| Alice Johnson | SQL Basics          |
| Bob Smith     | SQL Basics          |
| Charlie Brown | SQL Basics          |
| Diana Prince  | SQL Basics          |
| Ethan Hunt    | SQL Basics          |
| Fiona Green   | SQL Basics          |
| Alice Johnson | Python Fundamentals |
| Bob Smith     | Python Fundamentals |
| Charlie Brown | Python Fundamentals |
| Diana Prince  | Python Fundamentals |
| Ethan Hunt    | Python Fundamentals |
| Fiona Green   | Python Fundamentals |
| Alice Johnson | Data Analytics      |
| Bob Smith     | Data Analytics      |
| Charlie Brown | Data Analytics      |
| Diana Prince  | Data Analytics      |
| Ethan Hunt    | Data Analytics      |
| Fiona Green   | Data Analytics      |
| Alice Johnson | Cloud Computing     |
| Bob Smith     | Cloud Computing     |
| Charlie Brown | Cloud Computing     |
| Diana Prince  | Cloud Computing     |
| Ethan Hunt    | Cloud Computing     |
| Fiona Green   | Cloud Computing     |
| Alice Johnson | Machine Learning    |
| Bob Smith     | Machine Learning    |
| Charlie Brown | Machine Learning    |
| Diana Prince  | Machine Learning    |
| Ethan Hunt    | Machine Learning    |
| Fiona Green   | Machine Learning    |
| Alice Johnson | Cyber Security      |
| Bob Smith     | Cyber Security      |
| Charlie Brown | Cyber Security      |
| Diana Prince  | Cyber Security      |
| Ethan Hunt    | Cyber Security      |
| Fiona Green   | Cyber Security      |

---

[View on DB Fiddle](https://www.db-fiddle.com/)
