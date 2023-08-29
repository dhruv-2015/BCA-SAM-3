create database LAB6_BCA3

use LAB6_BCA3


--country
CREATE TABLE country (
    country_id INT PRIMARY KEY,
    country_name VARCHAR(100),
    population INT,
    area_sq_km FLOAT,
    capital VARCHAR(100),
    currency VARCHAR(50)
);

-- state
CREATE TABLE state (
    state_id INT PRIMARY KEY,
    state_name VARCHAR(100),
    population INT,
    area_sq_km FLOAT,
    capital VARCHAR(100),
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES country (country_id)
);

-- Inserting data

INSERT INTO country (country_id, country_name, population, area_sq_km, capital, currency)
VALUES
(1, 'USA', 331002651, 9833520, 'Washington, D.C.', 'USD'),
(2, 'Canada', 38005238, 9984670, 'Ottawa', 'CAD'),
(3, 'Brazil', 212559417, 8515767, 'Brasília', 'BRL'),
(4, 'India', 1380004385, 3287263, 'New Delhi', 'INR'),
(5, 'Russia', 145934462, 17098246, 'Moscow', 'RUB'),
(6, 'China', 1439323776, 9706961, 'Beijing', 'CNY'),
(7, 'Australia', 25499881, 7692024, 'Canberra', 'AUD'),
(8, 'Argentina', 45195777, 2780400, 'Buenos Aires', 'ARS'),
(9, 'Germany', 83783942, 357022, 'Berlin', 'EUR'),
(10, 'South Africa', 59308690, 1221037, 'Pretoria', 'ZAR');



INSERT INTO state (state_id, state_name, population, area_sq_km, capital, country_id)
VALUES
(1, 'California', 39538223, 423972, 'Sacramento', 1),
(2, 'Texas', 28995881, 695662, 'Austin', 1),
(3, 'Ontario', 14734014, 917741, 'Toronto', 2),
(4, 'São Paulo', 46289333, 248209, 'São Paulo', 3),
(5, 'Maharashtra', 114063427, 307713, 'Mumbai', 4),
(6, 'Moscow Oblast', 7694989, 443562, 'Moscow', 5),
(7, 'Beijing', 21542000, 16410, 'Beijing', 6),
(8, 'New South Wales', 8160062, 800642, 'Sydney', 7),
(9, 'Buenos Aires Province', 17700000, 307571, 'La Plata', 8),
(10, 'Bavaria', 13076721, 70550, 'Munich', 9);

-- Part – A
-- 1. Create a view that displays the top 5 countries with the highest population, along with their population figures.
create view Top5Countries as
select TOP 5 country_name, population from country order by population desc

select * from Top5Countries
-- 2. Create a view that lists countries that do not have any states.
create view countriesWithoutStates as
select country.country_id, country.country_name from country left outer join state on country.country_id = state.country_id where state.state_id is null
select * from countriesWithoutStates 
-- Part – B
-- 3. Create a view that displays the capital cities of countries with a population greater than 10 million.
-- 4. Create a view that displays the state with the highest population for each country, along with its population figure.
-- Part – C
-- 5. Create a view that lists states that do not have a designated capital.
-- 6. Create a view that displays countries with more than one capital city.