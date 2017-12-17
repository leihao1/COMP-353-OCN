SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `rvc353_2` ;
CREATE SCHEMA IF NOT EXISTS `rvc353_2` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `rvc353_2` ;


-- -----------------------------------------------------
-- Table `rvc353_2`.`Province`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rvc353_2`.`Province` ;

CREATE TABLE IF NOT EXISTS `rvc353_2`.`Province` (
  
  `provinceName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`provinceName`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rvc353_2`.`City`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rvc353_2`.`City` ;

CREATE TABLE IF NOT EXISTS `rvc353_2`.`City` (
  `provinceName` VARCHAR(45) NOT NULL,
  `cityName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`provinceName`,`cityName`),
  CONSTRAINT `city_province`
	FOREIGN KEY (`provinceName`)
	REFERENCES `rvc353_2`.`Province` (`provinceName`)
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `rvc353_2`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rvc353_2`.`User` ;

CREATE TABLE IF NOT EXISTS `rvc353_2`.`User` (
  `userID` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `user_type` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `province` VARCHAR(45) ,
  `city` VARCHAR(45) , 
  PRIMARY KEY (`userID`),
  UNIQUE KEY (`email`),
  CONSTRAINT `user_province`
    FOREIGN KEY (`province`)
    REFERENCES `rvc353_2`.`Province` (`provinceName`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION) 
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `rvc353_2`.`userOfcard`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rvc353_2`.`userOfcard` ;

CREATE TABLE IF NOT EXISTS `rvc353_2`.`userOfcard` (
  `cardNumber` INT NOT NULL,
  `userID` INT NOT NULL,
  PRIMARY KEY (`cardNumber`),
  CONSTRAINT `card_user`
    FOREIGN KEY (`userID`)
    REFERENCES `rvc353_2`.`User` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `rvc353_2`.`Membership`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rvc353_2`.`Membership` ;

CREATE TABLE IF NOT EXISTS `rvc353_2`.`Membership` (
  `plan` VARCHAR(45) NOT NULL,
  `price` INT NOT NULL,
  `visibleDays` INT NOT NULL,
  PRIMARY KEY (`plan`),
  UNIQUE KEY (`price`,`visibleDays`),
  CHECK (price > 0),
  CHECK (visibleDays >0))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `rvc353_2`.`MembershipPayment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rvc353_2`.`MembershipPayment` ;

CREATE TABLE IF NOT EXISTS `rvc353_2`.`MembershipPayment` (
  `userID` INT NOT NULL,
  `plan` VARCHAR(45) NOT NULL,
  `cardNumber` INT NULL,
  `amount` INT NULL,
  `DateofPayment` DATE NOT NULL,
  PRIMARY KEY (`userID`, `plan`,`DateofPayment`),
  INDEX `member_user_idx` (`userID` ASC),
  CONSTRAINT `MembershipPayment_user`
    FOREIGN KEY (`userID`)
    REFERENCES `rvc353_2`.`User` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `MembershipPayment_plan`
    FOREIGN KEY (`plan`)
    REFERENCES `rvc353_2`.`Membership` (`plan`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
CONSTRAINT `MembershipPayment_cardnumber`
    FOREIGN KEY (`cardNumber`)
    REFERENCES `rvc353_2`.`userOfcard` (`cardNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `rvc353_2`.`Category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rvc353_2`.`Category` ;

CREATE TABLE IF NOT EXISTS `rvc353_2`.`Category` (
  `categoryType` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`categoryType`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `rvc353_2`.`SubCategory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rvc353_2`.`SubCategory` ;

CREATE TABLE IF NOT EXISTS `rvc353_2`.`SubCategory` (
  `categoryType` VARCHAR(45) NOT NULL,
  `sub_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`categoryType`,`sub_type`),
  CONSTRAINT `subcategory_category`
	FOREIGN KEY (`categoryType`)
	REFERENCES `rvc353_2`.`Category` (`categoryType`)
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `rvc353_2`.`Store`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rvc353_2`.`Store` ;

CREATE TABLE IF NOT EXISTS `rvc353_2`.`Store` (
  `storeName` VARCHAR(45) NOT NULL,
  `SL` INT NULL,
  PRIMARY KEY (`storeName`),
  UNIQUE KEY (`SL`))
ENGINE = InnoDB;




-- -----------------------------------------------------
-- Table `rvc353_2`.`Ad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rvc353_2`.`Ad` ;

CREATE TABLE IF NOT EXISTS `rvc353_2`.`Ad` (
  `AdID` INT NOT NULL ,
  `phone` INT NULL,
  `price` INT  NULL,
  `forsaleby` VARCHAR(45)  NULL,
  `availability` VARCHAR(45)  NOT NULL,
  `title` VARCHAR(45) NULL,
  `description` VARCHAR(200) NULL,
  `images` VARCHAR(45) NULL,
  `category` VARCHAR(45) NOT NULL,
  `subcategory` VARCHAR(45) NULL,
  `userID` INT NOT NULL,
  `postDate` DATE NULL,
  `province` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NULL,
  `AdType` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`AdID`),
  INDEX `AdID_idx` (`AdID` ASC),
  INDEX `category_idx` (`category` ASC),
  INDEX `userID_idx` (`userID` ASC),
  INDEX `province_idx` (`province` ASC),
  CONSTRAINT `Ad_category`
    FOREIGN KEY (`category`)
    REFERENCES `rvc353_2`.`Category` (`categoryType`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Ad_user`
    FOREIGN KEY (`userID`)
    REFERENCES `rvc353_2`.`User` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Ad_province`
    FOREIGN KEY (`province`)
    REFERENCES `rvc353_2`.`Province` (`provinceName`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `rvc353_2`.`PromotionPayment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rvc353_2`.`PromotionPayment` ;

CREATE TABLE IF NOT EXISTS `rvc353_2`.`PromotionPayment` (
  `AdID` INT ,
  `promoDays` INT NOT NULL,
  `cardNumber` INT NOT NULL,
  `amount` INT NULL,
  `DateofPayment` DATE NOT NULL,
  PRIMARY KEY (`AdID`,`promoDays`,`DateofPayment`),
  INDEX `date_idx` (`DateofPayment` ASC),
  INDEX `user_idx` (`AdID` ASC),
  INDEX `card_idx` (`cardNumber` ASC),
  CONSTRAINT `promotionPayment_Ad`
    FOREIGN KEY (`AdID`)
    REFERENCES `rvc353_2`.`Ad` (`AdID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `promotionPayment_cardnumber`
    FOREIGN KEY (`cardNumber`)
    REFERENCES `rvc353_2`.`userOfcard` (`cardNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `rvc353_2`.`Transaction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rvc353_2`.`Transaction` ;

CREATE TABLE IF NOT EXISTS `rvc353_2`.`Transaction` (
  `transactionNO` INT NOT NULL ,
  `dateofPayment` DATE NULL,
  `paymethod` VARCHAR(200) NULL,
  `cardNumber` INT NOT NULL,
  `purchasetype` VARCHAR(45) NULL,
  `rating` INT NULL,
  `amount` INT NULL,
  `AdID` INT NOT NULL,
  PRIMARY KEY (`transactionNO`),
  INDEX `Transaction_Ad_idx` (`AdID` ASC),
  INDEX `Transaction_card_idx` (`cardNumber` ASC),
  CONSTRAINT `transaction_Ad`
    FOREIGN KEY (`AdID`)
	REFERENCES `rvc353_2`.`Ad` (`AdID`),
  CONSTRAINT `transaction_cardnumber`
    FOREIGN KEY (`cardNumber`)
	REFERENCES `rvc353_2`.`userOfcard` (`cardNumber`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `rvc353_2`.`StoreRental`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rvc353_2`.`StoreRental` ;

CREATE TABLE IF NOT EXISTS `rvc353_2`.`StoreRental` (
  `rentDate` DATE NOT NULL,
  `starttime` TIME NOT NULL,
  `endtime` TIME NOT NULL,
  `delivery` VARCHAR(45) NULL,
  `cardNumber` INT NOT NULL,
  `price` INT NULL,
  `storeName` VARCHAR(45) NOT NULL,
  `AdID` INT ,
  PRIMARY KEY (`rentDate`,`starttime`,`endtime`,`storeName`),
  INDEX `rent_name` (`storeName` ASC),
  CONSTRAINT `rent_store`
    FOREIGN KEY (`storeName`)
    REFERENCES `rvc353_2`.`Store` (`storeName`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `rent_ad`
    FOREIGN KEY (`AdID`)
    REFERENCES `rvc353_2`.`Ad` (`AdID`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `rent_cardnumber`
    FOREIGN KEY (`cardNumber`)
    REFERENCES `rvc353_2`.`userOfcard` (`cardNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `rvc353_2`.`ExternalBackup`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rvc353_2`.`ExternalBackup` ;

CREATE TABLE IF NOT EXISTS `rvc353_2`.`ExternalBackup` (
  `backupID` INT NOT NULL ,
  `cardNumber` INT NOT NULL,
  `amount` INT NULL,
  `dateofPayment` DATE NULL,
  PRIMARY KEY (`backupID`),
  CONSTRAINT `backup_cardnumber`
    FOREIGN KEY (`cardNumber`)
    REFERENCES `rvc353_2`.`userOfcard` (`cardNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
