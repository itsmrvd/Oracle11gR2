set serveroutput on
declare
"pi" number :=5;
"PI" number :=10;
"p i" number := 2 * "pi";
begin
DBMS_OUTPUT.PUT_LINE("pi"||' '||"PI"||' '|| "p i");
"p i" := 2 * "PI";
DBMS_OUTPUT.PUT_LINE("pi"||' '||"PI"||' '|| "p i");
END;
