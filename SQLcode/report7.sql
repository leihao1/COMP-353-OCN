select avg(amount),storeName
from StoreRental s,Transaction t
where storeName ='storeA' and s.AdID = t.AdID;


select avg(amount),storeName
from StoreRental s,Transaction t
where storeName ='storeD' and s.AdID = t.AdID;
