-- ----------------------------------------------------------------------
-- MySQL Migration Toolkit
-- SQL Create Script
-- ----------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;

CREATE DATABASE IF NOT EXISTS `BD_Alumnos`
  CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `BD_Alumnos`;
-- -------------------------------------
-- Tables

DROP TABLE IF EXISTS `BD_Alumnos`.`alumno`;
CREATE TABLE `BD_Alumnos`.`alumno` (
  `dni` VARCHAR(9) NULL,
  `nombre` VARCHAR(50) NULL,
  `apellido1` VARCHAR(50) NULL,
  `apellido2` VARCHAR(50) NULL,
  `dirección` VARCHAR(100) NULL,
  `codPostal` VARCHAR(5) NULL,
  `edad` INT(10) NULL,
  `edadPadre` INT(10) NULL,
  `edadMadre` INT(10) NULL,
  `provNacimiento` VARCHAR(50) NULL,
  UNIQUE INDEX `Index_08FBB919_07BB_4F02` (`dni`)
)
ENGINE = INNODB;

DROP TABLE IF EXISTS `BD_Alumnos`.`asignatura`;
CREATE TABLE `BD_Alumnos`.`asignatura` (
  `codAsig` INT(10) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NULL,
  `ciclo` VARCHAR(10) NULL,
  `curso` INT(10) NULL,
  `dniProfesor` VARCHAR(9) NULL,
  PRIMARY KEY (`codAsig`),
  UNIQUE INDEX `Index_6731B5F9_2CE1_464A` (`codAsig`),
  INDEX `profesorasignatura` (`dniProfesor`)
)
ENGINE = INNODB;

DROP TABLE IF EXISTS `BD_Alumnos`.`estudian`;
CREATE TABLE `BD_Alumnos`.`estudian` (
  `codAsig` INT(10) NULL,
  `dniAlumno` VARCHAR(9) NULL,
  `nota` INT(10) NULL,
  UNIQUE INDEX `Index_8F403C19_F5F9_4B36` (`codAsig`, `dniAlumno`),
  INDEX `alumnoestudian` (`dniAlumno`),
  INDEX `asignaturaestudian` (`codAsig`)
)
ENGINE = INNODB;

DROP TABLE IF EXISTS `BD_Alumnos`.`profesor`;
CREATE TABLE `BD_Alumnos`.`profesor` (
  `dni` VARCHAR(9) NULL,
  `nombre` VARCHAR(50) NULL,
  `apellido1` VARCHAR(50) NULL,
  `apellido2` VARCHAR(50) NULL,
  UNIQUE INDEX `Index_C9CA047B_1E94_4C7A` (`dni`)
)
ENGINE = INNODB;



SET FOREIGN_KEY_CHECKS = 1;

-- ----------------------------------------------------------------------
-- EOF

