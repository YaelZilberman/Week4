use sakila;
select count(distinct last_name) from actor; -- there are 121 different surnames
select count(distinct language_id) from film; -- 1 language id
select rating, title from film where rating = 'pg-13'; -- 223 movies where released as 'pg-13'
select length, title, release_year 
  from sakila.film 
    where release_year = 2006 
      order by length desc limit 10; -- here the 10 longest movies released in 2006
-- Show rental info with additional columns month and weekday. Get 20.
select inventory_id, DATE_FORMAT(substring_index(rental_date, ' ', 1), "%M %D,%Y") as month_weekday from rental limit 20;
-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select inventory_id, customer_id, rental_date, case
when DAYOFWEEK(rental_date) in (1, 7) then 'weekend'
    else 'workday'
end as 'day_type'
from rental;
 -- How many rentals were in the last month of activity?
 select count(rental_date) as rented_movies, customer_id from rental where month(rental_date) = 5 group by customer_id;