select e.Title as[Unvan],e.FirstName as[ Adý ],e.LastName as [Soyadý ],e.BirthDate as [Doðum Tarihi ],e.City as [Þehir] ,e.Country [Ülke]
from Employees as e

select e.Title as[Unvan],e.FirstName as[ Adý ],e.LastName as [Soyadý ],e.BirthDate as [Doðum Tarihi ],e.City as [Þehir] ,e.Country [Ülke],e.HireDate
from Employees as e where YEAR(GETDATE()) - year(e.HireDate) = 30 and e.Country = 'USA'

select e.Title as[Unvan],e.FirstName as[ Adý ],e.LastName as [Soyadý ],e.BirthDate as [Doðum Tarihi ],e.City as [Þehir] ,e.Country [Ülke],e.HireDate
from Employees as e where 40 >= YEAR(GETDATE()) - year(e.HireDate) and YEAR(GETDATE()) - year(e.HireDate) >= 30  and e.Country = 'USA'

select e.Title as[Unvan],e.FirstName as[ Adý ],e.LastName as [Soyadý ],e.BirthDate as [Doðum Tarihi ],e.City as [Þehir] ,e.Country [Ülke],e.HireDate
from Employees as e where year(GETDATE())-year(e.BirthDate) <75

select o.OrderDate,o.OrderID,o.ShipCity,o.ShipCountry,
e.Title as[Unvan],e.FirstName as[ Adý ],e.LastName as [Soyadý ],e.BirthDate as [Doðum Tarihi ],e.City as [Þehir] ,e.Country [Ülke],e.HireDate from Employees as e 
inner join Orders as o on o.EmployeeID = e.EmployeeID 
where 40 >= YEAR(GETDATE()) - year(e.HireDate) and 
YEAR(GETDATE()) - year(e.HireDate) >= 30  and e.Country = 'USA' and 
year(GETDATE())-year(e.BirthDate) <75

select count(*),e.EmployeeID  from Employees as e 
inner join Orders as o on o.EmployeeID = e.EmployeeID 
where 40 >= YEAR(GETDATE()) - year(e.HireDate) and 
YEAR(GETDATE()) - year(e.HireDate) >= 30  and e.Country = 'USA' and 
year(GETDATE())-year(e.BirthDate) <75
group by e.EmployeeID 

select Count(*) , o.ShipCountry ,e.EmployeeID
from Employees as e 
inner join Orders as o 
on o.EmployeeID=e.EmployeeID 
where Year(getdate())- Year(e.HireDate) between 30 and 40 and e.Country='USA' and Year(getdate())- Year(e.BirthDate) <75 
group by  o.ShipCountry,e.EmployeeID
having count(*)>10
order by count(*) desc

select Count(*) , o.ShipCountry ,e.EmployeeID,cs.City,cs.Country
from Employees as e 
inner join Orders as o 
on o.EmployeeID=e.EmployeeID 
inner join Customers as cs
on cs.CustomerID = o.CustomerID
where Year(getdate())- Year(e.HireDate) between 30 and 40 and e.Country='USA' and Year(getdate())- Year(e.BirthDate) <75 
group by  o.ShipCountry,e.EmployeeID,cs.City,cs.Country
having count(*)>5
order by count(*) desc



--Create view vwHesapAdet as
select sum(od.Quantity*od.UnitPrice) as Hesap,e.EmployeeID ,
count(*) as SatisAdet
from Employees as e 
inner join Orders as o on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od on od.OrderID =o.OrderID
group by e.EmployeeID
select* from vwHesapAdet as ha 
where ha.SatisAdet > (select avg(SatisAdet)  from vwHesapAdet)