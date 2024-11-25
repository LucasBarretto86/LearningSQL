CREATE TABLE Persons (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  birthday DATE
);


INSERT INTO Persons(
  first_name,
  last_name,
  birthday
) VALUES (
  "Lucas",
  "Barretto e Silva",
  "1986-08-05"
);


DROP TABLE Persons;