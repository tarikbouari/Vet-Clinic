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

