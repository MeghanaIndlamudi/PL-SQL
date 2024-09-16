----Creating type in database
--create type e_list is varray(5) of varchar(50);
--declare 
--type e_list is varray(5) of varchar(50);
--employees e_list;
--begin 
--employees:= e_list('Alex','Bruce','John','Bob','Richard');
--for i in 1..5 loop
--dbms_output.put_line(employees(i));
--end loop;
--end;
--
--declare 
--type e_list is varray(5) of varchar(50);
--employees e_list;
--begin 
--employees:= e_list('Alex','Bruce','John','Bob','Richard');
--for i in 1..employees.count() loop
--dbms_output.put_line(employees(i));
--end loop;
--end;
--
--declare 
--type e_list is varray(5) of varchar(50);
--employees e_list;
--begin 
--employees:= e_list('Alex','Bruce','John','Bob','Richard');
--for i in employees.first()..employees.last() loop
--dbms_output.put_line(employees(i));
--end loop;
--end;
--
--declare 
--type e_list is varray(5) of varchar(50);
--employees e_list;
--begin 
--employees:= e_list('Alex','Bruce','John','Bob');
--for i in 1..5 loop
--if employees.exists(i) then 
--dbms_output.put_line(employees(i));
--end if;
--end loop;
--end;
--
--declare 
--type e_list is varray(5) of varchar(50);
--employees e_list;
--begin 
--employees:= e_list('Alex','Bruce','John','Bob','Richard');
--dbms_output.put_line(employees.limit());
--end;
--
--declare 
--type e_list is varray(5) of varchar(50); 
--employees e_list := e_list('Alex','Bruce','John','Bob','Richard');
--begin
--dbms_output.put_line(employees.limit()); 
--end;
--
--declare 
--type e_list is varray(15) of varchar2(50);
--employees elist:=e_list();
--idx number :=1;
--begin 
--for i in 100..110 loop
--employees.extend;
--select first_name into employees(idx) from employees where employee_id =i;
--idx:=idx+1;
--end loop;
--for x in 1..employees.count() loop
--dbms_output.put_line(employees(x));
--end loop;
--end;

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