
-- SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
-- SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';




-- -----------------------------------------------------
-- Table `rvc353_2`.`Province`
-- -----------------------------------------------------
-- DROP TABLE IF EXISTS `Province` ;

CREATE TABLE IF NOT EXISTS `Province` (
  
  `provinceName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`provinceName`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rvc353_2`.`City`
-- -----------------------------------------------------
-- DROP TABLE IF EXISTS `City` ;

CREATE TABLE IF NOT EXISTS `City` (
  `provinceName` VARCHAR(45) NOT NULL,
  `cityName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`provinceName`,`cityName`),
  CONSTRAINT `city_province`
	FOREIGN KEY (`provinceName`)
	REFERENCES `Province` (`provinceName`)
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `rvc353_2`.`User`
-- -----------------------------------------------------
-- DROP TABLE IF EXISTS `User` ;

CREATE TABLE IF NOT EXISTS `User` (
  `userID` INT NOT NULL AUTO_INCREMENT ,
  `email` VARCHAR(45) NOT NULL,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `user_type` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `province` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NULL, 
  PRIMARY KEY (`userID`),
  UNIQUE KEY (`email`),
  INDEX `user_type_idx` (`user_type` ASC),
  CONSTRAINT `user_province`
    FOREIGN KEY (`province`)
    REFERENCES `Province` (`provinceName`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION) 
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `rvc353_2`.`backuppayment`
-- -----------------------------------------------------
-- DROP TABLE IF EXISTS `backuppayment` ;

CREATE TABLE IF NOT EXISTS `backuppayment` (
  `userID` int(11) NOT NULL,
  `AdID` int(11) NOT NULL,
  `promoDays` int(11) NOT NULL DEFAULT '-1',
  `cardNumber` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `DateofPayment` date NOT NULL,
  `PaymentType` varchar(20) NOT NULL,
  `plan` varchar(20) NOT NULL,
  PRIMARY KEY (`userID`,`AdID`,`DateofPayment`,`promoDays`,`plan`,`PaymentType`),
  KEY `userID_idx` (`userID`),
  KEY `adID_idx` (`AdID`),
  CONSTRAINT `userID` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -----------------------------------------------------
-- Table `rvc353_2`.`Membership`
-- -----------------------------------------------------
-- DROP TABLE IF EXISTS `Membership` ;

CREATE TABLE IF NOT EXISTS `Membership` (
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
-- DROP TABLE IF EXISTS `MembershipPayment` ;

CREATE TABLE IF NOT EXISTS `MembershipPayment` (
  `userID` INT NOT NULL,
  `plan` VARCHAR(45) NOT NULL,
  `cardNumber` INT NULL,
  `amount` INT NULL,
  `DateofPayment` DATE NOT NULL,
  PRIMARY KEY (`userID`, `plan`,`DateofPayment`),
  INDEX `date_idx` (`DateofPayment` ASC),
  CONSTRAINT `MembershipPayment_user`
    FOREIGN KEY (`userID`)
    REFERENCES `User` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `MembershipPayment_plan`
    FOREIGN KEY (`plan`)
    REFERENCES `Membership` (`plan`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `rvc353_2`.`Category`
-- -----------------------------------------------------
-- DROP TABLE IF EXISTS `Category` ;

CREATE TABLE IF NOT EXISTS `Category` (
  `categoryType` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`categoryType`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `rvc353_2`.`SubCategory`
-- -----------------------------------------------------
-- DROP TABLE IF EXISTS `SubCategory` ;

CREATE TABLE IF NOT EXISTS `SubCategory` (
  `categoryType` VARCHAR(45) NOT NULL,
  `sub_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`categoryType`,`sub_type`),
  CONSTRAINT `subcategory_category`
	FOREIGN KEY (`categoryType`)
	REFERENCES `Category` (`categoryType`)
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `rvc353_2`.`Store`
-- -----------------------------------------------------
-- DROP TABLE IF EXISTS `Store` ;

CREATE TABLE IF NOT EXISTS `Store` (
  `storeName` VARCHAR(45) NOT NULL,
  `SL` INT NULL,
  PRIMARY KEY (`storeName`),
  UNIQUE KEY (`SL`))
ENGINE = InnoDB;




-- -----------------------------------------------------
-- Table `rvc353_2`.`Ad`
-- -----------------------------------------------------
-- DROP TABLE IF EXISTS `Ad` ;

CREATE TABLE IF NOT EXISTS `Ad` (
  `AdID` INT NOT NULL AUTO_INCREMENT ,
  `contact` VARCHAR(45) NOT NULL,
  `price` INT NOT NULL,
  `forsaleby` VARCHAR(45) NOT NULL,
  `availability` VARCHAR(45) NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `description` VARCHAR(200) NOT NULL,
  `images` VARCHAR(45) NOT NULL,
  `category` VARCHAR(45) NOT NULL,
  `subcategory` VARCHAR(45) NOT NULL,
  `userID` INT NOT NULL,
  `postDate` DATE NULL,
  `province` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `storeName` VARCHAR(45) NOT NULL,
  `adtype` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`AdID`),
  INDEX `AdID_idx` (`AdID` ASC),
  INDEX `availability_idx` (`availability` ASC),
 
  INDEX `sub_catogery__idx` (`subcategory` ASC),
  INDEX `userID_idx` (`userID` ASC),
  INDEX `store_idx` (`storeName` ASC),
  INDEX `province_idx` (`province` ASC),
  INDEX `city_idx` (`city` ASC),
  CONSTRAINT `Ad_user`
    FOREIGN KEY (`userID`)
    REFERENCES `User` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Ad_province`
    FOREIGN KEY (`province`)
    REFERENCES `Province` (`provinceName`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Ad_store`
    FOREIGN KEY (`storeName`)
    REFERENCES `Store` (`storeName`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `rvc353_2`.`PromotionPayment`
-- -----------------------------------------------------
-- DROP TABLE IF EXISTS `PromotionPayment` ;

CREATE TABLE IF NOT EXISTS `PromotionPayment` (
  `userID` INT NOT NULL,
  `AdID` INT NOT NULL,
  `promoDays` INT NOT NULL,
  `cardNumber` INT NULL,
  `amount` INT NULL,
  `DateofPayment` DATE NOT NULL,
  PRIMARY KEY (`AdID`,`promoDays`,`DateofPayment`),
  INDEX `date_idx` (`DateofPayment` ASC),
  INDEX `user_idx` (`AdID` ASC),
  CONSTRAINT `PromotionPayment_user`
    FOREIGN KEY (`userID`)
    REFERENCES `User` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `promotionPayment_Ad`
    FOREIGN KEY (`AdID`)
    REFERENCES `Ad` (`AdID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;




-- -----------------------------------------------------
-- Table `rvc353_2`.`Transaction`
-- -----------------------------------------------------
-- DROP TABLE IF EXISTS `Transaction` ;

CREATE TABLE IF NOT EXISTS `Transaction` (
  `transactionNO` INT NOT NULL AUTO_INCREMENT,
  `dateofPayment` DATE NULL,
  `paymethod` VARCHAR(200) NULL,
  `cardNumber` INT NULL,
  `purchasetype` VARCHAR(45) NULL,
  `rating` INT NULL,
  `amount` INT NULL,
  `userID` INT NOT NULL,
  `AdID` INT NOT NULL,
  PRIMARY KEY (`transactionNO`),
  INDEX `Transaction_userID_idx` (`userID` ASC),
  INDEX `Transaction_Ad_idx` (`AdID` ASC),
  INDEX `rating_idx` (`rating` ASC),
  INDEX `paymethod_idx` (`paymethod` ASC),
  INDEX `purchasetype_idx` (`purchasetype` ASC),
  CONSTRAINT `trasaction_user`
    FOREIGN KEY (`userID`)
    REFERENCES `User` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `transaction_Ad`
    FOREIGN KEY (`AdID`)
	REFERENCES `Ad` (`AdID`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `rvc353_2`.`StoreReantal`
-- -----------------------------------------------------
-- DROP TABLE IF EXISTS `StoreReantal` ;

CREATE TABLE IF NOT EXISTS `StoreReantal` (
  `rentDate` DATE NOT NULL,
  `timeslot` VARCHAR(45) NOT NULL,
  `delivery` VARCHAR(45) NULL,
  `cardNumber` INT NULL,
  `price` INT NULL,
  `userID` INT NOT NULL,
  `storeName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`rentDate`,`timeslot`,`storeName`),
  INDEX `rent_user` (`userID` ASC),
  INDEX `rent_name` (`storeName` ASC),
  INDEX `rent_date` (`rentDate` ASC),
  CONSTRAINT `rent_user`
    FOREIGN KEY (`userID`)
    REFERENCES `User` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `rent_store`
    FOREIGN KEY (`storeName`)
    REFERENCES `Store` (`storeName`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



alter table User modify column province varchar(45);
alter table Ad modify column storeName varchar(45);
alter table Ad change contact phone varchar(45);

