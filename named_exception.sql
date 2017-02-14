set serveroutput on
declare
eid employees.employee_id%type :=&ID;
ename varchar2(50);
stmt varchar2(200);

--Declare Exception
invalid_id exception;

begin
if eid <= 0 then

--Raising Exception
raise invalid_id;

end if;

stmt:='select first_name||'' ''||last_name into :empname from employees where employee_id=:empid';
EXECUTE IMMEDIATE stmt into ename using eid;
dbms_output.put_line(ename);

--Exception Block
exception
when invalid_id then
dbms_output.put_line('Invalid id entered.');
when no_data_found then
dbms_output.put_line('Employee doesn''t exist.');
end;
/