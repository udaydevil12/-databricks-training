**Schema (MySQL v5.7)**

    CREATE TABLE customer_spending (
    
    cust_id INT,
    
    cust_name VARCHAR(50),
    
    city VARCHAR(30),
    
    purchase_amount DECIMAL(10,2),
    
    purchase_date DATE
    
    );
    
    
    INSERT INTO customer_spending VALUES
    
    (1,'amit','mumbai',12000.75,'2024-12-01'),
    
    (2,'neha','delhi',8500.40,'2024-12-15'),
    
    (3,'rohit','mumbai',15500.90,'2024-11-20'),
    
    (4,'kavya','chennai',6000.10,'2024-10-05');
    

---

**Query #1**

    SELECT * FROM customer_spending;

| cust_id | cust_name | city    | purchase_amount | purchase_date |
| ------- | --------- | ------- | --------------- | ------------- |
| 1       | amit      | mumbai  | 12000.75        | 2024-12-01    |
| 2       | neha      | delhi   | 8500.4          | 2024-12-15    |
| 3       | rohit     | mumbai  | 15500.9         | 2024-11-20    |
| 4       | kavya     | chennai | 6000.1          | 2024-10-05    |

---
**Query #2**

    SELECT CONCAT(UPPER(LEFT(cust_name,1)),SUBSTRING(cust_name,2)) AS customer_name FROM customer_spending;

| customer_name |
| ------------- |
| Amit          |
| Neha          |
| Rohit         |
| Kavya         |

---
**Query #3**

    SELECT cust_id,DATE_FORMAT(purchase_date,'%M') AS month_purchased FROM customer_spending;

| cust_id | month_purchased |
| ------- | --------------- |
| 1       | December        |
| 2       | December        |
| 3       | November        |
| 4       | October         |

---
**Query #4**

    SELECT cust_id,ROUND(purchase_amount,0) FROM customer_spending;

| cust_id | ROUND(purchase_amount,0) |
| ------- | ------------------------ |
| 1       | 12001                    |
| 2       | 8500                     |
| 3       | 15501                    |
| 4       | 6000                     |

---
**Query #5**

    SELECT cust_id, CASE WHEN purchase_amount <0 THEN 'Anamoly detected - fixed' ELSE 'normal' END  AS status_flag,ABS(purchase_amount)  FROM customer_spending;

| cust_id | status_flag | ABS(purchase_amount) |
| ------- | ----------- | -------------------- |
| 1       | normal      | 12000.75             |
| 2       | normal      | 8500.4               |
| 3       | normal      | 15500.9              |
| 4       | normal      | 6000.1               |

---
**Query #6**

    SELECT cust_id,CASE WHEN purchase_amount>15000 THEN 'High Spender' WHEN  purchase_amount BETWEEN 8000 AND 15000 THEN 'Medium' ELSE 'Low' END AS customer_spending_rate FROM customer_spending;

| cust_id | customer_spending_rate |
| ------- | ---------------------- |
| 1       | Medium                 |
| 2       | Medium                 |
| 3       | High Spender           |
| 4       | Low                    |

---

[View on DB Fiddle](https://www.db-fiddle.com/)
