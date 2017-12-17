select a.AdID, a.category
from Ad a,StoreRental s,userOfcard c,User u
where u.province = 'Montreal' and c.cardNumber = s.cardNumber and c.userID = u.userID and a.AdID=S.AdID
