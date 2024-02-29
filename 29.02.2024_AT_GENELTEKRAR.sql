create procedure sp_GOREV
as
begin
SELECT e.FirstName,e.LastName,e.Title FROM Employees AS e where e.City is not null
end
exec sp_GOREV
------------------------------------------------------------------------
create procedure sp_tumkategori 
as 
begin
select c.CategoryName,p.ProductName from Categories as c 
inner join Products as p
on c.CategoryID = p.CategoryID

end
exec sp_tumkategori
------------------------------------------------------------------------
create procedure sp_kategoriid @id int
as
begin
select * from Categories as c inner join Products as p on 
c.CategoryID =p.CategoryID
where p.CategoryID = @id
end
exec sp_kategoriid 5
------------------------------------------------------------------------
create procedure sp_parametre @categoriid int , @productid int
as 
begin
select c.CategoryName,p.ProductName,p.CategoryID from Categories as c inner join Products as p on p.CategoryID=c.CategoryID
where p.CategoryID =@categoriid and p.ProductID> @productid
end
exec sp_parametre 4,5
------------------------------------------------------------------------
-- VIEW NEDÝR ? 
--viewlar tablolar gibi sorgularý veri kaynaðý olarak kullanýlýr,
--fakat kalýcý olarak depolamaz, runtime da çalýþtýrýlarak sorgular elde edilir
------------------------------------------------------------------------
create view sunOlanlar
as
(
select t.TerritoryDescription,r.RegionDescription from Territories as t inner join Region as r
on r.RegionID = t.RegionID where t.TerritoryDescription like '%san%'
)

select * from sunOlanlar
------------------------------------------------------------------------
--UNION AND UNIONALL NEDIR FARKLARI NELERDIR
--Union ile sorgu yaptýðýmýz iki farklý tabloyu birbiri ile birleþtirebiliriz,
--UnionAll ile ise tekrarlý bir þekilde tamamý ile tablolarý birleþtirir.
(select e.FirstName, e.LastName, e.BirthDate from Employees as e)
union 
(select e.FirstName, e.LastName, e.BirthDate  from Employees as e
	where e.FirstName like 'A%'
)
					----------------------
(select e.FirstName, e.LastName, e.BirthDate from Employees as e)
union all
(select e.FirstName, e.LastName, e.BirthDate  from Employees as e
	where e.FirstName like 'A%'
)
------------------------------------------------------------------------
-- INDEX NEDÝR

--Indexleme bir veritabanýn tablolarýndaki veriler sorgulandýðýnda daha az veri okuyarak 
--çok daha hýzlý bir þekilde veriye ulaþmayý amaçlayan 
--ve iþlem sonucunu daha hýzlý döndüren yapýlardýr.

------------------------------------------------------------------------
--SUPER KEY ILE CANDIDATE KEY FARKI NEDÝR
--Candidate anahtar, bir tablodaki her satýrý benzersiz þekilde tanýmlayabilen tek bir özelliktir.
--Süper anahtar bir sütun koleksiyonudur. Ýster tek bir tabloda ister birden fazla iliþkili tabloda,
--birleþtirilmiþ tablo kümesindeki her satýrý benzersiz þekilde tanýmlayabilirler.
------------------------------------------------------------------------
CREATE PROCEDURE SP_SAYITOPLAM @SAYI1 INT ,@SAYI2 INT ,@SAYI3 INT
AS
BEGIN
SELECT (@SAYI1+@SAYI2+@SAYI3) AS TOPLAM
END
EXEC SP_SAYITOPLAM 10,20,30
------------------------------------------------------------------------
CREATE PROCEDURE SP_SAYIORT @SAYI1 INT ,@SAYI2 INT ,@SAYI3 INT
AS
BEGIN
SELECT (@SAYI1+@SAYI2+@SAYI3)/3 AS TOPLAM
END
EXEC SP_SAYIORT 10,20,30
------------------------------------------------------------------------
select OrderId, Sum(UnitPrice * Quantity*(1-Discount)) as ToplamTutar
from [Order Details]
where OrderID between 10500 and 11000
group by OrderId
having Sum(UnitPrice * Quantity*(1-Discount)) between 2500 and 3500
order by 2 desc
------------------------------------------------------------------------
--SP VE FUNCTÝON ARASINDAKÝ FARKLAR NELERDÝR ? 
------------------------------------------------------------------------