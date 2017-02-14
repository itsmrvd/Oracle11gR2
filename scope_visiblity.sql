set serveroutput on

declare
x number := 5;
begin
dbms_output.put_line(x);
declare
x number := 10;
begin
dbms_output.put_line(x);
end;
dbms_output.put_line(x);
end;
/

<<outer>>
declare
x number := 5;
begin
dbms_output.put_line(x);

<<inner>>
declare
x number := 10;
begin
dbms_output.put_line(outer.x||' '||inner.x);
end;

dbms_output.put_line(x);
end;
/

declare
x number := 5;
begin
dbms_output.put_line(x);
declare
y number := 10;
begin
x:= y + 5;
dbms_output.put_line(x||' '||y);
end;
dbms_output.put_line(x);
end;
/

