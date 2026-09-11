/*
AGENDA :
    Exception handling
    Cursors
    NoSQL
    DCL 
   
*/
--_________________________________________________________
/*
* Exception Handling -- Take action upon error.
* When error occurs, handler will be executed (if implemented).

Handler syntax
    DECLARE action HANDLER FOR condition handler_implementation;
    DECLARE EXIT HANDLER FOR 1062 SELECT "Duplicate Entry" As msg;

    -- action = EXIT or CONTINUE
    -- condition = Error code or Error alias
        -- https://dev.mysql.com/doc/mysql-errors/8.0/en/server-error-reference.html
    -- handler_implementation = Single liner or BEGIN ... END



* Exception handler types/actions to be taken :
    - EXIT handler: after execution of handler, the program stops. Next line not executed.
    - CONTINUE handler: after execution of handler, the next line after the error is executed.

* condition :
    - Error_code :(4 digit number)
    - Error_status :(may be alpha numeric)
    - Error_alias : (readable name - userdefined)

* Handler_implementation :
    Two ways to implement exception handler
    - Single Liner
    - Multi Liner PSM block --> BEGIN ... END


Types of errors :
- 1062 : Duplicate value entered : (primary key violeted)
- 1146 : Table does not exists.
- 1054 : column does not exists
- 1044 : Access denied
- 1452 : Foreign key violation : 


*/

/*
    Example 2: CONTINUE handler
   Write a procedure to add a dept into dept table.
   if error occurs use continue handler to show appropriate msg.
*/

PSM01.sql


--_______________________________________________________________
/* Example 3 : Change the above procedure with Error alias and multi line implimentation.
*/

PSM02.sql


--_________________________________________________________
-- Example 4: Generic Exception Handler
-- SQLEXCEPTION  
-- Insert into the dept table.

PSM03.sql

--_______________________________________________________________
/* How to throw exception?
 
    SIGNAL SQLSTATE '45000';
   
    - SIGNAL keyword is similar to C++ "throw" keyword. It raise the error.
    - Must throw some SQL state e.g. '45000' is user defined error state commonly used.
    
 Syntax :   
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'User-defined Error Message'; -- custom error message
 
*/
/*
 Example : Write a procedure to accept age as a parameter and check if age is less than 15 then throw an error else show a msg.
*/

PSM04.sql
--_______________________________________________________
-- cursors :
/*
* Cursor is an object used to process the results of SELECT query row by row.
* Your SELECT query can have WHERE ,joins,sub-queries,group-by,having,limit etc.
* Cursor can be used in MySQL programs (SP, Fn, or Triggers).
*/


/*
* Cursor steps
    * step 1: declare cursor variable with SELECT query.
        > DECLARE v_cur CURSOR FOR SELECT empno,ename,sal FROM emp;

    * step 2: declare end-of-cursor error handler -- NOT FOUND error.
        > DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_flag = 1;

    * step 3: open the cursor
        > OPEN v_cur;

    * step 4: fetch current row into the variables.
        > FETCH v_cur INTO var1, var2, ...;

    * step 5: if end of cursor (NOT FOUND error -> v_err set to 1), leave the loop; otherwise process the current row.
        - Repeat steps 4 & 5 for all the rows -- in LOOP.

    * step 6: close the cursor
        - CLOSE v_cur;

The steps remain the same. Only the SELECT query changes.
--__________________________________________________
*/

/* Example 1: Read deptno and dname from dept and insert deptno, dname in lower case into results table -- using cursor.
*/
    
PSM05.sql

--_________________________________________________________________
-- Example 2: Fetch rows of t1 & t2 and write the added values into results table.
  --  SELECT * FROM t1; --A, B, C ,D
   -- SELECT * FROM t2; -- B, X, Y , Z
   

PSM06.sql

--________________________________________________________
/* 
MySQL Cursor characteristics:
- Read-only :
    can only read values using cursor (cannnot UPDATE/DELETE them back in table).
    - SET v_cur = new_value; NOT allowed.

-  Forward-only:
    Each FETCH will get the next row (cannot traverse in reverse direction).
    After the current row is fetched, the cursor AUTOMATICALLY moves to the next row.
    To revisit the previous rows, we can close the cursor and reopen it to get the rows from the beginning.

- Asensitive(sensitive):
     Internally the cursor stores the address of each row. 
    while processing the cursor row by row, if any record is updated externally (by some other client), then the modified record (changes) will be visible with cursor. 
    It does not store the copy of the record.

* Cursor applications:
    - Process the rows one by one.

* How cursor works internally?
    - When cursor is "OPEN"ed, by default it is at 0th position (at beginning - no row fetched yet).
    - On first "FETCH" operation, first row of the SELECT query is fetched into the given variables and internally position is set to the next row.
    - On next "FETCH" the next row will be fetched into the variables and again position is set to the next row.
    - When cursor is "CLOSE"d, cannot use cursor further.
*/
--_______________________________________________
/*
### MongoDb
* Mongo is NoSQL database (not a RDBMS i.e. not using SQL language).
* Mongo concepts can be mapped to RDBMS:
    - Database  ->  Database
    - Table     ->  Collection
    - Row       ->  Document
    - Columns   ->  Fields
    - Primary key -> _id field
* Mongo docs are stored in Binary JSON format (BSON).
* Mongo records are JSON data:
   
* MongoDb have flexible schema (unlike RDBMS).

#### Mongo Installation
* Download Mongo Community edition from official website and install.
* It installs
    * Mongo server -- mongod.exe (listens port 27017) -- runs in background (no ui).
    * Mongo clients
        -- Mongo Compass -- gui client (installed by default in modern mongo).
        -- Mongo Shell -- cli client (need to install separately in modern mongo).
            - Follows JS syntax.
*/
-- Mongo Commands
* cmd> mongosh


-- check databases :
show databases

-- create database : classwork
use ac_classwork_db

-- check the current database :
db

-- check the tables
show collections

-- create table and insert data syntax :
-- db.colname.insertOne({new json doc})
-- db.colname.insertMany([ {new json doc1}, {new json doc2}, ... ])

db.person.insertOne(
    {
        emp_name : "Ram",
        Age : 25,
        city : "Pune",
        sal : 25000
    }
)

db.person.insertOne(
    {
        name : "Sham",
        address :
        {
            area : "Wakad",
            city : "Pune",
            Pincode : 411057
        },
        Hobbies : ["Singing","Sleeping"]
    }
)


db.person.insertMany([
    {
        name : "Seeta",
        age : 20,
        sal : 2000,
        deptno : 10
    },
    {
        name : "Geeta",
        city : "Pune",
        age : 25,
        hobbies : ["Dancing","Singing"]
    },
    {
        name : "Reeta",
        email : "Reeta@gmail.com",
        company_name : "Infosys"
    }
])

-- check the collection created :
show collections

-- check the database :
show databases


-- check the data inserted into person collection :
db.person.find()


-- Use the below collections  emp and dept :
/*
db.dept.insertMany([
    {_id:10,dname:"ACCOUNTING",loc:"NEW YORK"},
    {_id:20,dname:"RESEARCH",loc:"DALLAS"},
    {_id:30,dname:"SALES",loc:"CHICAGO"},
    {_id:40,dname:"OPERATIONS",loc:"BOSTON"}
]);

db.emp.insertOne({_id:7369,ename:"SMITH",job:"CLERK",mgr:7902,sal:800.00,deptno:20});
db.emp.insertOne({_id:7499,ename:"ALLEN",job:"SALESMAN",mgr:7698,sal:1600.00,comm:300.00,deptno:30});
db.emp.insertOne({_id:7521,ename:"WARD",job:"SALESMAN",mgr:7698,sal:1250.00,comm:500.00,deptno:30});
db.emp.insertOne({_id:7566,ename:"JONES",job:"MANAGER",mgr:7839,sal:2975.00,deptno:20});
db.emp.insertOne({_id:7654,ename:"MARTIN",job:"SALESMAN",mgr:7698,sal:1250.00,comm:1400.00,deptno:30});
db.emp.insertOne({_id:7698,ename:"BLAKE",job:"MANAGER",mgr:7839,sal:2850.00,deptno:30});
db.emp.insertOne({_id:7782,ename:"CLARK",job:"MANAGER",mgr:7839,sal:2450.00,deptno:10});
db.emp.insertOne({_id:7788,ename:"SCOTT",job:"ANALYST",mgr:7566,sal:3000.00,deptno:20});
db.emp.insertOne({_id:7839,ename:"KING",job:"PRESIDENT",sal:5000.00,deptno:10});
db.emp.insertOne({_id:7844,ename:"TURNER",job:"SALESMAN",mgr:7698,sal:1500.00,comm:0.00,deptno:30});
db.emp.insertOne({_id:7876,ename:"ADAMS",job:"CLERK",mgr:7788,sal:1100.00,deptno:20});
db.emp.insertOne({_id:7900,ename:"JAMES",job:"CLERK",mgr:7698,sal:950.00,deptno:30});
db.emp.insertOne({_id:7902,ename:"FORD",job:"ANALYST",mgr:7566,sal:3000.00,deptno:20});
db.emp.insertOne({_id:7934,ename:"MILLER",job:"CLERK",mgr:7782,sal:1300.00,deptno:10});

*/


/*
 _id is unique identity of each document (record).
    - If _id not given in insert operation, a new id is auto-generated by mongo client.
    - This auto-generated id is of 12 bytes and guranteed to be unique.
    - If _id given in insert operation, it will be used to uniquely identify the document. Duplicate _id is not allowed - will cause error.

*/

-- To display the output from the collection :
-- db.colname.find()
db.person.find()
-- displays all the documents from the person collection.

-- db.colname.find(criteria, projection) 
-- db.colname.findOne(criteria, projection)

/*
 Mongo cursor functions
    - sort() - returns cursor : -1 is for Desc and 1 is for Asc
    - limit() - returns cursor
    - skip() - returns cursor
    - pretty() - default nowadays (void)
    - count() - returns integer

    db.emp.find().count()
*/



-- sort emps by sal in desc order
--  SELECT * FROM emp ORDER BY sal DESC
db.emp.find().sort({sal : -1})

-- sort emps by deptno and job in asc order
-- SELECT * FROM emp ORDER BY deptno ASC, job ASC
db.emp.find().sort({deptno : 1, job : 1})


-- find emp with highest sal
-- SELECT * FROM emp ORDER BY sal DESC LIMIT 1
db.emp.find().sort({sal : -1}).limit(1)


-- find emp with third lowest sal
-- SELECT * FROM emp ORDER BY sal ASC LIMIT 2, 1
db.emp.find().sort({sal : 1}).skip(2).limit(1)


-- db.colname.find( {criteria}, { projection })
    -- projection: colname: 1/0, colname: true/false
    -- when no criteria { empty }: all records fetched




-- Display _id,ename and sal from emp: use inclusion projection
db.emp.find({},{_id : 1,ename : 1,sal : 1})


-- Do not display _id,job,comm,hire : use exclusion projection
db.emp.find({},{_id : 0, job:0, comm : 0, hire : 0})


-- Use combination of inclusion and exclusion : Not allowed
db.emp.find({},{_id:1,job : 0,sal : 1,comm : 0})
/*
MongoServerError[Location31253]: Cannot do inclusion on field sal in exclusion projection
*/


-- Just print ename and job :
db.emp.find({},{ename : 1,job : 1})
-- by default _id is displayed as the part of inclusions if not mentioned.

-- exclude _id :
db.emp.find({},{ename : 1,job : 1, _id : 0})
/*
inclusions and exclusions are not allowed, but for _id it is allowed.
*/

--______________________________________________________________
/*
 db.colname.find({criteria})
    - condition can be given
        - using comparison operators: $eq (default), $ne, $gt, $lt, $gte, $lte
        - using logical operators: $and, $or, $nor
        - using misc operators: $in, $nin, $exist, ...
*/


-- SELECT * FROM emp WHERE ename='KING';
db.emp.find({ename : 'KING'})

db.emp.find({ename : /king/i})
-- check for case insensitive

-- SELECT * FROM emp WHERE deptno=10;
db.emp.find({deptno : 10})
-- OR
db.emp.find({deptno : {$eq : 10}})

-- SELECT * FROM emp WHERE sal > 2500;
db.emp.find({sal : {$gt : 2500}})
db.emp.find({sal : {$gt : 2500}}).count()

-- SELECT * FROM emp WHERE deptno != 30;
db.emp.find({deptno : {$ne : 30}})


-- SELECT * FROM emp WHERE job IN ('ANALYST', 'PRESIDENT', 'MANAGER');
db.emp.find({
    job : {
        $in : ['ANALYST', 'PRESIDENT', 'MANAGER']
    }
})


-- SELECT * FROM emp WHERE deptno = 20 AND job = 'MANAGER';


db.emp.find({
    $and : [
        {deptno : 20}, {job : 'MANAGER'}
    ]
})

-- SELECT * FROM emp WHERE deptno = 10 OR job = 'ANALYST';
db.emp.find(
    {
        $or : [
            {deptno : 10},
            {job : 'ANALYST' }
        ]
    }
)




-- SELECT * FROM emp WHERE ename = 'king';

-- to search with patterns use regex syntax /pattern/
db.emp.find({
    ename : /king/i
})


/* 
regex option "i" makes search case in-sensitive
 create regex patterns using wild-card chars
  ^ -- match at the start
  $ -- match at the end
  [a-z] -- match any char in range a-z
  {}, ., +, ?, ...
*/

-- SELECT * FROM emp WHERE ename LIKE 'M%'
db.emp.find({
    ename : /^M/
})

-- SELECT * FROM emp WHERE ename LIKE '%ER'
db.emp.find({
    ename : /ER$/
})

-- SELECT * FROM emp WHERE ename LIKE '%U%'
db.emp.find(
    {
        ename : /U/
    }
)

-- find emp whose name contains 4 alphabets
db.emp.find(
    {
        ename : /^[A-Z][A-Z][A-Z][A-Z]$/i
    }
)

-- find emps that have comm field.
db.emp.find({
    comm : {$exists : 1}
})

--_____________________________________________________________

-- db.colname.updateOne(criteria, changes, options)
-- db.colname.updateMany(criteria, changes, options)
--  changes: $set, $inc, $mul, ...


-- increment age of person  by 1.

db.person.updateOne(
    {name : "Geeta"},
    {
        $inc : {age : 1}
    }
    )

-- decrement age of person by 1.
db.person.updateOne(
    {name : "Seeta"},
    {
        $inc : {age : -1}
    }
)



--  set addr of person to Mumbai, sal field to 10000.
db.person.updateOne(
    {name : "Geeta"},
    {
        $set :
        {
            age : 30,
            city : "Mumbai"
        }
        
    }
)


-- check the changes :


-- increase sal of all emps by 10%.
db.emp.updateMany(
    {},
    {
        $mul : {
        sal : 1.1
    }
    }
)


--  change the sal  of John in dept 30  to 5000 :
db.emp.updateOne (
    {ename : 'JOHN', deptno : 30},
    {$set : { sal : 5000}},
    {upsert : true }
)


-- check the emp john :

db.emp.find({ename : 'JOHN'})

--_________________________________________________________________
-- DELETE :
-- db.colname.deleteOne({criteria})
-- db.colname.deleteMany({criteria})

-- DELETE FROM person WHERE name = 'Seeta';
db.person.deleteOne(
    { name : "Seeta"}
)


-- DELETE FROM emp WHERE sal > 2500;
db.emp.deleteMany(
    {sal : {$gt : 2500}}
)



-- DELETE FROM person;
db.person.deleteMany({})


-- check the collections
show collections 

-- drop the people collection :
db.person.drop()


-- drop the database :
db.dropDatabase("classwork_db")
-- ___________________________________________________________
-- DCL : Grant , Revoke


--_________________DCL__________________________

--Login Through Root User
 cmd : mysql -u root -pmanager

-- Create few users (mgr,teamlead,dev1,dev2)
-- syntax : CREATE USER username IDENTIFIED BY 'pwd';
CREATE USER mgr IDENTIFIED BY 'mgr';
CREATE USER teamlead IDENTIFIED BY 'teamlead';
CREATE USER dev1 IDENTIFIED BY 'dev1';
CREATE USER dev2 IDENTIFIED BY 'dev2';



-- Grant ALL privileges on classwork_db to mgr 
--with further grant options.
GRANT ALL PRIVILEGES ON ac_classwork_db.* TO mgr WITH GRANT OPTION;

-- WITH GRANT OPTION allows the mgr to further grant the rights
-- to his subordinates.

-- Exit from root user
exit;

-- Login through mgr user
cmd > mysql -u mgr -p --prompt= "mgr>"
--_____________________________________________________________________
-- check the privileges for mgr
SHOW GRANTS;

-- mgr will give all the privileges 
--on classwork_db to teamlead With further grant rights
GRANT ALL PRIVILEGES ON ac_classwork_db.* TO teamlead WITH GRANT OPTION;


--______________________________________________________
-- login with teamlead with prompt
C:\Users\Nisha Dingare>mysql -u teamlead -p --prompt="teamlead>"
Enter password: ********

-- check the databases
SHOW databases;

-- check the tables
SHOW tables;

-- check the permissions
SHOW GRANTS;


-- As a teamlead grant select ,insert and update 
--to dev1 on emp tables
GRANT SELECT,INSERT,UPDATE ON ac_classwork_db.emp TO dev1;

--As a teamlead grant select to dev1 on dept tables
GRANT SELECT ON ac_classwork_db.dept TO dev1;



-- As a teamlead grant select to dev2 on emp table
GRANT SELECT on ac_classwork_db.emp TO dev2;



--  revoke only Update permissions from dev1 on emp table.
REVOKE UPDATE ON ac_classwork_db.emp FROM dev1;

--___________________________________________________
-- Login through dev1 :
-- check the databases and tables
SHOW DATABASES;

-- check the grants.
SHOW tables;

-- Try the update command on dept table.
dev1>UPDATE emp SET sal = sal + 400
    -> WHERE deptno = 10;
ERROR 1142 (42000): UPDATE command denied to user 'dev1'@'localhost' for table 'emp'

-- Try to create a table.
-- ACCESS denied

--__________________________________________________
login from the root user :
-- DROP the user dev2
DROP USER dev2;


DROP USER temlead;
-- All the rights of teamlead on the classwork_db 
-- for all the tables will be revoked automatically.

-- rights of dev1 remain intact. no changes to their rights




--________________________________________________________________