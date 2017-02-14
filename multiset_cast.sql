select * from user_objects where object_type='TYPE';

create or replace type enames_varr is VARRAY(200) of  varchar2(50);

select first_name from employees;

select cast(multiset (select first_name from employees) as enames_varr) from dual;

create table emp_coll( eid number, ename varchar2(100), esalary number(7,2), prev_comp enames_varr);

insert into emp_coll (eid,ename,esalary) select employee_id,first_name||' '||last_name,salary from employees where rownum<=50;

select * from emp_coll;

update emp_coll set PREV_COMP=enames_varr('HCL','Acccenture','Capgemini','Delloite','Tech Mahindara');


select * from emp_coll e where  'HCL' in (select * from table(E.PREV_COMP)) and e.eid <105;


declare
fav_comp enames_varr:=enames_varr('HCL','TCS','Infosys');
begin
for rec in (select column_value favs from table (fav_comp) order by column_value)
loop
dbms_output.put_line(rec.favs);
end loop;
end;
/

set serveroutput on