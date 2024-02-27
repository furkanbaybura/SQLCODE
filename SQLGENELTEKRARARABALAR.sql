--CREATE TABLE Kisiler (
--ID int primary key identity(1,1),
--Ad nvarchar(30),
--Soyad nvarchar(30))

--(create table Arabalar

--ID int primary key identity,
--Marka nvarchar(20),
--KisiId int foreign key references Kisiler(ID))


select * from Kisiler as k inner join Arabalar a on a.KisiId=k.ID

select k.Ad,k.Soyad,a.Marka from Kisiler as k left join Arabalar a on a.KisiId=k.ID
where a.ID is null

select k.Ad,k.Soyad,a.Marka from Kisiler as k right join Arabalar a on a.KisiId=k.ID
where k.ID is null
