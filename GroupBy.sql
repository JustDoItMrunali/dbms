select count(*) from student_jibe


select standard , count(*) from student_jibe
group by standard
order by standard

--grouping + filtering
select standard, division, count(*) from student_jibe
where maths >=35
group by rollup(standard, division)
having count(*) >=30
order by standard, division;

select address , count(*) from student_jibe
where sname like 'b%' and len(sname)>6
group by address
having count(*) >1

