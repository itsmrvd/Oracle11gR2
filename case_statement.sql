SELECT * FROM EMPLOYEES;
set serveroutput on
declare
sal employees.salary%type;
BEGIN
select salary into sal from employees where employee_id=&EMP_ID;
case TRUE
  when sal>20000 then
  DBMS_OUTPUT.PUT_LINE('> 20000');
  when sal>10000 then
  DBMS_OUTPUT.PUT_LINE('> 10000');
  else
  DBMS_OUTPUT.PUT_LINE('< 10000');
end case;
END;
/

declare
last_digit number(1);
begin
select MOD(to_number(substr(phone_number,-1,1)),2) into last_digit from employees where employee_id =&EMP_ID;
case last_digit
  when 0 then
  dbms_output.put_line('Number is even.');
  when 1 then
  dbms_output.put_line('Number is odd.');
  else
  dbms_output.put_line('Invalid number');
end case;
end;
/

--SEARCHED CASE STATEMENT
declare
last_digit number(1);
begin
select MOD(to_number(substr(phone_number,-1,1)),2) into last_digit from employees where employee_id =&EMP_ID;
case 
  when last_digit=0 then
  dbms_output.put_line('Number is even.');
  when last_digit=1 then
  dbms_output.put_line('Number is odd.');
  else
  dbms_output.put_line('Invalid number');
end case;
end;
/