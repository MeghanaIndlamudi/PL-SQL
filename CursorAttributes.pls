--UNDERSTANDING
--We said that, if our cursor is not open, open it.So it entered to the if block. So we saw the hello text. Then we used %rowcount attribute.
--But, we haven’t fetched any rows yet. So it returned 0. Because the number of fetched rows are 0 for now. Then, we fetched one row and printed the rowcount. So it printed 1 since we fetched only 1 row. Then, we printed the rowcount again. Since we haven’t fetched any more row, it printed 1 again.
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
