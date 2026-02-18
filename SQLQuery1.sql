 select salesperson, region, amount,
 sum(amount) over (
 partition by salesperson
 )
 as total_sales
 from sales;

 select * from student_jibe
 where science > (
 select science from student_jibe
 where roll=25
 )

 exec sp_help sales;
 select salesperson, region, amount, total_Sales,
 ((cast(amount as float) / cast(total_sales as float)) * 100)
 as percent_sales
 from 
 (
	 select salesperson, region, amount,
	 sum(amount) over (
	 partition by salesperson
 )
	as total_sales
	from sales
) as t;

select salesperson, region, amount,
dense_rank() over (
partition by region
order by amount desc
)
as data_rank
from sales_jibe;

select * from salesdata;

--Normally, a SUM() function needs a GROUP BY and turns 10 rows into 1 row. When you add OVER, you tell the database: 
--"Calculate the sum, but keep all 10 rows visible on my screen."
select * ,
ntile(5) over (order by cases desc) as tile
from salesdata
order by cases desc;