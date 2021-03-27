--Author: Napoleón Devesa

SET search_path TO 'ubd_20202';
select distinct band.name, band.year_formed, count(distinct album.id_album), count(distinct member.id_musician)
from album
INNER JOIN band ON album.id_band=band.id_band
INNER JOIN member ON band.id_band=member.id_band
INNER JOIN musician ON member.id_musician=musician.id_musician
Group by band.name, band.year_formed
order by count(distinct album.id_album) desc, band.year_formed asc
limit 4
;