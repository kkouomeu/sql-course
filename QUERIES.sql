
/* 
*
* ///////////////// MORE EXEMPLES OF SQL QUERY ////////////////////
*
*/


/* create an employee table*/
CREATE TABLE employees (
id INT NOT NULL AUTO_INCREMENT,
last_name VARCHAR(50) NOT NULL,
first_name VARCHAR(50) NOT NULL,
middle_name VARCHAR(50),
age INT NOT NULL,
current_status VARCHAR(50) NOT NULL DEFAULT 'employed',
PRIMARY KEY (id)
);

/* Insert into employee table*/
INSERT INTO employees ( first_name, last_name, middle_name, age)
VALUES ( 'Marc', 'BARRY' , 'La gachette', 22 );


/* create cats table*/
CREATE TABLE cats (
cat_id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(100),
breed VARCHAR(100),
age INT,
PRIMARY KEY (cat_id)
)

/* Insert into cats table*/
INSERT INTO cats ( name, breed, age)
VALUES  ( 'Ringo', 'Tabby' , 4 ),
		( 'Vigo', 'Bred' , 14 ),
		( 'Bob', 'Garps' , 5 ),
		( 'MAthos', 'Phied' , 12 ),
		( 'Misty', 'Ragbol' , 7 ),
		( 'Mingo', 'Tabby' , 3 ),
		( 'Balthazar', 'Tabby' , 1 ),
		( 'Minos', 'Rubgy' , 9 );
	
	

/* Select from cats table*/		
SELECT * FROM cats
WHERE name = 'misty';


/* Select with ALIASES*/		
SELECT cat_id AS id, name FROM cats;


/* Update data in table */
UPDATE cats 
SET breed = 'Shorthair' 
WHERE breed = 'Tabby';


/* Delete data in table */
DELETE FROM cats
WHERE name = 'Minos';


/* Delete all datas in table */
DELETE FROM cats ;