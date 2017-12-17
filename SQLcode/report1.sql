


select distinct userID,category
from `rvc353_2`.Ad
where userID in
(select userID 
from (select userID ,count(*) as ct
      from (select*from `rvc353_2`.Ad where category='Buy and Sell') as eachcat
      group by userID) as count
where ct in (select MAX(ct)
             from (select userID ,count(*) as ct
                   from (select*from `rvc353_2`.Ad where category='Buy and Sell') as eachcat
                   group by userID) as count))
and category ='Buy and Sell'

union

select distinct userID,category
from `rvc353_2`.Ad
where userID in
(select userID 
from (select userID ,count(*) as ct
      from (select*from `rvc353_2`.Ad where category='Rent') as eachcat
      group by userID) as count
where ct in (select MAX(ct)
             from (select userID ,count(*) as ct
                   from (select*from `rvc353_2`.Ad where category='Rent') as eachcat
                   group by userID) as count))
and category ='Rent'

union

select distinct userID,category
from `rvc353_2`.Ad
where userID in
(select userID 
from (select userID ,count(*) as ct
      from (select*from `rvc353_2`.Ad where category='Services') as eachcat
      group by userID) as count
where ct in (select MAX(ct)
             from (select userID ,count(*) as ct
                   from (select*from `rvc353_2`.Ad where category='Services') as eachcat
                   group by userID) as count))
and category ='Services'

union

select distinct userID,category
from `rvc353_2`.Ad
where userID in
(select userID 
from (select userID ,count(*) as ct
      from (select*from `rvc353_2`.Ad where category='Luxury') as eachcat
      group by userID) as count
where ct in (select MAX(ct)
             from (select userID ,count(*) as ct
                   from (select*from `rvc353_2`.Ad where category='Luxury') as eachcat
                   group by userID) as count))
and category ='Luxury';
