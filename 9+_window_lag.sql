-- Exercise 1
SELECT name, DAY(whn),
 confirmed, deaths, recovered
 FROM covid
WHERE name = 'Spain'
AND MONTH(whn) = 3 AND YEAR(whn) = 2020
ORDER BY whn;

-- Exercise 2
SET @@sql_mode='ANSI'; -- LAG MariaDB bug fix
SELECT name, DAY(whn), confirmed,
   LAG(confirmed, 1) OVER (PARTITION BY name ORDER BY whn)
 FROM covid
WHERE name = 'Italy'
AND MONTH(whn) = 3 AND YEAR(whn) = 2020
ORDER BY whn;

-- Exercise 3
SET @@sql_mode='ANSI';
SELECT name, DAY(whn), confirmed -
   LAG(confirmed, 1) OVER (PARTITION BY name ORDER BY whn)
 FROM covid
WHERE name = 'Italy'
AND MONTH(whn) = 3 AND YEAR(whn) = 2020
ORDER BY whn

-- Exercise 4
SET @@sql_mode='ANSI';
SELECT name, DATE_FORMAT(whn,'%Y-%m-%d'),
    confirmed - LAG(confirmed, 1) OVER (PARTITION BY name ORDER BY whn)
 FROM covid
WHERE name = 'Italy'
AND WEEKDAY(whn) = 0 AND YEAR(whn) = 2020
ORDER BY whn;

-- Exercise 5
SELECT tw.name, DATE_FORMAT(tw.whn,'%Y-%m-%d'),
 tw.confirmed - lw.confirmed
 FROM covid tw LEFT JOIN covid lw ON
  DATE_ADD(lw.whn, INTERVAL 1 WEEK) = tw.whn
   AND tw.name=lw.name
WHERE tw.name = 'Italy'
AND WEEKDAY(tw.whn) = 0
ORDER BY tw.whn;

-- Exercise 6
SET @@sql_mode='ANSI';
SELECT
   name,
   confirmed,
   RANK() OVER (ORDER BY confirmed DESC) rc,
   deaths,
   RANK() OVER (ORDER BY deaths DESC) rc
  FROM covid
WHERE whn = '2020-04-20'
ORDER BY confirmed DESC

-- Exercise 7
SET @@sql_mode='ANSI';
SELECT
   world.name,
   ROUND(100000*confirmed/population,0),
   RANK() OVER (ORDER BY (confirmed/population))
  FROM covid JOIN world ON covid.name=world.name
WHERE whn = '2020-04-20' AND population > 10000000
ORDER BY population DESC;

-- Exercise 8
SET @@sql_mode='ANSI';
SELECT name, DATE_FORMAT(whn, '%Y-%m-%d') AS date, new_cases AS peakNewCases FROM (
SELECT name, whn, new_cases, RANK() OVER (PARTITION BY name ORDER BY new_cases DESC) as ranking FROM
(
SELECT name,
   whn,
   confirmed - LAG(confirmed, 1) OVER (PARTITION BY name ORDER BY whn) AS new_cases
  FROM covid
) AS c
WHERE c.new_cases >= 1000
) c1
WHERE ranking = 1
ORDER BY whn;
