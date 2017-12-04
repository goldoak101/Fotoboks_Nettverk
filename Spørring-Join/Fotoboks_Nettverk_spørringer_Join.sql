-- dette er et forklaring for join.
use Fotoboks_Nettverk;

select kategori_id, navn from produkt; 

select * from produkt inner join kategori; 

select * from produkt inner join kategori on produkt.kategori_ID = kategori.kategori_ID;

