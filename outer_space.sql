-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE galaxy(
  id SERIAL PRIMARY KEY,
  planets INT FOREIGN KEY,
  name NOT NULL TEXT
);

CREATE TABLE planet(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  orbital_period FLOAT NOT NULL,
  galaxy_id INT FOREIGN KEY,
  moon_id INT FOREIGN KEY,
  sun_id
);

CREATE TABLE moons(
  id SERIAL NOT NULL,
  name TEXT NOT NULL UNIQUE,
  planet_id INT FOREIGN KEY,
);

CREATE TABLE big_stars(
  id SERIAL PRIMARY KEY,
  name UNIQUE NOT NULL,
  galaxy_id INT FOREIGN KEY
);

-- INSERT INTO planets
--   (name, orbital_period_in_years, orbits_around, galaxy, moons)
-- VALUES
--   ('Earth', 1.00, 'The Sun', 'Milky Way', '{"The Moon"}'),
--   ('Mars', 1.88, 'The Sun', 'Milky Way', '{"Phobos", "Deimos"}'),
--   ('Venus', 0.62, 'The Sun', 'Milky Way', '{}'),
--   ('Neptune', 164.8, 'The Sun', 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
--   ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', '{}'),
--   ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', '{}');