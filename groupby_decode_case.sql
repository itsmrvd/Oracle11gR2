CREATE TABLE txn_log
  (
    acc     NUMBER(8,0),
    curr    VARCHAR2(3),
    crdr    VARCHAR2(1),
    forcurr NUMBER(8,2),
    loccurr NUMBER(8,2)
  );

INSERT ALL
INTO txn_log VALUES(3123456,'INR','C',NULL,1500)
INTO txn_log VALUES(5123456,'USD','C',1000,NULL)
INTO txn_log VALUES(3123456,'INR','D',NULL,500)
INTO txn_log VALUES(3123456,'INR','C',NULL,200)
INTO txn_log VALUES(5123456,'USD','D',300,NULL)
INTO txn_log VALUES(7123456,'EUR','C',800,NULL)
SELECT * FROM dual;

select * from txn_log;

select acc,
curr,
sum(case (curr)
when 'INR' THEN Decode(crdr,'C',loccurr,-loccurr)
else
decode(crdr,'C',forcurr,-forcurr)
end)  as Balance
from txn_log
group by acc,curr;