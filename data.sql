INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg)  VALUES (1, 'Agumon', '2020-02-03', 0, true, 10.23);
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (2, 'Gabumon', '2018-11-15', 2, true, 8.0);
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (3, 'Pikachu', '2021-01-07', 1, false, 15.04);
INSERT INTO animals (id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (4, 'Devimon', '2017-05-12', 5, true, 11.0);

INSERT INTO animals VALUES (5, 'Charmander', '2020-02-08', 0, false, -11.0);
INSERT INTO animals VALUES (6, 'Plantmon', '2021-11-15', 2, true, -5.7);
INSERT INTO animals VALUES (7, 'Squirtle', '1993-04-02', 3, false, -12.13);
INSERT INTO animals VALUES (8, 'Angemon', '2005-06-12', 1, true, -45);
INSERT INTO animals VALUES (9, 'Boarmon', '2005-06-07', 7, true, 20.4);
INSERT INTO animals VALUES (10, 'Blossom', '1998-10-13', 3, true, 17);
INSERT INTO animals VALUES (11, 'Ditto', '2022-05-14', 4, true, 22);

--Query multiple tables
INSERT INTO owners (age,full_name) VALUES (34, 'Sam Smith');
INSERT INTO owners (age,full_name) VALUES ( 19, 'Jennifer Orwell');
INSERT INTO owners (age,full_name) VALUES ( 45, 'Bob');
INSERT INTO owners (age,full_name) VALUES (77, 'Melody Pond');
INSERT INTO owners (age,full_name) VALUES (14, 'Dean Wincheste');
INSERT INTO owners (age,full_name) VALUES (38, 'Jodie Whittake');

INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');

UPDATE animals SET species_id = 3 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 2 WHERE name NOT LIKE '%mon';

UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name = 'Gabumon' OR 'Pikachu'; 
UPDATE animals SET owner_id = 6 WHERE name = 'Devimon' OR name ='Plantmon';
UPDATE animals SET owner_id = 3 WHERE name = 'Charmander' OR name='Squirtle' OR name ='Blossom';
UPDATE animals SET owner_id = 4 WHERE name = 'Angemon' OR name ='Boarmon';

-- Joining Tables
INSERT INTO vets (name,age,date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-23');
INSERT INTO vets (name,age,date_of_graduation) VALUES ('Maisy Smith', 26, '2019-01-17');
INSERT INTO vets (name,age,date_of_graduation) VALUES ('Stephanie Mendez', 64, '1981-05-04');
INSERT INTO vets (name,age,date_of_graduation) VALUES ('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations (vets_id, species_id) VALUES (1,2);

INSERT INTO specializations (vets_id, species_id) VALUES (3,3),(3,2);
INSERT INTO specializations (vets_id, species_id) VALUES (4,3);

INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (1, 1,'2020-05-24');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (3, 1,'2020-07-22');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (4, 2,'2021-02-02');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (2, 7,'2020-01-05');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (2, 7,'2020-03-08');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (2, 7,'2020-05-14');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (3, 3,'2021-05-04');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (4, 3,'2021-02-24');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (4, 8,'2021-02-24');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (2, 4,'2019-12-21');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (1, 4,'2020-08-10');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (2, 4,'2021-04-07');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (3, 9,'2019-09-29');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (4, 5,'2020-10-03');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (4, 5,'2020-11-04');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (2, 6,'2019-01-24');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (2, 6,'2019-05-15');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (2, 6,'2020-02-27');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (2, 6,'2020-08-03');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (3, 10,'2020-05-24');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES (1, 10,'2021-01-11');

