use universe;

CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    description TEXT,
    galaxy_type VARCHAR(50) NOT NULL,
    has_life BOOLEAN NOT NULL,
    age_in_millions_of_years NUMERIC NOT NULL
);

CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    galaxy_id INT REFERENCES galaxy(galaxy_id),
    is_main_sequence BOOLEAN NOT NULL,
    age_in_millions_of_years NUMERIC NOT NULL,
    mass_in_solar_units NUMERIC NOT NULL
);

CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    star_id INT REFERENCES star(star_id),
    is_habitable BOOLEAN NOT NULL,
    mass_in_earth_units NUMERIC NOT NULL,
    distance_from_star NUMERIC NOT NULL
);

CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    planet_id INT REFERENCES planet(planet_id),
    is_spherical BOOLEAN NOT NULL,
    orbital_period_in_days NUMERIC NOT NULL
);

CREATE TABLE asteroid (
    asteroid_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    galaxy_id INT REFERENCES galaxy(galaxy_id),
    diameter_in_km NUMERIC NOT NULL,
    is_potentially_hazardous BOOLEAN NOT NULL
);

INSERT INTO galaxy (name, description, galaxy_type, has_life, age_in_millions_of_years)
VALUES
('Milky Way', 'Our home galaxy', 'Spiral', TRUE, 13600),
('Andromeda', 'Nearest spiral galaxy', 'Spiral', FALSE, 10000),
('Triangulum', 'Small spiral galaxy', 'Spiral', FALSE, 8000),
('Large Magellanic Cloud', 'Satellite galaxy of Milky Way', 'Irregular', FALSE, 13000),
('Small Magellanic Cloud', 'Another satellite galaxy of Milky Way', 'Irregular', FALSE, 6000),
('Whirlpool', 'Famous spiral galaxy', 'Spiral', FALSE, 5000);

INSERT INTO star (name, galaxy_id, is_main_sequence, age_in_millions_of_years, mass_in_solar_units)
VALUES
('Sun', 1, TRUE, 4600, 1.0),
('Sirius', 1, TRUE, 242, 2.0),
('Proxima Centauri', 1, TRUE, 4500, 0.12),
('Rigel', 2, FALSE, 8000, 18.0),
('Betelgeuse', 2, FALSE, 10000, 20.0),
('Vega', 2, TRUE, 455, 2.1);

INSERT INTO planet (name, star_id, is_habitable, mass_in_earth_units, distance_from_star)
VALUES
('Earth', 1, TRUE, 1.0, 1.0),
('Mars', 1, FALSE, 0.1, 1.5),
('Venus', 1, FALSE, 0.8, 0.7),
('Jupiter', 1, FALSE, 318.0, 5.2),
('Saturn', 1, FALSE, 95.0, 9.5),
('Neptune', 1, FALSE, 17.0, 30.1),
('Kepler-22b', 2, TRUE, 2.4, 600),
('Proxima b', 3, TRUE, 1.3, 0.05),
('Kepler-452b', 2, TRUE, 5.0, 1400),
('Gliese 581g', 2, TRUE, 1.6, 20),
('HD 209458b', 4, FALSE, 220.0, 50),
('Tau Ceti e', 5, TRUE, 1.7, 11);

INSERT INTO moon (name, planet_id, is_spherical, orbital_period_in_days)
VALUES
('Moon', 1, TRUE, 27.3),
('Phobos', 2, TRUE, 0.3),
('Deimos', 2, TRUE, 1.3),
('Io', 4, TRUE, 1.8),
('Europa', 4, TRUE, 3.5),
('Ganymede', 4, TRUE, 7.2),
('Callisto', 4, TRUE, 16.7),
('Titan', 5, TRUE, 15.9),
('Rhea', 5, TRUE, 4.5),
('Triton', 6, TRUE, 5.9),
('Charon', 6, TRUE, 6.4),
('Enceladus', 5, TRUE, 1.4),
('Mimas', 5, TRUE, 0.9),
('Hyperion', 5, TRUE, 21.3),
('Dione', 5, TRUE, 2.7),
('Miranda', 6, TRUE, 1.4),
('Ariel', 6, TRUE, 2.5),
('Umbriel', 6, TRUE, 4.1),
('Oberon', 6, TRUE, 13.5),
('Titania', 6, TRUE, 8.7);


SELECT name FROM star WHERE galaxy_id = 1;


