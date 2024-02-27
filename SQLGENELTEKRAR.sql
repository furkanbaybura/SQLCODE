
--INNER JOIN
SELECT p.ProductID,p.ProductName,c.CategoryName FROM Products AS p 
inner join  Categories c 
on  p.CategoryID = c.CategoryID 
select o.EmployeeID ,count(o.EmployeeID) as[sipariþ s] from Orders as o
group by o.EmployeeID order by COUNT(o.EmployeeID) desc

SELECT count(*),p.CategoryID FROM Categories AS c
inner join Products as p on p.CategoryID=c.CategoryID 
group by p.CategoryID order by p.CategoryID,count(*) desc


select sum(od.Quantity) as[ürün sayýsý],od.OrderID as [ürün idleri] from [Order Details] as od 
inner join Products as p on od.ProductID = p.ProductID 
group by od.OrderID order by sum(od.Quantity) desc

select p.ProductID,sum(o.Quantity) as [toplam] from Products as p
inner join [Order Details] as o on p.ProductID=o.ProductID 
group by p.ProductID,p.UnitsOnOrder order by sum(o.Quantity) asc 

-- LEFT,RÝGHT JOIN SORGULAR


-- LEFT JOIN
select p.ProductID,p.ProductName,c.CategoryName,c.[Description] from Categories as c left join Products as p
on p.CategoryID =c.CategoryID 
--RÝGHT JOIN
select p.ProductID,p.ProductName,c.CategoryName,c.[Description] from Categories as c right join Products as p
on p.CategoryID =c.CategoryID where c.CategoryID is null

--FULL OUTER JOIN
select p.ProductID,p.ProductName,c.CategoryID,c.CategoryName,c.[Description] from Categories as c full outer join Products as p
on p.CategoryID =c.CategoryID 