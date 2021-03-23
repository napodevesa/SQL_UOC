SET search_path TO 'ubd_20202';

ALTER TABLE BAND

ADD CONSTRAINT CHECK_DISS CHECK(year_dissolution IS NULL OR year_dissolution > year_formed)
;
