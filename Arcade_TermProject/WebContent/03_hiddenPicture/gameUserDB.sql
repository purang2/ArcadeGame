use team5;

CREATE TABLE gameUserDB(
	gameId VARCHAR(50) not null, 
	password VARCHAR(50) not null, 
	name VARCHAR(50) not null, 
	dateOfBirth VARCHAR(10) not null,
	nation VARCHAR(30) not null,
	
	PRIMARY KEY(GameId));

show tables;

desc gameUser;


insert into gameUserDB VALUES('admin', '1234', 'admin', '9999-99-99', 'KOREA');
select * From gameUserDB;

delete FROM gameUserDB;
--drop table gameUserDB;