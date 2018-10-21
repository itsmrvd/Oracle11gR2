DECLARE
  CURSOR emp_cur
  IS
    SELECT * FROM employees WHERE rownum<3;
  emp_rec employees%ROWTYPE;
BEGIN
  ------------------------------------------------------------------------------
  dbms_output.put_line('START');
  IF emp_cur%ISOPEN THEN
    dbms_output.put_line('cursor is open');
  ELSE
    dbms_output.put_line('cursor is not open');
  END IF;
  OPEN emp_cur;
  dbms_output.put_line('CURSOR OPENED');
  dbms_output.put_line('rowcount: '||emp_cur%ROWCOUNT);
  IF emp_cur%ISOPEN THEN
    dbms_output.put_line('cursor is open');
  ELSE
    dbms_output.put_line('cursor is not open');
  END IF;
  ------------------------------------------------------------------------------
  FETCH emp_cur
  INTO emp_rec;
  dbms_output.put_line('FETCH');
  dbms_output.put_line('rowcount: '||emp_cur%ROWCOUNT);
  dbms_output.put_line(emp_rec.employee_id||' :: '||emp_rec.first_name);
  FETCH emp_cur INTO emp_rec;
  dbms_output.put_line('FETCH');
  dbms_output.put_line('rowcount: '||emp_cur%ROWCOUNT);
  IF emp_cur%NOTFOUND THEN
    dbms_output.put_line('cursor notfound');
  ELSE
    dbms_output.put_line('cursor not notfound');
  END IF;
  IF emp_cur%FOUND THEN
    dbms_output.put_line('cursor found');
  ELSE
    dbms_output.put_line('cursor not found');
  END IF;
  dbms_output.put_line(emp_rec.employee_id||' :: '||emp_rec.first_name);
  FETCH emp_cur INTO emp_rec;
  dbms_output.put_line('FETCH');
  dbms_output.put_line('rowcount: '||emp_cur%ROWCOUNT);
  IF emp_cur%NOTFOUND THEN
    dbms_output.put_line('cursor notfound');
  ELSE
    dbms_output.put_line('cursor not notfound');
  END IF;
  IF emp_cur%FOUND THEN
    dbms_output.put_line('cursor found');
  ELSE
    dbms_output.put_line('cursor not found');
  END IF;
  dbms_output.put_line(emp_rec.employee_id||' :: '||emp_rec.first_name);
  ------------------------------------------------------------------------------
  CLOSE emp_cur;
  dbms_output.put_line('CURSOR CLOSED');
  IF emp_cur%ISOPEN THEN
    dbms_output.put_line('cursor is open');
  ELSE
    dbms_output.put_line('cursor is not open');
  END IF;
  ------------------------------------------------------------------------------
END;
/

