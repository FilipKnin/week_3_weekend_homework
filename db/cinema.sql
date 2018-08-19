DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS screenings;
DROP TABLE IF EXISTS films;
DROP TABLE IF EXISTS customers;



CREATE TABLE customers(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  funds INT
  );

CREATE TABLE films(
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255)
  );

CREATE TABLE screenings(
  id SERIAL8 PRIMARY KEY,
  capacity INT,
  screning_time TIME,
  film_id INT8 REFERENCES films(id) ON DELETE CASCADE
  );

CREATE TABLE tickets(
  id SERIAL8 PRIMARY KEY,
  price INT,
  customer_id INT8 REFERENCES customers(id) ON DELETE CASCADE,
  screening_id INT8 REFERENCES screenings(id) ON DELETE CASCADE
  );
