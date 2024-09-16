create table Friends(Name char(10),age Integer,grad date, Place VARCHAR2(20));

INSERT INTO FRIENDS(name,age,grad,place) values ('Meghana',23,TO_DATE('08/17/2024','MM/DD/YYYY'),'los angeles');
INSERT INTO FRIENDS(name,age,grad,place) values ('Sreeja',24,TO_DATE('05/14/2025','MM/DD/YYYY'),'Missourri');
INSERT INTO FRIENDS(name,age,grad,place) values ('Swetha', 25,TO_DATE('12/14/2024','MM/DD/YYYY'),'Los angeles');
INSERT INTO FRIENDS(name,age,grad,place) values ('Nidhi', 24,TO_DATE('05/14/2022','MM/DD/YYYY'),'banglore');
INSERT INTO FRIENDS(name,age,grad,place) values ('Vamshi', 25,TO_DATE('05/14/2024','MM/DD/YYYY'),'Los angeles');
INSERT INTO FRIENDS(name,age,grad,place) values ('Likhitha', 25,TO_DATE('12/14/2024','MM/DD/YYYY'),'Los angeles');
INSERT INTO FRIENDS(name,age,grad,place) values ('Praneeth', 25,TO_DATE('05/14/2024','MM/DD/YYYY'),'Los angeles');


select * from Friends;

select * from Employees;
select * from departments;
select * from locations;
select * from countries;
select * from regions;
select * from Jobs;
select * from job_history;

Alter table friends add constraint friends_pk primary key(name);

select name, Extract(year from grad) as gradyear from friends;

rename friends to close_friends;

alter table close_friends add state varchar2(10); 

alter table close_friends add ID Integer;

create table new_close_friends(Id Integer,Name char(10) primary key
,age Integer,grad date, Place VARCHAR2(20));

Insert into new_close_friends(Name,age,grad, Place) 
select Name,age,grad, Place from close_friends;

drop table close_friends;

select * from new_close_friends;

rename new_close_friends to friends;

select * from friends;

alter table friends modify id number;

select * from friends;

alter table friends add city VARCHAR2(10);
alter table friends drop column city;

alter table friends rename column place to city;

alter table friends drop constraint SYS_C008506;

alter table friends add constraint friend_pk primary key(Id,name);


select constraint_name from user_constraints where table_name='friends';

SELECT table_name
FROM user_tables
WHERE table_name = 'FRIENDS';

SELECT constraint_name
FROM user_constraints
WHERE table_name = 'FRIENDS' and constraint_type='P';

alter table friends drop constraint friend_pk;

select table_name from user_tables;

alter table job_history add constraint fk_job_id 
FOREIGN key (job_id) references
jobs(job_id);

select constraint_name,constraint_typE from user_constraints where table_name='JOB_HISTORY';

SELECT index_name
FROM user_indexes
WHERE table_name = 'JOB_HISTORY';
  
drop index JHIST_JOB_IX;

create index JHIST_JOB_IX on job_history(job_id);

select column_name,comments from user_col_comments;

(select first_name,last_name,salary from employees where salary>(select salary as salaryb from employees where last_name='Bull'));

select first_name,last_name from employees e join departments d on e.department_id=d.department_id
where department_name='IT';

select first_name,last_name from employees where department_id in (select department_id from departments where department_name='IT');

select first_name,last_name from employees 
where manager_id in(select employee_id 
from employees where department_id 
in(select department_id from departments where location_id 
in (select location_id from locations where country_id='US')));

select first_name,last_name from employees where employee_id in (select manager_id from employees);

select first_name,last_name,salary from employees where salary>(select avg(salary) from employees);

select first_name,last_name ,salary from employees where salary in (select Min_salary from jobs where job_id in (select job_id from employees));

select first_name,last_name,salary from employees where salary >(select avg(salary) from employees) and department_id in (select department_id from departments where department_name like 'IT%');

select first_name,last_name from employees where salary >(select salary from employees where last_name='Bell');

select * from employees where salary in(select min(salary) from employees where department_id in (select department_id from departments));

select * from employees where salary> all(select avg(salary) from employees group by department_id );

select first_name,last_name ,salary from employees where salary >All(select salary from employees where job_id='SH_CLERK') order by salary asc;

select e1.first_name,e1.last_name from employees e1 where not exists (select 'X' from employees e2 where e2.manager_id=e1.manager_id);

select e.employee_id,e.first_name,e.last_name,d.department_name from employees e,departments d where d.department_id in(select e.department_id from employees) order by department_name;

SELECT employee_id, first_name, last_name, 
(SELECT department_name FROM departments d
 WHERE e.department_id = d.department_id) department 
 FROM employees e ORDER BY department;
 
select employee_id,first_name,last_name from employees e1 where salary >(select avg(salary) from employees e2 where e1.department_id=e2.department_id);

select * from (select e.*,ROW_NUMBER() OVER (order by e.employee_id) as rn from employees e) where mod(rn,2)=0;

select salary from (select salary, DENSE_RANK() OVER (order by salary desc) as rank from employees) where rank=5;

select DIStinct(salary) from (select salary, DENSE_RANK() OVER (order by salary asc) as rank from employees) where rank=4;

select * from (select e.*, ROW_NUMBER() OVER(order by employee_id desc) as row_num from employees e) where row_num<=10;

select d.* from departments d where d.department_id not in (select e.department_id from employees e where e.department_id=d.department_id); 

select distinct(salary) from (select salary,DENSE_RANK() OVER(order by salary desc)as rank from employees) where rank<=3;

select distinct(salary) from (select salary,DENSE_RANK() OVER(order by salary asc)as rank from employees) where rank<4;

select * from (select e.*,DENSE_RANK() OVER(order by salary desc)as rank from employees e) where rank=:n;

select count(Distinct(job_id)) from employees;

select sum(salary) from employees;

select min(salary) from employees;

select max(salary) from employees where job_id='IT_PROG';

select count(*), avg(salary) from employees where department_id=90;

select round(max(salary),0),round(min(salary),0),round(sum(salary),0),round(avg(salary),0) from employees;

select count(*),job_id from employees group by job_id; 

select round(max(salary)-min(salary)) from employees;

select min(salary),manager_id from employees where manager_id is not null group by manager_id order by min(salary) desc;

select department_id,sum(salary) from employees where department_id is not null group by department_id;

select avg(salary),job_id from employees where Job_id<>'IT_PROG' group by job_id;

select sum(salary),max(salary),min(salary),avg(salary),job_id from employees where department_id=90 group by job_id;

select job_id,max(salary)from employees group by job_id having max(salary)>=4000;

select round(avg(salary),2),department_id,count(*) from employees group by department_id having count(employee_id)>10;