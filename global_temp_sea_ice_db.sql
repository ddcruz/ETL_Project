create database global_temp_sea_ice_db;

use global_temp_sea_ice_db;

create table sea_ice(
date_time date,
north_icearea_sq_km float,
south_icearea_sq_km float);

create table global_temp(
date_time date,
tmax float,
tmin float);

#TRUNCATE TABLE sea_ice;
#TRUNCATE TABLE global_temp;

SELECT * FROM sea_ice;
SELECT * FROM global_temp;