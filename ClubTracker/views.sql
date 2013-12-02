
SELECT first_name, last_name, role_name
FROM students s, clubs c, students_clubs sc, club_roles cr, semesters sem
WHERE club_name = 'Computer Society'
AND s.student_cwid = sc.student_cwid
AND c.club_id = sc.club_id
AND cr.role_id = sc.role_id
AND sc.semester_id = sem.semester_id
AND NOW() > sem.start_date
AND NOW() < sem.end_date;

DROP VIEW IF EXISTS ClubsThisSemester;
CREATE VIEW ClubsThisSemester AS
SELECT distinct club_name
FROM clubs c, students_clubs sc, semesters sem
WHERE c.club_id = sc.club_id
AND sc.semester_id = sem.semester_id
AND NOW() > sem.start_date
AND NOW() < sem.end_date;


DROP FUNCTION IF EXISTS studentForMeetings(int, int, text);
CREATE FUNCTION studentForMeetings(clubId int, semId int, cwid text)
RETURNS BIGINT as $$
	SELECT count(cm.meeting_id) as attendances
	FROM club_meetings cm, meeting_attendances ma, semesters sem
	WHERE cm.club_id = $1
	AND cm.start_time >= sem.start_date
	AND cm.start_time <= sem.end_date
	AND sem.semester_id = $2
	AND ma.student_cwid = $3
	AND cm.meeting_id = ma.meeting_id;
$$ language 'sql';

SELECT * FROM studentForMeetings(3, 1, '20036153');

DROP FUNCTION IF EXISTS studentForEvents(int, int, text);
CREATE FUNCTION studentForEvents(eventId int, semId int, cwid text)
RETURNS BIGINT as $$
	SELECT count(ce.event_id) as attendances
	FROM club_events ce, event_attendances ea, semesters sem
	WHERE ce.club_id = $1
	AND ce.start_time >= sem.start_date
	AND ce.start_time <= sem.end_date
	AND sem.semester_id = $2
	AND ea.student_cwid = $3
	AND ce.event_id = ea.event_id;
$$ language 'sql';
SELECT * FROM studentForEvents(3, 1, '20036153');

DROP FUNCTION IF EXISTS totalMeetingsBySemester(int, int);
CREATE FUNCTION totalMeetingsBySemester(clubId int, semId int)
RETURNS BIGINT as $$
	SELECT count(meeting_id) as attendances
	FROM club_meetings ce, semesters sem
	WHERE cm.club_id = $1
	AND cm.start_time >= sem.start_date
	AND cm.start_time <= sem.end_date
	AND sem.semester_id = $2;
$$ language 'sql';
SELECT * FROM totalMeetingsBySemester(3, 1);

DROP FUNCTION IF EXISTS totalEventsBySemester(int, int);
CREATE FUNCTION totalEventsBySemester(eventId int, semId int)
RETURNS BIGINT as $$
	SELECT count(event_id) as attendances
	FROM club_events ce, semesters sem
	WHERE ce.club_id = $1
	AND ce.start_time >= sem.start_date
	AND ce.start_time <= sem.end_date
	AND sem.semester_id = $2;
$$ language 'sql';
SELECT * FROM totalEventsBySemester(3, 1);

DROP FUNCTION IF EXISTS threePriorityPoints(int, int, text);
CREATE FUNCTION threePriorityPoints(semId int, clubId int, cwid text)
RETURNS BOOLEAN as $$
	SELECT (role_id <> 1
		AND 100 * studentForMeetings(sc.club_id, sc.semester_id, sc.student_cwid) / totalMeetingsBySemester(sc.club_id, sc.semester_id) >= 50
		AND studentForMeetings(sc.club_id, sc.semester_id, sc.student_cwid) = totalMeetingsBySemester(sc.club_id, sc.semester_id))
	FROM students_clubs sc, semesters sem
	WHERE sc.semester_id = $1
	AND sc.club_id = $2
	AND sc.student_cwid = $3;
$$ language 'sql';
SELECT * FROM threePriorityPoints(1, 3, '20036153');

DROP FUNCTION IF EXISTS twoPriorityPoints(int, int, text);
CREATE FUNCTION twoPriorityPoints(semId int, clubId int, cwid text)
RETURNS BOOLEAN as $$
	SELECT (100 * studentForMeetings(sc.club_id, sc.semester_id, sc.student_cwid) / totalMeetingsBySemester(sc.club_id, sc.semester_id) >= 50
		AND 100 * studentForMeetings(sc.club_id, sc.semester_id, sc.student_cwid) / totalMeetingsBySemester(sc.club_id, sc.semester_id) >= 75)
	FROM students_clubs sc, semesters sem
	WHERE sc.semester_id = $1
	AND sc.club_id = $2
	AND sc.student_cwid = $3;
$$ language 'sql';
SELECT * FROM twoPriorityPoints(1, 3, '20036153');

DROP FUNCTION IF EXISTS onePriorityPoints(int, int, text);
CREATE FUNCTION onePriorityPoints(semId int, clubId int, cwid text)
RETURNS BOOLEAN as $$
	SELECT (100 * studentForMeetings(sc.club_id, sc.semester_id, sc.student_cwid) / totalMeetingsBySemester(sc.club_id, sc.semester_id) >= 50
		AND 100 * studentForMeetings(sc.club_id, sc.semester_id, sc.student_cwid) / totalMeetingsBySemester(sc.club_id, sc.semester_id) >= 50)
	FROM students_clubs sc, semesters sem
	WHERE sc.semester_id = $1
	AND sc.club_id = $2
	AND sc.student_cwid = $3;
$$ language 'sql';
SELECT * FROM onePriorityPoints(1, 3, '20036153');


CREATE FUNCTION date_order() RETURNS trigger AS $date_order$
	BEGIN
		IF NEW.start_date > NEW.end_date THEN
			RAISE EXCEPTION 'end_date % should come after start_date %.', NEW.start_date, NEW.end_date;
		END IF;
		RETURN NEW;
	END;
$date_order$ LANGUAGE plpgsql;


CREATE TRIGGER check_semester_dates 
	BEFORE INSERT or UPDATE
	ON semesters
	FOR EACH ROW EXECUTE PROCEDURE date_order();

INSERT INTO semesters (end_date, start_date)
VALUES ('2014-01-21 00:00:00 EST', '2014-05-22 23:59:59 EST');


SELECT COUNT(student_cwid) AS event_attendances
FROM meeting_attendances
WHERE student_cwid = '20036153';


select * from students;
select * from teachers;
select * from semesters;
select * from clubs;
select * from club_events;
select * from club_meetings;
select * from students_clubs;
select * from advisors_clubs;
select * from meeting_attendances;
select * from event_attendances;