-- drop schema fotoboks_nettverk; (kommentert ut for sikkerhet)

create schema if not exists Fotoboks_Nettverk;
use Fotoboks_Nettverk;
-- Dette er er for å lage og deretter bruke bruke databasen som er opprettet.

drop table if exists Produkt_Innhold;
drop table if exists Sjekk;
drop table if exists Produkt;
drop table if exists Kategori;
drop table if exists Fotoboks;
drop table if exists Lokasjon;
drop table if exists Inspektør;

-- Dette er bare en sikkerhets slik at vi ikke lager tabel'er vi har fra før.

create table Inspektør(
	Inspektør_ID int auto_increment,
	navn varchar(60),
	lonnPerSjekk int,
	primary key (Inspektør_ID)
);

create table Lokasjon(
	Lokasjon_ID int auto_increment,
	navn varchar(60) unique,
	x decimal(9,7) unique, 
	y decimal(9,7) unique,
	primary key (Lokasjon_ID)
);

create table Kategori(
	Kategori_ID int auto_increment,
	navn varchar(60) unique,
	beskrivelse varchar(255),
	primary key (Kategori_ID)
);


create table Fotoboks(
	Fotoboks_ID int auto_increment,
	Lokasjon_ID int,
	kapasitet int,
	primary key (Fotoboks_ID),
	foreign key (Lokasjon_ID) references Lokasjon(Lokasjon_ID)
);

create table Produkt(
	Produkt_ID int auto_increment,
	Kategori_ID int,
	pris decimal(6,2),
	navn varchar(60) unique,
	beskrivelse varchar(255),
	primary key (Produkt_ID),
	foreign key (Kategori_ID) references Kategori(Kategori_ID)
);

create table Produkt_Innhold(
	Fotoboks_ID int,
	Produkt_ID int,
	antall int,
	primary key (Fotoboks_ID, Produkt_ID),
	foreign key (Fotoboks_ID) references Fotoboks(Fotoboks_ID),
	foreign key (Produkt_ID) references Produkt(Produkt_ID)
);

create table Sjekk(
	Sjekk_ID int auto_increment, -- automatID/vaktID holder ikke fordi samme vakt kan sjekke en automat flere ganger
	Fotoboks_ID int,
	Inspektør_ID int,
	primary key (Sjekk_ID),
	foreign key (Fotoboks_ID) references Fotoboks(Fotoboks_ID),
	foreign key (Inspektør_ID) references Inspektør(Inspektør_ID)
);
select * from kategori;
-- før inført
-- innføringsdata:

insert into Kategori(navn, beskrivelse) values
	("PortrettFoto", "Her kan du ta et Portrett foto"),
    ("Fotoremse", "Her kan du ta og lage Fotoremse, velg antall fotograper i remsa"),
    ("Foto", "Her kan du velge bilde størelser for bilderammer ");

select* from kategori;
-- etter inført    
    
select* from Produkt;
-- før inført
 
insert into Produkt (pris, navn, beskrivelse, Kategori_ID) values
-- fotoboks: Foto
    (25.00, "Foto - stor", "Størrelse: 15 x 20cm", 1),
	(15.00, "Foto - medium", "Størrelse: 13 x 18cm", 1),
	(10.00, "Foto - liten", "Størrelse: 10 x 15cm", 1),
    
-- fotoboks: Fotoremser
	(35.00, "Fotoremse, mange", "Antall: 1 x 9", 2),
	(25.00, "Fotoremse, normal", "Antall: 1 x 6", 2),
	(15.00, "Fotoremse, få", "Antall: 1 x 3", 2),

-- fotoboks: PortrettFoto
    (35.00, "PortrettFoto, IDkort", "Få ordnet et IDbilde som passer deg!", 3),
	(25.00, "PortrettFoto, Passbilde", "Få ditt Passbilde påplass idag!", 3);
	
select * from produkt;
-- etter inført

insert into Lokasjon(navn, x, y) values
	("Stortinget", 59.913154, 10.739782),
	("Oslo S", 59.911087, 10.752612),
	("nasjonalteater", 59.914514, 10.734085),
	("frognerparken", 59.926446, 10.703101),
	("Opera Huset", 59.907537, 10.753117),
	("Westerdals", 59.916206, 10.760202);
    
-- totale antall fotobokser: 8
insert into fotoboks(Lokasjon_ID, kapasitet) values
	(2,250),(1,750),(3,500),(6,650),(4,900),(3,250),(5,900),(6,700); 
    
insert into Inspektør(navn, lonnPerSjekk) values
	("Tom Bolstad", 110),
	("Kjetil Antonsen", 90),
	("Nicolay Frøyland", 110),
	("Unni Thomassen", 90),
	("Emil Holter", 100),
    ("Emil Holter", 80),
	("Eva Romundstad", 110);
    -- (kommentar: her kan det være like navn takket være "Inspektør_ID int auto_increment")
    
insert into Sjekk(Fotoboks_ID, Inspektør_ID) values
	(1,3),(1,4),(2,3),(2,5),(5,1),(2,3),
	(1,2),(2,2),(6,4),(6,7),
	(5,4),(3,2),(1,7);
    

insert into Produkt_Innhold(Fotoboks_ID, Produkt_ID, antall) values
	(1,3,36),(1,4,35),(1,5,44), 
    -- automat 1: hoved fokus på foto

	(2,1,7),(2,2,14),(2,3,24),(2,4,25),
	(2,5,6),(2,6,25),(2,7,32),(2,8,33),
	 -- automat 2: fokus på alt
     
	(3,5,15),(3,6,02),(3,7,6); 
    -- automat 3: hoved fokus på PortrettFoto 
    
    
