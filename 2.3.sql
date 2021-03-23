SET search_path TO 'ubd_20202';

select distinct band.name, band.year_formed, count(album.id_band), count(member.id_musician)
from album natural join band natural join member 

GROUP BY band.name, band.year_formed
order by count(album.id_band) desc, band.year_formed asc
limit 4
