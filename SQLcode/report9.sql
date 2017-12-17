/* assume userID =1 */

select avg(s.price )
from StoreRental s,userOfcard c,User u
where u.userID ='1' and c.userID =u.userID and c.cardNumber =s.cardNumber and rentDate < date(now()) + 7;


select sum(s.price )
from StoreRental s,userOfcard c,User u
where u.userID ='1' and c.userID =u.userID and c.cardNumber =s.cardNumber and rentDate > date(now()) - 7;


