-- Database: Geo

-- DROP DATABASE "Geo";

CREATE DATABASE "Geo"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Polish_Poland.1250'
    LC_CTYPE = 'Polish_Poland.1250'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
	

--1.Utworzenie tabel

create table GeoEon(id_eon integer primary key, nazwa_eon varchar (15));
create table GeoEra(id_era integer primary key, id_eon integer not null, nazwa_era varchar(15));
create table GeoOkres(id_okres integer primary key, id_era integer not null, nazwa_okres varchar(30));
create table GeoEpoka(id_epoka integer primary key, id_okres integer not null, nazwa_epoka varchar(15));
create table GeoPietro(id_pietro integer primary key, id_epoka integer not null, nazwa_pietro varchar(30));


--2.Dodanie kluczy obcych

alter table GeoEra
add foreign key (id_eon) references GeoEon(id_eon);
alter table GeoOkres
add foreign key (id_era) references GeoEra(id_era);
alter table GeoEpoka
add foreign key (id_okres) references GeoOkres(id_okres);
alter table GeoPietro
add foreign key (id_epoka) references GeoEpoka(id_epoka);


--3.Dodanie wartości do tabel

insert into GeoEon values(1, 'Farenozoik');

insert into GeoEra values(1, 1, 'Kenozoik');
insert into GeoEra values(2, 1, 'Mezozoik');
insert into GeoEra values(3, 1, 'Paleozoik');

insert into GeoOkres values(1, 1, 'Czwartorząd');
insert into GeoOkres values(2, 1, 'Trzeciorząd(Neogen)');
insert into GeoOkres values(3, 1, 'Trzeciorząd(Paleogen)');
insert into GeoOkres values(4, 2, 'Kreda');
insert into GeoOkres values(5, 2, 'Jura');
insert into GeoOkres values(6, 2, 'Trias');
insert into GeoOkres values(7, 3, 'Perm');
insert into GeoOkres values(8, 3, 'Karbon');
insert into GeoOkres values(9, 3, 'Dewon');

insert into GeoEpoka values(1, 1, 'Halocen');
insert into GeoEpoka values(2, 1, 'Plejstocen');
insert into GeoEpoka values(3, 2, 'Pliocen');
insert into GeoEpoka values(4, 2, 'Miocen');
insert into GeoEpoka values(5, 3, 'Oligocen');
insert into GeoEpoka values(6, 3, 'Eocen');
insert into GeoEpoka values(7, 3, 'Paleocen');
insert into GeoEpoka values(8, 4, 'Górna');
insert into GeoEpoka values(9, 4, 'Dolna');
insert into GeoEpoka values(10, 5, 'Górna');
insert into GeoEpoka values(11, 5, 'Środkowa');
insert into GeoEpoka values(12, 5, 'Dolna');
insert into GeoEpoka values(13, 6, 'Górna');
insert into GeoEpoka values(14, 6, 'Środkowa');
insert into GeoEpoka values(15, 6, 'Dolna');
insert into GeoEpoka values(16, 7, 'Loping');
insert into GeoEpoka values(17, 7, 'Gwadalup');
insert into GeoEpoka values(18, 7, 'Cisural');
insert into GeoEpoka values(19, 8, 'Górny');
insert into GeoEpoka values(20, 8, 'Dolny');
insert into GeoEpoka values(21, 9, 'Górny');
insert into GeoEpoka values(22, 9, 'Środkowy');
insert into GeoEpoka values(23, 9, 'Dolny');


insert into GeoPietro values(1,1,'megalaj'),
(2,1,'northgrip'),
(3,1,'grenland'),
(4,2,'późny'),
(5,2,'chiban'),
(6,2,'kalabr'),
(7,2,'gelas'),
(8,3,'piacent'),
(9,3,'zankl'),
(10,4,'messyn'),
(11,4,'torton'),
(12,4,'serrawal'),
(13,4,'lang'),
(14,4,'burdygał'),
(15,4,'akwitan'),
(16,5,'szat'),
(17,5,'rupel'),
(18,6,'priabon'),
(19,6,'barton'),
(20,6,'lutet'),
(21,6,'iprez'),
(22,7,'tanet'),
(23,7,'zeland'),
(24,7,'dan'),
(25,8,'mastrycht'),
(26,8,'kampan'),
(27,8,'santon'),
(28,8,'koniak'),
(29,8,'turon'),
(30,8,'cenoman'),
(31,9,'alb'),
(32,9,'apt'),
(33,9,'barrem'),
(34,9,'hoteryw'),
(35,9,'walanżyn'),
(36,9,'berrias'),
(37,10,'tyton'),
(38,10,'kimeryd'),
(39,10,'oksford'),
(40,11,'kelowej'),
(41,11,'baton'),
(42,11,'bajos'),
(43,11,'aalen'),
(44,12,'toark'),
(45,12,'pliensbach'),
(46,12,'synemur'),
(47,12,'hettang'),
(48,13,'retyk'),
(49,13,'noryk'),
(50,13,'karnik'),
(51,14,'ladyn'),
(52,14,'anizyk'),
(53,15,'olenek'),
(54,15,'ind'),
(55,16,'czangsing'),
(56,16,'wucziaping'),
(57,17,'kapitan'),
(58,17,'word'),
(59,17,'road'),
(60,18,'kungur'),
(61,18,'artinsk'),
(62,18,'sakmar'),
(63,18,'assel'),
(64,19,'gżel'),
(65,19,'kasimow'),
(66,19,'moskow'),
(67,19,'baszkir'),
(68,20,'serpuchow'),
(69,20,'wizen'),
(70,20,'turnej'),
(71,21,'famen'),
(72,21,'fran'),
(73,22,'żywet'),
(74,22,'eifel'),
(75,23,'ems'),
(76,23,'prag'),
(77,23,'lochkow');

CREATE TABLE GeoTabela AS (SELECT * FROM GeoPietro 
						   NATURAL JOIN GeoEpoka 
						   NATURAL JOIN GeoOkres 
						   NATURAL JOIN GeoEra 
						   NATURAL JOIN GeoEon );

SELECT * From GeoTabela;


create table Dziesiec(cyfra int, bit int);
insert into Dziesiec(cyfra) values (0), (1), (2), (3), (4), (5), (6), (7), (8), (9);

CREATE TABLE Milion(liczba int,cyfra int, bit int);
INSERT INTO Milion 
SELECT a1.cyfra +10* a2.cyfra +100*a3.cyfra + 1000*a4.cyfra + 10000*a5.cyfra + 10000*a6.cyfra 
AS liczba , a1.cyfra AS cyfra, a1.bit AS bit 
FROM Dziesiec a1, Dziesiec a2, Dziesiec a3, Dziesiec a4, Dziesiec a5, Dziesiec a6 ;


explain SELECT COUNT(*) FROM Milion INNER JOIN GeoTabela ON 
(mod(Milion.liczba,77)=(GeoTabela.id_pietro));

explain SELECT COUNT(*) FROM Milion INNER JOIN GeoPietro ON 
(mod(Milion.liczba,68)=GeoPietro.id_pietro) NATURAL JOIN GeoEpoka NATURAL JOIN 
GeoOkres NATURAL JOIN GeoEra NATURAL JOIN GeoEon;



explain SELECT COUNT(*) FROM Milion WHERE mod(Milion.liczba,77)= 
(SELECT id_pietro FROM GeoTabela WHERE mod(Milion.liczba,77)=(id_pietro));

explain SELECT COUNT(*) FROM Milion WHERE mod(Milion.liczba,77)in
(SELECT GeoPietro.id_pietro FROM GeoPietro NATURAL JOIN GeoEpoka NATURAL JOIN 
GeoOkres NATURAL JOIN GeoEra NATURAL JOIN GeoEon);


create index indexEon on GeoEon(id_eon);
create index indexEra on GeoEra(id_era, id_eon);
create index indexOkres on GeoOkres(id_okres, id_era);
create index indexEpoka on GeoEpoka(id_epoka, id_okres);
create index indexPietro on GeoPietro(id_pietro, id_epoka);
create index indexLiczba on Milion(liczba);
create index indexGeoTabela on GeoTabela(id_pietro, id_epoka, id_era, id_okres,id_eon);






















