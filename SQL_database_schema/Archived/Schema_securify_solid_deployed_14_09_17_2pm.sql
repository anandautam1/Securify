-- MySQL Script generated by MySQL Workbench
-- Thu Sep 14 13:18:34 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema securify
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema securify
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `securify` DEFAULT CHARACTER SET utf8 ;
USE `securify` ;

-- -----------------------------------------------------
-- Table `securify`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `securify`.`users` (
  `userID` INT(11) NOT NULL AUTO_INCREMENT,
  `fname` VARCHAR(50) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `lname` VARCHAR(50) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `email` VARCHAR(50) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `phone` VARCHAR(50) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `pass_hashed` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `pass_salt` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `role` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `gps_long` DOUBLE NULL,
  `gps_lati` DOUBLE NULL,
  `isOnline` TINYINT NULL,
  `lastUpdated` TIMESTAMP NULL,
  PRIMARY KEY (`userID`),
  UNIQUE INDEX `email` (`email` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `securify`.`registercar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `securify`.`registercar` (
  `carID` INT(11) NOT NULL AUTO_INCREMENT,
  `keyID` VARCHAR(25) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `registerationID` VARCHAR(25) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `nameAlias` VARCHAR(25) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `time_stamp_last_serviced` TIMESTAMP NOT NULL,
  `description` TEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `userID` INT(11) NOT NULL,
  `carImgURI` TEXT NULL,
  PRIMARY KEY (`carID`, `userID`),
  UNIQUE INDEX `email` (`keyID` ASC, `registerationID` ASC),
  INDEX `fk_registercar_users_idx` (`userID` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `securify`.`data`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `securify`.`data` (
  `temp` DOUBLE NULL DEFAULT NULL,
  `humidity` INT(11) NULL DEFAULT NULL,
  `odometer` DOUBLE NULL DEFAULT NULL,
  `gps_long` DOUBLE NULL DEFAULT NULL,
  `gps_lati` DOUBLE NULL DEFAULT NULL,
  `battery_status` INT(11) NULL DEFAULT NULL,
  `description` TEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `carID` INT(11) NOT NULL,
  `userID` INT(11) NOT NULL,
  `time_stamp` TIMESTAMP NOT NULL,
  PRIMARY KEY (`carID`, `userID`),
  INDEX `fk_data_registercar1_idx` (`carID` ASC, `userID` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `securify`.`joblist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `securify`.`joblist` (
  `jobID` INT(11) NOT NULL AUTO_INCREMENT,
  `keyID` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `registerID` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `isJobActive` TINYINT(1) NOT NULL,
  `time_stamp_created` TIMESTAMP NOT NULL,
  `time_stamp_lastupdated` TIMESTAMP NOT NULL,
  `isJobApproved` TINYINT(1) NOT NULL,
  `description` TEXT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `carID` INT(11) NOT NULL,
  `userID` INT(11) NOT NULL,
  PRIMARY KEY (`jobID`, `carID`, `userID`),
  INDEX `fk_joblist_registercar1_idx` (`carID` ASC, `userID` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
