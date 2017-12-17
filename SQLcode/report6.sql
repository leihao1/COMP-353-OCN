/* we assume that storeA belonging to the given manager*/

select count(*),paymethod
from StoreRental S,Transaction T
where S.AdID = T.AdID and storeName ='storeA' and T.dateofPayment >date(now())-15;

