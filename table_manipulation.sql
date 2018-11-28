/* Create a table */
CREATE TABLE friends (
	id INTEGER,
	name TEXT,
	birthday DATE);

/* Insert rows */
INSERT INTO friends (id, name, birthday)
VALUES (0, 'John Doe', 1990-06-30);
INSERT INTO friends (id, name, birthday)
VALUES (1, 'Jane Doe', 1990-05-30);
INSERT INTO friends (id, name, birthday)
VALUES (3, 'Bob Doe', 1990-07-30);

/* Update a row */
UPDATE friends SET name = 'Jane Smith' WHERE id = 1;

/* Add an email column */
ALTER TABLE friends ADD COLUMN email TEXT;
UPDATE friends SET email = 'jane@codecademy.com' WHERE name = 'Jane Smith';
UPDATE friends SET email = 'john@codecademy.com' WHERE name = 'John Doe';
UPDATE friends SET email = 'bob@codecademy.com' WHERE name = 'Bob Doe';

/* Remove a row */
DELETE FROM friends WHERE name = 'Jane Smith';

/* Show the created table */
SELECT * FROM friends;