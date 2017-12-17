SELECT * 
FROM User 
WHERE User.province='Quebec' AND userID IN(SELECT userID FROM Ad WHERE title='winter men jacket');
