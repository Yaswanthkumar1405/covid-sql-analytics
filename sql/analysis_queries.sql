-- analysis_queries.sql

-- Query 1: Top 10 countries with highest total cases
SELECT c.country_name, MAX(cd.total_cases) AS total_cases
FROM covid_data cd
JOIN country c ON cd.country_id = c.country_id
GROUP BY c.country_name
ORDER BY total_cases DESC
LIMIT 10;

-- Query 2: Highest fatality rate by country
SELECT c.country_name,
ROUND(MAX(cd.total_deaths)::NUMERIC / NULLIF(MAX(cd.total_cases)::NUMERIC, 0) * 100, 2) AS fatality_rate
FROM covid_data cd
JOIN country c ON cd.country_id = c.country_id
GROUP BY c.country_name
ORDER BY fatality_rate DESC
LIMIT 10;