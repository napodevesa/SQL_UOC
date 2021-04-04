
	SET search_path TO 'ubd_20202';

	SELECT song.title_song, song.duration, album.year, count(composer.id_musician)
	FROM song 
	natural join composer natural join band natural join album
	where duration < '00:02:00' AND band.style = 'Rock'
	GROUP BY song.title_song, song.duration, album.year
	order by duration DESC, title_song asc
	;