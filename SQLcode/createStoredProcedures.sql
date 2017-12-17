DELIMITER $$
CREATE PROCEDURE `backupAllPayments`()
BEGIN
CALL `comp353`.`backupPromotionPayments`();
CALL `comp353`.`backupMembershipPayments`();

End$$
DELIMITER ;
DELIMITER $$
CREATE PROCEDURE `backupMembershipPayments`()
BEGIN
DECLARE n INT DEFAULT 0;
DECLARE i INT DEFAULT 0;
DECLARE CONTINUE HANDLER FOR 1062
  BEGIN
    -- body of handler
  END;
SELECT COUNT(*) FROM membershippayment INTO n;
SET i=0;
WHILE i<n DO 
  INSERT INTO backuppayment(`userID`,`AdID`,`promoDays`,`cardNumber`,`amount`,`DateofPayment`,`PaymentType`,`plan`) SELECT `userID`,-1,-1,`cardNumber`,`amount`,`DateofPayment`,'Membership',`plan` FROM membershippayment LIMIT i,1;
  SET i = i + 1;
END WHILE;
End$$
DELIMITER ;
DELIMITER $$
CREATE PROCEDURE `backupPromotionPayments`()
BEGIN

DECLARE n INT DEFAULT 0;
DECLARE i INT DEFAULT 0;
DECLARE CONTINUE HANDLER FOR 1062
  BEGIN
    -- body of handler
  END;
SELECT COUNT(*) FROM membershippayment INTO n;
SET i=0;
WHILE i<n DO 
  INSERT INTO backuppayment(`userID`,`AdID`,`promoDays`,`cardNumber`,`amount`,`DateofPayment`,`PaymentType`,`plan`) SELECT `userID`,`AdID`,`promoDays`,`cardNumber`,`amount`,`DateofPayment`,'Promotion','-1' FROM promotionpayment LIMIT i,1;
  SET i = i + 1;
END WHILE;
End$$
DELIMITER ;
