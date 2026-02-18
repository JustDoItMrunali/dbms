--coalesce -> example
select * from prices;

SELECT PNAME,
case when mrp is null and sp is null and op is null then ap+1
when mrp is null and sp is null then op+2
when mrp is null then sp+3
else mrp end as price
from prices

select pname , coalesce(mrp, sp+3, op+2, ap+1) as price from prices;

select 123+'68';
select 123+'68abc';

SELECT 
    sname, 
    dob,
    CASE 
        WHEN MONTH(dob) = MONTH(GETDATE()) THEN 'Birthday Month'
        WHEN MONTH(dob) = MONTH(GETDATE()+1) THEN 'Next Month'
        ELSE 'BIRTHDAY IN '+ Upper(DATENAME(month, dob))
    END AS birthdayStatus
FROM student_jibe;

--convert is faster than format
SELECT CONVERT( VARCHAR , GETDATE(), 103);
SELECT CONVERT( VARCHAR , GETDATE(), 101);
SELECT CONVERT( VARCHAR , GETDATE(), 120);

SELECT COUNT(english), count (*) from student_jibe;
select avg(english), sum(english) / count(*) as calc_avg from student_jibe;
select count(isnull(english,0)), count(*) from student_jibe;


select * from student_jibe;

select max(maths) from student_jibe
where address='pune' and standard=6;