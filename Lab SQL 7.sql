USE sakila;

###nstructions



###1. In the table actor, which are the actors whose last names are not repeated? 
###For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. 
###These three actors have the same last name. So we do not want to include this last name in our output. 
###Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.

SELECT last_name as distinct_last_name
FROM actor
GROUP BY last_name
HAVING COUNT(last_name) =1
ORDER BY last_name ASC;





### 2. Which last names appear more than once? 
### We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once

SELECT last_name as nondistinct_last_name
FROM actor
GROUP BY last_name
HAVING COUNT(last_name) > 1
ORDER BY last_name ASC;

### 3. Using the rental table, find out how many rentals were processed by each employee.


SELECT staff_id, COUNT(rental_id) AS number_rentals
FROM rental
GROUP BY staff_id
ORDER BY number_rentals DESC;


### 4.Using the film table, find out how many films were released each year.

SELECT *
FROM film
LIMIT 10;

SELECT COUNT(film_id), release_year AS yearly_release
FROM film
GROUP BY release_year
ORDER BY release_year ASC;

SELECT DISTINCT release_year
FROM film;


### 5.Using the film table, find out for each rating how many films were there.

SELECT COUNT(film_id), rating
FROM film
GROUP BY rating
ORDER by rating ASC;


### 6.What is the mean length of the film for each rating type. Round off the average lengths to two decimal places

SELECT rating, ROUND(AVG(`length`)) as average_film_length 
FROM film
GROUP BY rating
ORDER by rating ASC;



### 7.Which kind of movies (rating) have a mean duration of more than two hours?

SELECT rating long_movies
FROM film
GROUP by rating
HAVING AVG(length) > 120
ORDER by rating ASC;
