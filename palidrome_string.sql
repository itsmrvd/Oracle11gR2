CREATE OR REPLACE FUNCTION IS_PALINDROME(
    in_str VARCHAR2)
  RETURN BOOLEAN
  /*
  AUTHOR  : L30
  DATE    : 20181021
  PURPOSE : CHECK IF INPUT STRING IS A PALINDROME
  INPUT   : VARCHAR2
  OUTPUT  : BOOLEAN
  
  STUB    :
  BEGIN
  IF IS_PALINDROME('MALAYALAM') THEN
  dbms_output.put_line('IS PALINDROME.');
  ELSE
  dbms_output.put_line('ISN''T PALINDROME.');
  END IF;
  END;
  */
IS
  is_palin BOOLEAN:= TRUE;
  l_len BINARY_INTEGER;
  l_half_len BINARY_INTEGER;
BEGIN
  l_len      := LENGTH(in_str);
  l_half_len := TRUNC(l_len/2);
  FOR indx                IN REVERSE 1 .. l_half_len
  LOOP
    IF SUBSTR(in_str,indx,1) <> SUBSTR(in_str,l_len - indx + 1 ,1) THEN
      is_palin               := FALSE;
      EXIT;
    END IF;
  END LOOP;
RETURN is_palin;
END;
/

