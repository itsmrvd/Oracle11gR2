DECLARE
----------------------------- Implementation I ---------------------------------
--  CURSOR emp_cur
--  IS
--    SELECT * FROM employees;
--TYPE emp_ty
--IS
--  TABLE OF employees%ROWTYPE;
--  my_emps emp_ty;
----------------------------- Implementation II --------------------------------
--  CURSOR emp_cur
--  IS
--    SELECT employee_id, first_name, last_name FROM employees;
--type emp_rec
--IS
--  RECORD
--  (
--    employee_id NUMBER,
--    first_name  VARCHAR2(30),
--    last_name   VARCHAR2(30) );
--TYPE emp_ty
--IS
--  TABLE OF emp_rec;
--  my_emps emp_ty;
----------------------------- Implementation III -------------------------------
  CURSOR emp_cur
  IS
    SELECT employee_id, first_name, last_name FROM employees;
TYPE emp_ty
IS
  TABLE OF emp_cur%ROWTYPE;
  my_emps emp_ty;
--------------------------------------------------------------------------------
BEGIN
  OPEN emp_cur;
  LOOP
    FETCH emp_cur bulk collect INTO my_emps limit 30;
    FOR indx IN 1 .. my_emps.COUNT
    LOOP
      dbms_output.put_line(lpad(indx,3,' ')||' : '||lpad(my_emps(indx).employee_id,3,' ')||' : '||my_emps(indx).first_name||' '||my_emps(indx).last_name);
    END LOOP;
    EXIT
  WHEN my_emps.count = 0;
  END LOOP;
  CLOSE emp_cur;
EXCEPTION
  WHEN OTHERS THEN
    dbms_output.put_line('Unknown Error Occoured: '||SQLCODE||' : '||SQLERRM);
END;
/

