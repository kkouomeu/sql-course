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






