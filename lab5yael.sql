use sakila;
-- Drop column picture from staff.
select * from staff;
alter table staff drop column picture;
-- A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
select * from customer where first_name = 'tammy';
insert into staff (first_name, last_name, address_id, active, email, store_id, username, password)
values("tammy", "sanders", 79, 1, "tammy.sanders@sakilacustomer.org", 2, "tammys", 12345);
select * from staff where username = "tammys";
-- Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1
select * from rental;
insert into rental (rental_date, inventory_id, customer_id, staff_id)
values(950324, 1, 130, 1);
select * from rental where customer_id = 130 and inventory_id = 1;
-- consigna 4
drop table deleted_users;
create table if not exists deleted_users (
    customer_id SMALLINT PRIMARY KEY,
    email VARCHAR(50),
    create_date DATETIME)
        SELECT customer_id, email, create_date
        FROM customer
        WHERE active = 0;
SET SQL_SAFE_UPDATES = 0; -- PARA DESACTIVAR EL MODO SEGURO
delete from customer where active = 0; 
