SELECT name
FROM world
where population > (SELECT population 
FROM world
WHERE name = 'Russia');

SELECT name
FROM world
WHERE continent = 'Europe'
AND gdp/population > (SELECT gdp/population as per_capita_gdp
FROM world
WHERE name = 'United Kingdom');

SELECT name, continent
FROM world
WHERE
continent = (SELECT continent FROM world WHERE name = 'Argentina')
or
continent = (SELECT continent FROM world WHERE name = 'Australia')
ORDER BY name;

SELECT name, population
FROM world
WHERE population > (SELECT population FROM world WHERE name = 'United Kingdom')
AND
population < (SELECT population FROM world WHERE name = 'Germany');

SELECT name, CONCAT(ROUND(population / (SELECT population FROM world WHERE name = 'Germany') * 100, 0),'%') AS percentage
FROM world
WHERE continent = 'Europe';

SELECT name FROM world
WHERE gdp > (SELECT MAX(gdp) FROM world
WHERE continent = 'Europe' AND gdp IS NOT NULL);


-- try to understand concept
-- "select the continent, name, and area from world where the area is greater than or equal to the area of all countries where the continent is the same"
SELECT continent, name, area FROM world x
WHERE area >= ALL
(SELECT area FROM world y
WHERE y.continent = x.continent
AND area > 0);

-- try to understand concept
-- "select the continent and name for the country from world where the name is less than or equal to the name of all countries where the continent is the same"
SELECT continent, name FROM world x
WHERE x.name <= ALL
(SELECT y.name FROM world y
WHERE x.continent = y.continent)
ORDER BY continent;

--
SELECT name, continent, population FROM world x
WHERE 25000000 >= ALL
(SELECT y.population FROM world y
WHERE x.continent = y.continent);

--
SELECT name, continent FROM world x
WHERE x.population / 3 >= ALL
(SELECT y.population FROM world y
WHERE x.continent = y.continent AND x.name != y.name);