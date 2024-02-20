--create database FILM 
--go

--use FILM 
--go

create table filmler
(
filmid int primary key identity(1,1),
filmadi nvarchar(50),
filmtarihi date 
)
create table kategoriler
(
kategoriid int primary key identity(1000,1),
kategoriadi nvarchar(30)
)


create table oyuncular 
(
oyuncuid int primary key identity(2000,1),
oyuncuadi nvarchar(30) 
)
create table kullanýcý 
(
kullaniciid int primary key identity (3000,1),
kullaniciadi nvarchar(30)
)
create table yonetmenler 
(
yonetmenid int primary key identity (4000,1),
yonetmenadi nvarchar(30)
)
create table yorumyapma 
(
yorumid int primary key identity (5000,1),
yorumadi nvarchar(50),
filmfk int,
kullanýcýfk int ,
foreign key (filmfk) references filmler(filmid),
foreign key (kullanýcýfk) references kullanýcý(kullaniciid)
)
create table favoriler
(
favoriid int primary key identity (6000,1),
favoriadi nvarchar(30),
favorifilm int,
favorikullanýcý int
foreign key (favorifilm) references filmler(filmid),
foreign key (favorikullanýcý) references kullanýcý(kullaniciid)
)
create table oynama 
(
oynamaid int primary key identity (7000,1),
oynamaadi nvarchar(30),
filmoyna int,
oyuncuoyna int
foreign key (filmoyna) references filmler(filmid),
foreign key (oyuncuoyna) references oyuncular(oyuncuid)


)
create table filmtur
(
filmturid int primary key identity(100,1),
filmkategoriid int , 
filmvefilmtur int,
foreign key (filmkategoriid) references kategoriler(kategoriid),
foreign key (filmvefilmtur) references filmler(filmid)
)
create table yonetme 
(yonetmeid int primary key identity,
filmyonetme int,
yonetmenyonet int,
foreign key (filmyonetme) references filmler(filmid),
foreign key (yonetmenyonet) references yonetmenler(yonetmenid)

)
