-- Business Questions for analysis
-- Which city and season have the most successful athletes?

SELECT City, Season, COUNT(Medal) as Medal_count
FROM Athlete
WHERE Medal IS NOT NULL
GROUP BY City, Season
ORDER BY Medal_count DESC


-- Gender distribution of athletes across different sports and events

SELECT Sport, Event, Sex, COUNT(Name) as athlete_count
FROM Athlete
GROUP BY Sport, Event, Sex
ORDER BY athlete_count DESC;

--Which sports and events tend to have most medals awarded
SELECT Sport, Event, COUNT(Medal) as medal_count
FROM Athlete
GROUP BY Sport, Event
ORDER BY medal_count DESC;

--Which athletes are the most successful in terms of medals won?
SELECT Name, COUNT(Medal) as medal_count
FROM Athlete
GROUP BY Name
ORDER BY medal_count DESC;

--Which athletes are the most successful in terms of medals won, type of sport and event?

SELECT Name,Sport, Event, COUNT(Medal) as medal_count
FROM Athlete
GROUP BY Name, Sport, Event
ORDER BY medal_count DESC;


-- Using statistical analysis to find factors associated  with winning more medals

WITH city_season_medals AS (
	SELECT City, Season, COUNT(Medal) AS medal_count
	FROM Athlete
	GROUP BY City, Season
)
SELECT City, Season, medal_count, (medal_count - AVG(medal_count) OVER()) / STDEV(medal_count) OVER() AS z_score
FROM city_season_medals
ORDER BY z_score DESC


--Trends in the number of medals won over time
-- By year
SELECT Year, COUNT(Medal) as medal_count
FROM Athlete
GROUP BY Year
ORDER BY Year ;

--By year, sport
SELECT Year, Sport, COUNT(Medal) as medal_count
FROM Athlete
GROUP BY Year, Sport
ORDER BY Year;

-- By year, event
SELECT Year, Event, COUNT(Medal) as medal_count
FROM Athlete
GROUP BY Year, Event
ORDER BY Year;



