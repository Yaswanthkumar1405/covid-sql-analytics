-- tables.sql

CREATE TABLE country (
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(255),
    continent VARCHAR(255),
    population BIGINT
);

CREATE TABLE datedim (
    date_id DATE PRIMARY KEY,
    year INT,
    month INT,
    day INT,
    month_name VARCHAR(20),
    weekday_name VARCHAR(20)
);

CREATE TABLE covid_data_raw (
    iso_code TEXT,
    continent TEXT,
    location TEXT,
    date DATE,
    total_cases DOUBLE PRECISION,
    new_cases DOUBLE PRECISION,
    total_deaths DOUBLE PRECISION,
    new_deaths DOUBLE PRECISION,
    icu_patients DOUBLE PRECISION,
    people_fully_vaccinated DOUBLE PRECISION,
    total_vaccinations DOUBLE PRECISION,
    people_vaccinated DOUBLE PRECISION,
    stringency_index DOUBLE PRECISION,
    population DOUBLE PRECISION
);

CREATE TABLE covid_data (
    country_id INT,
    date_id DATE,
    total_cases DOUBLE PRECISION,
    new_cases DOUBLE PRECISION,
    total_deaths DOUBLE PRECISION,
    new_deaths DOUBLE PRECISION,
    icu_patients DOUBLE PRECISION,
    stringency_index DOUBLE PRECISION,
    PRIMARY KEY (country_id, date_id)
);

CREATE TABLE vaccination (
    country_id INT,
    date_id DATE,
    total_vaccinations DOUBLE PRECISION,
    people_vaccinated DOUBLE PRECISION,
    people_fully_vaccinated DOUBLE PRECISION,
    PRIMARY KEY (country_id, date_id)
);