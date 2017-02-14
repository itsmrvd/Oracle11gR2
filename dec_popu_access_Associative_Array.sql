declare
type emp_ty is table of employees%rowtype index by pls_integer;
emp_list emp_ty;
i pls_integer;
row pls_integer;
begin

--select bulk collect into emp_list from employees;

-- Fetch from database
for rec in (select * from employees)
loop
emp_list(rec.employee_id):=rec;
end loop;

--Trying to print all the record using FIRST and LAST if collection is dense other wise it will cause NO_DATA_FOUND EXCEPTION
------------------------------------------------------
dbms_output.put_line('Display when collection is densely populated');
for i in emp_list.FIRST .. emp_list.LAST LOOP
dbms_output.put_line(i||' '||emp_list(i).employee_id||' '||emp_list(i).First_name||' '||emp_list(i).last_name);
end loop;

EXCEPTION

--Printing Using FIRST and NEXT when NO_DATA_FOUND exception occours i.e. in case of sparse collections
when no_data_found then
dbms_output.put_line(null);
dbms_output.put_line('Display when collection is sparse');
row := emp_list.FIRST;
while row is not null
loop
dbms_output.put_line(row||' '||emp_list(row).employee_id||' '||emp_list(row).First_name||' '||emp_list(row).last_name);
row:= emp_list.next(row);
end loop;
end;
/
set serveroutput on



select * from employees where employee_id=111;

delete from employees where employee_id=111;

select * from employees;
