-- Active: 1748008427030@@127.0.0.1@5432@conservation_db@public
-- DROP TABLE test1_table;

-- Create Rangers Table;
CREATE TABLE rangers(
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    region VARCHAR(30) NOT NULL
);

-- Create Species Table;
CREATE TABLE species(
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(30) NOT NULL,
    scientific_name VARCHAR(30) NOT NULL,
    discovery_date DATE NOT NULL,
    conservation_status VARCHAR(20) NOT NULL CHECK (conservation_status IN ('Endangered', 'Vulnerable', 'Extinct', 'Least Concern'))
);

-- Create Sightings Table;
CREATE TABLE sightings(
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INT NOT NULL REFERENCES rangers(ranger_id) ON DELETE CASCADE,
    species_id INT NOT NULL REFERENCES species(species_id) ON DELETE CASCADE,
    location VARCHAR(30) NOT NULL,
    sighting_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    notes TEXT
);

-- Insert Sample Data Into Rangers;
INSERT INTO rangers(name, region) VALUES 
('Alice Green', 'Northern Hills'),
('Bob White', 'River Delta'),
('Carol King', 'Mountain Range');

-- Insert Sample Data Into Species;
INSERT INTO species(common_name, scientific_name, discovery_date, conservation_status) VALUES 
('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');

-- Insert Sample Data Into Sightings;
INSERT INTO sightings(species_id, ranger_id, location, sighting_time, notes) VALUES 
(1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);

-- Check The Data of Tables;
SELECT * FROM rangers;
SELECT * FROM species;
SELECT * FROM sightings;

-- Problem 1
INSERT INTO rangers(name, region) 
VALUES ('Derek Fox', 'Coastal Plains');

-- Problem 2
SELECT count(DISTINCT species_id) as unique_species_count FROM sightings;

-- Problem 3
SELECT * FROM sightings
WHERE location LIKE '%Pass%';

-- Problem 4
