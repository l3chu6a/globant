SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Table `ARDEP`.`departments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ARDEP`.`departments` (
  `id` INT NOT NULL,
  `department` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ARDEP`.`jobs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ARDEP`.`jobs` (
  `id` INT NOT NULL,
  `job` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ARDEP`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ARDEP`.`hired_employees` (
  `id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,  -- Assuming name is a string, change the data type accordingly
  `datetime` DATETIME NULL,
  `department_id` INT NULL,
  `job_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_employees_jobs1_idx` (`job_id` ASC),
  CONSTRAINT `fk_employees_jobs1`
    FOREIGN KEY (`job_id`)
    REFERENCES `ARDEP`.`jobs` (`id`),
  CONSTRAINT `fk_employees_departments1`
    FOREIGN KEY (`department_id`)
    REFERENCES `ARDEP`.`departments` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
