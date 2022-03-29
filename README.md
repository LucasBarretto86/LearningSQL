
# Learning SQL

- [Learning SQL](#learning-sql)
  - [CREATE](#create)
    - [Create Database](#create-database)
    - [Create Tables](#create-tables)
  - [INSERT](#insert)
    - [Single record](#single-record)
    - [Multiple records](#multiple-records)
  - [SELECT](#select)
    - [Select all records from a table](#select-all-records-from-a-table)
    - [Select a specific column from a table](#select-a-specific-column-from-a-table)
    - [Select distintic data from a table](#select-distintic-data-from-a-table)
    - [Select within Range](#select-within-range)
  - [WHERE](#where)
    - [Select records where specific data is present](#select-records-where-specific-data-is-present)
    - [Select where records that contains](#select-where-records-that-contains)
  - [UPDATE](#update)
  - [DELTE](#delte)
  - [Functions](#functions)
    - [Count](#count)
  - [ORDER BY](#order-by)
  - [ALTER TABLE](#alter-table)
    - [Renaming table](#renaming-table)
    - [Adding new columns](#adding-new-columns)
    - [Altering column](#altering-column)
    - [Droping column](#droping-column)
    - [Adding constrants](#adding-constrants)
    - [Dropping constaints](#dropping-constaints)
    - [Adding Foreing key and constrants](#adding-foreing-key-and-constrants)
  - [Joins](#joins)
    - [INNER JOIN](#inner-join)
    - [LEFT JOIN](#left-join)
    - [RIGHT JOIN](#right-join)
    - [FULL JOIN](#full-join)
    - [SQL Commands table](#sql-commands-table)

## CREATE

### Create Database

```sql
CREATE DATABASE family;
```

### Create Tables

```sql
CREATE TABLE person (
    id SERIAL,
    first_name VARCHAR(35) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    birthday DATE NOT NULL
);
```

## INSERT

### Single record

```sql
INSERT INTO person (first_name, last_name, birthday)
VALUES ('Lucas', 'Barretto e Silva', '1986-08-05');
```

### Multiple records

```sql
INSERT INTO person (first_name, last_name, birthday)
VALUES
    ('Rafael', 'Barretto Casanova', '1982-08-10'),
    ('Daniel', 'Barretto e Silva', '1984-09-03'),
    ('Camila', 'Barretto Vieira', '1981-09-05');
```

## SELECT

### Select all records from a table

```sql
SELECT * FROM person
```

### Select a specific column from a table

```sql
SELECT column_name
FROM person;
```

### Select distintic data from a table

```sql
SELECT DISTINCT last_name FROM person
```

### Select within Range

```sql
SELECT MIN(birthday), MAX(birthday)
FROM person;
```

## WHERE

### Select records where specific data is present

```sql
SELECT * FROM person
WHERE last_name = "Barretto e Silva";
```

### Select where records that contains

```sql
SELECT * FROM person
WHERE last_name <> 'Barretto';
```

## UPDATE

```sql
UPDATE person
SET last_name = 'Barretto Vieira'
WHERE first_name = 'Camila';
```

## DELTE

```sql
DELETE FROM person
WHERE birthday < '1980-1-1';
```

## Functions

### Count

```sql
SELECT COUNT(*) FROM person
```

## ORDER BY

```sql
SELECT *
FROM person
ORDER BY first_name;
```

## ALTER TABLE

### Renaming table

```sql
ALTER TABLE person
RENAME TO child;
```

### Adding new columns

```sql
ALTER TABLE child
ADD COLUMN parent_id INT;
```

### Altering column

```sql
ALTER TABLE child
ALTER COLUMN parent_id SET DEFAULT 0;
```

### Droping column

```sql
ALTER TABLE child
DROP COLUMN parent_id;
```

### Adding constrants

```sql
ALTER TABLE child
ADD CONSTRAINT unique_parent_id_constraint
UNIQUE (parent_id);
```

### Dropping constaints

```sql
ALTER TABLE child
DROP CONSTRAINT unique_parent_id_constraint;
```

### Adding Foreing key and constrants

```sql
ALTER TABLE child
ADD CONSTRAINT parent_id_constraint
FOREIGN KEY (parent_id)
REFERENCES parent (id);
```

## Joins

|Join Type|Description|
| :--- | :--- |
|INNER  | Only returns the values that has relation, skipping every record that has null relation |
|LEFT   | return the left table complete including null relations but removes null relations from the right table |
|RIGHT | return the right table complete including null relations but removes null relations from the left table |
|FULL   | return every recordo from all joined table whether it has relation or not |

### INNER JOIN

```sql
SELECT child.first_name, child.last_name,
parent.first_name
FROM child
INNER JOIN parent
ON parent.id = child.parent_id;
```

### LEFT JOIN

```sql
SELECT child.first_name, child.last_name,
parent.first_name
FROM child
LEFT JOIN parent
ON parent.id = child.parent_id;
```

### RIGHT JOIN

```sql
SELECT child.first_name, child.last_name,
parent.first_name
FROM child
RIGHT JOIN parent
ON parent.id = child.parent_id;
```

### FULL JOIN

```sql
SELECT child.first_name, child.last_name,
parent.first_name
FROM child
FULL JOIN parent
ON parent.id = child.parent_id;
```

### SQL Commands table

| Available help |
| :------------- |
| ABORT |
| ALTER AGGREGATE |
| ALTER COLLATION |
| ALTER CONVERSION |
| ALTER DATABASE |
| ALTER DEFAULT PRIVILEGES |
| ALTER DOMAIN |
| ALTER EVENT TRIGGER |
| ALTER EXTENSION |
| ALTER FOREIGN DATA WRAPPER |
| ALTER FOREIGN TABLE |
| ALTER FUNCTION |
| ALTER GROUP |
| ALTER INDEX |
| ALTER LANGUAGE |
| ALTER LARGE OBJECT |
| ALTER MATERIALIZED VIEW |
| ALTER OPERATOR |
| ALTER OPERATOR CLASS |
| ALTER OPERATOR FAMILY |
| ALTER POLICY |
| ALTER PROCEDURE |
| ALTER PUBLICATION |
| ALTER ROLE |
| ALTER ROUTINE |
| ALTER RULE |
| ALTER SCHEMA |
| ALTER SEQUENCE |
| ALTER SERVER |
| ALTER STATISTICS |
| ALTER SUBSCRIPTION |
| PREPARE |
| PREPARE TRANSACTION |
| REASSIGN OWNED |
| REFRESH MATERIALIZED VIEW |
| REINDEX |
| RELEASE SAVEPOINT |
| RESET |
| REVOKE |
| ROLLBACK |
| ROLLBACK PREPARED |
| ROLLBACK TO SAVEPOINT |
| SAVEPOINT |
| SECURITY LABEL |
| SELECT |
| SELECT INTO |
| SET |
| SET CONSTRAINTS |
| SET ROLE |
| SET SESSION AUTHORIZATION |
| SET TRANSACTION |
| SHOW |
| START TRANSACTION |
| TABLE |
| TRUNCATE |
| UNLISTEN |
| UPDATE |
| VACUUM |
| VALUES |
| WITH |
| ALTER SYSTEM |
| ALTER TABLE |
| ALTER TABLESPACE |
| ALTER TEXT SEARCH CONFIGURATION   |
| ALTER TEXT SEARCH DICTIONARY |
| ALTER TEXT SEARCH PARSER |
| ALTER TEXT SEARCH TEMPLATE |
| ALTER TRIGGER |
| ALTER TYPE |
| ALTER USER |
| ALTER USER MAPPING |
| ALTER VIEW |
| ANALYZE |
| BEGIN |
| CALL |
| CHECKPOINT |
| CLOSE |
| CLUSTER |
| COMMENT |
| COMMIT |
| COMMIT PREPARED |
| COPY |
| CREATE ACCESS METHOD |
| CREATE AGGREGATE |
| CREATE CAST |
| CREATE COLLATION |
| CREATE CONVERSION |
| CREATE DATABASE |
| CREATE DOMAIN |
| CREATE EVENT TRIGGER |
| CREATE EXTENSION |
| CREATE FOREIGN DATA WRAPPER |
| CREATE FOREIGN TABLE |
| CREATE FUNCTION |
| CREATE GROUP |
| CREATE INDEX |
| CREATE LANGUAGE |
| CREATE MATERIALIZED VIEW |
| CREATE OPERATOR |
| CREATE OPERATOR CLASS |
| CREATE OPERATOR FAMILY |
| CREATE POLICY |
| CREATE PROCEDURE |
| CREATE PUBLICATION |
| CREATE ROLE |
| CREATE RULE |
| CREATE SCHEMA |
| CREATE SEQUENCE |
| CREATE SERVER |
| CREATE STATISTICS |
| CREATE SUBSCRIPTION |
| CREATE TABLE |
| CREATE TABLE AS |
| CREATE TABLESPACE |
| CREATE TEXT SEARCH CONFIGURATION |
| CREATE TEXT SEARCH DICTIONARY |
| CREATE TEXT SEARCH PARSER |
| CREATE TEXT SEARCH TEMPLATE |
| CREATE TRANSFORM |
| CREATE TRIGGER |
| CREATE TYPE |
| CREATE USER |
| CREATE USER MAPPING |
| CREATE VIEW |
| DEALLOCATE |
| DECLARE |
| DELETE |
| DISCARD |
| DO |
| DROP ACCESS METHOD |
| DROP AGGREGATE |
| DROP CAST |
| DROP COLLATION |
| DROP CONVERSION |
| DROP DATABASE |
| DROP DOMAIN |
| DROP EVENT TRIGGER |
| DROP EXTENSION |
| DROP FOREIGN DATA WRAPPER |
| DROP FOREIGN TABLE |
| DROP FUNCTION |
| DROP GROUP |
| DROP INDEX |
| DROP LANGUAGE |
| DROP MATERIALIZED VIEW |
| DROP OPERATOR |
| DROP OPERATOR CLASS |
| DROP OPERATOR FAMILY |
| DROP OWNED |
| DROP POLICY |
| DROP PROCEDURE |
| DROP PUBLICATION |
| DROP ROLE |
| DROP ROUTINE |
| DROP RULE |
| DROP SCHEMA |
| DROP SEQUENCE |
| DROP SERVER |
| DROP STATISTICS |
| DROP SUBSCRIPTION |
| DROP TABLE |
| DROP TABLESPACE |
| DROP TEXT SEARCH CONFIGURATION |
| DROP TEXT SEARCH DICTIONARY |
| DROP TEXT SEARCH PARSER |
| DROP TEXT SEARCH TEMPLATE |
| DROP TRANSFORM |
| DROP TRIGGER |
| DROP TYPE |
| DROP USER |
| DROP USER MAPPING |
| DROP VIEW |
| END |
| EXECUTE |
| EXPLAIN |
| FETCH |
| GRANT |
| IMPORT FOREIGN SCHEMA |
| INSERT |
| LISTEN |
| LOAD |
| LOCK |
| MOVE |
| NOTIFY |
