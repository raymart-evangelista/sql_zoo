SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950;

SELECT winner
FROM nobel
WHERE yr = 1962
AND subject = 'literature';

SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein';

SELECT winner
FROM nobel
WHERE yr >= 2000 AND subject LIKE '%peace%';

SELECT *
FROM nobel
WHERE subject LIKE 'literature' AND yr BETWEEN 1980 AND 1989;

SELECT *
FROM nobel
WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama');

SELECT winner
FROM nobel
WHERE winner LIKE ('John%');

SELECT yr, subject, winner
FROM nobel
WHERE subject LIKE 'physics' AND yr = '1980' XOR subject LIKE 'chemistry' AND yr = '1984';

SELECT yr, subject, winner
FROM nobel
WHERE yr = 1980 AND subject NOT IN ('medicine', 'chemistry');

SELECT yr, subject, winner
FROM nobel
WHERE subject = 'medicine' AND yr < 1910 OR subject = 'literature' AND yr >= 2004;

SELECT *
FROM nobel
WHERE winner LIKE 'PETER GR%';

SELECT *
FROM nobel
WHERE winner LIKE "EUGENE O'NEILL";

SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'Sir%';
ORDER BY yr DESC;

SELECT winner, subject
FROM nobel
WHERE yr = 1984
ORDER BY CASE WHEN subject IN ('chemistry', 'physics') THEN 1 ELSE 0 END, subject, winner;