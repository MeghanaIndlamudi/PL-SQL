set serveroutput on;
select * from user_indexes where table_name='Employees';

select * from user_ind_columns where table_name='Employees';

select * from user_ind_statistics where table_name='Employees';

select * from user_ind_expressions where table_name='Employees';

select * from employees;

select index_name,index_type from all_indexes where table_name='Employees';

drop index idx_bitmap;

create index idx_btree on employees(employee_id);

create bitmap index idx_bitmap on employees(department_id);

create index idx_func on employees(upper(first_name));

create index idx_revkey on employees(salary) reverse;

create index idx_comp on employees(job_id,department_id);


select /*+PArallel*/ * from employees;

create table temp as select * from employees;

EXPLAIN PLAN FOR
SELECT * FROM employees WHERE employee_id = 101;

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

INSERT /*+APPEND*/ into temp select /*+Cache*/ * from employees; 

commit;

select /*+Parallel*/ * FROM temp;

Explain plan for 
select /*+Parallel*/ * FROM temp;

select * from table(dbms_xplan.display);

select * from employees where employee_id=101;
SELECT * FROM v$sql WHERE sql_text LIKE '%FROM employees WHERE employee_id=101%';