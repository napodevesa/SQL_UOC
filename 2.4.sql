SET search_path TO 'ubd_20202';

UPDATE song

--INNER JOIN composer ON song.id_song = composer.id_song
--INNER JOIN musician ON composer.id_musician=composer.id_band

SET musician.name = 'José Luis Perales'
WHERE song.duration > '00:05:00'