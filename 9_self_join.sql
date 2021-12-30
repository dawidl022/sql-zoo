-- Exercise 1
SELECT COUNT(*) FROM stops;

-- Exercise 2
SELECT id FROM stops
 WHERE name = 'Craiglockhart';

-- Exercise 3
SELECT id, name
  FROM stops
 INNER JOIN route
 ON stops.id = route.stop
 WHERE num = '4' AND company = 'LRT';

-- Exercise 4
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) = 2;

-- Exercise 5
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop = 149;

-- Exercise 6
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name = 'London Road';

-- Exercise 7
SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Haymarket' AND stopb.name = 'Leith'

-- Exercise 8
SELECT a.company, a.num
  FROM route a
 JOIN route b
   ON a.num = b.num AND a.company = b.company
 JOIN stops stopsa
   ON a.stop = stopsa.id
 JOIN stops stopsb
   ON b.stop = stopsb.id
 WHERE stopsa.name = 'Craiglockhart' AND stopsb.name = 'Tollcross';

-- Exercise 9
SELECT stopsb.name, b.company, b.num
  FROM route a
 JOIN route b
   ON a.num = b.num AND a.company = b.company
 JOIN stops stopsa
   ON a.stop = stopsa.id
 JOIN stops stopsb
   ON b.stop = stopsb.id
 WHERE stopsa.name = 'Craiglockhart'
 AND a.company = 'LRT';

-- Exercise 10
SELECT bus1.num as bus1_num, bus1.company as bus1_company,
bus1.name AS transfer_stop,
bus2.num as bus2_num, bus2.company as bus2_company FROM
(SELECT stopsb.id, stopsb.name, b.company, b.num
  FROM route a
 JOIN route b
   ON a.num = b.num AND a.company = b.company
 JOIN stops stopsa
   ON a.stop = stopsa.id
 JOIN stops stopsb
   ON b.stop = stopsb.id
 WHERE stopsa.name = 'Craiglockhart') as bus1
INNER JOIN (
SELECT stopsb.id, b.company, b.num
  FROM route a
 JOIN route b
   ON a.num = b.num AND a.company = b.company
 JOIN stops stopsa
   ON a.stop = stopsa.id
 JOIN stops stopsb
   ON b.stop = stopsb.id
 WHERE stopsa.name = 'Lochend'
) AS bus2
ON bus1.id = bus2.id
ORDER BY bus1.num, transfer_stop, bus2.num;
