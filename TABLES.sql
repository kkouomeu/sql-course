/* BASICS
*
* ///////////////// HERE ARE MY BASICS TABLES COMMANDS /////////////////
*
*/


/* Show tables in database */
SHOW TABLES;


/* basic table creation */
CREATE TABLE <table_name> (column1 type(maxlength), column2 type);
/* >> EXEMPLE
* CREATE TABLE cats (name VARCHAR(100), age INT);
*/


/* table creation with NOT NULL VALUE */
CREATE TABLE <table_name>
 (column1 type(maxlength) NOT NULL,
  column2 type);

  
/* table creation with Default VALUE */
CREATE TABLE <table_name>
 (column1 type(maxlength) DEFAULT 'String',
  column2 type Default int);

  
/* table creation with PRIMARY KEY */
CREATE TABLE <table_name>
 (columnId INT NOT NULL,
  column1 type(maxlength) DEFAULT 'String',
  column2 type Default int
  PRIMARY KEY (columnId));
  
  
/* table creation with PRIMARY KEY */
CREATE TABLE <table_name>
 (columnId INT NOT NULL AUTO_INCREMENT ,
  column1 type(maxlength) DEFAULT 'String',
  column2 type Default int
  PRIMARY KEY (columnId));
  

/* Show table structure */  
SHOW COLUMNS FROM <table_name>;
DESC <table_name>;


/* Drop tables in database */ 
DROP TABLE <table_name>;
