CREATE TABLE Addresses (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  address_1 VARCHAR(255),
  address_2 VARCHAR(255),
  city VARCHAR(25),
  state VARCHAR(25),
  country VARCHAR(25),
  zipcode VARCHAR(25),
  person_id INTEGER,
  FOREIGN KEY (person_id) REFERENCES Persons(id)
);


INSERT INTO Addresses(
  address_1,
  city,
  state,
  country,
  zipcode,
  person_id
) VALUES (
  "Av. João Bastista Assenço, 658",
  "Mogi Guaçu",
  "São Paulo",
  "Brazil",
  "13840-420",
  1
);


DROP TABLE Addresses;
