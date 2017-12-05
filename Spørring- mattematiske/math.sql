create schema if not exists fotoboks_nettverk;
use fotoboks_nettverk;

##################################################

select * from produkt_innhold; -- dette er alt sammen 

select max(antall) from produkt_innhold; -- max = 44

select min(antall) from produkt_innhold; -- min = 2

select avg(antall) from produkt_innhold; -- avg = 21.7
 
select sum(antall) from produkt_innhold; -- sum = 304

select count(antall) from produkt_innhold; -- count = 14

#####################################################

select sum(case when fotoboks_ID like '1' then antall end) as 'fotoboks 1',
sum(case when fotoboks_ID like '2' then antall end) as 'fotoboks 2',
sum(case when fotoboks_ID like '3' then antall end) as 'fotoboks 3' 
from produkt_innhold;

