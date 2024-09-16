set serveroutput on
declare

lv_int1 interval year to month;
lv_int2 interval year to month;
lv_int3 interval year to month;
--lv_int1 interval year to month;

begin

--lv_int1:='01-06';
--lv_int2:='01-08';
--select lv_int1+lv_int2 into lv_int3 from dual;
--dbms_output.put_line('lv_int3 =  '||lv_int3);

lv_int1:='01-06';
lv_int2:=null;
select lv_int1+nvl(lv_int2,'00-00') into lv_int3 from dual;
dbms_output.put_line('lv_int3 =  '||lv_int3);
end;
