/* 
*
* ///////////////// ONE TO MANY ////////////////////
*
*/
 
-- Creating the customers and orders tables
CREATE TABLE customers 
	(
		id INT AUTO_INCREMENT PRIMARY KEY,
		first_name VARCHAR(100),
		last_name VARCHAR(100),
		email VARCHAR(100)
	);

	
CREATE TABLE orders 
	(
		id INT AUTO_INCREMENT PRIMARY KEY,
		order_date DATE,
		amount DECIMAL(8,2),
		customer_id INT,
		FOREIGN KEY(customer_id) REFERENCES customers(id)
	);
	

-- Inserting some customers and orders

INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
	   
	   
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);
	

	
	
	
	
	
	

-- ///////////////////////////////////////////////////////////////////////////////////	
	   
-- CROSS JOIN
SELECT * FROM orders, customers;





-- ///////////////////////////////////////////////////////////////////////////////////


-- IMPLICIT INNER JOIN  (using WHERE )
SELECT * FROM customers, orders
WHERE customers.id = orders.customer_id;

/* 
Result
+----+------------+-----------+------------------+----+------------+--------+-------------+
| id | first_name | last_name | email            | id | order_date | amount | customer_id |
+----+------------+-----------+------------------+----+------------+--------+-------------+
|  1 | Boy        | George    | george@gmail.com |  1 | 2016-02-10 |  99.99 |           1 |
|  1 | Boy        | George    | george@gmail.com |  2 | 2017-11-11 |  35.50 |           1 |
|  2 | George     | Michael   | gm@gmail.com     |  3 | 2014-12-12 | 800.67 |           2 |
|  2 | George     | Michael   | gm@gmail.com     |  4 | 2015-01-03 |  12.50 |           2 |
|  5 | Bette      | Davis     | bette@aol.com    |  5 | 1999-04-11 | 450.25 |           5 |
+----+------------+-----------+------------------+----+------------+--------+-------------+
*/


-- EXPLICIT INNER JOIN   (Will take onlything that exist in customers and orders  )
SELECT first_name, last_name, email, order_date, amount FROM customers
JOIN orders 
	ON customers.id = orders.customer_id;

/* 
Result
+------------+-----------+------------------+------------+--------+
| first_name | last_name | email            | order_date | amount |
+------------+-----------+------------------+------------+--------+
| Boy        | George    | george@gmail.com | 2016-02-10 |  99.99 |
| Boy        | George    | george@gmail.com | 2017-11-11 |  35.50 |
| George     | Michael   | gm@gmail.com     | 2014-12-12 | 800.67 |
| George     | Michael   | gm@gmail.com     | 2015-01-03 |  12.50 |
| Bette      | Davis     | bette@aol.com    | 1999-04-11 | 450.25 |
+------------+-----------+------------------+------------+--------+
*/







-- ///////////////////////////////////////////////////////////////////////////////////

-- LEFT JOIN   ( Will take every thing for the customers )
SELECT * FROM customers
LEFT JOIN orders 
	ON customers.id = orders.customer_id;

/* 
Result
+----+------------+-----------+------------------+------+------------+--------+-------------+
| id | first_name | last_name | email            | id   | order_date | amount | customer_id |
+----+------------+-----------+------------------+------+------------+--------+-------------+
|  1 | Boy        | George    | george@gmail.com |    1 | 2016-02-10 |  99.99 |           1 |
|  1 | Boy        | George    | george@gmail.com |    2 | 2017-11-11 |  35.50 |           1 |
|  2 | George     | Michael   | gm@gmail.com     |    3 | 2014-12-12 | 800.67 |           2 |
|  2 | George     | Michael   | gm@gmail.com     |    4 | 2015-01-03 |  12.50 |           2 |
|  5 | Bette      | Davis     | bette@aol.com    |    5 | 1999-04-11 | 450.25 |           5 |
|  3 | David      | Bowie     | david@gmail.com  | NULL | NULL       |   NULL |        NULL |
|  4 | Blue       | Steele    | blue@gmail.com   | NULL | NULL       |   NULL |        NULL |
+----+------------+-----------+------------------+------+------------+--------+-------------+
*/


-- LEFT JOIN   ( Check if LEFT COLUMN HAS A NULL VALUE AND REPLACE IT BY 0)
SELECT first_name, last_name, email, IFNULL(order_date,'0000-00-00'), IFNULL(SUM(amount),0) AS Total_spent FROM customers
LEFT JOIN orders 
	ON customers.id = orders.customer_id
GROUP BY customers.id ;

/* 
Result
+------------+-----------+------------------+---------------------------------+-------------+
| first_name | last_name | email            | IFNULL(order_date,'0000-00-00') | Total_spent |
+------------+-----------+------------------+---------------------------------+-------------+
| Boy        | George    | george@gmail.com | 2016-02-10                      |      135.49 |
| George     | Michael   | gm@gmail.com     | 2014-12-12                      |      813.17 |
| David      | Bowie     | david@gmail.com  | 0000-00-00                      |        0.00 |
| Blue       | Steele    | blue@gmail.com   | 0000-00-00                      |        0.00 |
| Bette      | Davis     | bette@aol.com    | 1999-04-11                      |      450.25 |
+------------+-----------+------------------+---------------------------------+-------------+
*/


-- LEFT JOIN   ( with condition on Jointure)
SELECT first_name, last_name, email, order_date, IFNULL(SUM(amount),0) AS Total_spent FROM customers
LEFT JOIN orders 
	ON customers.id = orders.customer_id  WHERE customers.first_name LIKE '%i%'
GROUP BY customers.id ;

/* 
Result
+------------+-----------+-----------------+------------+-------------+
| first_name | last_name | email           | order_date | Total_spent |
+------------+-----------+-----------------+------------+-------------+
| David      | Bowie     | david@gmail.com | NULL       |        0.00 |
+------------+-----------+-----------------+------------+-------------+
*/







-- ///////////////////////////////////////////////////////////////////////////////////

-- CASCADE DELETE

/* add the line 'ON DELETE CASCADE' */
CREATE TABLE orders 
	(
		id INT AUTO_INCREMENT PRIMARY KEY,
		order_date DATE,
		amount DECIMAL(8,2),
		customer_id INT,
		FOREIGN KEY(customer_id) 
			REFERENCES customers(id)
			ON DELETE CASCADE
	);

/* Then delete one customer will delete his order */
DELETE FROM customers WHERE id = 1;



















