select * from cars;
select * from owners;

--Joins
--brings only data that matches
select owners.sname , cars.brand, cars.price
from cars inner join owners
on cars.oid = owners.oid;

select owners.sname , cars.brand, cars.price
from owners left join cars
on cars.oid = owners.oid;

select owners.sname , cars.brand, cars.price
from owners right join cars
on cars.oid = owners.oid;

select owners.sname , cars.brand, cars.price
from owners full join cars
on cars.oid = owners.oid;

select owners.sname, cars.brand, cars.price
from owners cross join cars;

SELECT owners.sname, cars.brand
FROM owners 
LEFT JOIN cars ON owners.oid = cars.oid -- Don't forget the "ON"!
WHERE cars.price > 1000000;

SELECT owners.sname, cars.brand
FROM owners 
LEFT JOIN cars ON owners.oid = cars.oid -- Don't forget the "ON"!
WHERE cars.price is null;


SELECT o.sname, cars.brand
FROM owners o
LEFT JOIN cars ON owners.oid = cars.oid -- Don't forget the "ON"!
WHERE cars.price is null;

