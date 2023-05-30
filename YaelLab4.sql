use sakila;
-- get film ratings
select title, rating from film;
-- get release years
select title, release_year from film;
-- Get all films with ARMAGEDDON in the title.
select film_id, title from film where title like '%armageddon%';
-- Get all films with APOLLO in the title
select film_id, title from film where title like '%apollo%';
-- Get all films which title ends with APOLLO.
select film_id, title from film where title like '%apollo';
-- Get all films with word DATE in the title.
select film_id, title from film where title like '%date%';
-- Get 10 films with the longest title.
select title from film order by length(title) desc limit 10;
-- Get 10 the longest films.
select title, length from film order by length desc limit 10;
-- How many films include Behind the Scenes content?
select title, special_features from film where special_features like '%behind the scenes%';
-- List films ordered by release year and title in alphabetical order.
select title, release_year from film order by release_year desc, title;
