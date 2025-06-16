-- views.sql

CREATE OR REPLACE VIEW vw_case_fatality_rate AS
SELECT
    c.country_name,
    d.year,
    d.month_name,
    ROUND(MAX(cd.total_deaths)::NUMERIC / NULLIF(MAX(cd.total_cases)::NUMERIC, 0) * 100, 2) AS case_fatality_rate
FROM covid_data cd
JOIN country c ON cd.country_id = c.country_id
JOIN datedim d ON cd.date_id = d.date_id
WHERE cd.total_cases IS NOT NULL AND cd.total_deaths IS NOT NULL
GROUP BY c.country_name, d.year, d.month_name;