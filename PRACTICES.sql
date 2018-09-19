/*  >>>>>>>>>>>>>>> PRACTICES <<<<<<<<<<<< */

CREATE TABLE shirts (
shirt_id INT NOT NULL AUTO_INCREMENT,
article VARCHAR(100),
color VARCHAR(100),
shirt_size VARCHAR(1),
last_worn INT,
PRIMARY KEY (shirt_id)
);


INSERT INTO shirts ( article, color, shirt_size, last_worn)
VALUES  ( 't-shirt', 'white' ,'S', 10 ),
		( 't-shirt', 'green' ,'S', 200 ),
		( 'polo shirt', 'black' ,'S', 10 ),
		( 'tank top', 'blue' ,'S', 50 ),
		( 't-shirt', 'pink' ,'S', 0  ),
		( 'polo shirt', 'red' ,'S', 5 ),
		( 'tank top', 'white' ,'S', 200 ),
		( 'tank top', 'blue' ,'S', 15 );
		

INSERT INTO shirts ( article, color, shirt_size, last_worn)
VALUES  ( 'polo shirt', 'purple' ,'M', 50 );



INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('10% Happier', 'Dan', 'Harris', 2014, 29, 256),
('fake_book', 'Freida', 'Harris',2001, 287, 428),
('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);



SELECT DISTINCT
 CONCAT_WS (author_fname, ' ' , author_lname) AS 'Full name of Author' 
 from books;
 
 
 
SELECT CONCAT ('In ', released_year , ' ' , COUNT(*), ' book(s) released') AS Year from books GROUP BY released_year;


SELECT COUNT(*) from books;


select released_year ,count(book_id) AS 'Number of books' from books group by released_year;


SELECT SUM(stock_quantity) from books;


select author_fname, author_lname ,AVG(released_year)
 AS 'Average released year' from books
 group by  author_fname, author_lname;
 
 
select author_fname, author_lname,pages from books ORDER BY pages DESC LIMIT 1 ;

 
 
select * from books 
where author_lname = 'Eggers' || author_lname = 'Chabon';

 
select * from books where pages BETWEEN 100 AND 200 ;
 

select * from books
where author_lname LIKE 'c%' || author_lname LIKE 's%' ;



-- EXPLICIT INNER JOIN   (using JOIN )
SELECT first_name, last_name, email, order_date, SUM(amount) AS 'Total Expenses' FROM customers
JOIN orders 
	ON customers.id = orders.customer_id
GROUP BY customer_id;

-- LEFT JOIN   ( Will take every thing for the customers )
SELECT first_name, last_name, email, order_date, IFNULL(SUM(amount),0) AS Total_spent FROM customers
LEFT JOIN orders 
	ON customers.id = orders.customer_id  WHERE customers.first_name LIKE '%i%'
GROUP BY customers.id ;









-- /////////////////////////////////////////////////////////////////////////////////////

CREATE TABLE students 
	(
		id INT AUTO_INCREMENT PRIMARY KEY,
		first_name VARCHAR(100)
	);


CREATE TABLE papers 
	(
		title  VARCHAR(100),
		grade INT,
		student_id INT,
	    FOREIGN KEY(student_id) 
			REFERENCES students(id)
			ON DELETE CASCADE
	);	

	
-- The Starter Data

INSERT INTO students (first_name) VALUES 
('Caleb'), 
('Samantha'), 
('Raj'), 
('Carlos'), 
('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);



	
-- ///////////////////////////// < and > /////////////////////////////////////////////

SELECT first_name, title, grade FROM students 
INNER JOIN papers
ON students.id = papers.student_id
ORDER BY grade DESC; 


SELECT first_name, IFNULL(title,'MISSING'), IFNULL(grade, 0) FROM students 
LEFT JOIN papers
ON students.id = papers.student_id
GROUP BY id, title; 


SELECT first_name,IFNULL(AVG(grade), '0') AS average,
CASE
	WHEN AVG(grade) > 75 THEN 'PASSING'
	ELSE 'FAILING'
END AS passing_status
FROM students 
LEFT JOIN papers
ON students.id = papers.student_id
GROUP BY students.id 
ORDER BY AVG(grade) DESC; 
/*
result
+------------+---------+----------------+
| first_name | average | passing_status |
+------------+---------+----------------+
| Samantha   | 96.0000 | PASSING        |
| Carlos     | 89.0000 | PASSING        |
| Caleb      | 67.5000 | FAILING        |
| Lisa       | 0       | FAILING        |
| Raj        | 0       | FAILING        |
+------------+---------+----------------+
*/


-- /////////////////////////////
-- //////// MANY TO MANY ///////

SELECT CONCAT( first_name,' ', last_name) AS REVIEWERS , title, genre 
FROM reviewers, series 
	INNER JOIN reviews
		ON reviewers.id = reviews.reviewer_id AND series.id = reviews.series_id;







