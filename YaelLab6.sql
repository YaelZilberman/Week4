use sakila;
drop table if exists films_2020;
CREATE TABLE `films_2020` (
  `film_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `release_year` year(4) DEFAULT NULL,
  `language_id` tinyint(3) unsigned NOT NULL,
  `original_language_id` tinyint(3) unsigned DEFAULT NULL,
  `rental_duration` int(6),
  `rental_rate` decimal(4,2),
  `length` smallint(5) unsigned DEFAULT NULL,
  `replacement_cost` decimal(5,2) DEFAULT NULL,
  `rating` enum('G','PG','PG-13','R','NC-17') DEFAULT NULL,
  PRIMARY KEY (`film_id`),
  CONSTRAINT FOREIGN KEY (`original_language_id`) REFERENCES `language` (`language_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8; -- here the new table 
SELECT * FROM films_2020;
SET SQL_SAFE_UPDATES = 0; -- PARA DESACTIVAR EL MODO SEGURO
show variables like 'local_infile';
set global local_infile = 1;
LOAD DATA INFILE '/Ironhack/Week4/films_2020.csv'
INTO TABLE films_2020
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
SHOW VARIABLES LIKE 'secure_file_priv'; -- no funciona nada, lo hice con el wizard.
update films_2020 set rental_duration= 3; -- here setting rental duration
update films_2020 set rental_rate= 2.99; -- here setting rental rate duration
update films_2020 set replacement_cost= 8.99; -- here setting replacement cost duration
select * from films_2020;