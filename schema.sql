
CREATE DATABASE vet_clinic;

CREATE TABLE animals (
    id INT PRIMARY KEY NOT NULL,
    name TEXT NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL
    );

ALTER TABLE animals ADD COLUMN species TEXT;

CREATE TABLE owners (
        id BIGSERIAL PRIMARY KEY NOT NULL,
        full_name TEXT NOT NULL,
        age INT NOT NULL
    );

CREATE TABLE species(
        id BIGSERIAL PRIMARY KEY NOT NULL,
        name TEXT NOT NULL
    );
    
ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals DROP COLUMN id;
ALTER TABLE animals ADD COLOUM id BIGSERIAL PRIMARY KEY NOT NULL;
ALTER TABLE animals ADD COLUMN species_id INT REFERENCES species(id);
ALTER TABLE animals ADD COLUMN owner_id INT REFERENCES owners(id);

