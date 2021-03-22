SET search_path TO 'ubd_20202';
select distinct band.name, musician.name, musician.birth
from album
INNER JOIN band ON album.id_band=band.id_band
INNER JOIN member ON band.id_band=member.id_band
INNER JOIN musician ON member.id_musician=musician.id_musician
where musician.birth > '1960-01-01'AND band.origin = 'Spain' 
AND album.year not between 2000 AND 2009