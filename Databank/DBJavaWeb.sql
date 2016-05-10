-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema IIMJavaWeb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema IIMJavaWeb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `IIMJavaWeb` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `IIMJavaWeb` ;

-- -----------------------------------------------------
-- Table `IIMJavaWeb`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IIMJavaWeb`.`User` (
  `id` INT NOT NULL,
  `FirstName` VARCHAR(45) NULL,
  `LastName` VARCHAR(45) NULL,
  `Type` INT NULL,
  `Email` VARCHAR(60) NULL,
  `Password` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IIMJavaWeb`.`Reservation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IIMJavaWeb`.`Reservation` (
  `Id` INT NOT NULL,
  `CreationDate` DATETIME NULL,
  `StartDate` DATETIME NULL,
  `EndDate` DATETIME NULL,
  `User_id` INT NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `fk_Reservation_User1_idx` (`User_id` ASC),
  CONSTRAINT `fk_Reservation_User1`
    FOREIGN KEY (`User_id`)
    REFERENCES `IIMJavaWeb`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IIMJavaWeb`.`Material`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IIMJavaWeb`.`Material` (
  `Id` INT NOT NULL,
  `ArticleNr` VARCHAR(45) NULL,
  `Description` VARCHAR(120) NULL,
  `Name` VARCHAR(45) NULL,
  `Price` DECIMAL(100) NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IIMJavaWeb`.`ReservationDetail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `IIMJavaWeb`.`ReservationDetail` (
  `Id` INT NOT NULL,
  `Amount` INT NULL,
  `PickUpDate` DATETIME NULL,
  `BroughtBackDate` DATETIME NULL,
  `Reservation_Id` INT NOT NULL,
  `Material_Id` INT NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `fk_ReservationDetail_Reservation_idx` (`Reservation_Id` ASC),
  INDEX `fk_ReservationDetail_Material1_idx` (`Material_Id` ASC),
  CONSTRAINT `fk_ReservationDetail_Reservation`
    FOREIGN KEY (`Reservation_Id`)
    REFERENCES `IIMJavaWeb`.`Reservation` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ReservationDetail_Material1`
    FOREIGN KEY (`Material_Id`)
    REFERENCES `IIMJavaWeb`.`Material` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
