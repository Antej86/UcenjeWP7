use master;
go
drop database if exists ispitnirokwp7;
go
create database ispitnirokwp7;
go
use ispitnirokwp7;
go

create table Ispitnirok(
sifra int not null primary key identity(1,1),
predmet varchar(50) not null,
vrstaIspita varchar(50) not null,
datum datetime,
pristupio bit not null
);

create table Pristupnici(
Ispitnirok int references Ispitnirok(sifra) not null,
student varchar(50) not null,
brojbodova int not null,
ocjena int not null
);