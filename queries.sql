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

-- Joining Tables

SELECT animals.name, vets.name 
FROM animals, vets, visits
WHERE animals.id = visits.animal_id
AND vets.id = visits.vet_id
AND vets.name = 'William Tatcher'
ORDER BY visit_date DESCQ2
AND vets.name = ' Stephanie Mendez'
GROUP BY animals.name, vets.name;

SELECT vets.name, species.name
FROM specializations 
INNER JOIN species ON species.id = specializations.species_id
FULL OUTER JOIN vets  ON specializations.vets_id = vets.id;


SELECT animals.name, vets.name, visits.visit_date
FROM animals, vets, visits
WHERE animals.id = visits.animal_id
AND vets.id = visits.vet_id
AND vets.name = 'Stephanie Mendez'
AND TO_CHAR(visits.visit_date, 'YYYY-MM-DD') BETWEEN '2020-04-01' AND '2020-08-30';

SELECT DISTINCT(animals.name) animal, COUNT(animals.name) total_visits
FROM animals, vets, visits
WHERE animals.id = visits.animal_id
AND vets.id = visits.vet_id
GROUP BY animals.name
ORDER BY total_visits DESC
LIMIT 1;


SELECT DISTINCT(animals.name) animal, visits.visit_date, vets.name 
FROM vets, animals, visits
WHERE visits.animal_id = animals.id
AND visits.vet_id = vets.id
AND vets.name = 'Maisy Smith'
GROUP BY animals.name, visit_date, vets.name
ORDER BY visit_date
LIMIT 1;


SELECT DISTINCT(animals.name) animal, visits.visit_date visit_date, vets.name vet
FROM vets, animals, visits
WHERE visits.animal_id = animals.id
AND visits.vet_id = vets.id
GROUP BY animals.name, visit_date, vet
ORDER BY visit_date DESC
LIMIT 1;


SELECT COUNT(visit_date)-(SELECT COUNT(vets.name) 
FROM vets, specializations, animals, visits
WHERE
visits.vet_id = vets.id
AND animals.id = visits.animal_id
AND concat(animals.species_id, visits.vet_id) = concat(specializations.species_id, specializations.vets_id)) total_unspecialized_cases 
FROM visits;

WITH new AS(
    SELECT DISTINCT(animals.name) animal, COUNT(animals.name) total_visits, vets.name vet
FROM vets, animals, visits
WHERE visits.animal_id = animals.id
AND visits.vet_id = vets.id
AND vets.name = 'Maisy Smith'
GROUP BY animals.name, vet
)
SELECT * FROM new WHERE total_visits = (SELECT MAX(total_visits) FROM new);