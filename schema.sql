CREATE SCHEMA IF NOT EXISTS catalog_of_my_things;

CREATE TABLE IF NOT EXISTS Genre (
  id SERIAL PRIMARY KEY,
  name VARCHAR(55) NOT NULL
  );

CREATE TABLE IF NOT EXISTS Author (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(55) NOT NULL,
  last_name VARCHAR(55) NOT NULL
  );

CREATE TABLE IF NOT EXISTS Source (
  id SERIAL PRIMARY KEY,
  name VARCHAR(55) NOT NULL);

CREATE TABLE IF NOT EXISTS Label (
  id SERIAL PRIMARY KEY,
  title VARCHAR(55) NOT NULL,
  color VARCHAR(55) NOT NULL
  );

CREATE TABLE IF NOT EXISTS archived (
  id SERIAL PRIMARY KEY,
  archived BOOLEAN NULL
);

CREATE TABLE IF NOT EXISTS Game (
  id SERIAL PRIMARY KEY,
  multiplayer BOOLEAN NOT NULL,
  last_played_at DATE NOT NULL,
  published_date DATE NULL,
  archived BOOLEAN NULL,
  Genre_id INT NOT NULL,
  Author_id INT NOT NULL,
  Source_id INT NOT NULL,
  Label_id INT NOT NULL,
  archived_id INT NOT NULL
);

CREATE TABLE IF NOT EXISTS Book (
  id SERIAL PRIMARY KEY,
  publisher VARCHAR(55) NOT NULL,
  cover_state VARCHAR(55) NULL,
  published_date DATE NULL,
  Author_id INT NOT NULL,
  Label_id INT NOT NULL,
  Source_id INT NOT NULL,
  Genre_id INT NOT NULL,
  archived_id INT NOT NULL
);

CREATE TABLE IF NOT EXISTS music_album (
  id SERIAL PRIMARY KEY,
  on_spotify BOOLEAN NOT NULL,
  publish_date DATE NULL,
  Label_id INT NOT NULL,
  Author_id INT NOT NULL,
  Genre_id INT NOT NULL,
  Source_id INT NOT NULL,
  archived_id INT NOT NULL
);