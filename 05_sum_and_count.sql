SELECT SUM(population) FROM world;

SElECT DISTINCT(continent) FROM world;

SELECT SUM(gdp) FROM world WHERE continent = 'Africa';

SELECT count(name) FROM world where area >= 1000000;

SELECT SUM(population) FROM world where name IN ('Estonia', 'Latvia', 'Lithuania');

SElECT continent, count(name) FROM world GROUP BY continent;

SElECT continent, count(name) FROM world WHERE population >= 10000000 GROUP BY continent;

SELECT continent 
FROM world
GROUP BY continent 
HAVING SUM(population) >= 100000000;