SET search_path TO 'ubd_20202';
SELECT distinct song.duration, song.title_song
FROM song natural join band natural join album 
where song.duration < '00:05:00' AND band.style = 'Rock'
order by duration DESC
	;
	

	
