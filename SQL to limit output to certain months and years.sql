/*
*	Problem Statement:
*	I'm trying to write an SQL statement that only displays employees hired from certain months like April and May as well as exclude employees hired in certain years, but I'm having trouble finding any resources online that explain how to do this. I'm using Oracle SQL so the YEAR and MONTH commands I have used are met with invalid identifier. This is what I have so far.
*
*	 SELECT EMPLOYEE_ID, 
*	        SUBSTR(LAST_NAME || ' ' || FIRST_NAME, 1, 25) AS "Full Name", 
*	        JOB_ID,
*	        TO_CHAR(last_day(hire_date), 'Month fmDd"st" "of" YYYY') AS "Start Date"
*	 FROM EMPLOYEES
*	 WHERE HIRE_DATE NOT IN ('01-01-1992' TO_DATE('12-31-1992'));
 */


SELECT EMPLOYEE_ID, SUBSTR(LAST_NAME || ' ' || FIRST_NAME, 1, 25) AS "Full Name",
JOB_ID,
TO_CHAR(hire_date, 'Month fmDd"th" "of" YYYY') AS "Start Date"
FROM EMPLOYEES 
WHERE HIRE_DATE NOT 
BETWEEN TO_DATE('01-01-1992','MM-DD-YYYY') 
    AND TO_DATE('12-31-1992','MM-DD-YYYY') 
AND TO_NUMBER(TO_CHAR(hire_date,'mm')) in (4,5);
