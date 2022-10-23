CREATE TABLE IF NOT EXISTS training.cyclist_career_teams (
  id UUID PRIMARY KEY,
  lastname text,
  teams set<text>
);


INSERT INTO training.cyclist_career_teams (
  id, lastname, teams
 ) VALUES (
  5b6962dd-3f90-4c93-8f61-eabfa4a803e2, 
  'VOS', 
  {
    'Rabobank-Liv Woman Cycling Team',
    'Rabobank-Liv Giant',
    'Rabobank Women Team',
    'Nederland bloeit'
  }
);


INSERT INTO training.cyclist_career_teams (id,lastname,teams) VALUES (e7cd5752-bc0d-4157-a80f-7523add8dbcd, 'VAN DER BREGGEN', { 'Rabobank-Liv Woman Cycling Team','Sengers Ladies Cycling Team','Team Flexpoint' } );
INSERT INTO training.cyclist_career_teams (id,lastname,teams) VALUES (cb07baad-eac8-4f65-b28a-bddc06a0de23, 'ARMITSTEAD', { 'Boels-Dolmans Cycling Team','AA Drink - Leontien.nl','Team Garmin - Cervelo' } );
INSERT INTO training.cyclist_career_teams (id,lastname,teams) VALUES (1c9ebc13-1eab-4ad5-be87-dce433216d40, 'BRAND', { 'Rabobank-Liv Woman Cycling Team','Rabobank-Liv Giant','AA Drink - Leontien.nl','Leontien.nl' } );


SELECT * FROM training.cyclist_career_teams;

CREATE TABLE IF NOT EXISTS training.cyclist_telefono (
  id UUID PRIMARY KEY,
  telefonos set<text>
);

INSERT INTO training.cyclist_telefono (id, telefonos) VALUES (5b6962dd-3f90-4c93-8f61-eabfa4a803e2, {'123-141','235245'});
INSERT INTO training.cyclist_telefono (id, telefonos) VALUES (1c9ebc13-1eab-4ad5-be87-dce433216d40, {'123-141','235245'});

SELECT * FROM training.cyclist_telefono;
DESC training.cyclist_telefono;

UPDATE training.cyclist_telefono SET telefonos = {'123-11','11'} WHERE id = 1c9ebc13-1eab-4ad5-be87-dce433216d40;

SELECT * FROM training.cyclist_telefono;

SELECT MAX(id) FROM training.cyclist_telefono;
SELECT COUNT(*) FROM training.cyclist_telefono;

INSERT INTO training.cyclist_telefono (id, telefonos) VALUES (1c9ebc13-1eab-4ad5-be87-dce433216d40, {'222-333','6789'});

SELECT * FROM training.cyclist_telefono;

INSERT INTO training.cyclist_career_teams (id,lastname,teams) VALUES (1c9ebc13-1eab-4ad5-be87-dce433216d41, 'BRAND', { 'Rabobank-Liv Woman Cycling Team','Rabobank-Liv Giant','AA Drink - Leontien.nl','Leontien.nl' } );

SELECT * FROM training.cyclist_career_teams;

SELECT lastname, MAX(id) FROM training.cyclist_career_teams GROUP BY lastname;

CREATE INDEX cyclist_career_teams_lastname ON training.cyclist_career_teams (lastname);

SELECT id, MAX(lastname) FROM training.cyclist_career_teams GROUP BY id;

TRUNCATE TABLE training.cyclist_telefono;

SELECT * FROM training.cyclist_telefono;

DROP TABLE training.cyclist_telefono;

CREATE TABLE training.cyclist_telefono (
    id uuid PRIMARY KEY,
    telefonos set<text>
);

SELECT * FROM training.cyclist_career_teams WHERE id IN (1c9ebc13-1eab-4ad5-be87-dce433216d40);