select * from student_jibe
where english > 
(
	select english from student_jibe
	where roll = 100
)

select * from student_jibe

select standard, count(*) as count 
from student_jibe
group by standard
having count(*) > (
	select count(*) from student_jibe 
	where standard = 4
)

select roll, sname, english+maths+science as total from student_jibe 
where english+maths+science > (
		select max(english+maths+science) as maximum from student_jibe
		where standard = 5
	)
	and standard = 6

select * from student_jibe
where standard = 6
	and english > any
	(
		select min(english) from student_jibe
		where standard = 5
	)

select * from student_jibe
where standard = 6
	and english > any
	(
	 select english from student_jibe
	 where standard = 5
	)

SELECT OID FROM CARS


SELECT DISTINCT(OID) FROM CARS
WHERE OID IS NOT NULL

SELECT * FROM OWNERS
WHERE OID IN (
		SELECT DISTINCT(OID) FROM CARS
		WHERE OID IS NOT NULL
	)

SELECT * FROM OWNERS
WHERE OID NOT IN (
		SELECT DISTINCT (OID) FROM CARS
		WHERE OID IS NOT NULL
	)


SELECT STANDARD, RESULT, COUNT(*) FROM 
(
 SELECT STANDARD,
	CASE 
		WHEN ISNULL(ENGLISH, 0) + MATHS + SCIENCE >= 100 THEN 'PASS'
	ELSE 'FAIL' END AS RESULT
	FROM STUDENT_JIBE
) AS T
GROUP BY STANDARD, RESULT
ORDER BY STANDARD, RESULT

SELECT * FROM STUDENT_JIBE
WHERE MATHS = (
	SELECT MAX(MATHS) FROM STUDENT_JIBE
)

SELECT * FROM STUDENT_JIBE S
WHERE MATHS > (
	SELECT AVG(MATHS) FROM STUDENT_JIBE
	WHERE STANDARD = S.STANDARD
)	

SELECT * FROM STUDENT_JIBE S
WHERE MATHS > (
	SELECT AVG(MATHS) FROM STUDENT_JIBE
	GROUP BY STANDARD
	HAVING AVG(MATHS) > S.MATHS
)

SELECT SNAME, MATHS, S.STANDARD 
FROM STUDENT_JIBE S 
INNER JOIN (
	SELECT STANDARD, CAST(AVG(MATHS) AS DECIMAL(5,2)) AS AV
	FROM STUDENT_JIBE 
	GROUP BY STANDARD 
) AS T ON S.STANDARD = T.STANDARD 
WHERE S.MATHS > T.AV
WITH CTE AS (
	SELECT STANDARD, CAST(AVG(MATHS) AS DECIMAL(5,2)) AS AV
	FROM STUDENT_JIBE
	GROUP BY STANDARD 
)

SELECT SNAME, MATHS, S.STANDARD 
FROM STUDENT_JIBE 





