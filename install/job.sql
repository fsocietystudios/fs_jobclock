INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('offdutypolice', 'Off-Duty Police', 1),
	('offdutyambulance', 'Off-Duty Ambulance', 1);

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES 
    ('offdutypolice', 0, 'recruit', 'Off-Duty Recruit', 20, '{}', '{}'),
    ('offdutypolice', 1, 'officer', 'Off-Duty Officer', 40, '{}', '{}'),
    ('offdutypolice', 2, 'sergeant', 'Off-Duty Sergeant', 60, '{}', '{}'),
    ('offdutypolice', 3, 'lieutenant', 'Off-Duty Lieutenant', 85, '{}', '{}'),
    ('offdutypolice', 4, 'boss', 'Off-Duty Captain', 100, '{}', '{}'),

    ('offdutyambulance', 0, 'ambulance', 'Off-Duty Jr. EMT', 20, '{}', '{}'),
    ('offdutyambulance', 1, 'doctor', 'Off-Duty EMT', 40, '{}', '{}'),
    ('offdutyambulance', 2, 'cheif_doctor', 'Off-Duty Sr. EMT', 60, '{}', '{}'),
    ('offdutyambulance', 3, 'boss', 'Off-Duty EMT Supervisor', 80, '{}', '{}');