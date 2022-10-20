DROP DATABASE IF EXISTS school;
CREATE DATABASE school; 
USE school;

--  CREATE TEACHERS TABLE

CREATE TABLE teacher (
teacher_id INT PRIMARY KEY,
first_name VARCHAR(40) NOT NULL,
language_1 VARCHAR(3) NOT NULL,
language_2 VARCHAR(3) NOT NULL,
dob DATE,
tax_id INT UNIQUE,
phone_no VARCHAR(20)
);

-- SELECT * FROM teacher;

CREATE TABLE client (
client_id INT PRIMARY KEY,
client_name VARCHAR(20) NOT NULL,
address VARCHAR(20),
industry VARCHAR(20)
);

-- participant
CREATE TABLE participant (
participant_id INT PRIMARY KEY,
first_name VARCHAR(20) NOT NULL,
last_name VARCHAR(20) NOT NULL,
phone_no VARCHAR(20),
client INT
);

CREATE TABLE IF NOT EXISTS course(
course_id INT PRIMARY KEY,
course_name VARCHAR(20) NOT NULL,
language CHAR(3) NOT NULL,
level CHAR(2) NOT NULL,
course_length_weeks INT,
start_date DATE,
in_school BOOLEAN,
teacher INT,
client INT
);

-- 1. Alter table
-- 2. Populating / seeding table
-- 3. Delete / Update

-- Error message: copy
-- Semi-colons
-- Maybe you'll have to put things
-- within quotes

ALTER TABLE participant
ADD FOREIGN KEY (client) -- in participants table
REFERENCES client(client_id) -- in clients table
ON DELETE SET NULL;

-- If value is deleted in parent table
-- or original table -> Set nulls on 
-- child table

-- goal: include client on course table

ALTER TABLE course
ADD FOREIGN KEY (client) -- name on the child table
REFERENCES client(client_id) -- name on the original table, table
ON DELETE CASCADE;

ALTER TABLE course
ADD FOREIGN KEY (teacher) -- name on the child table
REFERENCES teacher(teacher_id) -- name on the original table, table
ON DELETE CASCADE;

-- This table will have two foreign keys that will make one primary key in combination
CREATE TABLE takes_course(
participant_id INT,
course_id INT,
PRIMARY KEY (participant_id, course_id),
	FOREIGN KEY(participant_id) REFERENCES participant(participant_id) ON DELETE CASCADE,
	FOREIGN KEY(course_id) REFERENCES course(course_id) ON DELETE CASCADE
);

INSERT INTO teacher VALUES
(1, "Sam", "ENG", "DEU", "2000-01-01", 68373737, "+78376367");


INSERT INTO teacher (teacher_id, first_name, language_1, language_2)
VALUES (2, "Venice", "ENG", "CAT");

DELETE FROM teacher WHERE teacher_id = 2;

INSERT INTO teacher VALUES
(20, "myname", "ESS", "ENN", "1890-01-01", 746736, "0"),
(21, "myname", "ESS", "ENN", "1890-01-01", 7467360, "0"),
(22, "myname", "ESS", "ENN", "1890-01-01", 74673600, "0");

UPDATE teacher
SET first_name = "Samuel"
WHERE teacher_id = 1;

SELECT * FROM teacher;