set serveroutput on
declare
str varchar2(2) := '';
begin
if str is null then
DBMS_OUTPUT.PUT_LINE('str is null');
else
DBMS_OUTPUT.PUT_LINE('str is not null');
end if;
end;
/

declare
str varchar2(2) := '';
begin
if str is null then
DBMS_OUTPUT.PUT_LINE('str is null');
elsif str = '' then
DBMS_OUTPUT.PUT_LINE('str is blank');
else
DBMS_OUTPUT.PUT_LINE('str is not null');
end if;
end;
/