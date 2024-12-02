use master;
go
drop database if exists nogomet;
go
create database nogomet;
go
use nogomet;
go

create table klub(
sifra int not null primary key identity(1,1),
naziv varchar(50) not null,
osnovan datetime not null,
stadion varchar(50) not null,
predsjednik varchar(50) not null,
drzava varchar(50) not null,
liga int not null
);

create table utakmica(
sifra int not null primary key identity(1,1), 
datum datetime not null,
vrijeme datetime not null,
lokacija varchar(50) not null,
stadion varchar(50) not null,
domaci_klub varchar(50) references klub(sifra) not null,
gostujuci_klub varchar(50) references klub(sifra) not null
);

create table trener(
sifra int not null primary key identity(1,1),
ime varchar(50) not null,
prezime varchar(50) not null,
klub int references klub(sifra) not null,
nacionalnost varchar(50),
iskustvo varchar(50)
);

create table igrac(
sifra int not null primary key identity(1,1),
ime varchar(50) not null,
prezime varchar(50) not null,
datum_rođenja datetime,
pozicija varchar(50) not null,
broj_dresa int not null,
klub int references klub(sifra) not null
);

