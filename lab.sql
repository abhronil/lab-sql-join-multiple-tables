-- 1) Write a query to display for each store its store ID, city, and country
select s.store_id, ct.city, c.country 
from store s
left join address a on s.address_id = a.address_id
left join city ct on a.city_id = ct.city_id
left join country c on ct.country_id = c.country_id;

-- 2) Write a query to display how much business, in dollars, each store brought in.
select s.store_id, sum(p.amount) from store s
left join staff st on s.store_id = st.store_id
left join payment p on st.staff_id = p.staff_id
group by s.store_id; 

-- 3) What is the average running time of films by category?
select c.name, avg(f.length) from film f
left join film_category fc on f.film_id = fc.film_id
left join category c on fc.category_id = c.category_id
group by c.name;

-- 4) Which film categories are longest?
select c.name, avg(f.length) as average from film f
left join film_category fc on f.film_id = fc.film_id
left join category c on fc.category_id = c.category_id
group by c.name
order by average desc
limit 1;

-- 5) Display the most frequently rented movies in descending order.
select f.title, count(r.rental_id) as frequency from rental r
left join inventory i on r.inventory_id = i.inventory_id
left join film f on i.film_id = f.film_id
group by title
order by frequency desc;

-- 6) List the top five genres in gross revenue in descending order.
select c.name as genre, sum(p.amount) as revenue 
from category c 
left join film_category fc on c.category_id = fc.category_id
left join film f on fc.film_id =f.film_id
left join inventory i on f.film_id = i.film_id
left join rental r on i.inventory_id = r.inventory_id
left join payment p on r.rental_id = p.rental_id
group by c.name
order by revenue desc
limit 5;

-- 7) Is "Academy Dinosaur" available for rent from Store 1?
select f.title, i.inventory_id, s.store_id from film f
left join inventory i on f.film_id = i.film_id
left join store s on i.store_id = s.store_id
left join rental r on i.inventory_id = r.inventory_id
where f.title = 'Academy Dinosaur' and s.store_id = 1 and r.return_date is not null
order by s.store_id;

select * from rental
where inventory_id =1;
