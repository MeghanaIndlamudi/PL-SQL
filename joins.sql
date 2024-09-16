/*Joins*/

--1.Write a SQL query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments.
--Hint : Use NATURAL JOIN.

select l.location_id, l.street_address, l.city, l.state_province, c.country_name from locations l inner join countries c on l.country_id=c.country_id order by location_id asc;

--2. Write a SQL query to find the name (first_name, last name), department ID and name of all the employees.

select e.first_name,e.last_name,d.department_id,d.department_name from employees e inner join departments d on e.department_id=d.department_id;

--3. Write a SQL query to find the name (first_name, last_name), job, department ID and name of the employees who works in London.

select e.first_name,e.last_name,e.job_id,d.department_id,d.department_name from employees e join departments d on e.department_id=d.department_id join locations l on l.location_id=d.location_id where l.city='London' ;

--4. Write a SQL query to find the employee id, name (last_name) along with their manager_id and name (last_name).

select e1.employee_id Emp_Id,e1.last_name Employee,e2.employee_id Mgr_Id,e2.last_name Manager from employees e1 join employees e2 on (e1.manager_id=e2.employee_id) order by Emp_Id asc;

--5. Write a SQL query to find the name (first_name, last_name) and hire date of the employees who was hired after 'Jones'.

select * from employees where last_name='Jones';

select e.first_name,e.last_name,e.hire_date from employees e join employees e2 on(e2.last_name='Jones') where e2.hire_date < e.hire_date order by e.hire_date;

--6.Write a SQL query to get the department name and number of employees in the department.

select count(e.department_id),d.department_name from employees e join departments d on(e.department_id=d.department_id) group by d.department_name order by d.department_name asc;

--7.Write a SQL query to find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90.


select jh.employee_id,j.job_title,(jh.end_date-jh.start_date) as job_duration from job_history jh join jobs j on (jh.job_id=j.job_id) where jh.department_id=90;

--8. Write a SQL query to display the department ID and name and first name of manager.

select d.department_id,d.department_name,e.first_name from employees e join departments d on (e.employee_id=d.manager_id) order by e.department_id asc;

--9. Write a SQL query to display the department name, manager name, and city.

select d.department_name,concat(e.first_name,e.last_name) as manager_name,l.city from departments d join employees e on(d.manager_id=e.employee_id) join locations l on (d.location_id=l.location_id); 

--10. Write a SQL query to display the job title and average salary of employees.

select j.job_title,avg(e.salary) from employees e join jobs j on (e.job_id=j.job_id) group by j.job_title order by j.job_title;

--11.Write a SQL query to display job title, employee name, and the difference between salary of the employee and minimum salary for the job.

select j.job_title,e.first_name,e.last_name,(e.salary-j.min_salary) from employees e join jobs j on (e.job_id=j.job_id);

--12. Write a SQL query to display the job history that were done by any employee who is currently drawing more than 10000 of salary.

select j.* from job_history j join employees e on(e.employee_id =j.employee_id) where e.salary>=10000;

--13. Write a SQL query to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years.

select e.first_name,e.last_name,d.department_name,e.hire_date,e.salary from employees e join departments d on(e.employee_id=d.manager_id) where (sysdate-e.hire_date)/365>15;

--