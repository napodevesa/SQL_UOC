	
	SET search_path TO 'ubd_20202';
	
	SELECT distinct title_song, song.duration, album.year
	FROM  band, song
	INNER JOIN album ON song.id_album=album.id_album 
	INNER JOIN composer ON album.id_album=composer.id_song
	where duration < '00:02:00' AND band.style = 'Rock'
	order by duration DESC, title_song asc
	;