SELECT song.duration, song.title_song, album.title, count (musician.name), musician.name

FROM song natural join band natural join album natural join member join musician  
ON (member.id_musician = musician.id_musician) 
where song.duration < '00:05:00' 
AND band.origin = 'Spain' 
group by song.duration, song.title_song, album.title, musician.name
;

UPDATE musician
SET name = 'José Luis Perales' 
WHERE musician.name = 'José María Cano'
;









