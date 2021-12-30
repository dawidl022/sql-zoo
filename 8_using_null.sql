-- Exercise 1
SELECT name FROM teacher
 WHERE dept IS NULL;

-- Exercise 3
SELECT teacher.name AS teacher_name, dept.name AS department
  FROM teacher
 LEFT JOIN dept
 ON teacher.dept = dept.id;

-- Exercise 4
SELECT teacher.name AS teacher_name, dept.name AS department
  FROM teacher
 RIGHT JOIN dept
 ON teacher.dept = dept.id;

-- Exercise 5
SELECT name, COALESCE(mobile, '07986 444 2266') AS mobile
FROM teacher;

-- Exercise 6
SELECT teacher.name AS teacher_name, COALESCE(dept.name, 'None') AS department
  FROM teacher
 LEFT JOIN dept
 ON teacher.dept = dept.id;

-- Exercise 7
SELECT COUNT(*), COUNT(mobile)
  FROM teacher;

-- Exercise 8
SELECT dept.name, COUNT(teacher.name) AS number_of_staff
  FROM teacher
 RIGHT JOIN dept
 ON teacher.dept = dept.id
 GROUP BY dept.name;

-- Exercise 9
SELECT name,
  CASE dept WHEN 1 THEN 'Sci'
            WHEN 2 THEN 'Sci'
            ELSE 'Art' END AS field
  FROM teacher;

-- Exercise 10
SELECT name,
  CASE dept WHEN 1 THEN 'Sci'
            WHEN 2 THEN 'Sci'
            WHEN 3 THEN 'Art'
            ELSE 'None' END AS field
  FROM teacher;
