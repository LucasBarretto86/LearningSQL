CREATE VIEW [Persons with Addresses] AS
SELECT Persons.id AS person_id, 
  Persons.first_name, 
  Persons.last_name, 
  Persons.birthday,
  Addresses.id AS address_id,
  Addresses.address_1,
  Addresses.address_2,
  Addresses.city,
  Addresses.state,
  Addresses.country,
  Addresses.zipcode 
  FROM Persons
  JOIN Addresses
  ON Addresses.person_id = Persons.id;


SELECT * FROM [Persons with Addresses];

DROP VIEW [Persons with Addresses];