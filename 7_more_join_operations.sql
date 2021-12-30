-- Exercise 2
SELECT yr
  FROM movie
 WHERE title = 'Citizen Kane';

-- Exercise 3
SELECT id, title, yr
  FROM movie
 WHERE title LIKE '%Star Trek%'
 ORDER BY yr;

-- Exercise 4
SELECT id FROM actor
 WHERE name = 'Glenn Close';

-- Exercise 5
SELECT id FROM movie
 WHERE title = 'Casablanca';

-- Exercise 6
SELECT name FROM actor
 WHERE id IN (
    SELECT actorid FROM casting
     WHERE movieid = 11768
);

-- Exercise 6 using inner join
SELECT name FROM actor
 INNER JOIN casting
 ON actorid = id
 WHERE movieid = 11768;

-- Exercise 7
SELECT name FROM actor
 INNER JOIN casting
 ON actorid = id
 WHERE movieid = (
    SELECT id FROM movie
     WHERE title = 'Alien'
);

-- Exercise 8
SELECT title FROM movie
 INNER JOIN casting
 ON movie.id = movieid
 INNER JOIN actor
 ON actor.id = actorid
 WHERE actor.name = 'Harrison Ford';

-- Exercise 9
SELECT title FROM movie
 INNER JOIN casting
 ON movie.id = movieid
 INNER JOIN actor
 ON actor.id = actorid
 WHERE actor.name = 'Harrison Ford' AND ord != 1;

-- Exercise 10
SELECT title, name
  FROM movie
 INNER JOIN casting
 ON movie.id = movieid
 INNER JOIN actor
 ON actor.id = actorid
 WHERE yr = 1962 AND ord = 1;

-- Exercise 11
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2;

-- Exercise 12
SELECT title, name
  FROM movie
 INNER JOIN casting
 ON movie.id = movieid
 INNER JOIN actor
 ON actor.id = actorid
 WHERE movie.id IN (
    SELECT movie.id FROM movie
     INNER JOIN casting
     ON movie.id = movieid
     INNER JOIN actor
     ON actor.id = actorid
     WHERE name='Julie Andrews'
) AND ord = 1;

-- Exercise 13
SELECT name FROM actor
  WHERE id IN (
    SELECT actorid FROM casting
     WHERE ord = 1
     GROUP BY actorid
     HAVING SUM(ord) >= 15
) ORDER BY name;

-- Exercise 14
SELECT title, COUNT(*) as number_of_actors
  FROM movie
 INNER JOIN casting
 ON movieid = id
 WHERE yr = 1978
 GROUP BY movieid, title
 ORDER BY COUNT(*) DESC, title;

-- Exercise 15
SELECT DISTINCT name
  FROM casting
 INNER JOIN actor
 ON actor.id = actorid
 WHERE movieid IN (
   SELECT movieid FROM casting
    INNER JOIN actor
    ON actor.id = actorid
    WHERE name = 'Art Garfunkel'
) AND name != 'Art Garfunkel';
