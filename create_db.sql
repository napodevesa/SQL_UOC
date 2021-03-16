DROP SCHEMA IF EXISTS ubd_20202 CASCADE;

CREATE SCHEMA ubd_20202 AUTHORIZATION postgres;

GRANT ALL ON SCHEMA ubd_20202 TO postgres;

SET search_path TO ubd_20202;

BEGIN WORK;

SET TRANSACTION READ WRITE;

SET datestyle = DMY;

CREATE TABLE MUSICIAN (
	id_musician SMALLINT,
	name VARCHAR(255) NOT NULL,
	birth DATE NOT NULL,
	death DATE,
	gender VARCHAR(255),
	nationality VARCHAR(255) NOT NULL,
	CONSTRAINT PK_MUSICIAN PRIMARY KEY(id_musician),
    CONSTRAINT CHECK_DEATH CHECK (death IS NULL OR birth < death),
    CONSTRAINT CHECK_GENDER CHECK (gender IN ('M', 'F'))

	


   );

CREATE TABLE BAND (
	id_band SMALLINT,
	name VARCHAR(255) NOT NULL,
	year_formed SMALLINT NOT NULL,
	year_dissolution SMALLINT,
	style VARCHAR(255) NOT NULL,
	origin VARCHAR(255) NOT NULL,
    CONSTRAINT PK_BAND PRIMARY KEY(id_band),
	CONSTRAINT CHECK_DISS CHECK(year_dissolution IS NULL OR year_dissolution > year_formed),
    CONSTRAINT STYLE_VALID CHECK (style IN ('Blues', 'Country', 'Heavy', 'Jazz', 'Pop', 'Punk', 'Reggae', 'Rock', 'Soul', 'Thrash', 'Techno'))
    
);

CREATE TABLE ALBUM (
	id_album SMALLINT,
	title VARCHAR(255) NOT NULL,
	year SMALLINT NOT NULL,
	id_band SMALLINT NOT NULL,
	CONSTRAINT PK_ALBUM PRIMARY KEY(id_album),
	CONSTRAINT FK_BAND_ALBUM FOREIGN KEY (id_band) REFERENCES BAND(id_band));

CREATE TABLE MEMBER (
	id_musician SMALLINT, 
	id_band SMALLINT, 
	instrument VARCHAR(255),
	CONSTRAINT PK_MEMBER PRIMARY KEY(id_musician, id_band, instrument),
	CONSTRAINT FK_BAND FOREIGN KEY (id_band) REFERENCES BAND(id_band),
	CONSTRAINT FK_MUSICIAN FOREIGN KEY (id_musician) REFERENCES MUSICIAN(id_musician),
	CONSTRAINT CHECK_INSTRUMENT CHECK (instrument IN ('Bass', 'Drums', 'Guitar', 'Keyboard', 'Vocals', 'Trumpet', 'Clarinet', 'Oboe', 'Flute'))

	);

CREATE TABLE COMPOSER(
	id_musician SMALLINT,
	id_song SMALLINT,
	awards SMALLINT,

	CONSTRAINT PK_COMPOSER PRIMARY KEY(id_musician, id_song),
	CONSTRAINT CHECK_AWARD CHECK(awards >= 0),
	CONSTRAINT FK_MUSICIAN_COMPOSER FOREIGN KEY (id_musician) REFERENCES MUSICIAN(id_musician) ON UPDATE CASCADE);

COMMIT;

CREATE TABLE SONG(
	id_song SMALLINT,
	title_song VARCHAR(255) NOT NULL,
	duration TIME NOT NULL,
	id_album SMALLINT,
	CONSTRAINT PK_SONG PRIMARY KEY(id_song),
	CONSTRAINT FK_ALBUM FOREIGN KEY (id_album) REFERENCES ALBUM(id_album) ON UPDATE CASCADE);
COMMIT;

