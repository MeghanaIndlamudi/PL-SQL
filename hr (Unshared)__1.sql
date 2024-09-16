with avg_salary as (select round(avg(salary),2) as avge_salary from employees)
select first_name,last_name,employee_id,avge_salary,salary-avge_salary from employees,avg_salary;

with avg_salary as(select round(avg(salary),2) as avge_salary from employees),
avg_dept as (select department_id,round(avg(salary),2) as avg_department from employees group by department_id)

select e.first_name,e.last_name,e.salary,avge_salary,avg_department from employees e join avg_dept ads 
on e.department_id=ads.department_id,avg_salary;

select * from employees;
with annual_sala as (select Extract(year from hire_date) as yearly,sum(salary) as tot_sal from employees group by Extract(year from hire_date))
select e.first_name,e.last_name,a.yearly,a.tot_sal from employees e JOIN 
    annual_sala a
    ON EXTRACT(YEAR FROM e.hire_date) = a.yearly;

with dept_details as (select department_id,department_name as dn from departments)
select e.*,dd.dn from employees e join dept_details dd on dd.department_id=e.department_id; 

with sal as (select round(avg(salary),2) as avgsal,department_id as did from employees group by department_id)
select s.did,d.department_name,s.avgsal from sal s join departments d on (s.did=d.department_id);

WITH job_hist_count AS (
    SELECT EMPLOYEE_ID, COUNT(*) AS job_count
    FROM JOB_HISTORY
    GROUP BY EMPLOYEE_ID
)
SELECT e.FIRST_NAME, e.LAST_NAME, jh.job_count
FROM job_hist_count jh
JOIN EMPLOYEES e ON jh.EMPLOYEE_ID = e.EMPLOYEE_ID
WHERE jh.job_count > 1;
