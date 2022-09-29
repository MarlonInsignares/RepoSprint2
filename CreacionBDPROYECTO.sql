-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Usuario` (
  `Cedula` INT NOT NULL,
  `Nombres` VARCHAR(50) NOT NULL,
  `Apellidos` VARCHAR(50) NOT NULL,
  `Teléfono` INT NOT NULL,
  `Email` VARCHAR(50) NOT NULL,
  `usuario` VARCHAR(45) NOT NULL,
  `Contraseña` VARCHAR(45) NOT NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  `Ciudad` VARCHAR(45) NOT NULL,
  `Sexo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Cedula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tipo_usurio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tipo_usurio` (
  `Cod_tipo_usuario` INT NOT NULL,
  `Adoptantes` VARCHAR(45) NOT NULL,
  `Administrador` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Cod_tipo_usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Login`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Login` (
  `Cod_Login` INT NOT NULL,
  `Contraseña` VARCHAR(45) NOT NULL,
  `Usuario` VARCHAR(45) NOT NULL,
  `Tipo_usurio_Cod_tipo_usuario` INT NOT NULL,
  PRIMARY KEY (`Cod_Login`, `Tipo_usurio_Cod_tipo_usuario`),
  INDEX `fk_Login_Tipo_usurio1_idx` (`Tipo_usurio_Cod_tipo_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_Login_Tipo_usurio1`
    FOREIGN KEY (`Tipo_usurio_Cod_tipo_usuario`)
    REFERENCES `mydb`.`Tipo_usurio` (`Cod_tipo_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tipo_usurio_has_Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tipo_usurio_has_Usuario` (
  `Tipo_usurio_Cod_tipo_usuario` INT NOT NULL,
  `Usuario_Cedula` INT NOT NULL,
  PRIMARY KEY (`Tipo_usurio_Cod_tipo_usuario`, `Usuario_Cedula`),
  INDEX `fk_Tipo_usurio_has_Usuario_Usuario1_idx` (`Usuario_Cedula` ASC) VISIBLE,
  INDEX `fk_Tipo_usurio_has_Usuario_Tipo_usurio_idx` (`Tipo_usurio_Cod_tipo_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_Tipo_usurio_has_Usuario_Tipo_usurio`
    FOREIGN KEY (`Tipo_usurio_Cod_tipo_usuario`)
    REFERENCES `mydb`.`Tipo_usurio` (`Cod_tipo_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tipo_usurio_has_Usuario_Usuario1`
    FOREIGN KEY (`Usuario_Cedula`)
    REFERENCES `mydb`.`Usuario` (`Cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Registro_de_Mascotas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Registro_de_Mascotas` (
  `Codigo_M` INT NOT NULL,
  `Raza` VARCHAR(45) NOT NULL,
  `Estado` VARCHAR(45) NOT NULL,
  `Peso` VARCHAR(45) NOT NULL,
  `Edad` VARCHAR(45) NOT NULL,
  `Color` VARCHAR(45) NOT NULL,
  `Usuario_Cedula` INT NOT NULL,
  PRIMARY KEY (`Codigo_M`),
  INDEX `fk_Registro_de_Mascotas_Usuario1_idx` (`Usuario_Cedula` ASC) VISIBLE,
  CONSTRAINT `fk_Registro_de_Mascotas_Usuario1`
    FOREIGN KEY (`Usuario_Cedula`)
    REFERENCES `mydb`.`Usuario` (`Cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Historial_clinica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Historial_clinica` (
  `Código_Historial` INT NOT NULL,
  `Fecha` DATE NOT NULL,
  `Vacunas` VARCHAR(45) NOT NULL,
  `Enfermedades` VARCHAR(45) NOT NULL,
  `Registro_de_Mascotas_Codigo_M` INT NOT NULL,
  PRIMARY KEY (`Código_Historial`, `Registro_de_Mascotas_Codigo_M`),
  INDEX `fk_Historial_clinica_Registro_de_Mascotas1_idx` (`Registro_de_Mascotas_Codigo_M` ASC) VISIBLE,
  CONSTRAINT `fk_Historial_clinica_Registro_de_Mascotas1`
    FOREIGN KEY (`Registro_de_Mascotas_Codigo_M`)
    REFERENCES `mydb`.`Registro_de_Mascotas` (`Codigo_M`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PQR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PQR` (
  `Codigo_pq` INT NOT NULL,
  `Observaciones` VARCHAR(45) NOT NULL,
  `Usuario_Cedula` INT NOT NULL,
  PRIMARY KEY (`Codigo_pq`),
  INDEX `fk_PQR_Usuario1_idx` (`Usuario_Cedula` ASC) VISIBLE,
  CONSTRAINT `fk_PQR_Usuario1`
    FOREIGN KEY (`Usuario_Cedula`)
    REFERENCES `mydb`.`Usuario` (`Cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
