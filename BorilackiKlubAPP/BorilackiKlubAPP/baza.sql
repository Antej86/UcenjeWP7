SELECT name, collation_name FROM sys.databases;
GO
ALTER DATABASE db_ab6b0e_borilackiklub SET SINGLE_USER WITH
ROLLBACK IMMEDIATE;
GO
ALTER DATABASE db_ab6b0e_borilackiklub COLLATE Croatian_CI_AS;
GO
ALTER DATABASE db_ab6b0e_borilackiklub SET MULTI_USER;
GO
SELECT name, collation_name FROM sys.databases;
GO

drop table ucesnici
drop table takmicenja

create table takmicenja (
	sifra int not null primary key identity(1,1),
	naziv varchar(100) not null,
	datumOdrzavanja datetime not null,
	vrsta varchar(100) not null
);

create table ucesnici (
	sifra int not null primary key identity(1,1),
	takmicenjeId int not null,
	ime varchar(100) not null,
	prezime varchar(100) not null
);

alter table ucesnici add foreign key (takmicenjeId) references takmicenja(sifra);

-- takmicenja
insert into takmicenja (naziv, datumOdrzavanja, vrsta) values ('Svjetsko prvenstvo', '2025-03-21', 'Karate');

-- ucesnici
insert into ucesnici (takmicenjeId, ime, prezime) values (1,'Pero', 'Perić');

