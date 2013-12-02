

INSERT INTO students (student_cwid, first_name, last_name) VALUES ('20036153', 'William', 'Cain');
INSERT INTO students (student_cwid, first_name, last_name) VALUES ('10129460', 'Bobby', 'Tables');
INSERT INTO students (student_cwid, first_name, last_name) VALUES ('08472532', 'Jeffrey', 'Hippo');
INSERT INTO students (student_cwid, first_name, last_name) VALUES ('21172544', 'Alfred', 'Pennyworth');

INSERT INTO teachers (teacher_cwid, first_name, last_name) VALUES ('12234363', 'Matthew', 'Shin');
INSERT INTO teachers (teacher_cwid, first_name, last_name) VALUES ('10234343', 'Jeff', 'Bass');
INSERT INTO teachers (teacher_cwid, first_name, last_name) VALUES ('10224433', 'Matthew', 'Johnson');
INSERT INTO teachers (teacher_cwid, first_name, last_name) VALUES ('10232333', 'Julie', 'Raines');
INSERT INTO teachers (teacher_cwid, first_name, last_name) VALUES ('10232233', 'Karen', 'Schrier');
INSERT INTO teachers (teacher_cwid, first_name, last_name) VALUES ('10237393', 'Kristin', 'Janschewitz');
INSERT INTO teachers (teacher_cwid, first_name, last_name) VALUES ('10233123', 'Edward', 'Smith');
INSERT INTO teachers (teacher_cwid, first_name, last_name) VALUES ('21234333', 'Michael', 'Janofsky');
INSERT INTO teachers (teacher_cwid, first_name, last_name) VALUES ('10234323', 'Carolyn', 'Matheus');
INSERT INTO teachers (teacher_cwid, first_name, last_name) VALUES ('10234387', 'Carlos', 'Rodriguez');

INSERT INTO semesters (start_date, end_date)
VALUES ('2013-08-26 00:00:00 EST', '2013-12-19 23:59:59 EST');
INSERT INTO semesters (start_date, end_date)
VALUES ('2014-01-21 00:00:00 EST', '2014-05-22 23:59:59 EST');

INSERT INTO club_roles (role_name) VALUES ('Member');
INSERT INTO club_roles (role_name) VALUES ('Treasurer');
INSERT INTO club_roles (role_name) VALUES ('Webmaster');
INSERT INTO club_roles (role_name) VALUES ('Secretary');
INSERT INTO club_roles (role_name) VALUES ('Public Relations');
INSERT INTO club_roles (role_name) VALUES ('Vice President');
INSERT INTO club_roles (role_name) VALUES ('President');

INSERT INTO clubs (club_name) VALUES ('Business Club');               -- 1
INSERT INTO clubs (club_name) VALUES ('Communication Arts Society');  -- 2
INSERT INTO clubs (club_name) VALUES ('Computer Society');            -- 3
INSERT INTO clubs (club_name) VALUES ('Criminal Justice Society');    -- 4
INSERT INTO clubs (club_name) VALUES ('Marist Game Society');         -- 5
INSERT INTO clubs (club_name) VALUES ('Psychology Club');             -- 6
INSERT INTO clubs (club_name) VALUES ('Anime Society');               -- 7
INSERT INTO clubs (club_name) VALUES ('Habitat for Humanity');        -- 8
INSERT INTO clubs (club_name) VALUES ('Chess Club');                  -- 9

INSERT INTO advisors_clubs VALUES ('12234363', 1, 1);
INSERT INTO advisors_clubs VALUES ('10234343', 2, 1);
INSERT INTO advisors_clubs VALUES ('10224433', 3, 1);
INSERT INTO advisors_clubs VALUES ('10232333', 4, 1);
INSERT INTO advisors_clubs VALUES ('10232233', 5, 1);
INSERT INTO advisors_clubs VALUES ('10237393', 6, 1);
INSERT INTO advisors_clubs VALUES ('10233123', 7, 1);
INSERT INTO advisors_clubs VALUES ('21234333', 8, 1);
INSERT INTO advisors_clubs VALUES ('10234323', 9, 1);
INSERT INTO advisors_clubs VALUES ('10234387', 9, 1);

INSERT INTO students_clubs VALUES ('20036153', 3, 1, 1);
INSERT INTO students_clubs VALUES ('20036153', 3, 2, 1);
INSERT INTO students_clubs VALUES ('20036153', 5, 1, 1);
INSERT INTO students_clubs VALUES ('20036153', 8, 1, 1);
INSERT INTO students_clubs VALUES ('08472532', 1, 2, 7);
INSERT INTO students_clubs VALUES ('08472532', 7, 2, 1);
INSERT INTO students_clubs VALUES ('10129460', 8, 1, 3);
INSERT INTO students_clubs VALUES ('10129460', 2, 1, 1);
INSERT INTO students_clubs VALUES ('10129460', 4, 2, 1);

INSERT INTO club_meetings (club_id, start_time, description)
VALUES (3, '2013-10-08 21:15:00 EST', 'Hack Night in the Linux Lab');

INSERT INTO club_meetings (club_id, start_time, description)
VALUES (3, '2013-9-18 21:15:00 EST', 'Lightning talk about functional programming');

INSERT INTO club_meetings (club_id, start_time, description)
VALUES (5, '2013-12-12 21:30:00 EST', 'Video gamezzzzzzzz');

INSERT INTO club_meetings (club_id, start_time, description)
VALUES (8, '2013-12-03 21:30:00 EST', 'We are going to show another presentation without any sound');

INSERT INTO club_meetings (club_id, start_time)
VALUES (4, '2013-12-05 04:05:00 EST');

INSERT INTO club_events (club_id, start_time, event_title)
VALUES (3, '2013-10-08 19:00:00 EST', 'Hackathon');

INSERT INTO club_events (club_id, start_time, event_title)
VALUES (5, '2013-11-26 21:30:00 EST', 'Gaming Day');

INSERT INTO club_events (club_id, start_time, event_title)
VALUES (8, '2013-12-03 21:30:00 EST', 'Build-A-Home Workshop');

INSERT INTO club_events (club_id, start_time)
VALUES (4, '2013-12-05 11:05:00 EST');

INSERT INTO meeting_attendances VALUES (1, '20036153');
INSERT INTO meeting_attendances VALUES (2, '20036153');
INSERT INTO meeting_attendances VALUES (1, '08472532');
INSERT INTO meeting_attendances VALUES (2, '08472532');

INSERT INTO event_attendances VALUES (1, '20036153');
INSERT INTO event_attendances VALUES (2, '20036153');
INSERT INTO event_attendances VALUES (3, '08472532');
INSERT INTO event_attendances VALUES (4, '08472532');
