-- dette er et forklaring for join.
use Fotoboks_Nettverk;

select kategori_id, navn from produkt; 

select * from produkt inner join kategori; 

select * from produkt inner join kategori on produkt.kategori_ID = kategori.kategori_ID;

select produkt.navn, kategori.navn from produkt inner join kategori on produkt.kategori_ID = kategori.kategori_ID;

select produkt.navn, kategori.navn from produkt right join kategori on produkt.kategori_ID = kategori.kategori_ID;

select produkt.navn, kategori.navn from produkt left join kategori on produkt.kategori_ID = kategori.kategori_ID;
-- dette vil ikke gjøre noe utslag siden vi ikke har noen produkter som ikke har en kategorti.

