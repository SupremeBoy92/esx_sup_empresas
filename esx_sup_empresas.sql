SET @job_name = 'bahamas';
SET @society_name = 'society_bahamas';
SET @job_Name_Caps = 'Bahamas';
SET @fridge = 'society_bahamas_fridge';
SET @fridge_Name = 'Bahamas (frigo)';
SET @offjob_name = 'offbahamas';




INSERT INTO `addon_account` (name, label, shared) VALUES
  (@society_name, @job_Name_Caps, 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
  (@society_name, @job_Name_Caps, 1),
  (@fridge,@fridge_Name , 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
    (@society_name, @job_Name_Caps, 1)
;

INSERT INTO `jobs` (name, label, whitelisted) VALUES
  (@job_name, @job_Name_Caps, 1),
  (@offjob_name, @job_Name_Caps, 1)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  (@job_name, 0, 'barman', 'Bailarín', 500, '{}', '{}'),
  (@job_name, 1, 'dancer', 'Barman', 600, '{}', '{}'),
  (@job_name, 2, 'viceboss', 'Gerente', 700, '{}', '{}'),
  (@job_name, 3, 'boss', 'Dueño', 1000, '{}', '{}'),

  (@offjob_name, 0, 'barman', 'Fuera de Servicio', 0, '{}', '{}'),
  (@offjob_name, 1, 'dancer', 'Fuera de Servicio', 0, '{}', '{}'),
  (@offjob_name, 2, 'viceboss', 'Fuera de Servicio', 0, '{}', '{}'),
  (@offjob_name, 3, 'boss', 'Fuera de Servicio', 0, '{}', '{}')
;

