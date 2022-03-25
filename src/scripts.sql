-- CREATE DATABASE
CREATE DATABASE family;

-- CREATE TABLES
CREATE TABLE person (
    id SERIAL, 
    first_name VARCHAR(35) NOT NULL, 
    last_name VARCHAR(100) NOT NULL, 
    birthday DATE NOT NULL
);
--

-- INSERTING DATA ON A TABLE
INSERT INTO person (first_name, last_name, birthday) 
VALUES ('Lucas', 'Barretto e Silva', '1986-08-05');
--

-- INSERTING MULTIPLE RECODS ON A TABLE
INSERT INTO person (first_name, last_name, birthday) 
VALUES 
    ('Rafael', 'Barretto Casanova', '1982-08-10'), 
    ('Daniel', 'Barretto e Silva', '1984-09-03'), 
    ('Camila', 'Barretto Vieira', '1981-09-05');
--

-- LISTING ALL RECORDS
SELECT * FROM person;
--

-- LISTING SPECIFIC COLUMN
SELECT column_name 
FROM person;
--

-- LISTING RECORDS BASED ON CONDITIONAL DATA
SELECT * FROM person 
WHERE last_name = "Barretto e Silva"; 
--

-- LISTING RECORDS BASED ON INCOMPLETE DATA ENTRY
SELECT * FROM person 
WHERE last_name <> 'Barretto';
--

-- UPDATING RECORDS
UPDATE person 
SET last_name = 'Barretto Vieira' 
WHERE first_name = 'Camila';
--

-- DELETING RECORDS
DELETE FROM person
WHERE birthday < '1980-1-1';
--

-- COUNTING THE NUMBER OF RECORDS
SELECT COUNT(*) FROM person;
--

-- SELECT DISTINCT DATA FROM A TABLE
SELECT DISTINCT last_name FROM person;
--

-- SELECT ORDERED DATA FROM A TABLE
SELECT * 
FROM person
ORDER BY first_name;
--

-- DETERMINING A RANGE BASED IN RECORDS
SELECT MIN(birthday), MAX(birthday) 
FROM person;
--

-- RENAMING A TABLE
ALTER TABLE person 
RENAME TO child;
--

-- ADDING NEW COLUMNS ON A TABLE
ALTER TABLE child
ADD COLUMN parent_id INT;
--

-- ALTERING COLUMNS ON A TABLE
ALTER TABLE child
ALTER COLUMN parent_id SET DEFAULT 0;
--

-- DROPPING COLUMNS ON A TABLE
ALTER TABLE child
DROP COLUMN parent_id;
--

-- ADDING NEW COLUMNS ON A TABLE
ALTER TABLE child
ADD COLUMN parent_id SMALLINT;
--

-- ADDING UNIQUINESS TO A COLUMN
ALTER TABLE child
ADD CONSTRAINT unique_parent_id_constraint 
UNIQUE (parent_id);
--

-- DROPPING CONSTRAINTS
ALTER TABLE child
DROP CONSTRAINT unique_parent_id_constraint;
--

-- ADDING FOREING KEY AND CONSTRAINTS
ALTER TABLE child
ADD CONSTRAINT parent_id_constraint 
FOREIGN KEY (parent_id)
REFERENCES parent (id);
--

-- CREATE PARENT TABLE THAT WILL USED AS FK_CONSTRAINT
CREATE TABLE parent (
    id SERIAL, 
    first_name VARCHAR(35) NOT NULL, 
    last_name VARCHAR(100) NOT NULL, 
    birthday DATE NOT NULL
);
--

-- INSERTING RECORD THAT WILL USED AS FK_CONSTRAINT
INSERT INTO parent (first_name, last_name, birthday)
VALUES ('Eloina', 'Barretto e Silva', '1959-03-16'),
('José Luiz', 'Barretto e Silva', null)
--

-- UPDATE CHILD RECORD WITH A FOREIGN KEY
UPDATE child
SET parent_id = 1;
--

--- JOINS
/*	
*   INNER JOIN - ONLY RETURNS THE VALUES THAT HAS RELATION, SKIPPING EVERY RECORD THAT HAS NULL RELATION 
*   LEFT JOIN  - RETURN THE LEFT TABLE COMPLETE INCLUDING NULL RELATIONS BUT REMOVES NULL RELATIONS FROM THE RIGHT TABLE 
*   RIGHT JOIN - RETURN THE RIGHT TABLE COMPLETE INCLUDING NULL RELATIONS BUT REMOVES NULL RELATIONS FROM THE LEFT TABLE  
*   FULL JOIN  - RETURN EVERY RECORDO FROM ALL JOINED TABLE WHETHER IT HAS RELATION OR NOT
*/

-- INNER JOIN - JOIN SPECIFIC COLUMNS FROM CHILD TABLE AND PARENT TABLE USING
SELECT child.first_name, child.last_name, 
parent.first_name
FROM child
INNER JOIN parent
ON parent.id = child.parent_id;

-- LEFT JOIN - JOIN SPECIFIC COLUMNS FROM CHILD TABLE AND PARENT TABLE USING LEFT JOIN
SELECT child.first_name, child.last_name, 
parent.first_name
FROM child
LEFT JOIN parent
ON parent.id = child.parent_id;

-- RIGHT JOIN - JOIN SPECIFIC COLUMNS FROM CHILD TABLE AND PARENT TABLE USING RIGHT JOIN
SELECT child.first_name, child.last_name, 
parent.first_name
FROM child
RIGHT JOIN parent
ON parent.id = child.parent_id;

-- FULL JOIN - JOIN SPECIFIC COLUMNS FROM CHILD TABLE AND PARENT TABLE USING FULL JOIN
SELECT child.first_name, child.last_name, 
parent.first_name
FROM child
FULL JOIN parent
ON parent.id = child.parent_id;


-- UTIL QUERIES THAT WILL BE USED TROUGHOUT THE LEARNING PROCESS
SELECT * FROM child;
INSERT INTO child (first_name, last_name, birthday, parent_id)
VALUES 
('Vinicíus', 'Barretto e Silva', '1999-12-31', null);

--DELETE FROM child WHERE ID = 1;

SELECT * FROM parent;
INSERT INTO parent (first_name, last_name, birthday)
VALUES 
('Rosilda', 'Barretto e Silva', null);

--DELETE FROM parent WHERE ID = 4;


-- STUDY / TESTS------------------------------------------------------
--  THE IMPORTANCY OF CLEAN RECORDS AND HOW TO TURN DATA INTO INFORMATION
SELECT to_char(birthday, 'YYYYMMDD')::integer, AVG(to_char)
FROM child
GROUP BY birthday;
SELECT to_char(birthday, 'YYYYMMDD')::integer AS b_numeric from child;