-- Exercise 1
SELECT A_STRONGLY_AGREE
  FROM nss
 WHERE question='Q01'
   AND institution='Edinburgh Napier University'
   AND subject='(8) Computer Science'

-- Exercise 2
SELECT institution, subject
  FROM nss
 WHERE question='Q15'
   AND score >= 100;

-- Exercise 3
SELECT institution,score
  FROM nss
 WHERE question='Q15'
   AND subject='(8) Computer Science'
   AND score < 50;

-- Exercise 4
SELECT subject, SUM(response)
  FROM nss
 WHERE question='Q22'
   AND (subject='(8) Computer Science'
     OR subject='(H) Creative Arts and Design')
 GROUP BY subject;

-- Exercise 5
SELECT subject, SUM(response * A_STRONGLY_AGREE / 100)
  FROM nss
 WHERE question='Q22'
   AND (subject='(8) Computer Science'
     OR subject='(H) Creative Arts and Design')
 GROUP BY subject;

-- Exercise 6
SELECT subject, ROUND(SUM(response * A_STRONGLY_AGREE) / SUM(response))
  FROM nss
 WHERE question='Q22'
   AND (subject='(8) Computer Science'
     OR subject='(H) Creative Arts and Design')
 GROUP BY subject;

-- Exercise 7
SELECT institution,ROUND(SUM(response * score) / SUM(response))
  FROM nss
 WHERE question='Q22'
   AND (institution LIKE '%Manchester%')
 GROUP BY institution
ORDER BY institution

-- Exercise 8
SELECT institution, SUM(sample), (
    SELECT SUM(sample) FROM nss AS n2
     WHERE n1.institution = n2.institution
       AND subject LIKE '%Comp%'
       AND question='Q01'
 )
  FROM nss AS n1
 WHERE question='Q01'
   AND (institution LIKE '%Manchester%')
 GROUP BY institution;
