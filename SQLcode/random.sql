INSERT INTO user VALUES (null,"Email@gmail.com","FirstName","LastName",0,"123",null,null);

Insert into City values("Ontario","Toronto");
Insert into City values("Quebec","Montreal");

Insert into Category values("Buy and Sell"),("Services"),("Rent"),("Luxury");

Insert into SubCategory values
("Buy and Sell","Clothing"),("Buy and Sell","Books"),("Buy and Sell","Electronics"),("Buy and Sell","Musical Instruments"),
("Services","Tutors"),("Services","Event Planners"),("Services","Photographers"),("Services","Personal Trainers"),
("Rent","Electronics"),("Rent","Car"),("Rent","Apartments"),("Rent","Wedding Dresses"),
("Luxury","Cars"),("Luxury","Mansions"),("Luxury","Land"),("Luxury","Antiques");

delete from user where userID = 4;

update ad set province = "Quebec" where AdID = "6";

insert into membership values ("normal",0,7),("silver",10,14),("premium",50,30);

update membership set price = 25 where plan = "silver";