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
-- Schema spotify
-- -----------------------------------------------------
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`artists`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`artists` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ironhackers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ironhackers` (
  `id` INT NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`songs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`songs` (
  `id` INT NOT NULL,
  `lyrics` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `artists_id` INT NOT NULL,
  `ironhackers_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_songs_artists_idx` (`artists_id` ASC) VISIBLE,
  INDEX `fk_songs_ironhackers1_idx` (`ironhackers_id` ASC) VISIBLE,
  CONSTRAINT `fk_songs_artists`
    FOREIGN KEY (`artists_id`)
    REFERENCES `mydb`.`artists` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_songs_ironhackers1`
    FOREIGN KEY (`ironhackers_id`)
    REFERENCES `mydb`.`ironhackers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
