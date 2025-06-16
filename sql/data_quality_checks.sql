-- data_quality_checks.sql

-- Check for missing values
SELECT COUNT(*) AS total_rows,
       COUNT(*) FILTER (WHERE location IS NULL) AS missing_location,
       COUNT(*) FILTER (WHERE date IS NULL) AS missing_date
FROM covid_data_raw;

-- Check for duplicates
SELECT location, date, COUNT(*)
FROM covid_data_raw
GROUP BY location, date
HAVING COUNT(*) > 1;

-- Check for vaccination > population
SELECT c.country_name, v.date_id, v.people_fully_vaccinated, c.population,
       ROUND((v.people_fully_vaccinated::NUMERIC / NULLIF(c.population, 0)) * 100, 2) AS vaccination_percent
FROM vaccination v
JOIN country c ON v.country_id = c.country_id
WHERE v.people_fully_vaccinated > c.population;

-- Check for negative numbers
SELECT * FROM covid_data
WHERE new_cases < 0 OR new_deaths < 0;

-- Orphan date check
SELECT cd.*
FROM covid_data cd
LEFT JOIN datedim d ON cd.date_id = d.date_id
WHERE d.date_id IS NULL;