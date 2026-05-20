**Schema (MySQL v5.7)**

    CREATE TABLE orders_delivery (
    
    order_id INT,
    
    customer_name VARCHAR(50),
    
    order_date DATE,
    
    delivery_date DATE,
    
    order_amount DECIMAL(10,2)
    
    );
    INSERT INTO orders_delivery VALUES
    
    (101,'rajesh','2025-01-01','2025-01-05',12500.75),
    
    (102,'meena','2025-01-10','2025-01-10',8400.40),
    
    (103,'arun','2025-01-15','2025-01-20',15600.90),
    
    (104,'pooja','2025-01-18',NULL,9200.10);
    

---

**Query #1**

    SELECT * FROM orders_delivery;

| order_id | customer_name | order_date | delivery_date | order_amount |
| -------- | ------------- | ---------- | ------------- | ------------ |
| 101      | rajesh        | 2025-01-01 | 2025-01-05    | 12500.75     |
| 102      | meena         | 2025-01-10 | 2025-01-10    | 8400.4       |
| 103      | arun          | 2025-01-15 | 2025-01-20    | 15600.9      |
| 104      | pooja         | 2025-01-18 |               | 9200.1       |

---
**Query #2**

    SELECT UPPER(customer_name) FROM orders_delivery;

| UPPER(customer_name) |
| -------------------- |
| RAJESH               |
| MEENA                |
| ARUN                 |
| POOJA                |

---
**Query #3**

    SELECT order_id, CASE WHEN delivery_date IS NULL THEN 'In progress' ELSE ABS(DATEDIFF(order_date,delivery_date)) END AS 
    shipped_in_days FROM orders_delivery;

| order_id | shipped_in_days |
| -------- | --------------- |
| 101      | 4               |
| 102      | 0               |
| 103      | 5               |
| 104      | In progress     |

---
**Query #4**

    UPDATE orders_delivery
    SET delivery_date = order_date
    WHERE delivery_date IS NULL;

There are no results to be displayed.

---
**Query #5**

    UPDATE orders_delivery SET order_amount = ROUND(order_amount,1) ;

There are no results to be displayed.

---
**Query #6**

    SELECT * FROM orders_delivery;

| order_id | customer_name | order_date | delivery_date | order_amount |
| -------- | ------------- | ---------- | ------------- | ------------ |
| 101      | rajesh        | 2025-01-01 | 2025-01-05    | 12500.8      |
| 102      | meena         | 2025-01-10 | 2025-01-10    | 8400.4       |
| 103      | arun          | 2025-01-15 | 2025-01-20    | 15600.9      |
| 104      | pooja         | 2025-01-18 | 2025-01-18    | 9200.1       |

---
**Query #7**

    SELECT order_id, CASE WHEN DATEDIFF(delivery_date,order_date) = 0 THEN 'same day' WHEN DATEDIFF(delivery_date,order_date) > 3 THEN 'Delayed' ELSE 'Pending' END AS delivery_label FROM orders_delivery;

| order_id | delivery_label |
| -------- | -------------- |
| 101      | Delayed        |
| 102      | same day       |
| 103      | Delayed        |
| 104      | same day       |

---

[View on DB Fiddle](https://www.db-fiddle.com/)
