# What is PL/SQL?

PL/SQL is a procedural programming language, which extends SQL capabilities.
**Note:-** PL/SQL is not an Object-Oriented language, you can use it as an object Oriented programming, but at the end it is not.

### How will you have PL/SQL?

PL/SQL is created in early 90’s by oracle and it has been developing by oracle since then. It works on oracle Database.

PL/SQL is a Platform independent language. You can use it in windows, mac, linux.

# Why PL/SQL?

- It is developed for business operations or handling some complicated logic with strong logic control statements.
- We can use it for after SQL statements, like logs, controls like constraints, some security things.
- Re-usability with stored procedures.
- Unlike Jave or .net, PL/SQL works in database, it is much faster than the other Languages in its area.
- PL/SQL is not Just for showing the data, it is created for only data-manipulation, for only oracle databases by oracle.
- Since it works in database Engine, Network loss is very less.
- This also increases performance. → For this it has it's own methods Ex: - Bulk insert.
- PL/SQL will provide the power to make the applications more efficient, more robust, more secure.
- **Note:-** PL/SQL is not a display language. You can not create visual things with PL/SQL. Oracle has some other tools for that Ex:- Data Visualization

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/051e0ce8-5b8b-4896-82b8-6d13d8d78174/bf5c3545-09fc-4c1f-9025-69b0964f5938/image.png)

# PL/SQL Architecture

Two parts - 1. physical  2. Logical.

## Physical:

We have SQL Statement Executor to run SQL queries. when we run our query it steps into 3 main processes. 

<aside>
💡 1.parsing
2.Fetching
3. Executing
The above 3 operations are done by SQL Engine.

</aside>

- SQL optimizer, optimizes your query, Example if you did joins with standard joins it turns them to oracles join types → Optimization levels-It optimizes your query based on which optimization level you selected.
- All Your SQL operations are done in SQL Engine, Executor does these Operations, deletes query returns etc.

<aside>
💡 Optimization Levels

- **Level 0:** This is the lowest optimization level and should generally be avoided. It disables most optimizations and is primarily used for debugging purposes.
- **Level 1:** Enables basic optimizations but still prioritizes debugging information. It's suitable for development environments where debugging is essential.
- **Level 2:** This is the default level and provides a good balance between performance and debugging. It performs most optimizations without significantly impacting debugging.

### Key Considerations

- **Performance:** Higher optimization levels generally lead to better performance.
- **Debugging:** Lower optimization levels provide more detailed debugging information.
- **Trade-off:** There's a trade-off between performance and debugging capabilities.
- **Native Code Generation:** Optimization level 1 and below disable native code generation, which can impact performance.

### Setting Optimization Level

You can set the optimization level using the `PLSQL_OPTIMIZE_LEVEL` compilation parameter. For example:

SQL

`ALTER SESSION SET PLSQL_OPTIMIZE_LEVEL = 3;`

**Note:** Level 3 is not a standard option but is mentioned in some resources. It's essential to verify its availability in your Oracle database version.

### Additional Optimization Techniques

While optimization levels are important, they are just one aspect of PL/SQL performance tuning. Other techniques include:

- **Indexing:** Creating appropriate indexes for frequently queried columns.
- **Bulk SQL:** Using bulk operations (FORALL, BULK COLLECT) for efficient data processing.
- **Code Refactoring:** Improving code structure and logic for better performance.
- **Profiling:** Identifying performance bottlenecks using profiling tools.
</aside>

## Logical:

PL/SQL Engine allows us to create, manage and execute SQL and PL/SQL codes and interaction with the database Ex:- If we write an SQL code inside PL/SQL it will call the SQL Engine and the operation is done with SQL Engine.
Then the result is sent back to PL/SQL Engine. This operation is called as `Context switches` and one Engine to another and the opposite is valid.

## **PL/SQL logical Architecture:-**

- Cooperates with SQL Engine
- Enables Subprograms
- Dynamic Queries
- Case Insensitivity optimizer
- Enables Object oriented programming
- Web Development

### What is Pluggable Database?

Also called as Multitenant (database) architecture. Starting from Oracle dB  version 12c, Oracle has introduced the '`Pluggable Database`' feature.
So new versions there is one big database called `Container` database.

There must be at least one pluggable(has its own users, objects ,tables, Applications etc.) database inside container database(doesn't have any objects).

### why pluggable Database?

In earlier versions each DB in installed on a separate server. But in companies there are very small DB's used for only Some specific job. Each Server for small DB is a lot of work for DBA's.
So to make that easier pluggable DB's came into picture.

### DB Concepts:

- What is schema?
schemas are the collection of objects for each user in Oracle database.
- What is HR Schema ?
A Schema that can, practice on it.
It can have objects like:
Tables, Views, Triggers, constraints etc.
HR Schema:- Tables and Relationships
ER Diagrams: →→shous, relationships. primary Keys → Unique Key

**Quiz:**

- PL/SQL is not Case -sensitive

# Blocks

## What are blocks?

<aside>
💡 In PL/SQL we write all the code in blocks. Blocks are the executable code groups that are inside the "begin end" Key words.
Two Sections: -

1. Declare(optional).
2. BEGIN (MANDATORY)
3. Exception (optional)
4. END; (mandatory)

These Keywords should be written in the same sequence.

</aside>

There are 3 types of Blocks:

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/051e0ce8-5b8b-4896-82b8-6d13d8d78174/f005b245-54d5-45ad-8c77-faa605f81fc3/image.png)

1. Anonymous Blocks
2. Procedures
3. Functions

**Note:**  

If we write a code into a worksheet and run it directly then it is `anonymous Block`(an uncompiled code). We don't save them

Procedures(named objects (includes SQL +PL/SQL)) → we do some business things, save the code + Run.

Functions → return a value procedures don't (almost same).

**PL/SQL Outputs:**

PL/SQL is not an output language. It doesn't have built in output functionality.

To see outputs we should intentionally say it & run a code at least one time for a session.

`SET SERVEROUTPUT ON`. (Command). That is not enough.

To have outputs, You need to use `DBMS_OUTPUT` package.

**DBMS-OUTPUT Package:-**

This is an oracle's pre-built package that, can do some output issues.

A **`package`** is a PL/SQL Object that has some procedures and functions in it to do some operations.

**Syntax to get output:-**

`Package.procedure (input);`

Ex : `DBMS_OUTPUT.put_line(”HELLO WORLD");`

**Nested Blocks:-** A Block inside a Block.

**Quiz:**

Anonymous Block → an uncompiled code

- If we execute `dbms_ouput.putline` & you cannot see the output the reason can be `SET SERVEROUTPUT ON`(not added in code.)

# Variables

what are variables? why do we need them? 

variables are temporary storage of data. We save it, manipulate it & reuse whenever we need it. Every variable must have data type..
Oracle has categorized them into 4 main groups.

1. Scalar datatypes([Scalar Datatypes:](https://www.notion.so/Scalar-Datatypes-b1afc9dee1194731acac8bbe9805c170?pvs=21) )
2. Reference Data Types(Ref cursors and refs to objects)
3. Large Objects(LOBS)(BFILE,BLOB,NCLOB,CLOB)
4. Composite Datatypes.(records and collections)

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/051e0ce8-5b8b-4896-82b8-6d13d8d78174/59b70cad-e3c3-4c80-9dd1-a3d9a6a0d18e/image.png)

## Scalar Datatypes:

Single value with one type.

`CHAR(max_length)`: if 30 bits is given 30 is allocated even if we use 10 bits.

`VARCHAR(max_length):` only 10 bits(max 30 bits) is allocated depends on usage

`NUMBER[precesion, scale]:` precesion→ 1 to 38 scale→ -84 to 127

`NUMBER[3,2]:` 3digits and 2 decimal parts.

`BINARY_INTEGER:` PLSINTEGER range (-2 Billion to +2 Billion). They are faster and requires less storage than numbe rs.

`BINARY_FLOAT`: Allocates 5 bytes of memory ends with “f” character.

`BINARY_DOUBLE:` Allocates 9 bytes of memory ends with “d” keyword.

`BOOLEAN:`  True, False, NULL. By default it is NULL.

`DATE:` Time of day and hours, minutes, seconds.

`sysdate` or `current_date` : To get Current date.

`TIMESTAMP(precesion)`: Extension of datetime it has millisecond with precesion that we specify.

`TIMESTAMP(precesion) with TIMEZONE`: extends timestamp with timezone.

`TIMESTAMP(precesion)with local TIMEZONE:` When you insert a value it stores with databases time zone. But when you query it, oracle server returns value with time zone of your session(local).

`INTERVAL(P) YEAR TO MONTH:-` stores, manipulates intervals of years and months. P→ number of digits in year.

`INTERVAL(P) DAY TO SECOND` : stores, manipulates intervals of days, hours, minutes and seconds. P→ specify number of digits in specified time value.

### Variables Naming Rules:-

- should start with letters can contain some special characters (Like _#$)
- can be maximum 30 characters.
- Cannot have oracles reserved words as names.

### Naming Conventions

**why naming conventions ?**
If the programmers use their own style of names it is hard to understand to other programmers or users.

- VARIABLE →V_Variable_name →v_mar salary
- CURSOR → Cur_cursor_name → cur_employees
- Exception → e_exception_name → e_invalid_salary
- PROCEDURE → p_procedure_name → p_calculate_salary
- FUNCTION → f_function_name → f_calculate_salary
- BINDVARIABLE → b_bind_name →b_emp_id.

### Declaring & Initializing & Using variables :-

General Usage:-

Name [constant] datatype [NOT NULL] [:= DEFAULT value expression];

:= → used to initialize a value.

```sql
SET SERVEROUTPUT ON
DECLARE
v_text varchar(50) NOT NULL :='WELCOME';--DEFAULT 'HELLO';
BEGIN
v_text :='PL/SQL '|| 'COURSE';
DBMS_OUTPUT.put_line(v_text);
END;

DECLARE
v_number NUMBER(2) NOT NULL :=50.42;
BEGIN
DBMS_OUTPUT.put_line(v_NUMBER ||' BEGINNER TO ADVANCED');
END;

DECLARE
v_number NUMBER(10,1) NOT NULL :=50.42;
BEGIN
DBMS_OUTPUT.put_line(v_NUMBER ||' BEGINNER TO ADVANCED');
END;

DECLARE
v_number NUMBER(10,2) NOT NULL :=50.42;
BEGIN
DBMS_OUTPUT.put_line(v_NUMBER ||' BEGINNER TO ADVANCED');
END;

DECLARE
v_integer PLS_INTEGER NOT NULL :=50;
BEGIN
DBMS_OUTPUT.put_line(v_integer ||' BEGINNER TO ADVANCED');
END;

DECLARE
v_integer BINARY_FLOAT NOT NULL :=50.42f;
BEGIN
DBMS_OUTPUT.put_line(v_integer ||' BEGINNER TO ADVANCED');
END;

DECLARE
v_date DATE NOT NULL := SYSDATE;
BEGIN
DBMS_OUTPUT.put_line(v_date ||' BEGINNER TO ADVANCED');
END;

DECLARE
v_date DATE NOT NULL := '21-MAR-2024';
BEGIN
DBMS_OUTPUT.put_line(v_date ||' BEGINNER TO ADVANCED');
END;

DECLARE
v_date DATE NOT NULL := '21-MAR-2024 19-12-20';
BEGIN
DBMS_OUTPUT.put_line(v_date ||' BEGINNER TO ADVANCED');
END;

DECLARE
v_date TIMESTAMP WITH TIME ZONE NOT NULL := SYSTIMESTAMP;
BEGIN
DBMS_OUTPUT.put_line(v_date ||' BEGINNER TO ADVANCED');
END;

DECLARE
v_date TIMESTAMP(3) WITH TIME ZONE NOT NULL := SYSTIMESTAMP;
BEGIN
DBMS_OUTPUT.put_line(v_date ||' BEGINNER TO ADVANCED');
END;

DECLARE
--default values are 2 for day amd 6 for milliseconds
v_date INTERVAL DAY(4) TO SECOND(2) := '21 01:05:21.012';
BEGIN
DBMS_OUTPUT.put_line(v_date ||' BEGINNER TO ADVANCED');
END;

DECLARE
v_date INTERVAL YEAR(3) TO MONTH := '122-3';
BEGIN
DBMS_OUTPUT.put_line(v_date ||' BEGINNER TO ADVANCED');
END;

DECLARE
v_bool BOOLEAN := TRUE;
BEGIN
DBMS_OUTPUT.put_line(v_bool ||' BEGINNER TO ADVANCED');
END;

-----------------------===================-----------------------
-----------------------DECLARING VARIABLES-----------------------
-----------------------===================-----------------------
SET SERVEROUTPUT ON;
DECLARE 
    v varchar2(20) := 2 + 25 * 3;
BEGIN
    dbms_output.put_line(v);
END;
-----------------------===================-----------------------
DECLARE 
    v_text varchar2(50) NOT NULL DEFAULT 'Hello';
    v_number1 number := 50;
    v_number2 number(2) := 50.42;
    v_number3 number(10,2) := 50.42;
    v_number4 PLS_INTEGER := 50;
    v_number5 BINARY_float := 50.42;
    v_DATE1 DATE := '22-NOV-18 12:01:32';
    v_DATE2 timestamp := systimestamp;
    v_DATE3 timestamp(9) WITH TIME ZONE := systimestamp;
    v_DATE4 interval day(4) to second (3) := '124 02:05:21.012 ';
    v_DATE5 interval year to month := '12-3';
BEGIN
    V_TEXT := 'PL/SQL' || 'Course';
    DBMS_OUTPUT.PUT_LINE(V_TEXT);
    DBMS_OUTPUT.PUT_LINE(v_number1);
    DBMS_OUTPUT.PUT_LINE(v_number2);
    DBMS_OUTPUT.PUT_LINE(v_number3);
    DBMS_OUTPUT.PUT_LINE(v_number4);
    DBMS_OUTPUT.PUT_LINE(v_number5);
    DBMS_OUTPUT.PUT_LINE(v_DATE1);
    DBMS_OUTPUT.PUT_LINE(v_DATE2);
    DBMS_OUTPUT.PUT_LINE(v_DATE3);
    DBMS_OUTPUT.PUT_LINE(v_DATE4);
    DBMS_OUTPUT.PUT_LINE(v_DATE5);
    END;
----------------==================================---------------
----------------USING BOOLEAN DATA TYPE in PL/SQL----------------
----------------==================================---------------
DECLARE
    v_boolean boolean := true;
BEGIN
    dbms_output.put_line(sys.diutil.bool_to_int(v_boolean));
END;
----------------==================================---------------
```

# Using %TYPE Attribute:

### What is %Type Attribute ?

%Type gets the datatype of the referenced column or value and assigns this datatype to the declared variable.

### Why and where to use it?

If you are calculating the salaries (stored in table number(8,2))

In pl/sql when we calculate it, you need to store exactly in same datatype & precision to avoid error→ procedure created. Suddenly a person is hired with great salary and need to update  all your variables in all procedures(when you want to change). If not they may crash. When you don’t remember where to update, it is a risky & error-prone thing to hard-code the datatype of a variable that cooperates with DB column. So, %type helps here, it is a pointer. The datatype is referenced to the other value & column. So if datatype or precision changes for a column or variable, your datatype is automatically synchronizes. itself.

### How do we use it?

`variable_name column_name %TYPE`or `variable name %TYРЕ`

- %type gets only the type of column or variable it doesn't get the value from the referencing column or variable.

# Ref Cursors

## Introduction:

- They are just like pointers in languages like C or pascal(pointers to actual cursors).
- You can use a cursor for multiple queries(increases the flexibility.)
- We cannot:
Assign null values
Use in table-view create codes
Store in collections
Compare

## Why we need REF CURSORS?

- For example, we get the salaries but sometimes from the employees table or sometimes from the retired employees table. Or from a completely different query. We must have a structure that we can use a generic query. Or we want to send the cursor to some other programs like a function or even into a different platform like a Java code. With a simple cursor variable, we cannot do that. But we can do that with the ref cursors.

### Types of reference cursors

The difference is based on their return type.

- Strong(restrictive) cursors
- Weak(non restrictive) cursors.(return type not specified): more flexible because any valid SQL query will be accepted in it. But it is more error prone because the compiler cannot guess which type of data you will work on.

### Syntax

type cursor_type_name is ref cursor [return return_type]
open cursor_variable_name for query;

# Composite DataTypes:

## Easy DML with Records

Using records in DML operations and we will see how records simplify inserts and updates in our code. Before explaining this way, let’s remember how we make an insert or update normally. Let's talk on insert first. (Known way)

1. Normally, if we want to insert a row into a table, we can either write whole column names or we can write the specific columns and values to make our insert. 

Why is it useful? 

1. We have another option to make an insert with records. Since our records will have the same structure of the table, we can directly make our insert without writing any column name.

### Code:

```sql
/************************************************************/
CREATE TABLE retired_employees 
AS SELECT * FROM employees WHERE 1=2;
 
SELECT * FROM retired_employees;
/
 
DECLARE
    r_emp employees%rowtype;
BEGIN
    SELECT * 
    INTO   r_emp 
    FROM   employees 
    WHERE  employee_id = 104;
    
    r_emp.salary         := 0;
    r_emp.commission_pct := 0;
    
    INSERT INTO retired_employees VALUES r_emp;
END;
 
/************************************************************/
DECLARE
    r_emp employees%rowtype;
BEGIN
    SELECT * 
    INTO   r_emp 
    FROM   employees 
    WHERE  employee_id = 104;
 
    r_emp.salary         := 10;
    r_emp.commission_pct := 0;
 
    --insert into retired_employees values r_emp;
    UPDATE retired_employees 
    SET    row = r_emp 
    WHERE  employee_id = 104;
end;
/
DELETE FROM retired_employees;
/************************************************************/
```

[dmlwithrecords.pls](https://prod-files-secure.s3.us-west-2.amazonaws.com/051e0ce8-5b8b-4896-82b8-6d13d8d78174/2163d9fa-cf94-48d9-82bb-09ef00d97b37/dmlwithrecords.pls)

## Collections

Collections are second type of composite datatypes. Why do we need collections? Records are just like a row in our table. A box that has many variables in it. But with only "1" row. But generally, we need to have multiple rows to do our work. Right that time, we use "collections". In a record, we can reach the variables in it with writing their names. But there is no next one.

Example: let’s say we have a record of an employee. We can reach to the name of the employee or the salary or the others. But, what if we want to pass to the next employee? At that time, we need to create another record for the next one. What if we need a hundred? Or a thousand? Should we create a thousand records for that? Of course not. Or what if we need to get the employees from a table? In this time, we may not know the number of the employees. Can we do that with using only records? We cannot. In this time, we need to use the collections. Unlike records, collections have a list of the same data types.

There are 3 types of collections..

- Nested Tables :-

Nested tables are lists that keys can have only numbers starting from 1.

Unlike other programming languages, PL/SQL collections start from 1. Beside, nested tables are unbounded. You can add as many rows as you wish.

When you add one, the key increases by one. You cannot specify the key. It automatically increases.

- VARRAYs:- VARRAYs are very similar with the nested tables.

The only difference is that they are bounded. You need to specify the exact size of varrays at the declaration and cannot change the size after the declaration. But be careful that, they may take up some unused space.

I mean, if you created a varray sized 100 of rows and you used only 80 of them, the space is still used as 100.

So, you used 20 values sized unnecessary space. So why should I use VARRAYs while I can use nested tables instead?

Sometimes, we want the collection to have a certain bound. Because we send that object into a procedure or a function that is written by another programmer.

We need to be sure that it will not cause some memory error in my program. So I simply send varrays. But, this is very rare usage. So you will not use VARRAYs most of the times. You will use nested tables or associative arrays instead. But, I needed to explain anyway.

- Associative Arrays:-

This is the best I think. Because I can specify the value of the keys. Besides, the keys can be strings, too. This is really useful and strong usage. And generally very suitable for a real-life usage. Because most of the times, keys are important for you.

For example, generally you use identity numbers as the keys because they are unique and meaningful. So we use identity numbers in our collections. This collection type is also unbounded, too.

- Collections can have any type of pl/sql variables including composite data types. The collections can be considered as key-value pairs(The key is a number or string values to specify the values. We can think of them as indexes. For example, let’s think of the list of an employee. Let’s say the employee IDs are the keys and the names are the values. We can reach the names with using the employee IDs, which means keys.)

The last thing about collections are, using records in our collections.

This is really, really useful. Because we generally use records and collections together.

If I need to example it, we can think of a list of the employees. An employee has many information. We cannot create multiple collections for all the values.

Instead, we use a record including all the information of the employee and store that record as one value inside of our collection. You will see many examples about that. For the last lecture of our composite data types lessons, you will learn how to use TABLE operator to use all collection values in one step.

## V Arrays

VArrays are identical to Arrays in other languages.

Upper limit is Certain

VArrays are 1-Dimensional arrays

Varrays are null by default.

dbms_output prints all the values at a time after the code is ran.

Once we add we cannot delete any values.

To types of creating “type”

1.storing in declaration section. This is stored in the memory and will be deleted after the program finishes.

example: 

```sql
declare
	type e_list is varray(15) of varchar2(50);
		employees elist:=e_list();
			idx number :=1;
begin
	for i in 100..110 loop
		employees.extend;
				select first_name into employees(idx) from employees where employee_id =i;
						idx:=idx+1;
	end loop;
for x in 1..employees.count() 
	loop
		dbms_output.put_line(employees(x));
	end loop;
end;
```

2.Creating type in the database: This type stays in database even when your program finishes. You can use it with only referring it. called as “Schema-level ” type.

Example: create type e_list is varray(5) of varchar(50);(before declare statement)

Adavantage of it is you can use it multiple programs and update when neccessary.

Example:create or replace type e_list is varray(15) of varchar2(100);(before declare statement)

Can also drop type

Example: drop type e_list;

Code:

```sql

/**************** A Simple Working Example ******************/
DECLARE
  TYPE e_list IS VARRAY(5) OF VARCHAR2(50);
  employees e_list;
BEGIN
  employees := e_list('Alex','Bruce','John','Bob','Richard');
  FOR i IN 1..5 LOOP
    dbms_output.put_line(employees(i));
  END LOOP;
END;
 
/************** Limit Exceeding Error Example ***************/
DECLARE
  TYPE e_list IS VARRAY(4) OF VARCHAR2(50);
  employees e_list;
BEGIN
  employees := e_list('Alex','Bruce','John','Bob','Richard');
  FOR i IN 1..5 LOOP
    dbms_output.put_line(employees(i));
  END LOOP;
END;
 
/*********** Subscript Beyond Count Error Example ***********/
DECLARE
  TYPE e_list IS VARRAY(5) OF VARCHAR2(50);
  employees e_list;
BEGIN
  employees := e_list('Alex','Bruce','John','Bob');
  FOR i IN 1..5 LOOP
    dbms_output.put_line(employees(i));
  end loop;
END;
 
/**************** A Working count() Example *****************/
DECLARE
  TYPE e_list IS VARRAY(5) OF VARCHAR2(50);
  employees e_list;
BEGIN
  employees := e_list('Alex','Bruce','John','Bob');
  for i IN 1..employees.count() LOOP
    dbms_output.put_line(employees(i));
  END LOOP;
END;
 
/************ A Working first() last() Example **************/
DECLARE
  TYPE e_list IS VARRAY(5) OF VARCHAR2(50);
  employees e_list;
BEGIN
  employees := e_list('Alex','Bruce','John','Bob');
  FOR i IN employees.first()..employees.last() LOOP
    dbms_output.put_line(employees(i));
  END LOOP;
END;
 
/*************** A Working exists() Example *****************/
DECLARE
  TYPE e_list IS VARRAY(5) OF VARCHAR2(50);
  employees e_list;
BEGIN
  employees := e_list('Alex','Bruce','John','Bob');
  FOR i IN 1..5 LOOP
    IF employees.exists(i) THEN
      dbms_output.put_line(employees(i));
    END IF;
  END LOOP;
END;
 
/**************** A Working limit() Example *****************/
DECLARE
  TYPE e_list IS VARRAY(5) OF VARCHAR2(50);
  employees e_list;
BEGIN
  employees := e_list('Alex','Bruce','John','Bob');
  dbms_output.put_line(employees.limit());
END;
 
/****** A Create-Declare at the Same Time Error Example *****/
DECLARE
  TYPE e_list IS VARRAY(5) OF VARCHAR2(50);
  employees e_list('Alex','Bruce','John','Bob');
BEGIN
  --employees := e_list('Alex','Bruce','John','Bob');
  FOR i IN 1..5 LOOP
    IF employees.exists(i) THEN
       dbms_output.put_line(employees(i));
    END IF;
  END LOOP;
END;
 
/************** A Post Insert Varray Example ****************/
DECLARE
  TYPE e_list IS VARRAY(15) OF VARCHAR2(50);
  employees e_list := e_list();
  idx NUMBER := 1;
BEGIN
  FOR i IN 100..110 LOOP
    employees.extend;
    SELECT first_name 
    INTO   employees(idx) 
    FROM   employees 
    WHERE  employee_id = i;
    idx := idx + 1;
  END LOOP;
  FOR x IN 1..employees.count() LOOP
    dbms_output.put_line(employees(x));
  END LOOP;
END;
 
/******* An Example for the Schema-Level Varray Types *******/
CREATE TYPE e_list IS VARRAY(15) OF VARCHAR2(50);
/
CREATE OR REPLACE TYPE e_list AS VARRAY(20) OF VARCHAR2(100);
/
DECLARE
  employees e_list := e_list();
  idx       NUMBER := 1;
BEGIN
 
  FOR i IN 100..110 LOOP
    employees.extend;
    SELECT first_name 
    INTO employees(idx) 
    FROM employees 
    WHERE employee_id = i;
    idx := idx + 1;
  END LOOP;
  
  FOR x IN 1..employees.count() LOOP
    dbms_output.put_line(employees(x));
  END LOOP;
 
END;
/
DROP TYPE E_LIST;
```

[VArrays.pls](https://prod-files-secure.s3.us-west-2.amazonaws.com/051e0ce8-5b8b-4896-82b8-6d13d8d78174/ebf4f7eb-8d6f-4f7f-89f9-bf6f87313859/VArrays.pls)

## NESTED TABLES

very similar with the varrays.

compare to varrays.

key-values (keys are only positive numbers negative numbers are invalid)

2 GB at most

We can delete any values by using their index values.

They are not stored consecutively

Nested tables are unbounded.

Example:  

type type_name as table of value_data_type [NOT NULL]);

create or replace type type_name as table of value_data_type [NOT NULL]);

Code

[nestedtables.pls](https://prod-files-secure.s3.us-west-2.amazonaws.com/051e0ce8-5b8b-4896-82b8-6d13d8d78174/30ac3969-8c29-4df2-9c6b-2cee19078daf/nestedtables.pls)

```sql
/***************** The Complete PL/SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle PL/SQL Bootcamp            *
 * Lecture : Nested Tables                                  *
 ************************************************************/
 
/*********** The Simple Usage of Nested Tables **************/
DECLARE
  TYPE e_list IS TABLE OF VARCHAR2(50);
  emps e_list;
BEGIN
  emps := e_list('Alex','Bruce','John');
  FOR i IN 1..emps.count() LOOP
    dbms_output.put_line(emps(i));
  END LOOP;
END;
 
/************************************************************
Adding a New Value to a Nested Table After the Initialization
*************************************************************/
DECLARE
  TYPE e_list IS TABLE OF VARCHAR2(50);
  emps e_list;
BEGIN
  emps := e_list('Alex','Bruce','John');
  emps.extend;
  emps(4) := 'Bob';
  FOR i IN 1..emps.count() LOOP
    dbms_output.put_line(emps(i));
  END LOOP;
END;
 
/*************** Adding Values From a Table *****************/
DECLARE
  TYPE e_list IS TABLE OF employees.first_name%type;
  emps e_list := e_list();
  idx  PLS_INTEGER:= 1;
BEGIN
  FOR x IN 100 .. 110 LOOP
    emps.extend;
    SELECT first_name INTO emps(idx) 
    FROM   employees 
    WHERE  employee_id = x;
    idx := idx + 1;
  END LOOP;
  FOR i IN 1..emps.count() LOOP
    dbms_output.put_line(emps(i));
  END LOOP;
END;
 
/********************* Delete Example ***********************/
DECLARE
  TYPE e_list IS TABLE OF employees.first_name%type;
  emps e_list := e_list();
  idx  PLS_INTEGER := 1;
BEGIN
  FOR x IN 100 .. 110 LOOP
    emps.extend;
    SELECT first_name INTO emps(idx) 
    FROM   employees 
    WHERE  employee_id = x;
    idx := idx + 1;
  END LOOP;
  emps.delete(3);
  FOR i IN 1..emps.count() LOOP
    IF emps.exists(i) THEN 
       dbms_output.put_line(emps(i));
    END IF;
  END LOOP;
END;
```

# Associative Arrays

Storing collections in tables:

Associative arrays are also known as index by tables.

**Compare to other collections:**

associative arrays have two columns; the key and the value. The key can be a pls_integer, binary_integer, or unlike the others, it can be a string. But, we need to be sure that the keys are unique.

Keys does not need to be sequential can have scaler and record types.

Do not initialize associative arrays

Associative arrays are indexed(If you use a varchar key type, it is indexed as a B-TREE index.So if your program requires too much going back and forth, I suggest you to use varchar2 type as the key)

No Extend method.

**Syntax:** type type_name as table of value_data_type [Not NULL] INDEX BY {PLS_INTEGER | BINARY_INTEGER | VARCHAR2(size)};

### Code:

```sql
/***************** The Complete PL/SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle PL/SQL Bootcamp            *
 * Lecture : Associative Arrays                             *
 ************************************************************/
 
/********************* The First Example ********************/
DECLARE
  TYPE e_list IS TABLE OF employees.first_name%TYPE INDEX BY PLS_INTEGER;
  emps e_list;
BEGIN
  FOR x IN 100 .. 110 LOOP
    SELECT first_name 
    INTO   emps(x) 
    FROM   employees 
    WHERE  employee_id = x ;
  END LOOP;
  FOR i IN emps.first()..emps.last() LOOP
    dbms_output.put_line(emps(i));
  END LOOP; 
END;
 
/********* Error Example for the SELECT INTO Clause *********/
DECLARE
  TYPE e_list IS TABLE OF employees.first_name%TYPE INDEX BY PLS_INTEGER;
  emps e_list;
BEGIN
  FOR x IN 100 .. 110 LOOP
    SELECT first_name 
    INTO   emps(x) 
    FROM   employees 
    WHERE  employee_id   = x 
    AND    department_id = 60;
  END LOOP;
  FOR i IN emps.first()..emps.last() LOOP
    dbms_output.put_line(i);
  END LOOP; 
END;
 
/******* Error Example about Reaching an Empty Index ********/
DECLARE
  TYPE e_list IS TABLE OF employees.first_name%TYPE INDEX BY PLS_INTEGER;
  emps e_list;
BEGIN
  emps(100) := 'Bob';
  emps(120) := 'Sue';
  FOR i IN emps.first()..emps.last() LOOP
    dbms_output.put_line(emps(i));
  END LOOP; 
END;
 
/*************************************************************
An Example of Iterating in Associative Arrays with WHILE LOOPs
*************************************************************/
DECLARE
  TYPE e_list IS TABLE OF employees.first_name%TYPE INDEX BY PLS_INTEGER;
  emps e_list;
  idx  PLS_INTEGER;
BEGIN
  emps(100) := 'Bob';
  emps(120) := 'Sue';
  idx       := emps.first;
 
  WHILE idx IS NOT NULL LOOP 
    dbms_output.put_line(emps(idx));
    idx := emps.next(idx);
  END LOOP; 
END;
 
/*************************************************************
An Example of Using String-based Indexes with Associative Arrays
*************************************************************/
DECLARE
  TYPE e_list IS TABLE OF employees.first_name%TYPE INDEX BY employees.email%type;
  emps         e_list;
  idx          employees.email%TYPE;
  v_email      employees.email%TYPE;
  v_first_name employees.first_name%TYPE;
BEGIN
  FOR x IN 100 .. 110 LOOP
    SELECT first_name, email 
    INTO   v_first_name, v_email 
    FROM   employees
    WHERE  employee_id = x;
    emps(v_email) := v_first_name;
  END LOOP;
 
  idx := emps.first;
  WHILE idx IS NOT NULL LOOP 
    dbms_output.put_line('The email of '|| emps(idx) ||' is : '|| idx);
    idx := emps.next(idx);
  END LOOP; 
END;
 
/*** An Example of Using Associative Arrays with Records ****/
DECLARE
  TYPE e_list IS TABLE OF employees%rowtype INDEX BY employees.email%TYPE;
  emps e_list;
  idx  employees.email%type;
BEGIN
  FOR x IN 100 .. 110 LOOP
    SELECT * 
    INTO   emps(x) 
    FROM   employees
    WHERE  employee_id = x;
  END LOOP;
 
  idx := emps.first;
  
  WHILE idx IS NOT NULL LOOP 
    dbms_output.put_line('The email of '      || 
                         emps(idx).first_name || ' '     ||
                         emps(idx).last_name  || ' is : '|| emps(idx).email);
    idx := emps.next(idx);
  END LOOP; 
END;
 
/* An Example of Using Associative Arrays with Record Types */
DECLARE
  TYPE e_type IS RECORD (first_name employees.first_name%TYPE,
                         last_name  employees.last_name%TYPE,
                         email      employees.email%TYPE);
  TYPE e_list IS TABLE OF e_type INDEX BY employees.email%TYPE;
  emps e_list;
  idx  employees.email%type;
BEGIN
  FOR x IN 100 .. 110 LOOP
    SELECT first_name,last_name,email 
    INTO   emps(x) 
    FROM   employees
    WHERE  employee_id = x;
  END LOOP;
 
  idx := emps.first;
 
  WHILE idx IS NOT NULL LOOP
    dbms_output.put_line('The email of '       || 
                          emps(idx).first_name || ' ' ||
                          emps(idx).last_name  || ' is : ' || 
                          emps(idx).email);
    idx := emps.next(idx);
  END LOOP; 
END;
 
/**** An Example of Printing From the Last to the First *****/
DECLARE
  TYPE e_type IS RECORD (first_name employees.first_name%TYPE,
                         last_name  employees.last_name%TYPE,
                         email      employees.email%TYPE);
  TYPE e_list IS TABLE OF e_type INDEX BY employees.email%TYPE;
  emps e_list;
  idx  employees.email%type;
BEGIN
  FOR x IN 100 .. 110 LOOP
    SELECT first_name,last_name, email 
    INTO   emps(x) 
    FROM   employees
    WHERE  employee_id = x;
  END LOOP;
  
  --emps.delete(100,104);
  idx := emps.last;
  
  WHILE idx IS NOT NULL LOOP 
    dbms_output.put_line('The email of '       || 
                          emps(idx).first_name || ' '     ||
                          emps(idx).last_name  ||' is : ' || 
                          emps(idx).email);
    idx := emps.prior(idx);
  END LOOP; 
END;
 
/***** An Example of Inserting with Associative Arrays ******/
CREATE TABLE employees_salary_history 
AS SELECT * FROM employees WHERE 1=2;
 
ALTER TABLE employees_salary_history ADD insert_date DATE;
 
SELECT * FROM employees_salary_history;
/
DECLARE
  TYPE e_list IS TABLE OF employees_salary_history%rowtype INDEX BY PLS_INTEGER;
  emps e_list;
  idx  PLS_INTEGER;
BEGIN
  FOR x IN 100 .. 110 LOOP
    SELECT e.*,'01-JUN-20' 
    INTO   emps(x) 
    FROM   employees e
    WHERE  employee_id = x;
  END LOOP;
  
  idx := emps.first;
  
  WHILE idx IS NOT NULL LOOP 
    emps(idx).salary := emps(idx).salary + emps(idx).salary*0.2;
    INSERT INTO employees_salary_history VALUES emps(idx);
    dbms_output.put_line('The employee '       || emps(idx).first_name ||
                         ' is inserted to the history table');
    idx := emps.next(idx);
  END LOOP; 
END;
/
DROP TABLE employees_salary_history;
```

[AssociativeArrays.pls](https://prod-files-secure.s3.us-west-2.amazonaws.com/051e0ce8-5b8b-4896-82b8-6d13d8d78174/40270112-b515-4538-a48b-2265d6f77604/AssociativeArrays.pls)

# Storing Collections in tables

We can store varrays and nested tables in database tables. They are stored in different methods.

We cannot do that with associate arrays because we cannot create associative arrays as schema-level.

# Varrays and Nested Tables

### Code

[StoringCollections.pls](https://prod-files-secure.s3.us-west-2.amazonaws.com/051e0ce8-5b8b-4896-82b8-6d13d8d78174/d26a1339-4c32-4b26-8061-a3ba87b9134a/StoringCollections.pls)

# Cursors

## Introduction

### What are cursors?

Cursors are pointers to the data.(Pointers that points the data in the memory or disc).

### Types of cursors

There are two types of cursors. Implicit and Explicit Cursors. 

**Implicit Cursors:** 

- The implicit cursors are created by the database server and managed automatically.
- Each time you select a database an implicit cursor is created and it is killed when your block is finished or you finish the cursor explicitly.
- Cursors are to handle the select queries. Fetching the data from the memory. Examples when we have 50 in tools preferences advanced database , sql fetched 50 rows and when you scroll down it fetches another 50 . This doesn’t mean it goes to the database again. It gets all or some of the rows , stores them in the memory and handles them one by one in each fetch command.

**Explicit Cursors:**  

- Explicit cursors are the cursors that you created in your code.
- This usage is really efficient and fast way. Because, instead of selecting from the database for each employee, we get a bunch of them or all of them.
- For example, if we want to calculate the salaries of each employee, we create a cursor, fetch the values by that cursor one by one and operate all of the employees one by one.
- since you get many results at one time into the memory, it will be much faster than selecting one by one from the database.

### Why don’t we use collections instead of cursors?

Using collections are pretty simple and fast than collections.

- Let’s say that, we want to query all the columns from a table that has millions of rows. If we want to get them all into a collection, you may have some memory problems. (Program may crash due to lack of memory.)(Database may fail due to more usage.)
- So operating on the values one by one  Fastly helps. We use explicit cursors for that because explicit cursors do not get all the result set into the memory directly. The server arranges that based on the result set and memory situation.

**Disadv**: You cannot go back in cursors.

### Summary of above 3

cursors are the pointers that you can iterate on the data that you selected.

Cursors have a fetching and memory algorithms. So it gets a bunch of result set into the  memory at a time, so your operations will be much faster than selecting for each time.

There are 2 types of cursors.

Implicit cursors are created automatically in each select by the database server. Explicit cursors are created by the programmer to iterate on the result set of your query.

Since we cannot control the implicit cursors, we cannot do anything on that.

# Explicit Cursors.

## Definition:

Cursors are pointers to the current row in the active set. 

Using Explicit cursors we can iterate on the current set of rows one by one.

### Usage:

- Declare
- Open
- Fetch: When we fetch a row the cursor pointer will automatically points to the next row in the memory.
- check
- close: If we don’t close a cursor we may have logical errors link inappropriate data. When we close we can open up again and use.

### Syntax

declare
 Cursor cusor_name is select_statement;
begin 
 open cursor_name;
 fetch cursor_name into variables,records etc;
 close cursor_name;
end;

### code

```sql
--declare
--cursor c_emps is select first_name ,last_name from employees;
--v_first_name employees.first_name%type;
--v_last_name employees.last_name%type;
--begin
--open c_emps;
--fetch c_emps into v_first_name,v_last_name;
--fetch c_emps into v_first_name,v_last_name;
--fetch c_emps into v_first_name,v_last_name;
--fetch c_emps into v_first_name,v_last_name;
--dbms_output.put_line(v_first_name||' '|| v_last_name);
--fetch c_emps into v_first_name,v_last_name;
--dbms_output.put_line(v_first_name||' '|| v_last_name);
--close c_emps;
--end;
--
--
--declare
--cursor c_emps is select first_name ,last_name,department_name from employees
-- join departments using (department_id)
-- where department_id between 30 and 60;
--v_first_name employees.first_name%type;
--v_last_name employees.last_name%type;
--v_department_name departments.department_name%type;
--begin
--open c_emps;
--fetch c_emps into v_first_name,v_last_name,v_department_name;
--dbms_output.put_line(v_first_name||' '|| v_last_name|| v_department_name);
--close c_emps;
--end;
--
declare
  cursor c_emps is select first_name,last_name from employees;
  v_first_name employees.first_name%type;
  v_last_name employees.last_name%type;
begin
  open c_emps;
  fetch c_emps into v_first_name,v_last_name;
  fetch c_emps into v_first_name,v_last_name;
  fetch c_emps into v_first_name,v_last_name;
  dbms_output.put_line(v_first_name|| ' ' || v_last_name);
  fetch c_emps into v_first_name,v_last_name;
  dbms_output.put_line(v_first_name|| ' ' || v_last_name);
  close c_emps;
end;
--------------- cursor with join example
declare
  cursor c_emps is select first_name,last_name, department_name from employees
                      join departments using (department_id)
                      where department_id between 30 and 60;
  v_first_name employees.first_name%type;
  v_last_name employees.last_name%type;
  v_department_name departments.department_name%type;
begin
  open c_emps;
  fetch c_emps into v_first_name, v_last_name,v_department_name;
  dbms_output.put_line(v_first_name|| ' ' || v_last_name|| ' in the department of '|| v_department_name);
  close c_emps;
end;

```

## Using Cursors with Records

- We fetched our cursor values into some variables that we created. If we have 10 or 20 columns we cannot create more variables instead we use records.

### Code

[ExplicitCursors.pls](https://prod-files-secure.s3.us-west-2.amazonaws.com/051e0ce8-5b8b-4896-82b8-6d13d8d78174/b4b2cc70-0cb1-4e14-b666-25b8528d072a/ExplicitCursors.pls)

```sql
declare
  type r_emp is record (  v_first_name employees.first_name%type,
                           v_last_name employees.last_name%type);
  v_emp r_emp;
  cursor c_emps is select first_name,last_name from employees;
begin
  open c_emps;
  fetch c_emps into v_emp;
  dbms_output.put_line(v_emp.v_first_name|| ' ' || v_emp.v_last_name);
  close c_emps;
end;
--------------- An example for using cursors table rowtype
declare
  v_emp employees%rowtype;
  cursor c_emps is select first_name,last_name from employees;
begin
  open c_emps;
  fetch c_emps into v_emp.first_name,v_emp.last_name;
  dbms_output.put_line(v_emp.first_name|| ' ' || v_emp.last_name);
  close c_emps;
end;
--------------- An example for using cursors with cursor%rowtype.
declare
  cursor c_emps is select first_name,last_name from employees;
  v_emp c_emps%rowtype;
begin
  open c_emps;
  fetch c_emps into v_emp.first_name,v_emp.last_name;
  dbms_output.put_line(v_emp.first_name|| ' ' || v_emp.last_name);
  close c_emps;
end;
```

[Cursorswithrecords.pls](https://prod-files-secure.s3.us-west-2.amazonaws.com/051e0ce8-5b8b-4896-82b8-6d13d8d78174/00a984ab-1cd2-4774-a9c7-2f64e0c4368e/Cursorswithrecords.pls)

## Cursors with loops

```sql
--declare
--  cursor c_emps is select * from employees where department_id=30;
--  v_emp c_emps%rowtype;
--begin
--  open c_emps;
--  fetch c_emps into v_emp;
--  while c_emps%found loop
--  dbms_output.put_line(v_emp.employee_id|| ' ' || v_emp.first_name ||' '|| v_emp.last_name);
--  fetch c_emps into v_emp;
--  --exit when c_emps%notfound;
--  end loop;
--  close c_emps;
--end;
--
--declare
--  cursor c_emps is select * from employees where department_id=30;
--begin
--  for i in c_emps loop
--  dbms_output.put_line(i.employee_id|| ' ' || i.first_name ||' '|| i.last_name);
--  end loop;
--end;
--
--begin
--  for i in (select * from employees where department_id=30) loop
--  dbms_output.put_line(i.employee_id|| ' ' || i.first_name ||' '|| i.last_name);
--  end loop;
--end;
declare
  cursor c_emps is select * from employees where department_id = 30;
  v_emps c_emps%rowtype;
begin
  open c_emps;
  loop
    fetch c_emps into v_emps;
    dbms_output.put_line(v_emps.employee_id|| ' ' ||v_emps.first_name|| ' ' ||v_emps.last_name);
  end loop;
  close c_emps;
end; 
---------------%notfound example
declare
  cursor c_emps is select * from employees where department_id = 30;
  v_emps c_emps%rowtype;
begin
  open c_emps;
  loop
    fetch c_emps into v_emps;
    exit when c_emps%notfound;
    dbms_output.put_line(v_emps.employee_id|| ' ' ||v_emps.first_name|| ' ' ||v_emps.last_name);
  end loop;
  close c_emps;
end;
---------------while loop example
declare
  cursor c_emps is select * from employees where department_id = 30;
  v_emps c_emps%rowtype;
begin
  open c_emps;
  fetch c_emps into v_emps;
  while c_emps%found loop
    dbms_output.put_line(v_emps.employee_id|| ' ' ||v_emps.first_name|| ' ' ||v_emps.last_name);
    fetch c_emps into v_emps;
    --exit when c_emps%notfound;
  end loop;
  close c_emps;
end;
---------------for loop with cursor example
declare
  cursor c_emps is select * from employees where department_id = 30;
  v_emps c_emps%rowtype;
begin
  open c_emps;
  for i in 1..6 loop
    fetch c_emps into v_emps;
    dbms_output.put_line(v_emps.employee_id|| ' ' ||v_emps.first_name|| ' ' ||v_emps.last_name);
  end loop;
  close c_emps;
end;
---------------FOR..IN clause example
declare
  cursor c_emps is select * from employees where department_id = 30;
begin
  for i in c_emps loop
    dbms_output.put_line(i.employee_id|| ' ' ||i.first_name|| ' ' ||i.last_name);
  end loop;
end;
---------------FOR..IN with select example
begin
  for i in (select * from employees where department_id = 30) loop
    dbms_output.put_line(i.employee_id|| ' ' ||i.first_name|| ' ' ||i.last_name);
  end loop;
end;
```

[loopingwithcursors.pls](https://prod-files-secure.s3.us-west-2.amazonaws.com/051e0ce8-5b8b-4896-82b8-6d13d8d78174/e3d05ffc-0900-4dda-be25-d15085d288d9/loopingwithcursors.pls)

## Cursors with parameters

- Cursors can be used for many times. We can use same cursors with different values.

**Syntax:** 

declare
Cursor cursor_name(parameter_name datatype,…) is select_statement;
begin
open cursor_name(parameter_values);
fetch cursor_name into variables,records etc;
close cursor_name;
end;

```sql
--declare 
--cursor c_emps(p_dept_id number) is select first_name,last_name,department_name
--                             from employees join departments using (department_id)
--                             where department_id =p_dept_id;
--v_emps c_emps%rowtype;
--begin
--open c_emps(:b_dept_id2);
--fetch c_emps into v_emps;
--dbms_output.put_line('The employees in department of '|| v_emps.department_name|| 'are :');
--close c_emps;
--
--open c_emps(:b_dept_id2);
--loop
--fetch c_emps into v_emps;
--exit when c_emps%notfound;
--dbms_output.put_line(v_emps.first_name|| ' '|| v_emps.last_name);
--end loop;
--close c_emps;
--end;
declare
  cursor c_emps (p_dept_id number) is select first_name,last_name,department_name 
                    from employees join departments using (department_id)
                    where department_id = p_dept_id;
  v_emps c_emps%rowtype;
begin
  open c_emps(20);
  fetch c_emps into v_emps;
    dbms_output.put_line('The employees in department of '|| v_emps.department_name|| ' are :');
    close c_emps;
  open c_emps(20);
    loop
      fetch c_emps into v_emps;
      exit when c_emps%notfound;
      dbms_output.put_line(v_emps.first_name|| ' ' ||v_emps.last_name);
    end loop;
  close c_emps;
end;
--------------- bind variables as parameters
declare
  cursor c_emps (p_dept_id number) is select first_name,last_name,department_name 
                    from employees join departments using (department_id)
                    where department_id = p_dept_id;
  v_emps c_emps%rowtype;
begin
  open c_emps(:b_emp);
  fetch c_emps into v_emps;
    dbms_output.put_line('The employees in department of '|| v_emps.department_name|| ' are :');
    close c_emps;
  open c_emps(:b_emp);
    loop
      fetch c_emps into v_emps;
      exit when c_emps%notfound;
      dbms_output.put_line(v_emps.first_name|| ' ' ||v_emps.last_name);
    end loop;
  close c_emps;
end;
---------------cursors with two different parameters
declare
  cursor c_emps (p_dept_id number) is select first_name,last_name,department_name 
                    from employees join departments using (department_id)
                    where department_id = p_dept_id;
  v_emps c_emps%rowtype;
begin
  open c_emps(:b_dept_id);
  fetch c_emps into v_emps;
    dbms_output.put_line('The employees in department of '|| v_emps.department_name|| ' are :');
    close c_emps;
  open c_emps(:b_dept_id);
    loop
      fetch c_emps into v_emps;
      exit when c_emps%notfound;
      dbms_output.put_line(v_emps.first_name|| ' ' ||v_emps.last_name);
    end loop;
  close c_emps;
  
  open c_emps(:b_dept_id2);
  fetch c_emps into v_emps;
    dbms_output.put_line('The employees in department of '|| v_emps.department_name|| ' are :');
    close c_emps;
  open c_emps(:b_dept_id2);
    loop
      fetch c_emps into v_emps;
      exit when c_emps%notfound;
      dbms_output.put_line(v_emps.first_name|| ' ' ||v_emps.last_name);
    end loop;
  close c_emps;
end;
--------------- cursor with parameters - for in loops
declare
  cursor c_emps (p_dept_id number) is select first_name,last_name,department_name 
                    from employees join departments using (department_id)
                    where department_id = p_dept_id;
  v_emps c_emps%rowtype;
begin
  open c_emps(:b_dept_id);
  fetch c_emps into v_emps;
    dbms_output.put_line('The employees in department of '|| v_emps.department_name|| ' are :');
    close c_emps;
  open c_emps(:b_dept_id);
    loop
      fetch c_emps into v_emps;
      exit when c_emps%notfound;
      dbms_output.put_line(v_emps.first_name|| ' ' ||v_emps.last_name);
    end loop;
  close c_emps;
  
  open c_emps(:b_dept_id2);
  fetch c_emps into v_emps;
    dbms_output.put_line('The employees in department of '|| v_emps.department_name|| ' are :');
    close c_emps;
    
    for i in c_emps(:b_dept_id2) loop
      dbms_output.put_line(i.first_name|| ' ' ||i.last_name);
    end loop;
end;
---------------cursors with multiple parameters
declare
  cursor c_emps (p_dept_id number , p_job_id varchar2) is select first_name,last_name,job_id,department_name 
                    from employees join departments using (department_id)
                    where department_id = p_dept_id
                    and job_id = p_job_id;
  v_emps c_emps%rowtype;
begin
    for i in c_emps(50,'ST_MAN') loop
      dbms_output.put_line(i.first_name|| ' ' ||i.last_name|| ' - ' || i.job_id);
    end loop;
    dbms_output.put_line(' - ');
    for i in c_emps(80,'SA_MAN') loop
      dbms_output.put_line(i.first_name|| ' ' ||i.last_name|| ' - ' || i.job_id);
    end loop;
end;
--------------- An error example of using parameter name with the column name
declare
  cursor c_emps (p_dept_id number , job_id varchar2) is select first_name,last_name,job_id,department_name 
                    from employees join departments using (department_id)
                    where department_id = p_dept_id
                    and job_id = job_id;
  v_emps c_emps%rowtype;
begin
    for i in c_emps(50,'ST_MAN') loop
      dbms_output.put_line(i.first_name|| ' ' ||i.last_name|| ' - ' || i.job_id);
    end loop;
    dbms_output.put_line(' - ');
    for i in c_emps(80,'SA_MAN') loop
      dbms_output.put_line(i.first_name|| ' ' ||i.last_name|| ' - ' || i.job_id);
    end loop;
end;
```

- Code
    
    [Cursorswithparameters.pls](https://prod-files-secure.s3.us-west-2.amazonaws.com/051e0ce8-5b8b-4896-82b8-6d13d8d78174/368f3a7c-aaa4-4f03-8bc0-54ee401a8c55/Cursorswithparameters.pls)
    

## Cursor Attributes

There are 4 cursor attributes

- %Found— Returns true if the fetch returned a row.
- %NOTFOUND— Opposite of %found
- %ISOPEN— Returns true if the cursor is open.
- %ROWCOUNT— Returns the number of rows that are fetched up-to now.
- `%BULK_ROWCOUNT` and `%BULK_EXCEPTIONS` are attributes associated with the use of bulk operations, particularly when using the `FORALL` statement. These attributes help you manage and track the outcome of bulk operations more efficiently.

`%BULK_ROWCOUNT`:

- **Purpose**: This attribute is used to track the number of rows affected by each iteration of a `FORALL` loop.
- **Usage**: `%BULK_ROWCOUNT` is an array that stores the number of rows processed or affected by each individual execution of the DML statement within the `FORALL` loop.
- **Indexing**: You can access `%BULK_ROWCOUNT(i)` where `i` is the index of the loop iteration.

`%BULK_EXCEPTIONS`:

- **Purpose**: This attribute is used to handle exceptions raised during bulk operations in a `FORALL` loop.
- **Usage**: `%BULK_EXCEPTIONS` is an array that stores details about exceptions encountered during each iteration of the `FORALL` loop. It is used in conjunction with the `SAVE EXCEPTIONS` clause in a `FORALL` statement.
- **Attributes**:
    - `%BULK_EXCEPTIONS(i).ERROR_INDEX`: The iteration index at which the exception occurred.
    - `%BULK_EXCEPTIONS(i).ERROR_CODE`: The Oracle error code corresponding to the exception.

```
--UNDERSTANDING
--We said that, if our cursor is not open, open it.So it entered to the if block. So we saw the hello text. Then we used %rowcount attribute.
--But, we haven't fetched any rows yet. So it returned 0. Because the number of fetched rows are 0 for now. Then, we fetched one row and printed the rowcount. So it printed 1 since we fetched only 1 row. Then, we printed the rowcount again. Since we haven't fetched any more row, it printed 1 again.
--Then, we fetched one more row and printed the rowcount.So it printed 2. We have fetched 2 rows up to now. Then, we closed our cursor and opened it again to start the iteration from the beginning. So our rowcount is 0 now. Then, we started a loop and fetched at first. And said that, exit when the last fetch did not return any row,
--or exit when we fetched more than 5 rows up to now. Since our dbms_output is below the exit when clause,it did not print the 6. employee.
--So with this code, we said that, print at most 5 employees, print the existing ones and exit when there is no next one.-Since there are at least 5 employees, it returned first 5 employees.
declare
cursor c_emps is select * from employees where department_id=20;
v_emps c_emps%rowtype;
begin
if not c_emps%isopen then
open c_emps;
dbms_output.put_line('hello');
end if;
dbms_output.put_line(c_emps%rowcount);
fetch c_emps into v_emps;
dbms_output.put_line(c_emps%rowcount);
dbms_output.put_line(c_emps%rowcount);
fetch c_emps into v_emps;
dbms_output.put_line(c_emps%rowcount);
close c_emps;

open c_emps;
loop
fetch c_emps into v_emps;
exit when c_emps%notfound or c_emps%rowcount>5;
dbms_output.put_line(c_emps%rowcount|| ' '||v_emps.first_name||''||v_emps.last_name);
end loop;
close c_emps;
end;
```

### Code:

[CursorAttributes.pls](https://prod-files-secure.s3.us-west-2.amazonaws.com/051e0ce8-5b8b-4896-82b8-6d13d8d78174/36fb4590-4f31-4757-a3e5-4fa714973e31/CursorAttributes.pls)

## For Update Clause

## Introduction

- When you update a row, it is locked to any change to the other users.(No one can touch the row until you commit or rollback it)
- **for update** clause locks the selected rows, will be unlocked when you commit or rollback.
- **nowait** option will terminate execution if there is a lock(in order to eliminate waiting for hours on the already locked update).
- Default option is **wait**.
- **for update of** clause locks only the selected tables.

## When and why is it used?

- Let’s say, you are calculating the salaries of the employees and the salaries are calculated based on the work days. So I need to calculate the day offs of the employees. So I don’t want any changes on any row of the table that has the day offs. Or I don’t want the commission percentages to be changed by someone else until I finish my job. To do that, normally, we need to update a column of all the rows with the same values for once. So that no one else can touch these rows until I commit or rollback. But, this is not so efficient. Because you did may be thousands of updates unnecessarily and these changes are inserted into the log files. So your managers may ask you what did you do with these columns? Besides, the update is a costly operation, so you will use database resources unnecessarily. To sum up, this is not the correct way. Instead of that, cursors have something very "efficient". It is, "for update" clause.

### Syntax

`cursor cursor_name(parameter_name datatype,…)
is select_statement
for update [of column(s)] [nowait | wait n]——(n no.of seconds to wait)`

- HR user doesn’t have privilege, use system user

### Codes:

```sql
hr: declare
cursor c_emps is select employee_id,first_name,last_name,department_name
from employees_copy join departments using (department_id)
where employee_id in (100,101,102) for update;
begin
/* *for r_emps in c_emps loop
update employees_copy set phone_number=3
where employee_id =r_emps.employee_id;
end loop;*/
open c_emps;
end;
*/
select * from employees_copy;
```

```sql
**my_user:** update hr.employees_copy set phone_number='1'
where employee_id=100;
update hr.departments set department_name='x'
where department_id=90;
```

## Where current of

- Used together with for update clause to make your updates and deletes much faster.
- If we use the for update clause, the main goal of us is not just locking it. We lock it because we want to update or delete some rows from the selected query. As we exampled, if we are calculating the salaries, we update them after the calculation. So the main goal is updating these rows. Because of that we don’t want anybody to change it. In addition to the for update clause, now, I will explain you something that will make your code faster. I mean, make your updates and deletes much faster.

## When do we use ?

- When we use a cursor with the for update clause, the cursor returns the rows with their rowId’s. Then, we can use the rowId’s with using the where current of clause. We need to use for update clause and where current of clause together. Otherwise, it won’t work.
- **We cannot use where current of clause with joins ,group functions etc.(No error but won’t update).**
- If you really need to use a join, you can do tha t without using the "where current of" clause. You can do that with selecting the rowid in your select query, then fetch it into some variables or records, then, do the update with using them.

### Code

```sql
declare
  cursor c_emps is select * from employees 
                    where department_id = 30 for update;
begin
  for r_emps in c_emps loop
    update employees set salary = salary + 60
          where current of c_emps;
  end loop;  
end;

---------------Wrong example of using where current of clause
declare
  cursor c_emps is select e.* from employees e, departments d
                    where 
                    e.department_id = d.department_id
                    and e.department_id = 30 for update;
begin
  for r_emps in c_emps loop
    update employees set salary = salary + 60
          where current of c_emps;
  end loop;  
end;
---------------An example of using rowid like where current of clause
declare
  cursor c_emps is select e.rowid,e.salary from employees e, departments d
                    where 
                    e.department_id = d.department_id
                    and e.department_id = 30 for update;
begin
  for r_emps in c_emps loop
    update employees set salary = salary + 60
          where rowid = r_emps.rowid;
  end loop;  
end;
/*With these rows, the database can find the rows much faster. Especially, if you do not use the primary key,it will be pretty much faster.
So how do we use the rowids then? It is by using the "where current of" clause.*/
```

[wherecurrentof.pls](https://prod-files-secure.s3.us-west-2.amazonaws.com/051e0ce8-5b8b-4896-82b8-6d13d8d78174/121f9979-72c3-4c75-ba82-20cba6b51c2c/wherecurrentof.pls)

# Exceptions

## Handling Exceptions

### Syntax

```sql
**Syntax:** 
declare
Begin
//exception occurs here
exception
when expection_name then 
when others then 
end;
```

### Types

There are 3 types of exceptions
1.predefined oracle server errors: no_data_found….etc
2.non-predefined oracle server errors.  
Syntax: exception_name Exception.
3.User-defined errors.

## PRAGMA

PRAGMA(non-predefined exception) is a compiler directive or hint and it is used to provide an instruction to the compiler. With writing PRAGMA, you say to the compiler that, ‘Hi compiler, do the things that I will tell you’. In here, the thing is exception_init. There are 4 more directives like exception_init for the pragma directive, but they are not related with the exception subject.

PRAGMA EXCEPTION_INIT(exception_name, error_code)
It says to the compiler that, 'Hi compiler, when you face with this error code, know that, it has this name and when I say this name, know that, this name refers to this specific error code. I declare this name because I will use it in somewhere

# Functions and procedures

## Procedures

- for the functions, I can say that, procedures does not return any value, but functions must return a value. So you cannot write a procedure inside of a SELECT statement for example, but you can do that for the functions.
- If our procedure has any parameters, we can write them by separating with comma signs. But here is the difference. We need to specify if this parameter will be "IN" to this procedure, or "OUT" of this procedure.

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/051e0ce8-5b8b-4896-82b8-6d13d8d78174/0fa8b541-7516-46c3-825c-a3f79dbe0b67/Untitled.png)

- I mean, will you send any value to this procedure, or will you get some value from that procedure, or both.
- CREATE PROCEDURE, procedure_name and IS or AS keywords. These are mandatory.
- Compiling that code is considered as a DDL operation. All the changes will be committed automatically when you do any compile. So be sure that you roll backed all the changes before you compile your procedure.

## Why we pass parameters?

- For example, we increase the salary but with different employees. Or we check the salaries of the employees but with the specific employee. You need to pass parameters to your procedures, functions or these kind of structures.
- Between the parameter name and the type, we write the mode of our parameter. The mode means if it is passing into this procedure or out of this procedure. "IN" means, we will send a value into this procedure and this value will be used in this procedure. "OUT" means,the caller will get the value of the specified parameter after the execution of the procedure.If you write both "in" and "out" modes together, the caller will both send it and get the value of that parameter.
- If you don’t write the mode, it is "IN" by default.
- Named notations allow us to pass the parameters independent from the parameter position. I mean, with using a named notation, I can pass a value to a parameter in any position of a procedure call.
- the one that has both positional and named notations, this type call is called as "mixed notations".
- if you pass the first parameter with the named notation, you cannot pass parameters with its position.
- you can use named notations both for the IN and OUT mode parameters. The mode is not important here. But, if you will do that for the OUT or IN OUT modes, you need to write a variable instead of a value. Actually must do that for both positional and named annotations.

### What are the differences between functions and procedures?

| Functions | procedures |
| --- | --- |
| Must return a value other than out parameter value | When you use procedures, you generally don’t need to get any value.(Even if it gets it is through out or in-out parameter). |
| In general functions are used to compute some value.
The return statement of a function returns the control and function’s result value to the calling program. | While the return statement of the procedure returns control outside of procedure, it can not return the result value. |
| You cannot run functions standalone like procedures. | Used to standalone we cannot assign it to some variable or within an SQL query.  |
| The function can be called using Stored Procedure. | While procedures cannot be called from function. |

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/051e0ce8-5b8b-4896-82b8-6d13d8d78174/cadb1e24-07f9-4cb6-b8cf-949edfff0aee/Untitled.png)

### Restrictions of using functions inside anonymous block or sql statements

- if your function returns a record, you cannot use that function inside of an SQL expression. Functions cannot be used in the check clause of the create or alter table statements and cannot be used as the default value of the column.

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/051e0ce8-5b8b-4896-82b8-6d13d8d78174/f9eded9f-9b1b-43eb-a646-adfd1891883c/Untitled.png)

### Using local subprograms

- We can create our subprograms inside of another subprogram, or even inside of an anonymous block. These kinds of subprograms are called as local subprograms.
- With creating local subprograms, we avoid the subprogram crowd.
- Why? improve code readability, reduce code repetition, Need no privilege.

### Finding and removing the subprograms

apply filters by right clicking on functions and procedures in sql servers.

```sql
Select * from user_source;
```

Why? 

Most of the times we will have errors while using functions and procedures so we need to see subprograms if we have any error in the parameter or anywhere else.

Some times we also need to drop functions and procedures.

```sql
drop function get_emp;
```

Drop means removing all the privileges replace means privileges will be same .

### Regular & Pipelined table functions

What are table functions?

A function which returns a collection of data are called table functions.

- table functions return a table of Varray or nested tables.
- Regular table functions returns after completed the whole data.
- Pipelined functions return each row one by one (used in data warehouse and ETL operations to increase performance and reduce data load )

Which one to choose?

- Collection is with small data load —— regular table function
- Collection has large amount of data —— pipelined table functions.

```sql
--Regular & Pipelined Table Functions (Code Samples)
CREATE TYPE t_day AS OBJECT (
  v_date DATE,
  v_day_number INT
);
----------------- creating a nested table type
CREATE TYPE t_days_tab IS TABLE OF t_day;
 
----------------- creating a regular table function
CREATE OR REPLACE FUNCTION f_get_days(p_start_date DATE , p_day_number INT) 
              RETURN t_days_tab IS
v_days t_days_tab := t_days_tab();
BEGIN
 FOR i IN 1 .. p_day_number LOOP
  v_days.EXTEND();
  v_days(i) := t_day(p_start_date + i, to_number(to_char(p_start_date + i, 'DDD')));
 END LOOP;
 RETURN v_days;
END;
----------------- querying from the regular table function
select * from table(f_get_days(sysdate,1000000));
----------------- querying from the regular table function without the table operator
select * from f_get_days(sysdate,1000000);
----------------- creating a pipelined table function
create or replace function f_get_days_piped (p_start_date date , p_day_number int) 
              return t_days_tab PIPELINED is
begin
 for i in 1 .. p_day_number loop
  PIPE ROW (t_day(p_start_date + i,
                  to_number(to_char(p_start_date + i,'DDD'))));
 end loop;
 RETURN;
end;
----------------- querying from the pipelined table function
select * from f_get_days_piped(sysdate,1000000)
```

Any type of PL/SQL blocks has to be compiled. The difference is, while subprograms are compiled only once and executed multiple times, anonymous blocks are compiled each time they are executed.

The function can call that procedure even if it is used within a SQL query.

# **What Is a PL/SQL Package?**

A package is a schema object that groups logically related PL/SQL types, variables, and subprograms.  

Why?

Most of the times objects work together.

There will be an object crowd in a real work in time.

There is one more reason for using package.

**Work logic of oracle database.**

All your schema like objects, variables, codes, packages are stored in the `storage` of the db. Database memory has PGA (program global area people call it private global area since there aren’t visible to anyone). Each object called will take up some memory in Db memory in the form of PGA. If 1000 users call the same object at a time that object will also be loaded into the PGA. This will cause 1000’s of unnecessary memory usage.

When a users calls an object that is inside of a package the object is loaded into SGA(System global area a memory shared by individual users. so called shared memory area) when the very first user calls it. So even 1000 users call the object at a time it is loaded into only one place SGA. less memory and more performance improvement. However variables are session specific and stored in only PGA. That means when I call a variable it will exists in the PGA until session ends. 

<aside>
💡 Neither PGA nor SGA can run the code.

</aside>

**Advantages of PL/SQL Packages**

- **Modularity**
- **Easier Application Design , Maintenance.**
- **Information Hiding & Security**
- **Added Functionality( public variables and cursors)**
- **Better Performance**
- **Overloading(subprograms)**

### Creating and using Packages.

- To use a package, we have two main reasons:
    - Logically grouping the objects.
    - The performance gain.
- With logically grouping we can decrease code complexity and crowd.

Packages usually have two parts, a specification (spec) and a body; sometimes the body is unnecessary. The specification is the interface to the package. It declares the types, variables, constants, exceptions, cursors, and subprograms that can be referenced from outside the package. The body defines the queries for the cursors and the code for the subprograms.

<aside>
💡 You can think of the spec as an interface and of the body as a *black* *box*. You can debug, enhance, or replace a package body without changing the package spec.

</aside>

The spec holds public declarations, which are visible to stored procedures and other code outside the package. (anyone who has privilege can see and use it all are public)

The body holds implementation details and private declarations, which are hidden from code outside the package. 

Body and Spec must have the same name.

The `AUTHID` clause determines whether all the packaged subprograms execute with the privileges of their definer (the default) or invoker, and whether their unqualified references to schema objects are resolved in the schema of the definer or invoker. 

**What Goes In a PL/SQL Package?**

- `Get` and `Set` methods for the package variables, if you want to avoid letting other procedures read and write them directly.
- Cursor declarations with the text of SQL queries. Reusing exactly the same query text in multiple locations is faster than retyping the same query each time with slight differences. It is also easier to maintain if you need to change a query that is used in many places.
- Declarations for exceptions.
- Declarations for procedures and functions that call each other.
- Declarations for overloaded procedures and function.
- Variables that you want to remain available between procedure calls in the same session. You can treat variables in a package like global variables.
- Type declarations for PL/SQL collection types. To pass a collection as a parameter between stored procedures or functions, you must declare the type in a package so that both the calling and called subprogram can refer to it.

**Understanding The Package Specification**

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/051e0ce8-5b8b-4896-82b8-6d13d8d78174/5d041235-87e4-4891-8050-6e088cba603a/image.png)

The spec lists the package resources available to applications. All the information your application needs to use the resources is in the spec. For example, the following declaration shows that the function named `factorial` takes one argument of type `INTEGER` and returns a value of type `INTEGER`:

`FUNCTION factorial (n INTEGER) RETURN INTEGER; -- returns n!`

That is all the information you need to call the function. You need not consider its underlying implementation (whether it is iterative or recursive for example).

If a spec declares only types, constants, variables, exceptions, and call specs, the package body is unnecessary. Only subprograms and cursors have an underlying implementation. In example below, the package needs no body because it declares types, exceptions, and variables, but no subprograms or cursors. Such packages let you define global variables, usable by stored procedures and functions and triggers, that persist throughout a session.

```sql
CREATE PACKAGE trans_data AS  -- bodiless package
   TYPE TimeRec IS RECORD (
      minutes SMALLINT,
      hours   SMALLINT);
   TYPE TransRec IS RECORD (
      category VARCHAR2(10),
      account  INT,
      amount   REAL,
      time_of  TimeRec);
   minimum_balance    CONSTANT REAL := 10.00;
   number_processed   INT;
   insufficient_funds EXCEPTION;
END trans_data;
```

**Restrictions**

You cannot reference remote packaged variables, either directly or indirectly. For example, you cannot call the a procedure through a database link if the procedure refers to a packaged variable.

Inside a package, you cannot reference host variables.

**Understanding The Package Body**

The package body contains the implementation of every cursor and subprogram declared in the package spec. Subprograms defined in a package body are accessible outside the package only if their specs also appear in the package spec. If a subprogram spec is not included in the package spec, that subprogram can only be called by other subprograms in the same package. A package body must be in the same schema as the package spec.

```sql
CREATE PACKAGE emp_bonus AS
   PROCEDURE calc_bonus (date_hired employees.hire_date%TYPE);
END emp_bonus;
/
CREATE PACKAGE BODY emp_bonus AS
-- the following parameter declaration raises an exception 
-- because 'DATE' does not match employees.hire_date%TYPE
-- PROCEDURE calc_bonus (date_hired DATE) IS
-- the following is correct because there is an exact match
   PROCEDURE calc_bonus (date_hired employees.hire_date%TYPE) IS
   BEGIN
     DBMS_OUTPUT.PUT_LINE('Employees hired on ' || date_hired || ' get bonus.');
   END;
END emp_bonus;
```

The package body can also contain private declarations, which define types and items necessary for the internal workings of the package. The scope of these declarations is local to the package body. Therefore, the declared types and items are inaccessible except from within the package body. Unlike a package spec, the declarative part of a package body can contain subprogram bodies.

The initialization part of a package plays a minor role because, unlike subprograms, a package cannot be called or passed parameters. As a result, the initialization part of a package is run only once, the first time you reference the package.

<aside>
💡 Remember, if a package spec declares only types, constants, variables, exceptions, and call specs, the package body is unnecessary. However, the body can still be used to initialize items declared in the package spec.

</aside>

```sql
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------CREATING & USING PACKAGES-----------------------------------------------
--------------------------------------------------------------------------------------------------------------------
----------------- Creating first package specification
CREATE OR REPLACE 
PACKAGE EMP AS 
  v_salary_increase_rate number := 0.057; 
  cursor cur_emps is select * from employees;
  
  procedure increase_salaries;
  function get_avg_sal(p_dept_id int) return number;
END EMP;
----------------- Creating the package body
CREATE OR REPLACE
PACKAGE BODY EMP AS
  procedure increase_salaries AS
  BEGIN
    for r1 in cur_emps loop
      update employees_copy set salary = salary + salary * v_salary_increase_rate;
    end loop;
  END increase_salaries;
  function get_avg_sal(p_dept_id int) return number AS
  v_avg_sal number := 0;
  BEGIN
    select avg(salary) into v_avg_sal from employees_copy where
          department_id = p_dept_id;
    RETURN v_avg_sal;
  END get_avg_sal;
END EMP;
----------------- using the subprograms in packages
exec EMP_PKG.increase_salaries;
----------------- using the variables in packages
begin
  dbms_output.put_line(emp_pkg.get_avg_sal(50));
  dbms_output.put_line(emp_pkg.v_salary_increase_rate);
end;
```

### Visibility of package objects

- An object is visible to the others only if it is declared in the package spec.
- Where can we declare variables in a package?
    - The first one is inside of the package spec. We declare it only between the IS and END keywords. Since we cannot create a subprogram, we cannot declare variables inside of the subprograms here. So these variables will be visible to all the others and to the package body. Anyone who has the privilege can use it inside of another subprogram, SQL expression, etc. These variables are all public.
    - The second one is inside of the package body. Here, we can declare variables in two different places. To anywhere between AS and END keywords, and inside of a subprogram. Now, if you declared a variable outside of a subprogram, this variable is called as private, but can be used by all of the subprograms inside of that package body. So this variable is called as global variable. But if a variable is declared inside of a subprogram, it is a local variable and only that subprogram can reach to that variable.

For the subprograms, it is also similar. If a subprogram is not declared in the package spec, it can only be used inside of the package body. Other users will not be able to see or use your private subprogram. So you can easily create your own subprograms that can be used significantly in that package.

Actually, the visibility rules and naming are valid for all the objects used in a package. So all the private variables, types, subprograms, etc. are visible only in the package body. Local objects are visible only in the surrounding subprogram and public objects are visible for everyone.

```sql
create or replace PACKAGE BODY EMP_PKG AS
  v_sal_inc int := 500;
  v_sal_inc2 int := 500;
  procedure print_test is
  begin
    dbms_output.put_line('Test : '|| v_sal_inc);
  end;
  
  procedure increase_salaries AS
  BEGIN
    for r1 in cur_emps loop
      update employees_copy set salary = salary + salary * v_salary_increase_rate
      where employee_id = r1.employee_id;
    end loop;
  END increase_salaries;
  function get_avg_sal(p_dept_id int) return number AS
  v_avg_sal number := 0;
  BEGIN
    print_test;
    select avg(salary) into v_avg_sal from employees_copy where
          department_id = p_dept_id;
    RETURN v_avg_sal;
  END get_avg_sal;
  
END EMP_PKG;
----------------- 
create or replace PACKAGE BODY EMP_PKG AS
  
  v_sal_inc int := 500;
  v_sal_inc2 int := 500;
  function get_sal(e_id employees.employee_id%type) return number;
procedure print_test is
  begin
    dbms_output.put_line('Test : '|| v_sal_inc);
    dbms_output.put_line('Test salary : '|| get_sal(102));
  end;
  procedure increase_salaries AS
  BEGIN
    for r1 in cur_emps loop
      update employees_copy set salary = salary + salary * v_salary_increase_rate
      where employee_id = r1.employee_id;
    end loop;
  END increase_salaries;
  function get_avg_sal(p_dept_id int) return number AS
  v_avg_sal number := 0;
  BEGIN
    print_test;
    select avg(salary) into v_avg_sal from employees_copy where
          department_id = p_dept_id;
    RETURN v_avg_sal;
  END get_avg_sal;
  
  function get_sal(e_id employees.employee_id%type) return number is
  v_sal number := 0;
  begin
    select salary into v_sal from employees where employee_id = e_id;
  end;
  
end;
```

### Package Initialization

- A package is loaded into the memory on the first call.
- Uninitialized variables are null by default.
- Oracle let’s us to initialize the variables with one more way.(inside the package body).
- The initialized variables will be overridden with that way.
- We can also do some business logic.
- We do that as the last begin-end block.

### Persistent state of packages

<aside>
💡 In PL/SQL, the persistent state of a package means that variables declared in the package specification or body retain their values across multiple calls within the same session. This allows me to maintain state throughout the session without reinitializing variables each time a package procedure or function is called. This feature is useful for things like counters or session-specific data, where I need to keep track of information across different operations. However, the state is session-specific, so it’s isolated from other sessions.

</aside>

- A package is loaded into the memory at the first reference.
- Variables and objects are stored in your PGA.
- These variables are persistent for your session.
- These variables are unique for your session.
- Subprograms of the packages are stored in the SGA.
- We can change the persistent state of variables.
- PRAGMA SERIALLY_REUSABLE
Serially reusable packages cannot be accessed from :
    - Triggers
    - Subprograms called from SQL Statements.

```sql
---------------------------------------------------------------------------------------------
----------------------------------PERSISTENT STATE OF PACKAGES-------------------------------
--------------------------------------------------------------------------------------------- 
----------------- 
execute dbms_output.put_line(constants_pkg.v_salary_increase);
grant execute on constants_pkg to my_user;
revoke execute on constants_pkg from my_user;
----------------- 
----------------- 
begin
  constants_pkg.v_company_name := 'ACME';
  dbms_output.put_line(constants_pkg.v_company_name);
  dbms_lock.sleep(20); 
end;
exec dbms_output.put_line(constants_pkg.v_company_name);
----------------- 
create or replace package constants_pkg is
PRAGMA SERIALLY_REUSABLE;
  v_salary_increase constant number:= 0.04;
  cursor cur_emps is select * from employees;
  t_emps_type employees%rowtype;
  v_company_name varchar2(20) := 'ORACLE';
end;
----------------- 
begin
  constants_pkg.v_company_name := 'ACME';
  dbms_output.put_line(constants_pkg.v_company_name);
  dbms_lock.sleep(20); 
end;
----------------- 
declare
v_emp employees%rowtype;
begin
 open constants_pkg.cur_emps;
 fetch constants_pkg.cur_emps into v_emp;
 dbms_output.put_line(v_emp.first_name);
 close constants_pkg.cur_emps;
end;
----------------- 
declare
v_emp employees%rowtype;
begin
 fetch constants_pkg.cur_emps into v_emp;
 dbms_output.put_line(v_emp.first_name);
end;
```

**Overview of Product-Specific Packages**

**About the DBMS_ALERT Package**

Package `DBMS_ALERT` lets you use database triggers to alert an application when specific database values change.

**About the DBMS_OUTPUT Package**

Package `DBMS_OUTPUT` enables you to display output from PL/SQL blocks, subprograms, packages, and triggers.

**About the DBMS_PIPE Package**

Package `DBMS_PIPE` allows different sessions to communicate over named pipes. (A *pipe* is an area of memory used by one process to pass information to another.) You can use the procedures `PACK_MESSAGE` and `SEND_MESSAGE` to pack a message into a pipe, then send it to another session in the same instance or to a waiting application such as a UNIX program.

At the other end of the pipe, you can use the procedures `RECEIVE_MESSAGE` and `UNPACK_MESSAGE` to receive and unpack (read) the message.

**About the HTF and HTP Packages**

Packages `HTF` and `HTP` allow your PL/SQL programs to generate HTML tags.

**About the UTL_FILE Package**

Package `UTL_FILE` lets PL/SQL programs read and write operating system (OS) text files. It provides a restricted version of standard OS stream file I/O, including open, put, get, and close operations.

**About the UTL_HTTP Package**

Package `UTL_HTTP` allows your PL/SQL programs to make hypertext transfer protocol (HTTP) callouts. It can retrieve data from the Internet or call Oracle Web Server cartridges. The package has two entry points, each of which accepts a URL (uniform resource locator) string, contacts the specified site, and returns the requested data, which is usually in hypertext markup language (HTML) format.

**About the UTL_SMTP Package**

Package `UTL_SMTP` allows your PL/SQL programs to send electronic mails (emails) over Simple Mail Transfer Protocol (SMTP). The package provides interfaces to the SMTP commands for an email client to dispatch emails to a SMTP server.

**Separating Cursor Specs and Bodies with Packages**

The scope of a packaged cursor is not limited to a PL/SQL block. When you open a packaged cursor, it remains open until you close it or you disconnect from the session.

# Triggers

What are triggers?

Triggers are PL/SQL blocks that execute before or after or instead of a specific event.

Triggers are executed automatically by the database server.

Where?

Triggers are defined on tables, views, schemas, databases.

Triggers are fired when one of these occurs:

When a DML(insert,update,delete) occurs

When a DDL (create, alter, drop ) occurs

When some database operations occur(logon, startup, servererror,…)

These are called as database triggers.

Application triggers are related with some applications like oracle forms,…

Why ?

Security: You can create triggers to secure your tables. With triggers, you can allow or reject the access to the tables or values.

Auditing: You can test the values to be inserted and allow or reject these operations.

Data Integrity: You can enforce the integrity constraints with the simple constraints but with triggers, you can implement more complex integrity rules.

Table logging: The Oracle server does not log your tables normally. You can use some tools to log your data, but the cheapest way is logging with using the triggers.

Event Logging: Normally, Oracle server logs the events explicitly. So you can use the triggers to log the events easily.

Derived Data: 

The only way to derive some data based on a collection of the data is using triggers. So you can have a brief of the data, or the result of computing different tables, etc., with using the triggers. Then, you can store these data into some other tables and report to your managers easily and faster.

Types:

DML Triggers

Compound Triggers

Non-DML Triggers: 

# Index

To get anything from a table we have to do full table scan.

**Analogy:** Instead of scanning through the entire book we can get specific pages from the index of the book.

INDEXES are nothing but a smaller subset of data along with its `row_id` information stored.

> **Definition:** An index is a schema object that contains an entry for each value  that appears in the indexed column of the table or cluster and provides direct, task access to rows. Oracle Database supports several types of index.
> 

<aside>
💡 When you drop a table all the associated indexes are also dropped. 
ORACLE WILL DO INDEX ONLY FOR NOT NULL VAL

</aside>

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/051e0ce8-5b8b-4896-82b8-6d13d8d78174/33b14d4b-1880-4107-934e-0e9fe08216c2/image.png)

**Types of Indexes**

B-tree index:- Created on a column where the data is widely distributed.

Bit map index:- On a column which has very less number of distinct value.

function based index:-  functions are used since if we use function after index creation, index won’t be used on that function.

reverse key index:- same as b-tree index values are reversed. Used to avoid index block contention.

domain index:- 

bitmap and b tree join index

index organized tables:- Storing the data itself in the sorted order of index.

descending index.

### **B-Tree Index:**

B-trees, short for balanced trees, are the most common type of database index. A B-tree index is an ordered list of values divided into ranges. By associating a key with a row or range of rows, B-trees provide excellent retrieval performance for a wide range of queries, including exact match and range searches.

**Where to find metadata information?**

```sql
select * from user_indexes where table_name='Employees';

select * from user_ind_columns where table_name='Employees';

select * from user_ind_statistics where table_name='Employees';

select * from user_ind_expressions where table_name='Employees';

select index_name,index_type from all_indexes where table_name='Employees';
```

**How to find whether index is used by the query?**

### Method 1: Using `EXPLAIN PLAN`

1. **Run `EXPLAIN PLAN`**:
    
    ```sql
    EXPLAIN PLAN FOR
    SELECT * FROM employees WHERE employee_id = 101
    ```
    
2. **View the Execution Plan**:
After running `EXPLAIN PLAN`, view the execution plan using:
    
    ```sql
    SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);
    ```
    
    In the output, if you see an operation like `INDEX RANGE SCAN` or `INDEX UNIQUE SCAN`, it indicates that an index is being used by the query.
    

### Method 2: Using `V$SQL_PLAN`

1. **Execute the Query**:
First, run the query that you want to check.
2. **Check the `V$SQL_PLAN` View**:
Find the SQL_ID of your query from `V$SQL`:
    
    ```sql
    SELECT sql_id, sql_text
    FROM v$sql
    WHERE sql_text LIKE '%your_query_text%';
    ```
    
    Use the `SQL_ID` to check the execution plan:
    
    ```sql
    SELECT operation, options, object_name
    FROM v$sql_plan
    WHERE sql_id = 'your_sql_id';
    ```
    
    Similar to the `EXPLAIN PLAN` output, look for operations such as `INDEX RANGE SCAN`, `INDEX UNIQUE SCAN`, etc.
    

**When to create b-tree index?**

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/051e0ce8-5b8b-4896-82b8-6d13d8d78174/7454db19-1fef-4ffb-8048-4962e5226d9e/image.png)

**What types of scan operations b-tree will do?**

Range scan :- don’t know how many records are there

unique scan :- knows there is only one record

full scan:- 

full scan (min/max):-

fast full scan:-

**Advantages and disadvantages**

performance improves in select part and degrades in DML statements.

### Bitmap:

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/051e0ce8-5b8b-4896-82b8-6d13d8d78174/ba488f10-56a8-4d51-8e02-ebe5ce195b76/image.png)

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/051e0ce8-5b8b-4896-82b8-6d13d8d78174/3039582d-66ee-491f-a1bd-d5297da8de7d/image.png)

**When to use?**

1 - Table column with low cardinality value(gender column, yes or no column, pass or fail…)
2 - Very less DML activity., preferably read only tables, (because updating bitmapped indexes takes lot of resources, and locks all the key column rows)
3 - Multiple low cardinality columns -SQL queries contains multiple low cardinality columns in the where clause.

**Why bitmap index is not recommended for application with high DML operations?**

If the indexed column in a single row is updated, then the database locks the index key entry (for example, M or F) and not the individual bit mapped to the updated row. Because a key points to many rows, DML on indexed data typically locks all of these rows. For this reason, bitmap indexes are not appropriate for many OLTP applications.

### Function based index

A **function-based** index computes the value of a function or expression involving one or more columns and stores it in an index. A function-based index can be either a B-tree or a bitmap index.

The indexed function can be an arithmetic expression or an expression that contains a SQL function, user-defined PL/SQL function, package function, or C callout. For example, a function could add the values in two columns.

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/051e0ce8-5b8b-4896-82b8-6d13d8d78174/36255801-f9b8-4bc0-8f4a-72c4236c656a/image.png)

**How to know whether index is used by sql?**
Explain plan.

**Uses of Function-Based Indexes**

Function-based indexes are efficient for evaluating statements that contain functions in their WHERE clauses. The database only uses the function-based index when the function is included in a query. When the database processes INSERT and UPDATE statements, however, it must still evaluate the function to process the statement.

### Reverse Key Index

It is a b-tree type index that physically reverses the bytes of each index key while keeping the column order.

**Advantage:** 

Index block contention.

**Disadvantage :**

Won’t be able to do index range scan once create the index.

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/051e0ce8-5b8b-4896-82b8-6d13d8d78174/492cf5a8-bf8d-46f5-b5cc-def2925c9ac2/image.png)

### When to choose what type of index?

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/051e0ce8-5b8b-4896-82b8-6d13d8d78174/d9c0821c-36df-4913-a65c-c4c42947385e/image.png)

### How to know index is being used?

Explain plan. It gives estimated plan. 
Actual plan will be getting from `V$sql_plan` .

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/051e0ce8-5b8b-4896-82b8-6d13d8d78174/7d3c135b-282c-4959-b54c-d95ce644628d/image.png)

### How to monitor index usage?

```sql
Alter index idx_empno monitoring usage;

select * from emp where empno=7788;
--stop monitoring
Alter index idx_empno Nomonitoring usage;
```

V$object_usage and dba_object_usage (new version)

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/051e0ce8-5b8b-4896-82b8-6d13d8d78174/21249052-d408-4117-8268-a32679c5664d/image.png)

**Benefits/drawbacks of index?**

**Benefits**

1. Performance improvement

**Drawbacks**

1. Index consumes considerable amount of space.
2. Index needs to be managed
3. DML performance might get impacted

# SUBQUERY

A Subquery is a query within another SQL query.( Inner query or a Nested query ). The Result returned by the inner query will be used as an input to outer

query. It can have any number of nesting.

Example:

Write a MySQL query to fetch even numbered records from employees table.

```sql
select * from (select e.*,ROW_NUMBER() OVER (order by e.employee_id) as rn from employees e) where mod(rn,2)=0;
```

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/051e0ce8-5b8b-4896-82b8-6d13d8d78174/c4c7085d-258c-4535-878c-ab787e4afded/image.png)

Non-corelated subquery inner query is executed first output is given as input to outer query and the result is computed.

Corelated subquery inner query is dependent on outer query.

How correlated subquery executes?

Both executes simultaneously loop continues until the entire results are populated.

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/051e0ce8-5b8b-4896-82b8-6d13d8d78174/8e285afa-1fa9-4097-987a-99696f0a4a30/image.png)

# Hints

Oracle hints are special instructions embedded within SQL queries to influence the execution plan chosen by the Oracle optimizer. Hints can improve query performance by guiding the optimizer to make specific decisions regarding how the query should be executed. 

Oracle optimizer hints can be broadly categorized in two classes: 1) real hints(they provide Oracle with pertinent information that it may not have when it executes a particular statement. The information provided manually, for instance a cardinality estimate of an object, may aid in the search for an optimal execution plan. ), and 2) instructions(The latter are really best called instructions or directives as they tell the optimizer what (not) to do).  

They are indicated by the plus sign in `/*+ SOME_HINT */`. Without the plus sign the comment would be just that: a comment. And the optimizer does not care about the comments you add to increase the quality or legibility of your code. With the plus sign, the optimizer uses it do determine the execution plan for the statement.
**When To Use Hints**
We recommend “hints […] be used sparingly, and only *after you have collected statistics on the relevant tables and evaluated the optimizer plan without hints* using the `EXPLAIN PLAN` statement.”
Some of the reasons include:

- For demonstrative purposes.
- To try out different execution plans in the development phase.
- To provide Oracle with pertinent information when no such information is available in statistics.
- To fix the execution plan when you are absolutely sure that the hints lead to a significant performance boost.

**When Not To Use Hints**

don’t use hints when

- what the hint does is poorly understood, which is of course not limited to the (ab)use of hints;
- you have not looked at the root cause of bad SQL code and thus not yet tapped into the vast expertise and experience of your DBA in tuning the database;
- your statistics are out of date, and you can refresh the statistics more frequently or even fix the statistics to a representative state;
- you do not intend to check the correctness of the hints in your statements on a regular basis, which means that, when statistics change, the hint may be woefully inadequate;
- you have no intention of documenting the use of hints anyway.

**Types of Hints**

Oracle classifies hints based on their function:

- Optimization goals and approaches;
- Access path hints;
- In-memory column store hints;
- Join order hints;
- Join operation hints;
- Parallel execution hints;
- Online application upgrade hints;
- Query tranformation hints;
- XML hints;
- Other hints.

In [Oracle Database 12c Performance Tuning Recipes](http://www.apress.com/9781430261872), the authors provide two additional types of hints:

- Data warehousing hints;
- Optimizer hints.

The data warehousing hints are actually included in Oracle’s query transformation hints.

Access path and query transformation hints are by far the largest two categories

**Optimization Goals and Approaches**

`ALL_ROWS` and `FIRST_ROWS( number_of_rows )`. These are mutually exclusive. If you happen to be drunk while programming and inadvertently write both hints in the same statement, Oracle will go with `ALL_ROWS`.
`ALL_ROWS` causes Oracle to optimize a statement for throughput, which is the minimum *total* resource consumption. 

The `FIRST_ROWS` hint does not care about the throughput and instead chooses the execution plan that yields the first `number_of_rows` specified as quickly as possible.

<aside>
💡 Oracle ignores `FIRST_ROWS` in all `DELETE` and `UPDATE` statements and in `SELECT` statement blocks that include sorts and/or groupings, as it needs to fetch all relevant data anyway.

</aside>

**Optimizer Hints**

`GATHER_PLAN_STATISTICS` hint, which can be used to obtain statistics about the execution plan during the execution of a statement. It is especially helpful when you intend to [diagnose performance issues](http://docs.oracle.com/database/121/ARPLS/d_xplan.htm#ARPLS378) with a particular statement. It is definitely not meant to be used in production instances!
`GATHER_OPTIMIZER_STATISTICS`, which Oracle lists under ‘Other hints’. It can be used to collect bulk-load statistics for CTAS statements and `INSERT INTO ... SELECT` statements that use a direct-path insert, which is accomplished with the `APPEND` hint, but more on that later.
The `OPTIMIZER_FEATURES_ENABLE` hint can be used to *temporarily* disable certain (newer) optimizer feature after database upgrades. This hint is typically employed as a short-term solution when a small subset of queries performs badly.
**Access Path Hints**

Access path hints determine how Oracle accesses the data you require. They can be divided into two groups: access path hints for tables and access path hints for indexes.
**Tables**
`FULL( tab_name )` hint, It instructs the optimizer to access a table by means of a full table scan. If the table you want Oracle to access with a full table scan has an alias in the SQL statement, you have to use the alias rather than the table name (without the schema name) as the parameter to `FULL`.

**Indexes**

- `INDEX` / `NO_INDEX`:The first pair instructs the optimizer to either use (or not use) an index scan on a particular table. If a particular index is specified, then Oracle uses that index to scan the table. If no index is specified and the table has more than one index, the optimizer picks the index that leads to the lowest cost when scanning the data. These hints are valid for any function-based, domain, B-tree, bitmap, and bitmap join index.
- `INDEX_ASC` / `INDEX_DESC:`you can tell the optimizer that it needs to scan the specified index in ascending order with `INDEX_ASC` or descending order with `INDEX_DESC` for statements that use an index range scan.
- `INDEX_FFS` / `NO_INDEX_FFS`: it indicates that Oracle use a fast full index scan instead of a full table scan
- `INDEX_SS` / `NO_INDEX_SS`:An index skip scan. For index range scans, Oracle scans index entries in ascending order if the index is in ascending order and in descending order if the index is in descending order.
- `INDEX_SS_ASC` / `INDEX_SS_DESC`: override the default scan order.
- `INDEX_COMBINE` / `INDEX_JOIN`:The first one causes the optimizer to use a bitmap access path for the table specified as its parameter. The second one joins the indexes to access data.

All these hints take at least one parameter: the table name or alias in the SQL statement. A second parameter, the index name(s), is optional but often provided. If more than one index is provided, the indexes are separated by at least one space; the `INDEX_COMBINE` hint is recommended for this use case though.
**Join Order Hints**

`ORDERED` takes no parameters and instructs the optimizer to join the tables in the order as they appear in the `FROM` clause.
`LEADING` hint. It takes the table names or aliases (if specified) as parameters, separated by spaces.
**Join Operation Hints**

- `USE_HASH` / `NO_USE_HASH`
- `USE_MERGE` / `NO_USE_MERGE`
- `USE_NL` / `NO_USE_NL`

**Parallel Execution Hints**

Not all SQL statements can be run in parallel. All DML statements, including subqueries, can be run in parallel, which means that multiple blocks can be selected, inserted, deleted, or updated simultaneously. For parallelized DDL statements, multiple blocks are being created/altered and written in parallel. The DDL statements that can be run in parallel are:

- `CREATE INDEX`
- `CREATE TABLE ... AS SELECT`
- `ALTER INDEX ... REBUILD`
- `ALTER INDEX ... [ REBUILD | SPLIT ] PARTITION`
- `ALTER TABLE ... MOVE`
- `ALTER TABLE ... [ MOVE | SPLIT | COALESCE ] PARTITION`

**Query Transformation Hints**

- [`USE_CONCAT`](https://docs.oracle.com/cd/B10500_01/server.920/a96533/hintsref.htm#6873)
- [`NO_EXPAND`](https://docs.oracle.com/cd/B10500_01/server.920/a96533/hintsref.htm#5399)
- [`REWRITE`](https://docs.oracle.com/cd/B10500_01/server.920/a96533/hintsref.htm#5416)
- [`EXPAND_GSET_TO_UNION`](https://docs.oracle.com/cd/B10500_01/server.920/a96533/hintsref.htm#9299)
- [`NOREWRITE`](https://docs.oracle.com/cd/B10500_01/server.920/a96533/hintsref.htm#11281)
- [`MERGE`](https://docs.oracle.com/cd/B10500_01/server.920/a96533/hintsref.htm#9205)
- [`NO_MERGE`](https://docs.oracle.com/cd/B10500_01/server.920/a96533/hintsref.htm#5487)
- [`STAR_TRANSFORMATION`](https://docs.oracle.com/cd/B10500_01/server.920/a96533/hintsref.htm#5511)
- [`FACT`](https://docs.oracle.com/cd/B10500_01/server.920/a96533/hintsref.htm#11693)
- [`NO_FACT`](https://docs.oracle.com/cd/B10500_01/server.920/a96533/hintsref.htm#6504)
