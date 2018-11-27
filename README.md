# sql-projects
> A repository to practice using SQL
> Source: https://www.codecademy.com/courses/learn-sql/

# Manipulation
## What is a relational data base?
* Relational Databases: Databases that organize information into one or more tables.
* Table: A collection of data organized into rows and columns.
* Columns + Rows: Information is stored in type-specific groups.


## Common SQL Syntax
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

### Update
The update statement edits a row in a table.