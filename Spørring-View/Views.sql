create schema if not exists Fotoboks_Nettverk;
use Fotoboks_Nettverk;
-- Dette er er for å lage og deretter bruke bruke databasen som er opprettet.

select lokasjon.navn, fotoboks.Fotoboks_ID 
from lokasjon 
natural join fotoboks 
order by lokasjon.navn asc;

create view fotoboks_lokasjon 
as select lokasjon.navn, fotoboks.Fotoboks_ID 
from lokasjon 
natural join fotoboks 
order by lokasjon.navn;

select * from fotoboks_lokasjon;