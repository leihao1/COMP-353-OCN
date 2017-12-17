/*we assume that the given city is Montreal*/

select distinct userID,category
from Ad
where userID in(select userID
				from (select userID,AVG(rating)as avgrating 
					   from  (select userID,rating from Ad,Transaction where Ad.AdID = Transaction.AdID and city='Montreal' and AdType='sell'and category='Buy and Sell')as 
							
							user_and_rating
					   group by userID)as 
					   
					 user_and_avgrating
				where avgrating in (select max(avgrating) from (select userID,AVG(rating)as avgrating 
					   from  (select userID,rating from Ad,Transaction where Ad.AdID = Transaction.AdID and city='Montreal' and AdType='sell'and category='Buy and Sell')as 
							
							user_and_rating
					   group by userID)as 
					   
					 user_and_avgrating)
				)
	and category = 'Buy and Sell'

union 

select distinct userID,category
from Ad
where userID in(select userID
				from (select userID,AVG(rating)as avgrating 
					   from  (select userID,rating from Ad,Transaction where Ad.AdID = Transaction.AdID and city='Montreal' and AdType='sell'and category='Rent')as 
							
							user_and_rating
					   group by userID)as 
					   
					 user_and_avgrating
				where avgrating in (select max(avgrating) from (select userID,AVG(rating)as avgrating 
					   from  (select userID,rating from Ad,Transaction where Ad.AdID = Transaction.AdID and city='Montreal' and AdType='sell'and category='Rent')as 
							
							user_and_rating
					   group by userID)as 
					   
					 user_and_avgrating)
				)
	and category = 'Rent'

union 

select distinct userID,category
from Ad
where userID in(select userID
				from (select userID,AVG(rating)as avgrating 
					   from  (select userID,rating from Ad,Transaction where Ad.AdID = Transaction.AdID and city='Montreal' and AdType='sell'and category='Services')as 
							
							user_and_rating
					   group by userID)as 
					   
					 user_and_avgrating
				where avgrating in (select max(avgrating) from (select userID,AVG(rating)as avgrating 
					   from  (select userID,rating from Ad,Transaction where Ad.AdID = Transaction.AdID and city='Montreal' and AdType='sell'and category='Services')as 
							
							user_and_rating
					   group by userID)as 
					   
					 user_and_avgrating)
				)
	and category = 'Services'

union 

select distinct userID,category
from Ad
where userID in(select userID
				from (select userID,AVG(rating)as avgrating 
					   from  (select userID,rating from Ad,Transaction where Ad.AdID = Transaction.AdID and city='Montreal' and AdType='sell'and category='Luxury')as 
							
							user_and_rating
					   group by userID)as 
					   
					 user_and_avgrating
				where avgrating in (select max(avgrating) from (select userID,AVG(rating)as avgrating 
					   from  (select userID,rating from Ad,Transaction where Ad.AdID = Transaction.AdID and city='Montreal' and AdType='sell'and category='Luxury')as 
							
							user_and_rating
					   group by userID)as 
					   
					 user_and_avgrating)
				)
	and category = 'Luxury'	 
;
