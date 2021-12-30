-- Exercise 1
SELECT lastName, party, votes
  FROM ge
 WHERE constituency = 'S14000024' AND yr = 2017
 ORDER BY votes DESC

-- Exercise 2
SELECT party, votes,
       RANK() OVER (ORDER BY votes DESC) as posn
  FROM ge
 WHERE constituency = 'S14000024' AND yr = 2017
 ORDER BY party

-- Exercise 4
SELECT constituency,party, votes,
    RANK() OVER (PARTITION BY constituency ORDER BY votes DESC) AS ranking
  FROM ge
 WHERE constituency BETWEEN 'S14000021' AND 'S14000026'
   AND yr  = 2017
ORDER BY ranking, constituency, votes DESC

-- Exercise 5
SELECT constituency, party FROM (
    SELECT constituency,party, votes,
        RANK() OVER (PARTITION BY constituency ORDER BY votes DESC) AS ranking
      FROM ge
     WHERE constituency BETWEEN 'S14000021' AND 'S14000026'
       AND yr  = 2017
     ORDER BY ranking, constituency,votes DESC
) AS ge1
WHERE ranking = 1;

-- Exercise 6
SELECT party, COUNT(*) AS seats FROM (
    SELECT constituency,party, votes,
        RANK() OVER (PARTITION BY constituency ORDER BY votes DESC) AS ranking
      FROM ge
     WHERE constituency LIKE 'S%'
       AND yr  = 2017
     ORDER BY ranking, constituency,votes DESC
) AS ge1
WHERE ranking = 1
GROUP BY party;
