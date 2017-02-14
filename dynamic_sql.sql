--Dynamic SQL in PL/SQL

--Static SQL    Compile Time  Embedded SQL
--Dynamic SQL   Run Time

-- 3 kinds of statements:
--Dynamic DML   (select, delete, insert, update)
--Dynamic DDL   (Drop table, create procedure etc.)
      -- 'DROP '||l_type||' '||l_name
--Dynamic PLSQL (Dynamic anonymous PLSQL blocks, constructed, compiled and executed at run time)
      -- 'BEGIN '||l_proc_name||' ('||l_parameters||' ); END;'
      
-- 4 Dynamic sql methods
--      1> ddl/DML without bind variables
--          execute immediate string
--      2> dml with fixed no. of bind variables
--          execuete immediate string using
--      3> query with fixed no. of expressions in select list
--          execute immediate string into
--      4> query with dynamic no. of expressions in select list or dml with dynamic no. of bind variables
--          DBMS_SQL pkg

declare
stmt varchar2(100) := 'DROP ';      
l_type varchar2(20);
l_name varchar2(20);
begin
l_type := '&ENTER_TYPE';
l_name := '&ENTER_NAME';
stmt := stmt || l_type ||' '|| l_name;
dbms_output.put_line(stmt);
EXECUTE IMMEDIATE stmt;
end;
/
