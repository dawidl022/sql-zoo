-- Exercise 1
SELECT population FROM world
  WHERE name = 'Germany';

-- Exercise 2
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

-- Exercise 3
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000;
