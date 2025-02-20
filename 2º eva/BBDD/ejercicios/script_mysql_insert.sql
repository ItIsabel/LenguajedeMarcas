-- ----------------------------------------------------------------------
-- SQL data bulk transfer script generated by the MySQL Migration Toolkit
-- ----------------------------------------------------------------------

-- Disable foreign key checks
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;

INSERT INTO `BD_Alumnos`.`alumno`(`dni`, `nombre`, `apellido1`, `apellido2`, `dirección`, `codPostal`, `edad`, `edadPadre`, `edadMadre`, `provNacimiento`)
VALUES ('41', 'Ismael', 'apelIsmael', 'apel2', NULL, NULL, 18, 45, 49, 'Madrid'),
  ('42', 'Victor', 'apelVictor', 'apel2', NULL, NULL, 20, 45, 43, 'Madrid'),
  ('43', 'Jesús', 'apelJesús', 'apel2', NULL, NULL, 23, 53, 51, 'Valladolid'),
  ('44', 'Javier', 'apelJavier', 'apel2', NULL, NULL, 28, 56, 56, 'Ourense'),
  ('45', 'Alberto', 'apelAlberto', 'apel2', NULL, NULL, 20, 44, 44, 'Ourense');

INSERT INTO `BD_Alumnos`.`asignatura`(`codAsig`, `nombre`, `ciclo`, `curso`, `dniProfesor`)
VALUES (1, 'Programación en lenguajes estructurados', 'DAI', 1, '2'),
  (2, 'Análisis y Diseño detallado de aplicaciones Informácticas de gestión', 'DAI', 1, '1'),
  (3, 'Sistemas Multiusuario y en red', 'DAI', 1, '3'),
  (4, 'Oracle', 'DAI', 2, '4'),
  (6, 'Programación en estornos gráficos', 'DAI', 2, '3'),
  (7, 'Fundamentos de programación', 'ASI', 1, '5'),
  (8, 'Redes de ordenadores', 'ASI', 1, '7'),
  (9, 'Sistemas Monousuario y Multiusuario', 'ASI', 1, '8'),
  (10, 'Desarrollo de funciones en UNIX', 'ASI', 2, '7'),
  (11, 'Sistemas Gestores de Bases de Datos', 'ASI', 2, '5'),
  (12, 'Mantenimiento de Ordenadores', 'ASI', 2, '6');

INSERT INTO `BD_Alumnos`.`estudian`(`codAsig`, `dniAlumno`, `nota`)
VALUES (1, '41', 5),
  (1, '42', 4),
  (1, '43', 3),
  (1, '44', 8),
  (2, '41', 7),
  (2, '42', 9),
  (2, '43', 1),
  (2, '44', 3),
  (2, '45', 3);

INSERT INTO `BD_Alumnos`.`profesor`(`dni`, `nombre`, `apellido1`, `apellido2`)
VALUES ('1', 'Manuel José', 'Blanco', 'Barge'),
  ('2', 'Jacinto', 'Macias', 'Blanco'),
  ('3', 'Miguel', 'Pérez', 'Pérez'),
  ('4', 'Ana', 'Blanco', 'Pérez'),
  ('5', 'Vafa', 'Abbasi', 'Pérez'),
  ('6', 'José Ramón', 'Oliva', 'Oliva'),
  ('7', 'Alberto', 'Blanco', 'de la Rosa'),
  ('8', 'Custodia', 'Navajo', 'Navascues');

-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

-- End of script
