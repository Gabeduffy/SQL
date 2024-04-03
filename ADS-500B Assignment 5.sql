-- 1.1
DESCRIBE world.country;
SELECT COUNT(*) AS num_country_independent_20th_century
FROM world.country
WHERE YEAR(IndepYear) BETWEEN 1901 AND 2000;
-- 1.2
SELECT COUNT(*) AS num_people_over_75
FROM world.country
WHERE LifeExpectancy >= 75;
-- 1.3
SELECT 
    name AS country_name,
    Population,
    (Population / (SELECT SUM(Population) FROM world.country)) * 100 AS percentage_of_world_population
FROM 
    world.country
ORDER BY 
    Population DESC
LIMIT 
    10;
-- 1.4
SELECT 
    name AS country_name,
    Population / SurfaceArea AS population_density
FROM 
    world.country
ORDER BY 
    population_density DESC
LIMIT 
    10;
-- 1.5
SELECT 
    Region,
    COUNT(*) AS country_count
FROM 
    world.country
GROUP BY 
    Region
ORDER BY 
    country_count DESC;
-- 1.6
SELECT 
    Name,
    COUNT(cl.Language) AS language_count
FROM 
    world.countrylanguage cl
JOIN 
    world.country c ON cl.CountryCode = c.Code
GROUP BY 
    Name
HAVING 
    language_count > 10
ORDER BY 
    language_count DESC;