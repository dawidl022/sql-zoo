-- Exercise 1
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia');

-- Exercise 2
SELECT name
  FROM world
 WHERE gdp / population > (
    SELECT gdp / population FROM world
    WHERE name = 'United Kingdom'
) AND continent = 'Europe';

-- Exercise 3
SELECT name, continent
  FROM world
 WHERE continent IN (
    SELECT continent FROM world
     WHERE name IN ('Argentina', 'Australia')
) ORDER BY name;

-- Exercise 4
SELECT name, population
  FROM world
 WHERE population > (
    SELECT population FROM world
    WHERE name = 'Canada'
) AND population < (
    SELECT population FROM world
    WHERE name = 'Poland'
);

-- Exercise 5
SELECT name, CONCAT(ROUND(population / (
    SELECT population FROM world
    WHERE name = 'Germany'
) * 100), '%') as percentage
  FROM world
 WHERE continent = 'Europe';

-- Exercise 6
SELECT name
  FROM world
 WHERE gdp > ALL (
    SELECT gdp FROM world
     WHERE continent = 'Europe'
       AND gdp > 0 -- needed as some records may have null in this column
);

-- Exercise 7
SELECT continent, name, area
  FROM world as w1
 WHERE area >= ALL (
    SELECT area FROM world as w2
    WHERE w2.continent = w1.continent
);

-- Exercise 8
SELECT continent, MIN(name) AS name
  FROM world
 GROUP BY continent;

-- Exercise 8 using correlated subquery syntax
SELECT continent, name
  FROM world as w1
 WHERE name <= ALL (
    SELECT name FROM world as w2
    WHERE w2.continent = w1.continent
);

-- Exercise 9
SELECT name, continent, population
  FROM world as w1
 WHERE 25000000 >= ALL (
    SELECT population FROM world as w2
    WHERE w2.continent = w1.continent
);

-- Exercise 10
SELECT name, continent
  FROM world as w1
 WHERE population / 3 > ALL (
    SELECT population FROM world as w2
    WHERE w2.continent = w1.continent
      AND w2.name <> w1.name
);
