SELECT id, title
FROM movie
WHERE yr = 1962;

SELECT yr FROM movie
WHERE title = 'Citizen Kane';

SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr;

SELECT id FROM actor
WHERE name = 'Glenn Close';

SELECT id FROM movie
WHERE title = 'Casablanca';

SELECT name FROM casting
JOIN actor ON actorid=id
WHERE movieid = (SELECT id FROM movie
WHERE title = 'Casablanca');

SELECT name FROM casting
JOIN actor ON actorid=id
WHERE movieid = (SELECT id FROM movie WHERE title = 'Alien');

SELECT title FROM movie
WHERE movie.id IN (SELECT movieid FROM casting
JOIN actor ON actorid=id
WHERE actor.name = 'Harrison Ford');

SELECT title FROM movie
WHERE movie.id IN
(SELECT movieid FROM casting
JOIN actor ON actorid=id
WHERE actor.name = 'Harrison Ford' AND ord != 1);

SELECT title, actor.name FROM movie
JOIN casting ON movieid = movie.id JOIN actor ON actorid = actor.id
WHERE ord = 1 AND yr = 1962;

SELECT yr, COUNT(title) FROM movie
JOIN casting ON movie.id=movieid
JOIN actor ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2;


SELECT title, name FROM movie
JOIN casting ON movie.id=movieid
JOIN actor ON actorid=actor.id
WHERE movieid IN (SELECT DISTINCT movieid FROM casting JOIN actor ON id=actorid WHERE actor.name = 'Julie Andrews') AND ord = 1;

SELECT name, count(ord) FROM actor 
JOIN casting ON (id = actorid AND (SELECT COUNT(ord) FROM casting WHERE actorid = actor.id AND ord=1) >= 15)
GROUP BY name
ORDER BY name;

SELECT title, count(ord) FROM movie 
JOIN casting ON id=movieid 
WHERE yr = 1978 
GROUP BY title 
ORDER BY count(ord) DESC, title;

SELECT name FROM actor
JOIN casting ON id=actorid 
WHERE movieid IN (SELECT movieid FROM casting WHERE actorid IN (SELECT id FROM actor WHERE name = 'Art Garfunkel')) AND name != 'Art Garfunkel';