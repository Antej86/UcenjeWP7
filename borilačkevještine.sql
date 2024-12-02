use master;
go
drop database if exists borilačkevještine;
go
create database borilačkevještine;
go
use borilačkevještine;
go

create table Organizacija(
sifra int not null primary key identity (1,1),
naziv varchar(50) not null,
datum_kreacije datetime not null,
ime_foundera varchar (50) not null,
drzava varchar (50) not null
);

create table Klub(
sifra int not null references Organizacija(sifra),
naziv varchar(50) not null,
osnovan datetime not null,
predsjednik varchar(50) not null,
drzava varchar(50) not null,
organizacija int references organizacija(sifra) not null
);

create table Borac(
sifra int not null primary key identity(1,1),
ime varchar(50) not null,
prezime varchar(50) not null,
datum_rođenja datetime not null,
vještina varchar(50) not null,
rekord varchar(50) not null,
klub int not null references Klub(sifra)
);