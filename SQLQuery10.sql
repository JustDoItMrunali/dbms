select * from salesdata;

select product, sum( cases * caseprice)
from salesdata
group by product
order by product;

SELECT product, sum(cases) 
FROM salesdata
GROUP BY product
HAVING SUM(cases) > 1000;

SELECT CATEGORY , SUM(CASES*CASEPRICE)
FROM SALESDATA
GROUP BY CATEGORY
HAVING SUM(CASES*CASEPRICE)>30000

SELECT DATENAME(weekday, GETDATE());

SELECT SUM(CASES)
FROM SALESDATA
WHERE DATENAME(WEEKDAY,ORDERDATE) ='SUNDAY' OR DATENAME(WEEKDAY, ORDERDATE) ='SATURDAY'

SELECT CITY, SUM(CASES),
CASE 
	WHEN SUM(CASES) >1000 THEN 'STRONG MARKET'
	ELSE 'WEAK MARKET'
END AS MARKET
FROM SALESDATA
GROUP BY CITY

SELECT DISTINCT(PRODUCT) FROM SALESDATA

SELECT TOP 1 WITH TIES PRODUCT, SUM(CASES * CASEPRICE) FROM SALESDATA
GROUP BY PRODUCT 
ORDER BY SUM(CASES * CASEPRICE) DESC

SELECT TOP 1 PRODUCT, SUM(CASES * CASEPRICE) FROM SALESDATA
GROUP BY PRODUCT 
ORDER BY SUM(CASES * CASEPRICE) DESC

SELECT product, SUM(cases * caseprice) AS sales
FROM salesdata
GROUP BY product
HAVING SUM(cases * caseprice) = (
    SELECT MAX(sales)
    FROM (
        SELECT product, SUM(cases * caseprice) AS sales
        FROM salesdata
        GROUP BY product
    ) AS t
);

select year(orderdate), datename(month, orderdate), sum(cases* caseprice)
from salesdata
where DATEPART(quarter, orderdate)=1
group by year(orderdate), datename(month,orderdate)
having sum(cases * caseprice) <10000
order by year(orderdate)  

select salesperson, region , amount,
row_number() over(
partition by region
order by amount desc
)
as row_num
from sales;

select id, email, name, created_at,
    ROW_NUMBER() OVER(
    PARTITION BY email
    ORDER BY created_at DESC
    ) AS rn
FROM users_jibe2;

select id from
(
    select id,
    row_number() over(
    partition by email
    order by created_at desc
    )as rn
    from users_jibe2
) as t
where rn>1