SET search_path TO 'ubd_20202';

	
UPDATE musician
SET musician.name = 'José Luis Perales'
where song.duration < '00:05:00' 
AND album.year between '1980' and '1989' 
AND band.style = 'Rock'
AND count (distinct composer.id_musician) > 2

