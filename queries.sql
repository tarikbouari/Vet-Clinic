SELECT *  FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
SELECT name FROM animals WHERE neutered = true  AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT species FROM animals;
ROLLBACK;

SELECT species FROM animals;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
SELECT species FROM animals;
COMMIT;
SELECT species FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';

SAVEPOINT my_save_point1;
UPDATE animals SET weight_kg = weight_kg* -1;

ROLLBACK TO my_save_point1;

UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0; 

SELECT * FROM animals;

COMMIT; 

SELECT COUNT(*) AS All_animal FROM  animals;
SELECT AVG(weight_kg) FROM animals;
SELECT COUNT(escape_attempts) FROM animals WHERE escape_attempts = 0;
SELECT MIN(weight_kg), MAX(weight_kg), species FROM animals GROUP BY species;
SELECT SUM(escape_attempts), neutered FROM animals GROUP BY neutered;
SELECT AVG(escape_attempts), species, date_of_birth FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-01-01' GROUP BY species, date_of_birth;

--Query multiple tables

SELECT animals.name, owners.full_name 
FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE full_name = 'Melody Pond';

SELECT animals.name, species.name
FROM animals
JOIN species ON animals.species_id = species.id
WHERE species.name ='Pokemon';

SELECT animals.name, owners.full_name
FROM animals
LEFT JOIN owners ON animals.owner_id = owners.id;

SELECT COUNT(animals.name), species.name 
FROM animals
JOIN species ON animals.species_id = species.id
GROUP BY species.name;

SELECT animals.name, species.name, owners.full_name
FROM animals
JOIN species ON animals.species_id = species.id
JOIN owners ON animals.owner_id = owners.id
WHERE species.name = 'Digimon' AND owners.full_name ='Jennifer Orwell';

SELECT animals.name, owners.full_name 
FROM animals
JOIN owners ON animals.owner_id = owner_id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

SELECT COUNT (*) AS most_animal_owner , owners.full_name
FROM animals 
JOIN owners ON animals.owner_id = owners.id
GROUP BY owners.full_name;
