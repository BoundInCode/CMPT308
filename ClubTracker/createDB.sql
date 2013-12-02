-- create database maristclubs;

DROP TABLE IF EXISTS advisors_clubs;
DROP TABLE IF EXISTS students_clubs;
DROP TABLE IF EXISTS meeting_attendances;
DROP TABLE IF EXISTS event_attendances;
DROP TABLE IF EXISTS club_meetings;
DROP TABLE IF EXISTS club_events;
DROP TABLE IF EXISTS clubs;
DROP TABLE IF EXISTS club_roles;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS teachers;
DROP TABLE IF EXISTS semesters;

CREATE TABLE students (
	student_cwid VARCHAR(8) NOT NULL PRIMARY KEY,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL
);

CREATE TABLE teachers (
	teacher_cwid VARCHAR(8) NOT NULL PRIMARY KEY,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL
);

CREATE TABLE semesters (
	semester_id SERIAL NOT NULL PRIMARY KEY,
	start_date timestamp with time zone NOT NULL,
	end_date timestamp with time zone NOT NULL
);

CREATE TABLE club_roles (
	role_id SERIAL NOT NULL PRIMARY KEY,
	role_name VARCHAR(255) NOT NULL
);

CREATE TABLE clubs (
	club_id SERIAL NOT NULL PRIMARY KEY,
	club_name VARCHAR(255) NOT NULL
);

CREATE TABLE advisors_clubs (
	teacher_cwid VARCHAR(8) REFERENCES teachers(teacher_cwid) NOT NULL,
	club_id int REFERENCES clubs(club_id) NOT NULL,
	semester_id int REFERENCES semesters(semester_id) NOT NULL,
	primary key (teacher_cwid, club_id, semester_id)
);

CREATE TABLE students_clubs (
	student_cwid VARCHAR(8) REFERENCES students(student_cwid) NOT NULL,
	club_id int REFERENCES clubs(club_id) NOT NULL,
	semester_id int REFERENCES semesters(semester_id) NOT NULL,
	role_id int REFERENCES club_roles(role_id) NOT NULL,
	primary key (student_cwid, club_id, semester_id)
);

CREATE TABLE club_meetings (
	meeting_id SERIAL NOT NULL PRIMARY KEY,
	club_id int REFERENCES clubs(club_id),
	start_time timestamp with time zone NOT NULL,
	description VARCHAR(255)
);

CREATE TABLE club_events (
	event_id SERIAL NOT NULL PRIMARY KEY,
	club_id int REFERENCES clubs(club_id) NOT NULL,
	start_time timestamp with time zone NOT NULL,
	event_title VARCHAR(255),
	description VARCHAR(255)
);

CREATE TABLE meeting_attendances (
	meeting_id int REFERENCES club_meetings(meeting_id) NOT NULL,
	student_cwid VARCHAR(8) REFERENCES students(student_cwid) NOT NULL,
	primary key (meeting_id, student_cwid)
);

CREATE TABLE event_attendances (
	event_id int REFERENCES club_events(event_id) NOT NULL,
	student_cwid VARCHAR(8) REFERENCES students(student_cwid) NOT NULL,
	primary key (event_id, student_cwid)
);
