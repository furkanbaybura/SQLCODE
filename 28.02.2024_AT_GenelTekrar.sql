------------------------------------------------------
select od.UnitPrice from [Order Details] as od 
where od.UnitPrice = (select max(o.UnitPrice) from [Order Details] as o)
------------------------------------------------------
select top(1)max(p.UnitPrice),p.ProductName,p.UnitPrice from Products as p
group by p.UnitPrice,p.ProductName,p.UnitPrice order by p.UnitPrice desc
------------------------------------------------------
select distinct(p.ProductName) from Products as p 
inner join [Order Details] as od on p.ProductID = od.ProductID
------------------------------------------------------
