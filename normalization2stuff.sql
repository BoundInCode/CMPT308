DROP TABLE if exists Directors_Movies;
DROP TABLE if exists Actors_Movies;
DROP TABLE if exists Movies;
DROP TABLE if exists Directors;
DROP TABLE if exists Actors;
DROP TABLE if exists Persons;

CREATE TABLE Persons (
	pid      	serial not null,
	first_name	char(30) not null,
	last_name	char(30) not null,
	address		char(80),
primary key(pid)
);

CREATE TABLE Actors (
	aid      		int not null references Persons(pid),
	birth_date		char(20) not null,
	eye_color		char(20),
	hair_color  	char(20),
	height_inches	int,
	weight_lbs		int,
	sag_anniversary	date,

primary key(aid)
);

CREATE TABLE Directors (
	did 					int not null references Persons(pid),
	film_school_attended	char(30),
	dg_anniversary			date,
	
	primary key(did)
);

CREATE TABLE Movies (
	mid 							serial not null,
	title 							char(50),
	year_released 					int,
	domestic_box_office_sales_usd	int,
	foreign_box_office_sales_usd	int,
	dvd_bluray_sales				int,
 primary key(mid)
);

CREATE TABLE Actors_Movies (
	aid int not null references Actors(aid),
	mid int not null references Movies(mid),

	primary key(aid, mid)
);

CREATE TABLE Directors_Movies (
	did int not null references Directors(did),
	mid int not null references Movies(mid),

	primary key(did,mid)
);

insert into Persons (first_name, last_Name, address)
	values ('Sean', 'Connery', '2000 Star Avenue, Los Angeles, CA');
insert into Persons (first_name, last_Name, address)
	values ('Sandy ', 'Cheeks', '201 Ocean Ave, Dallas, TX');
insert into Persons (first_name, last_Name, address)
	values ('Squidward', 'Tennisballs', '155 Beach St, Bikini Bottom, TX');
insert into Persons (first_name, last_Name, address)
	values ('Tom', 'Hanks', '1994 Gump Street, Santa Monica, CA');

SELECT * FROM Persons;

-- Actors --
insert into Actors (aid, birth_date, hair_color, eye_color, height_inches, weight_lbs, sag_anniversary)
	values (1, '8/25/1930', 'brown', 'green', 74, 180, '5/11/2007');
insert into Actors (aid, birth_date, hair_color, eye_color, height_inches, weight_lbs, sag_anniversary)
	values (2, '5/1/1937', 'brown', 'blue', 70, 175, '11/25/2005');

SELECT * FROM Actors;

-- Directors --
insert into Directors (did, film_school_attended, dg_anniversary)
	values (3, 'American Film Institute', '11/24/1962');
insert into Directors (did, film_school_attended, dg_anniversary)
	values (4, 'Wesleyan University', '5/30/1840');

SELECT * FROM Directors;

insert into Movies (title, year_released, domestic_box_office_sales_usd, foreign_box_office_sales_usd, dvd_bluray_sales)
	values ('Forrest Gump', 1994, 64000000, 15000000, 8679305);
insert into Movies (title, year_released, domestic_box_office_sales_usd, foreign_box_office_sales_usd, dvd_bluray_sales)
values ('Dr. No', 1962, 31000000, 18000000, 8679306);

SELECT * FROM Movies;

insert into Actors_Movies (aid, mid) values (1, 1);
insert into Actors_Movies (aid, mid) values (1, 2);
insert into Actors_Movies (aid, mid) values (2, 2);
SELECT * FROM Actors_Movies;

insert into Directors_Movies (did, mid) values (3, 1);
insert into Directors_Movies (did, mid) values (4, 2);
SELECT * FROM Directors_Movies;

-- Functional dependencies
pid -> first_name
pid -> last_name
pid -> address
aid -> birth_date
aid -> hair_color
aid -> eye_color
aid -> height_inches
aid -> weight_lbs
aid -> sag_anniversary
did -> filmSchoolAttended
did -> dg_anniversary
mid -> title
mid -> year_released
mid -> domestic_box_office_sales_usd
mid -> foreign_box_office_sales_usd
mid -> dvd_bluray_sales


-- 4 --
SELECT distinct p.first_name, p.last_name
FROM Directors d, Directors_Movies dm, Persons p
WHERE d.did = p.pid
AND d.did = dm.did
AND dm.mid in 
	(SELECT distinct am.mid
	FROM Actors a, Actors_Movies am, Persons p, Movies m
	WHERE a.aid = p.pid
	AND p.first_name = 'Sean'
	AND p.last_name = 'Connery'
	AND am.aid = a.aid
	AND am.mid = m.mid);
