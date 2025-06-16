-- inserts.sql

-- Sample: Insert into country (example only, replace with your full data)
-- INSERT INTO country (country_name, continent, population) VALUES (...);

-- Insert into datedim
-- INSERT INTO datedim (date_id, year, month, day, month_name, weekday_name) VALUES (...);

-- Cleaned insert into covid_data
INSERT INTO covid_data (country_id, date_id, total_cases, new_cases, total_deaths, new_deaths, icu_patients, stringency_index)
SELECT DISTINCT ON (c.country_id, r.date)
    c.country_id,
    r.date,
    r.total_cases,
    r.new_cases,
    r.total_deaths,
    r.new_deaths,
    r.icu_patients,
    r.stringency_index
FROM covid_data_raw r
JOIN country c ON r.location = c.country_name
WHERE r.date IS NOT NULL
ORDER BY c.country_id, r.date, r.total_cases DESC NULLS LAST, r.total_deaths DESC NULLS LAST;

-- Cleaned insert into vaccination
INSERT INTO vaccination (country_id, date_id, total_vaccinations, people_vaccinated, people_fully_vaccinated)
SELECT DISTINCT ON (c.country_id, r.date)
    c.country_id,
    r.date,
    r.total_vaccinations,
    r.people_vaccinated,
    r.people_fully_vaccinated
FROM covid_data_raw r
JOIN country c ON r.location = c.country_name
WHERE r.date IS NOT NULL
ORDER BY c.country_id, r.date, r.total_vaccinations DESC NULLS LAST, r.people_fully_vaccinated DESC NULLS LAST;