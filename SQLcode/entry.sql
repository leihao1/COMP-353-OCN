
/* INSERT INTO `rvc353_2`.`` ( ) VALUES ( ); */

INSERT INTO `rvc353_2`.`Province` (provinceName) VALUES ('Quebec');
INSERT INTO `rvc353_2`.`Province` (provinceName) VALUES ('BC');
INSERT INTO `rvc353_2`.`Province` (provinceName) VALUES ('Ontario');
INSERT INTO `rvc353_2`.`Province` (provinceName) VALUES ('Newfoundland');


INSERT INTO `rvc353_2`.`City` (provinceName,cityName) VALUES ('Quebec','Montreal');
INSERT INTO `rvc353_2`.`City` (provinceName,cityName) VALUES ('Ontario','Toronto');
INSERT INTO `rvc353_2`.`City` (provinceName,cityName) VALUES ('Ontario','Ottawa');
INSERT INTO `rvc353_2`.`City` (provinceName,cityName) VALUES ('Ontario','Waterloo');


INSERT INTO `rvc353_2`.`User` (userID,email,firstName,lastName,user_type,password,province,city) 
VALUES ('100','admin@gmail.com','admin','admin','1','123','Quebec','Montreal');
INSERT INTO `rvc353_2`.`User` (userID,email,firstName,lastName,user_type,password,province,city)
VALUES ('1','user1@gmail.com','user1','user1','0','123','Quebec','Montreal');
INSERT INTO `rvc353_2`.`User` (userID,email,firstName,lastName,user_type,password,province,city)
VALUES ('2','user2@gmail.com','user2','user2','0','123','Ontario','Toronto');
INSERT INTO `rvc353_2`.`User` (userID,email,firstName,lastName,user_type,password,province,city)
VALUES ('3','user3@gmail.com','user3','user3','0','123','Ontario','Ottawa');
INSERT INTO `rvc353_2`.`User` (userID,email,firstName,lastName,user_type,password,province,city)
VALUES ('4','user4@gmail.com','user4','user4','0','123','Quebec','Montreal');
INSERT INTO `rvc353_2`.`User` (userID,email,firstName,lastName,user_type,password,province,city)
VALUES ('5','user5@gmail.com','user5','user5','0','123','Quebec','Montreal');


INSERT INTO `rvc353_2`.`userOfcard` (cardNumber,userID) VALUES ('123456','1');
INSERT INTO `rvc353_2`.`userOfcard` (cardNumber,userID) VALUES ('456456','1');
INSERT INTO `rvc353_2`.`userOfcard` (cardNumber,userID) VALUES ('223456','2');
INSERT INTO `rvc353_2`.`userOfcard` (cardNumber,userID) VALUES ('323456','3');
INSERT INTO `rvc353_2`.`userOfcard` (cardNumber,userID) VALUES ('111111','4');
INSERT INTO `rvc353_2`.`userOfcard` (cardNumber,userID) VALUES ('222222','5');
INSERT INTO `rvc353_2`.`userOfcard` (cardNumber,userID) VALUES ('444444','4');
INSERT INTO `rvc353_2`.`userOfcard` (cardNumber,userID) VALUES ('333333','5');


INSERT INTO `rvc353_2`.`Membership` (plan,price,visibleDays) VALUES ('normal','10','7');
INSERT INTO `rvc353_2`.`Membership` (plan,price,visibleDays) VALUES ('silver','15','14');
INSERT INTO `rvc353_2`.`Membership` (plan,price,visibleDays) VALUES ('premium','20','30');


INSERT INTO `rvc353_2`.`MembershipPayment` (userID,plan,cardNumber,amount,DateofPayment)
VALUES ('1','normal','123456','10','2017-11-11');
INSERT INTO `rvc353_2`.`MembershipPayment` (userID,plan,cardNumber,amount,DateofPayment)
VALUES ('1','silver','456456','15','2017-11-11');
INSERT INTO `rvc353_2`.`MembershipPayment` (userID,plan,cardNumber,amount,DateofPayment)
VALUES ('1','premium','456456','20','2017-11-11');
INSERT INTO `rvc353_2`.`MembershipPayment` (userID,plan,cardNumber,amount,DateofPayment)
VALUES ('1','normal','123456','10','2017-12-01');
INSERT INTO `rvc353_2`.`MembershipPayment` (userID,plan,cardNumber,amount,DateofPayment)
VALUES ('2','normal','223456','10','2017-11-11');
INSERT INTO `rvc353_2`.`MembershipPayment` (userID,plan,cardNumber,amount,DateofPayment)
VALUES ('3','premium','323456','20','2017-12-01');



INSERT INTO `rvc353_2`.`Category` (categoryType ) VALUES ( 'Buy and Sell');
INSERT INTO `rvc353_2`.`Category` (categoryType ) VALUES ( 'Services');
INSERT INTO `rvc353_2`.`Category` (categoryType ) VALUES ( 'Rent');
INSERT INTO `rvc353_2`.`Category` (categoryType ) VALUES ( 'Luxury');

INSERT INTO `rvc353_2`.`SubCategory` (categoryType,sub_type) VALUES ('Buy and Sell','Clothing');
INSERT INTO `rvc353_2`.`SubCategory` (categoryType,sub_type) VALUES ('Buy and Sell','Books');
INSERT INTO `rvc353_2`.`SubCategory` (categoryType,sub_type) VALUES ('Buy and Sell','Electronics');
INSERT INTO `rvc353_2`.`SubCategory` (categoryType,sub_type) VALUES ('Buy and Sell','Musical Instruments');
INSERT INTO `rvc353_2`.`SubCategory` (categoryType,sub_type) VALUES ('Services','Tutors');
INSERT INTO `rvc353_2`.`SubCategory` (categoryType,sub_type) VALUES ('Services','Event Planners');
INSERT INTO `rvc353_2`.`SubCategory` (categoryType,sub_type) VALUES ('Services','Photographers');
INSERT INTO `rvc353_2`.`SubCategory` (categoryType,sub_type) VALUES ('Services','Personal Trainers');
INSERT INTO `rvc353_2`.`SubCategory` (categoryType,sub_type) VALUES ('Rent','Electronics');
INSERT INTO `rvc353_2`.`SubCategory` (categoryType,sub_type) VALUES ('Rent','Car');
INSERT INTO `rvc353_2`.`SubCategory` (categoryType,sub_type) VALUES ('Rent','Apartments');
INSERT INTO `rvc353_2`.`SubCategory` (categoryType,sub_type) VALUES ('Rent','Wedding Dresses');
INSERT INTO `rvc353_2`.`SubCategory` (categoryType,sub_type) VALUES ('Luxury','Cars');
INSERT INTO `rvc353_2`.`SubCategory` (categoryType,sub_type) VALUES ('Luxury','Mansions');
INSERT INTO `rvc353_2`.`SubCategory` (categoryType,sub_type) VALUES ('Luxury','Land');
INSERT INTO `rvc353_2`.`SubCategory` (categoryType,sub_type) VALUES ('Luxury','Antiques');


INSERT INTO `rvc353_2`.`Store` (storeName,SL) VALUES ('storeA','1');
INSERT INTO `rvc353_2`.`Store` (storeName,SL) VALUES ('storeB','2');
INSERT INTO `rvc353_2`.`Store` (storeName,SL) VALUES ('storeC','3');
INSERT INTO `rvc353_2`.`Store` (storeName,SL) VALUES ('storeD','4');


INSERT INTO `rvc353_2`.`Ad` (AdID,phone,price,forsaleby,availability,title,description,images,category,subcategory,userID,postDate,province,city,AdType)
VALUES ('1','4389791234','34','owner','store','winter men jacket','nice jacket','0','Buy and Sell','Clothing','1','2017-12-12','Quebec','Montreal','sell');
INSERT INTO `rvc353_2`.`Ad` (AdID,phone,price,forsaleby,availability,title,description,images,category,subcategory,userID,postDate,province,city,AdType)
VALUES ('2','4389791235','54','owner','store','winter men jacket','nice jacket','0','Buy and Sell','Clothing','1','2017-12-12','Quebec','Montreal','sell');
INSERT INTO `rvc353_2`.`Ad` (AdID,phone,price,forsaleby,availability,title,description,images,category,subcategory,userID,postDate,province,city,AdType)
VALUES ('3','4389791236','44','owner','store','winter men jacket','nice jacket','0','Buy and Sell','Clothing','2','2017-12-02','Quebec','Montreal','sell');
INSERT INTO `rvc353_2`.`Ad` (AdID,phone,price,forsaleby,availability,title,description,images,category,subcategory,userID,postDate,province,city,AdType)
VALUES ('4','4389791237','14','owner','store','winter men jacket','nice jacket','0','Buy and Sell','Clothing','3','2017-12-02','Quebec','Montreal','sell');
INSERT INTO `rvc353_2`.`Ad` (AdID,phone,price,forsaleby,availability,title,description,images,category,subcategory,userID,postDate,province,city,AdType)
VALUES ('5','4389791238','22','owner','store','winter men jacket','nice jacket','0','Buy and Sell','Clothing','3','2017-12-02','Quebec','Montreal','sell');
INSERT INTO `rvc353_2`.`Ad` (AdID,phone,price,forsaleby,availability,title,description,images,category,subcategory,userID,postDate,province,city,AdType)
VALUES ('6','4389791239','31','owner','online','rent car','nice car','0','Rent','Car','2','2017-11-21','Quebec','Montreal','buy');
INSERT INTO `rvc353_2`.`Ad` (AdID,phone,price,forsaleby,availability,title,description,images,category,subcategory,userID,postDate,province,city,AdType)
VALUES ('7','4389791240','31','owner','online','rent car','nice car','0','Rent','Car','2','2017-11-21','Quebec','Montreal','buy');
INSERT INTO `rvc353_2`.`Ad` (AdID,phone,price,forsaleby,availability,title,description,images,category,subcategory,userID,postDate,province,city,AdType)
VALUES ('8','4389791241','31','owner','online','rent car','nice car','0','Rent','Car','2','2017-11-21','Quebec','Montreal','buy');
INSERT INTO `rvc353_2`.`Ad` (AdID,phone,price,forsaleby,availability,title,description,images,category,subcategory,userID,postDate,province,city,AdType)
VALUES ('9','4389791242','31','owner','online','rent car','nice car','0','Rent','Car','1','2017-11-21','Quebec','Montreal','buy');
INSERT INTO `rvc353_2`.`Ad` (AdID,phone,price,forsaleby,availability,title,description,images,category,subcategory,userID,postDate,province,city,AdType)
VALUES ('10','4389791243','31','owner','online','math tutor','math tutor','0','Services','Tutors','1','2017-10-21','Quebec','Montreal','need');
INSERT INTO `rvc353_2`.`Ad` (AdID,phone,price,forsaleby,availability,title,description,images,category,subcategory,userID,postDate,province,city,AdType)
VALUES ('11','4389791244','31','owner','online','math tutor','math tutor','0','Services','Tutors','1','2017-11-21','Quebec','Montreal','buy');
INSERT INTO `rvc353_2`.`Ad` (AdID,phone,price,forsaleby,availability,title,description,images,category,subcategory,userID,postDate,province,city,AdType)
VALUES ('12','4389791245','31','owner','online','math tutor','math tutor','0','Services','Tutors','2','2017-11-21','Quebec','Montreal','buy');
INSERT INTO `rvc353_2`.`Ad` (AdID,phone,price,forsaleby,availability,title,description,images,category,subcategory,userID,postDate,province,city,AdType)
VALUES ('13','4389791246','6500','business','online','painting','old painting ','0','Luxury','Antiques','5','2017-06-21','Quebec','Montreal','sell');


INSERT INTO `rvc353_2`.`PromotionPayment` (AdID,promoDays,cardNumber,amount,DateofPayment) VALUES ('1','7','123456','10','2017-12-02');
INSERT INTO `rvc353_2`.`PromotionPayment` (AdID,promoDays,cardNumber,amount,DateofPayment) VALUES ('2','30','456456','50','2017-12-02');
INSERT INTO `rvc353_2`.`PromotionPayment` (AdID,promoDays,cardNumber,amount,DateofPayment) VALUES ('3','30','456456','50','2017-12-02');


INSERT INTO `rvc353_2`.`Transaction` (transactionNO,dateofPayment,paymethod,cardNumber,purchasetype,rating,amount,AdID) 
VALUES ('1','2017-12-12','online','123456','creditcard','4','35','1');
INSERT INTO `rvc353_2`.`Transaction` (transactionNO,dateofPayment,paymethod,cardNumber,purchasetype,rating,amount,AdID) 
VALUES ('2','2017-12-12','online','123456','debitcard','3','25','2');
INSERT INTO `rvc353_2`.`Transaction` (transactionNO,dateofPayment,paymethod,cardNumber,purchasetype,rating,amount,AdID) 
VALUES ('3','2017-11-11','online','111111','debitcard','3','55','2');
INSERT INTO `rvc353_2`.`Transaction` (transactionNO,dateofPayment,paymethod,cardNumber,purchasetype,rating,amount,AdID) 
VALUES ('4','2017-3-11','online','333333','debitcard','4','45','3');
INSERT INTO `rvc353_2`.`Transaction` (transactionNO,dateofPayment,paymethod,cardNumber,purchasetype,rating,amount,AdID) 
VALUES ('5','2017-9-11','online','444444','debitcard','4','36','3');


INSERT INTO `rvc353_2`.`StoreRental` (rentDate,starttime,endtime,delivery,cardNumber,price,storeName,AdID) VALUES ('2017-12-12','12:00:00','14:00:00','yes','123456','65','storeA','1');
INSERT INTO `rvc353_2`.`StoreRental` (rentDate,starttime,endtime,delivery,cardNumber,price,storeName,AdID) VALUES ('2017-12-12','12:00:00','14:00:00','yes','123456','65','storeD','2');
INSERT INTO `rvc353_2`.`StoreRental` (rentDate,starttime,endtime,delivery,cardNumber,price,storeName,AdID) VALUES ('2017-12-13','12:00:00','14:00:00','no','333333','65','storeA','3');
INSERT INTO `rvc353_2`.`StoreRental` (rentDate,starttime,endtime,delivery,cardNumber,price,storeName,AdID) VALUES ('2017-12-14','12:00:00','14:00:00','no','333333','65','storeD','3');


INSERT INTO `rvc353_2`.`ExternalBackup` (backupID,cardNumber,amount,dateofPayment) VALUES ('1','123456','76','2017-08-08');
