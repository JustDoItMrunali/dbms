select * from student_jibe

SELECT 
    sname, 
    english,
    ROUND(AVG(maths) OVER (
        ORDER BY roll
        ROWS BETWEEN 4 PRECEDING AND CURRENT ROW
    ), 2) AS moving_avg_4
FROM student_jibe
WHERE standard = 5 
  AND division = 'A';


  SELECT 
    sname, 
    english,
    ROUND(AVG(maths) OVER (
        ORDER BY roll
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ), 2) AS running_total
FROM student_jibe
WHERE standard = 5 AND division = 'A';

