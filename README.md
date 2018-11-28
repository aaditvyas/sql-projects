**sql-projects**
> A repository to practice using SQL
> Source: https://www.codecademy.com/courses/learn-sql/

# Manipulation
> What is a relational data base?
* Relational Databases: Databases that organize information into one or more tables.
* Table: A collection of data organized into rows and columns.
* Columns + Rows: Information is stored in type-specific groups.


> Common SQL Syntax
'CREATE TABLE table_name (
   column_1 data_type, 
   column_2 data_type, 
   column_3 data_type
);'

* CREATE TABLE: This is a clause. Clauses perform specific tasks in SQL.
* table_name is the name of the table to which the clause / command is applied to.
* ( ): Is a parameter, which can be a list of columns, data types, or values.

### Create
Create statements allow you to create a new table in the database.

'CREATE TABLE celebs (
	id INTEGER,
	name TEXT,
	age INTEGER
);'

### Insert
Insert statements inserts a new row into a table.

'INSERT INTO celebs 
	(id, name, age)
  VALUES (1, 'Justin Bieber', 22);'


### Select 
Select statements are used to fetch data from a database.
\* is a special wildcare character that allows you to select every column without naming all of them.
'SELECT * FROM celebs;'
'SELECT name FROM celebs;'

### Alter
The alter table statement adds a new column to a table.
NULL is a special value in SQL that represents missing or unknown data.

'ALTER TABLE celebs 
ADD COLUMN twitter_handle TEXT;'

### Update
The update statement edits a row in a table.

'UPDATE celebs 
SET twitter_handle = '@taylorswift13' 
WHERE id = 4;'

### Delete
The delete from statement deletes one or more rows from a table.

'DELETE FROM celebs WHERE twitter_handle IS NULL;'

### Constraints
Constaints can be used to tell the data base to reject inserted data that does not adhere to a certain restriction.

'CREATE TABLE celebs ( id INTEGER PRIMARY KEY, name TEXT UNIQUE, date_of_birth TEXT NOT NULL, date_of_death TEXT DEFAULT 'Not Applicable' );'
* Primary key: columns can be used to uniquely idetify a row.
* Unique: columns have a different value for every row. Note that you can more than one unique column in a table, not not more than one of the same primary key.

## Summary 
* CREATE TABLE creates a new table.
* INSERT INTO adds a new row to a table.
* SELECT queries data from a table.
* ALTER TABLE changes an existing table.
* UPDATE edits a row in a table.
* DELETE FROM deletes rows from a table.

# Queries
> Queries allow SQL to communicate with a database by asking questions and having the result set return data relevant to the question.

## Select
**SELECT** column_names **FROM** table_name;
'SELECT name, genre FROM movies;'

## As 
Allows you to rename a column or table using an alias.
'SELECT name AS 'Titles' FROM movies;'

## Distinct
'SELECT DISTINCT genre FROM movies;'

## Where
Allows SQL to restrict query results.
'SELECT * FROM movies WHERE year > 2014;'

### LIKE
Can be used to compare similar values. When used with where like can be used to find a specific pattern, similar to regular expressions. *Note* like is not case sensitive.

**Underscores**
Underscores can be used for wildcard characters.
'SELECT * FROM movies WHERE name LIKE 'Se_en';'

**With percentage**
The percentage sign is another wildcard character that matched zero or more missing letters in the pattern.
'SELECT * FROM movies WHERE name LIKE 'the %';'

### Is NULL
NULL is used as a placeholder for missing values.
'SELECT name FROM movies WHERE imdb_rating IS NULL;'

### Between
Used in a where clause to filter a result within a certain range.
* BETWEEN two letters is not inclusive of the 2nd letter.
* BETWEEN two numbers is inclusive of the 2nd number.
'SELECT * FROM movies WHERE name BETWEEN 'D' AND 'G';'
'SELECT * FROM movies WHERE year BETWEEN 1970 AND 1979;'

### And
This is a way to chain and combine multiple conditions in a where clause.
'SELECT * FROM movies WHERE year < 1985 AND genre is 'horror';'

### Or 
Can be used to chain together conditions but only one condition must be true.
'SELECT * FROM movies WHERE genre is 'romance' OR genre = 'comedy';'

## Order By 
Useful for listing data is some particular way. 
'SELECT name, year, imdb_rating FROM movies ORDER BY imdb_rating DESC;'

## Limit
Cap the number of rows in the result. This is good when the table in question is large.
'SELECT * FROM movies ORDER BY imdb_rating DESC LIMIT 3;'

## Case 
This is like a switch statement to modify the output from query.
'SELECT name,
	CASE
  	WHEN genre = 'romance' or genre = 'comedy'
    THEN 'Chill'
    ELSE 'Intense'
    END AS 'Mood'
  FROM movies;'

## Summary
* SELECT is the clause we use every time we want to query information from a database.
* AS renames a column or table.
* DISTINCT return unique values.
* WHERE is a popular command that lets you filter the results of the query based on conditions that you specify.
* LIKE and BETWEEN are special operators.
* AND and OR combines multiple conditions.
* ORDER BY sorts the result.
* LIMIT specifies the maximum number of rows that the query will return.
* CASE creates different outputs.

# Aggregate Functions
> Calculations performed on multiple rows of a table.

## Common functions
* COUNT(): 'SELECT COUNT(star) FROM fake_apps;' | 'SELECT COUNT(star) FROM fake_apps WHERE price = 0;'
* SUM()
* MAX()/ MIN()
* AVG(): 'SELECT ROUND(AVG(price), 2) FROM fake_apps;'

## Group By 
Aggregate data with certain characteristics.
'SELECT price, COUNT(star) 
FROM fake_apps
WHERE downloads > 20000
GROUP BY price;'

## Having
Filter which groups to include and which to exclude.
'SELECT price, 
   ROUND(AVG(downloads)),
   COUNT(star)
FROM fake_apps
GROUP BY price
HAVING COUNT(star) > 10;'

## Summary
* COUNT(): count the number of rows
* SUM(): the sum of the values in a column
* MAX()/MIN(): the largest/smallest value
* AVG(): the average of the values in a column
* GROUP BY is a clause used with aggregate functions to combine data from one or more columns.
* HAVING limit the results of a query based on an aggregate property.

# Multiple Tables
> SQL can handle data and queries across multiple tables.

## Join
Used to combine tables.
'SELECT *
FROM orders
JOIN subscriptions
  ON orders.subscription_id = subscriptions.subscription_id;
  
SELECT *
FROM orders
JOIN subscriptions
  ON orders.subscription_id = subscriptions.subscription_id
WHERE subscriptions.description = 'Fashion Magazine';'

### Inner Join
'SELECT COUNT(start)
FROM newspaper;

SELECT COUNT(star)
FROM online;

SELECT COUNT(star)
FROM newspaper
JOIN online
  ON newspaper.id = online.id;'

### Left Join
'SELECT *
FROM newspaper
LEFT JOIN online
  ON newspaper.id = online.id;
  
SELECT *
FROM newspaper
LEFT JOIN online
  ON newspaper.id = online.id
WHERE online.id IS NULL;'

## Primary vs Foreign Key 
**Primary**
Primary keys have a few requirements:
* None of the values can be NULL.
* Each value must be unique (i.e., you can't have two customers with the same customer_id in the customers table).
* A table can not have more than one primary key column.

### Cross Join
### Union
'WITH previous_query AS (
   SELECT customer_id,
      COUNT(subscription_id) AS 'subscriptions'
   FROM orders
   GROUP BY customer_id
)
SELECT customers.customer_name, 
   previous_query.subscriptions
FROM previous_query
JOIN customers
  ON previous_query.customer_id = customers.customer_id;'

## Summary
* JOIN will combine rows from different tables if the join condition is true.
* LEFT JOIN will return every row in the left table, and if the join condition is not met, NULL values are used to fill in the columns from the right table.
* Primary key is a column that serves a unique identifier for the rows in the table.
* Foreign key is a column that contains the primary key to another table.
* CROSS JOIN lets us combine all rows of one table with all rows of another table.
* UNION stacks one dataset on top of another.
* WITH allows us to define one or more temporary tables that can be used in the final query.