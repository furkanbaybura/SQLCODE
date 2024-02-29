alter function AyHesaplama(@tarih datetime)
returns int
as
begin
declare @tarih1 int
set @tarih1 =DATEDIFF(month,@tarih,GETDATE())
return @tarih1
end
select dbo.AyHesaplama('12-02-2000')

select e.FirstName,e.LastName,dbo.AyHesaplama(e.HireDate) as [Geçen Ay Süresi] from Employees as e
---------------------------------------------------------------------------------------------------------------------
alter function TarihFark(@tarih1 datetime,@tarih2 datetime)
returns int
as 
begin
declare @tarih3 int
set @tarih3 = DATEDIFF(DAY,@tarih1,@tarih2)
return @tarih3
end
select dbo.TarihFark('12.05.2022','12.05.2023')
select o.CustomerID,o.ShipName,dbo.TarihFark(o.OrderDate,o.ShippedDate ) from Orders as o
---------------------------------------------------------------------------------------------------------------------
create function ABC(@fonk nvarchar(1))
returns table
as

return (select e.FirstName from Employees as e where e.FirstName like @fonk+'%')
select * from dbo.ABC('a') 
---------------------------------------------------------------------------------------------------------------------
create procedure sp_Ortalama
as
begin
select (sum(od.UnitPrice) - MAX(od.UnitPrice) - MIN(od.UnitPrice)) / (count(od.UnitPrice)-2) from [Order Details] as od
end
exec sp_Ortalama
---------------------------------------------------------------------------------------------------------------------