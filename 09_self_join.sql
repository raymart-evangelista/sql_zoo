SELECT COUNT(id) FROM stops;

SELECT id FROM stops WHERE name = 'Craiglockhart';

SELECT stops.id, name FROM stops 
JOIN route ON id = stop 
WHERE company = 'LRT' and num = 4;

SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) = 2;

SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop=149;

SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name='London Road';

SELECT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Haymarket' AND stopb.name='Leith'
GROUP BY a.company, a.num;

SELECT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name='Tollcross'
GROUP BY a.company, a.num;

SELECT stopb.name, b.company, b.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart';

-- 10 ?
SELECT a.num, a.company, stopc.name, c.num, c.company
FROM route a 
JOIN route b ON (a.company=b.company AND a.num=b.num)
JOIN (route c JOIN route d ON (c.company=d.company AND c.num=d.num))
JOIN stops stopa ON (a.stop=stopa.id)
JOIN stops stopb ON (b.stop=stopb.id)
JOIN stops stopc ON (c.stop=stopc.id)
JOIN stops stopd ON (d.stop=stopd.id)
WHERE stopa.name='Craiglockhart' AND stopd.name='Lochend' AND stopb.name=stopc.name
ORDER BY a.num, stopc.name;