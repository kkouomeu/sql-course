
/* 
*
* ///////////////// Strings functions OF SQL ////////////////////
*
*/
 
 /* FUNCTION CONCAT*/
 
 SELECT author_fname AS first , author_lname AS last ,
 CONCAT (author_fname, ' ' , author_lname) AS 'full name' 
 from books;
 
 /*
 Result :
 +---------+----------------+----------------------+
| first   | last           | full name            |
+---------+----------------+----------------------+
| Jhumpa  | Lahiri         | Jhumpa Lahiri        |
| Neil    | Gaiman         | Neil Gaiman          |
| Neil    | Gaiman         | Neil Gaiman          |
| Jhumpa  | Lahiri         | Jhumpa Lahiri        |
| Dave    | Eggers         | Dave Eggers          |
| Dave    | Eggers         | Dave Eggers          |
| Michael | Chabon         | Michael Chabon       |
| Patti   | Smith          | Patti Smith          |
| Dave    | Eggers         | Dave Eggers          |
| Neil    | Gaiman         | Neil Gaiman          |
| Raymond | Carver         | Raymond Carver       |
| Raymond | Carver         | Raymond Carver       |
| Don     | DeLillo        | Don DeLillo          |
| John    | Steinbeck      | John Steinbeck       |
| David   | Foster Wallace | David Foster Wallace |
| David   | Foster Wallace | David Foster Wallace |
+---------+----------------+----------------------+
*/




 /* FUNCTION CONCAT_WS */
 SELECT 
 CONCAT_WS (' - ' ,title, author_fname, author_lname) AS 'Title and Full name of Author' 
 from books;
 
 /*
  Result :
 +------------------------------------------------------------------------+
| Title and Full name of Author                                          |
+------------------------------------------------------------------------+
| The Namesake - Jhumpa - Lahiri                                         |
| Norse Mythology - Neil - Gaiman                                        |
| American Gods - Neil - Gaiman                                          |
| Interpreter of Maladies - Jhumpa - Lahiri                              |
| A Hologram for the King: A Novel - Dave - Eggers                       |
| The Circle - Dave - Eggers                                             |
| The Amazing Adventures of Kavalier & Clay - Michael - Chabon           |
| Just Kids - Patti - Smith                                              |
| A Heartbreaking Work of Staggering Genius - Dave - Eggers              |
| Coraline - Neil - Gaiman                                               |
| What We Talk About When We Talk About Love: Stories - Raymond - Carver |
| Where I'm Calling From: Selected Stories - Raymond - Carver            |
| White Noise - Don - DeLillo                                            |
| Cannery Row - John - Steinbeck                                         |
| Oblivion: Stories - David - Foster Wallace                             |
| Consider the Lobster - David - Foster Wallace                          |
+------------------------------------------------------------------------+
 */
 
 
 
 
 /* USING DISTINCT (for non redundance ) */
  SELECT DISTINCT author_fname AS 'first name' from books;
  
  
 /* FUNCTION LIMIT */
  Select author_lname from books order by author_lname ASC Limit 3;
  
  /* USING COUNT AND GROUP BY  */
  SELECT title, author_fname, author_lname, COUNT(*) FROM books GROUP BY author_lname, author_fname;
  
  /* 
  Result
+-----------------------------------------------------+--------------+----------------+----------+
| title                                               | author_fname | author_lname   | COUNT(*) |
+-----------------------------------------------------+--------------+----------------+----------+
| What We Talk About When We Talk About Love: Stories | Raymond      | Carver         |        2 |
| The Amazing Adventures of Kavalier & Clay           | Michael      | Chabon         |        1 |
| White Noise                                         | Don          | DeLillo        |        1 |
| A Hologram for the King: A Novel                    | Dave         | Eggers         |        3 |
| Oblivion: Stories                                   | David        | Foster Wallace |        2 |
| Norse Mythology                                     | Neil         | Gaiman         |        3 |
| 10% Happier                                         | Dan          | Harris         |        1 |
| fake_book                                           | Freida       | Harris         |        1 |
| The Namesake                                        | Jhumpa       | Lahiri         |        2 |
| Lincoln In The Bardo                                | George       | Saunders       |        1 |
| Just Kids                                           | Patti        | Smith          |        1 |
| Cannery Row                                         | John         | Steinbeck      |        1 |
+-----------------------------------------------------+--------------+----------------+----------+
  */
  
 
  
  
  /* USING MAX and MIN >> SUBQUERIES  */
  SELECT * FROM books 
  WHERE pages = (
  SELECT MAX(pages) FROM books
  );                                    
  --SUBQUERIES are not recommended for big databases 
  -- >> RECOMMENDED
  SELECT * FROM books ORDER BY pages ASC LIMIT 1;
  
  
  
/* USING MAX and MIN WITH GROUP BY  */
SELECT CONCAT ( author_fname,' ', author_lname) AS Author,
	 MAX(pages) AS 'Longest book'
FROM books 
Group BY author_fname,
	   author_lname;
  /*
  Result
+----------------------+--------------+
| Author               | Longest book |
+----------------------+--------------+
| Dan Harris           |          256 |
| Dave Eggers          |          504 |
| David Foster Wallace |          343 |
| Don DeLillo          |          320 |
| Freida Harris        |          428 |
| George Saunders      |          367 |
| Jhumpa Lahiri        |          291 |
| John Steinbeck       |          181 |
| Michael Chabon       |          634 |
| Neil Gaiman          |          465 |
| Patti Smith          |          304 |
| Raymond Carver       |          526 |
+----------------------+--------------+
  */
  
 
 
 /* USING SUM WITH GROUP BY  */
SELECT CONCAT (author_fname, ' ', author_lname) AS Author,
	 SUM(pages) AS 'All pages written' FROM books 
GROUP BY author_fname, author_lname ORDER BY SUM(pages) ASC;
/*
Result	
+----------------------+-------------------+
| Author               | All pages written |
+----------------------+-------------------+
| John Steinbeck       |               181 |
| Dan Harris           |               256 |
| Patti Smith          |               304 |
| Don DeLillo          |               320 |
| George Saunders      |               367 |
| Freida Harris        |               428 |
| Jhumpa Lahiri        |               489 |
| Michael Chabon       |               634 |
| David Foster Wallace |               672 |
| Raymond Carver       |               702 |
| Neil Gaiman          |               977 |
| Dave Eggers          |              1293 |
+----------------------+-------------------+
  */
  
  
  
 /* USING AVERAGE (avg) WITH GROUP BY  */
SELECT CONCAT (author_fname, ' ', author_lname) AS Author,
	 AVG(pages) AS 'Average page' FROM books 
GROUP BY author_fname, author_lname ORDER BY AVG(pages) ASC;
/* 
Result 
+----------------------+--------------+
| Author               | Average page |
+----------------------+--------------+
| John Steinbeck       |     181.0000 |
| Jhumpa Lahiri        |     244.5000 |
| Dan Harris           |     256.0000 |
| Patti Smith          |     304.0000 |
| Don DeLillo          |     320.0000 |
| Neil Gaiman          |     325.6667 |
| David Foster Wallace |     336.0000 |
| Raymond Carver       |     351.0000 |
| George Saunders      |     367.0000 |
| Freida Harris        |     428.0000 |
| Dave Eggers          |     431.0000 |
| Michael Chabon       |     634.0000 |
+----------------------+--------------+
*/


  
/* USING NOT LIKE */
SELECT * FROM books WHERE released_year NOT LIKE '1%';

  
/* USING Logical AND & GREATER THAN */
SELECT * FROM books 
WHERE author_lname = 'Eggers' 
&& released_year > 2010;
  
  
/* USING Logical OR & GREATER THAN */
SELECT * FROM books 
WHERE author_lname = 'Eggers' 
|| released_year > 2010;
 
 
/* USING BETWEEN */
SELECT title,released_year FROM books 
WHERE released_year BETWEEN 2001 AND 2004;
 
/* USING IN */
SELECT title, author_lname FROM books
WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');
 
/* 
Result
+-----------------------------------------------------+--------------+
| title                                               | author_lname |
+-----------------------------------------------------+--------------+
| The Namesake                                        | Lahiri       |
| Interpreter of Maladies                             | Lahiri       |
| Just Kids                                           | Smith        |
| What We Talk About When We Talk About Love: Stories | Carver       |
| Where I'm Calling From: Selected Stories            | Carver       |
+-----------------------------------------------------+--------------+
*/
 
/* USING IN */
SELECT title, released_year FROM books
WHERE released_year NOT IN 
(2000,2002,2004,2006,2008,2010,2012,2014,2016);
 
 
 /* USING CASE */  
 SELECT title, CONCAT( author_fname,' ', author_lname ) AS Author, released_year,
 CASE 
	 WHEN released_year >= 2000 THEN 'Modern Lit'
	 ELSE '20th Century Lit'
 END AS GENRE
 FROM books;
  
 
SELECT title, stock_quantity,
    CASE 
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        ELSE '***'
    END AS STOCK
FROM books ORDER BY stock_quantity ASC; 

/*
Result 
+-----------------------------------------------------+----------------+-------+
| title                                               | stock_quantity | STOCK |
+-----------------------------------------------------+----------------+-------+
| American Gods                                       |             12 | *     |
| Where I'm Calling From: Selected Stories            |             12 | *     |
| What We Talk About When We Talk About Love: Stories |             23 | *     |
| The Circle                                          |             26 | *     |
| 10% Happier                                         |             29 | *     |
| The Namesake                                        |             32 | *     |
| Norse Mythology                                     |             43 | *     |
| White Noise                                         |             49 | *     |
| Just Kids                                           |             55 | **    |
| The Amazing Adventures of Kavalier & Clay           |             68 | **    |
| Consider the Lobster                                |             92 | **    |
| Cannery Row                                         |             95 | **    |
| Interpreter of Maladies                             |             97 | **    |
| Coraline                                            |            100 | **    |
| A Heartbreaking Work of Staggering Genius           |            104 | ***   |
| A Hologram for the King: A Novel                    |            154 | ***   |
| Oblivion: Stories                                   |            172 | ***   |
| fake_book                                           |            287 | ***   |
| Lincoln In The Bardo                                |           1000 | ***   |
+-----------------------------------------------------+----------------+-------+

*/





/* Medium REQUEST 1 */
SELECT title, author_lname,
	CASE
		WHEN title LIKE '%stories%' THEN 'Short Stories'
		WHEN title LIKE '%Just Kids%' OR title LIKE '%A Heartbreaking Work%' THEN 'Memoir'
		ELSE 'Novel'
	END AS TYPE
FROM books;

/*
Result
+-----------------------------------------------------+----------------+---------------+
| title                                               | author_lname   | TYPE          |
+-----------------------------------------------------+----------------+---------------+
| The Namesake                                        | Lahiri         | Novel         |
| Norse Mythology                                     | Gaiman         | Novel         |
| American Gods                                       | Gaiman         | Novel         |
| Interpreter of Maladies                             | Lahiri         | Novel         |
| A Hologram for the King: A Novel                    | Eggers         | Novel         |
| The Circle                                          | Eggers         | Novel         |
| The Amazing Adventures of Kavalier & Clay           | Chabon         | Novel         |
| Just Kids                                           | Smith          | Memoir        |
| A Heartbreaking Work of Staggering Genius           | Eggers         | Memoir        |
| Coraline                                            | Gaiman         | Novel         |
| What We Talk About When We Talk About Love: Stories | Carver         | Short Stories |
| Where I'm Calling From: Selected Stories            | Carver         | Short Stories |
| White Noise                                         | DeLillo        | Novel         |
| Cannery Row                                         | Steinbeck      | Novel         |
| Oblivion: Stories                                   | Foster Wallace | Short Stories |
| Consider the Lobster                                | Foster Wallace | Novel         |
| 10% Happier                                         | Harris         | Novel         |
| fake_book                                           | Harris         | Novel         |
| Lincoln In The Bardo                                | Saunders       | Novel         |
+-----------------------------------------------------+----------------+---------------+
*/



/* Medium REQUEST 2 */
SELECT title, author_lname, 
 CASE 
		WHEN COUNT(*) > 1 THEN CONCAT(COUNT(*) , ' books') 
		ELSE CONCAT(COUNT(*) , ' book') 
 END AS 'COUNT'
 FROM books
 GROUP BY author_lname, author_fname;

/*
Result
+-----------------------------------------------------+----------------+---------+
| title                                               | author_lname   | COUNT   |
+-----------------------------------------------------+----------------+---------+
| What We Talk About When We Talk About Love: Stories | Carver         | 2 books |
| The Amazing Adventures of Kavalier & Clay           | Chabon         | 1 book  |
| White Noise                                         | DeLillo        | 1 book  |
| A Hologram for the King: A Novel                    | Eggers         | 3 books |
| Oblivion: Stories                                   | Foster Wallace | 2 books |
| Norse Mythology                                     | Gaiman         | 3 books |
| 10% Happier                                         | Harris         | 1 book  |
| fake_book                                           | Harris         | 1 book  |
| The Namesake                                        | Lahiri         | 2 books |
| Lincoln In The Bardo                                | Saunders       | 1 book  |
| Just Kids                                           | Smith          | 1 book  |
| Cannery Row                                         | Steinbeck      | 1 book  |
+-----------------------------------------------------+----------------+---------+
*/




