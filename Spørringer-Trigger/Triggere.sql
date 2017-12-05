create schema if not exists fotoboks_nettverk;
use fotoboks_nettverk;
###############################################

-- triggere

delimiter //

select * from produkt//



delimiter ;

select * from produkt;

drop table prislogg;
create table prislogg(
	loggvare_ID int,
    gammelPris int
);

#################################################

drop trigger prisloggTrigger;

delimiter !!
create trigger prisLoggTrigger
after update on produkt
for each row
begin
	if(OLD.pris <> NEW.pris) then
		insert into prislogg (loggvare_ID, gammelPris)
		values (OLD.produkt_ID, OLD.pris);
        end if;
        end!!
delimiter ;

###################################################

select * from produkt;

update produkt
set pris = 30
where Produkt_ID = 4;


select * from prislogg;

