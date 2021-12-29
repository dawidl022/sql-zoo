-- Exercise 2
SELECT DISTINCT continent
  FROM world;

-- Exercise 3
SELECT SUM(gdp)
  FROM world
 WHERE continent = 'Africa';

-- Exercise 4
SELECT COUNT(*) FROM world
   WHERE area >= 1000000;

-- Exercise 5
SELECT SUM(population)
  FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania');

-- Exercise 6
SELECT continent, COUNT(*)
  FROM world
 GROUP BY continent;

-- Exercise 7
SELECT continent, COUNT(*) AS num_of_countries
  FROM world
 WHERE population >= 10000000
 GROUP BY continent;

-- Exercise 8
SELECT continent
  FROM world
 GROUP BY continent
 HAVING SUM(population) >= 100000000;
