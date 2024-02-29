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
-- VIEW NED�R ? 
--viewlar tablolar gibi sorgular� veri kayna�� olarak kullan�l�r,
--fakat kal�c� olarak depolamaz, runtime da �al��t�r�larak sorgular elde edilir
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
--Union ile sorgu yapt���m�z iki farkl� tabloyu birbiri ile birle�tirebiliriz,
--UnionAll ile ise tekrarl� bir �ekilde tamam� ile tablolar� birle�tirir.
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
-- INDEX NED�R

--Indexleme bir veritaban�n tablolar�ndaki veriler sorguland���nda daha az veri okuyarak 
--�ok daha h�zl� bir �ekilde veriye ula�may� ama�layan 
--ve i�lem sonucunu daha h�zl� d�nd�ren yap�lard�r.

------------------------------------------------------------------------
--SUPER KEY ILE CANDIDATE KEY FARKI NED�R
--Candidate anahtar, bir tablodaki her sat�r� benzersiz �ekilde tan�mlayabilen tek bir �zelliktir.
--S�per anahtar bir s�tun koleksiyonudur. �ster tek bir tabloda ister birden fazla ili�kili tabloda,
--birle�tirilmi� tablo k�mesindeki her sat�r� benzersiz �ekilde tan�mlayabilirler.
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
--SP VE FUNCT�ON ARASINDAK� FARKLAR NELERD�R ? 
------------------------------------------------------------------------