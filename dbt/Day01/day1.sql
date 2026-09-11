-- Login through root user 
-- Open Command Prompt
/*
Login to mysql
-u means username
-p means password
*/
cmd > mysql -u root -p
cmd > Enter password : manager

-- password should be without the spaces between -p
cmd > mysql -u root -pmanager

--root is the main user(Admin : having all the rights on all the databases)
--__________________________________________________________________

-- to display all the databases under the current user.

SHOW databases;

-- Create a database named AC_classwork_db
CREATE DATABASE AC_classwork_db;


-- To clear the screen
\! cls 

-- to see the created database
SHOW databases;



-- Create a new user as sunbeam with password as sunbeam
-- username : sunbeam
-- password : sunbeam
-- SYNTAX : CREATE USER username IDENTIFIED BY 'password';

CREATE USER sunbeam IDENTIFIED BY 'sunbeam';

-- To check the user created :
-- Activate the mysql database :
USE mysql;

-- The table user contains the column name as user. 
SELECT user FROM user;
-- SELECT column_name FROM table_name;


-- Select the database
USE AC_classwork_db;


-- root needs to give all the permissions on classwork database 
-- to sunbeam user.
-- syntax : GRANT privileges ON database_name TO user_name;
GRANT ALL PRIVILEGES ON AC_classwork_db.* TO sunbeam;


-- exit from root login and relogin through sunbeam user
EXIT

cmd > mysql -u sunbeam -h ip_address -psunbeam
-h : host

cmd> mysql -u sunbeam -h localhost -psunbeam

-- check the current user and current database.
SELECT USER(),DATABASE();


-- select the database.
USE AC_classwork_db;

-- exit from the current user.
exit;

-- relogin through sunbeam user and select database simultaneously.
cmd > mysql -u sunbeam -psunbeam AC_classwork_db


-- check the current user and current database. 
SELECT USER(),DATABASE();


-- to see the tables in the current database.
SHOW tables;

-- Create a student table
-- roll_no : INT
-- Name : char(20)
-- Marks : double

--syntax : 
CREATE TABLE table_name(col1 datatype,col2 dataype,....);

CREATE TABLE students(roll_no INT,name CHAR(20),marks DOUBLE);

SHOW TABLES;

-- To see the data from the table use SELECT(DQL) command.
--syntax : 

SELECT * FROM students;

-- * means all the columns 


-- to insert the data into the table use INSERT(DML) command
-- syntax : INSERT INTO table_name VALUES(val1,val2,val3);
INSERT INTO students VALUEs(1,'Seeta',90);
INSERT INTO students VALUES(2,'Geeta',95);
INSERT INTO students VALUES(3,'Ram',80);
INSERT INTO students VALUES(4,'Sham',95);


-- to display the data from the students table
SELECT * FROM students;


--________________________________________________________________

-- understanding the installations.
mysqld.exe -- server
mysql.exe -- mysql CLI (command Line Interface) client
mysqlsh -- sysql shell client
mysql workbench -- client

-- Understanding the physical and logical layout of the database :
-- Refer PDF.


-- ________________________Datatypes________________________ 
-- Numeric Types : Refer PDF
    -- int
    -- float

-- DateTime types :


-- String types :
-- Understanding the difference between char varchar and text.
-- Create a table temp with 3 columns
-- col1 CHAR(4), col2 VARCHAR(4),col3 TEXT(4)

CREATE TABLE temp(col1 CHAR(4),col2 VARCHAR(4),col3 TEXT(4));

-- Insert the values into temp table

INSERT INTO temp VALUES('AA','AA','AA');

INSERT INTO temp VALUES('BBB','BBB','BBB');

INSERT INTO temp VALUES('CCCCC','BBB','BBB');
-- ERROR 1406 (22001): Data too long for column 'col1' at row 1

INSERT INTO temp VALUES('CCCC','CCCCC','BBB');
-- ERROR 1406 (22001): Data too long for column 'col2' at row 1

INSERT INTO temp VALUES('CCCC','CCCC','CCCCC');
-- Allowed


-- To display the table structure.
DESCRIBE temp;
--or
DESC temp;


-- ______________________________________________________________