Introduction to SQL
================
Joschka Schwarz

-   [1. Selecting columns](#1-selecting-columns)
    -   [Welcome to the course!](#welcome-to-the-course)
    -   [Onboarding \| Tables](#onboarding--tables)
    -   [Onboarding \| Query Result](#onboarding--query-result)
    -   [Onboarding \| Errors](#onboarding--errors)
    -   [Onboarding \| Multi-step
        Exercises](#onboarding--multi-step-exercises)
    -   [Beginning your SQL journey](#beginning-your-sql-journey)
    -   [SELECTing single columns](#selecting-single-columns)
    -   [SELECTing multiple columns](#selecting-multiple-columns)
    -   [SELECT DISTINCT](#select-distinct)
    -   [Learning to COUNT](#learning-to-count)
    -   [Practice with COUNT](#practice-with-count)
-   [2. Filtering rows](#2-filtering-rows)
    -   [Filtering results](#filtering-results)
    -   [Simple filtering of numeric
        values](#simple-filtering-of-numeric-values)
    -   [Simple filtering of text](#simple-filtering-of-text)
    -   [WHERE AND](#where-and)
    -   [WHERE AND OR](#where-and-or)
    -   [WHERE AND OR (2)](#where-and-or-2)
    -   [BETWEEN](#between)
    -   [BETWEEN (2)](#between-2)
    -   [WHERE IN](#where-in)
    -   [Introduction to NULL and IS
        NULL](#introduction-to-null-and-is-null)
    -   [NULL and IS NULL](#null-and-is-null)
    -   [LIKE and NOT LIKE](#like-and-not-like)
-   [3. Aggregate Functions](#3-aggregate-functions)
    -   [Aggregate functions](#aggregate-functions)
    -   [Aggregate functions practice](#aggregate-functions-practice)
    -   [Combining aggregate functions with
        WHERE](#combining-aggregate-functions-with-where)
    -   [A note on arithmetic](#a-note-on-arithmetic)
    -   [It’s AS simple AS aliasing](#its-as-simple-as-aliasing)
    -   [Even more aliasing](#even-more-aliasing)
-   [4. Sorting and grouping](#4-sorting-and-grouping)
    -   [ORDER BY](#order-by)
    -   [Sorting single columns](#sorting-single-columns)
    -   [Sorting single columns (2)](#sorting-single-columns-2)
    -   [Sorting single columns (DESC)](#sorting-single-columns-desc)
    -   [Sorting multiple columns](#sorting-multiple-columns)
    -   [GROUP BY](#group-by)
    -   [GROUP BY practice](#group-by-practice)
    -   [GROUP BY practice (2)](#group-by-practice-2)
    -   [HAVING a great time](#having-a-great-time)
    -   [All together now](#all-together-now)
    -   [All together now (2)](#all-together-now-2)
    -   [A taste of things to come](#a-taste-of-things-to-come)

**Short Description**

Learn the basics of syntax in SQL, how to extract and wrangle data, and
use querying tables in relational databases like MySQL, SQL Server, and
PostgreSQL.

**Long Description**

The role of a data scientist is to turn raw data into actionable
insights. Much of the world’s raw data—from electronic medical records
to customer transaction histories—lives in organized collections of
tables called relational databases. To be an effective data scientist,
you must know how to wrangle and extract data from these databases using
a language called SQL . This course teaches syntax in SQL shared by many
types of databases, such as PostgreSQL, MySQL, SQL Server, and Oracle.
This course teaches you everything you need to know to begin working
with databases today!

# 1. Selecting columns

This chapter provides a brief introduction to working with relational
databases. You’ll learn about their structure, how to talk about them
using database lingo, and how to begin an analysis using simple SQL
commands to select and summarize columns from database tables.

## Welcome to the course!

Theory. Coming soon …

**1. Welcome to the course!**

Hi, and welcome to Introduction to SQL for Data Science!Most of the
world’s data live in databases, so learning how to access and unlock
insights from these data is an essential skill for every data scientist.
SQL, or ess-que-el, is the native language for interacting with
databases and is designed for exactly this purpose.This course will give
you a basic introduction to SQL. We hope you enjoy it.

**2. Let’s practice!**

Now let’s get started!

## Onboarding \| Tables

The DataCamp interface for SQL courses contains a few unique features
you should be aware of.

For this course, you’ll be using a database containing information on
almost 5000 films. To the right, underneath the editor, you can see the
data in this database by clicking through the tabs.

From looking at the tabs, who is the first person listed in the `people`
table?

> ## *Question*
>
> ???<br> <br> ⬜ Kanye West<br> ⬜ Biggie Smalls<br> ✅ 50 Cent<br> ⬜
> Jay Z<br>

That’s correct! Head over to the next exercise to see how we can answer
a similar question with code!

## Onboarding \| Query Result

Notice the **query result** tab in the bottom right corner of your
screen. This is where the results of your SQL queries will be displayed.

Run this query in the editor and check out the resulting table in the
query result tab!

``` sql
SELECT name FROM people;
```

Who is the second person listed in the query result?

> ## *Question*
>
> ???<br> <br> ⬜ Kanye West<br> ✅ A. Michael Baldwin<br> ⬜ 50
> Cent<br> ⬜ Jay Z<br>

## Onboarding \| Errors

If you submit the code to the right, you’ll see that you get two types
of errors.

*SQL* errors are shown below the editor. These are errors returned by
the *SQL* engine. You should see:

``` sql
syntax error at or near "'DataCamp <3 SQL'" LINE 2: 'DataCamp <3 SQL' ^
```

*DataCamp* errors are shown in the **Instructions** box. These will let
you know in plain English where you went wrong in your code! You should
see:

``` sql
You need to add SELECT at the start of line 2!
```

**Steps**

1.  Submit the code to the right, check out the errors, then fix them!

``` sql
-- Try running me!
SELECT 'DataCamp <3 SQL'
AS result;
```

| result           |
|:-----------------|
| DataCamp \<3 SQL |

1 records

Excellent error editing! You can feel safe experimenting with code in
the editor – you’ll always get feedback if something goes wrong.

## Onboarding \| Multi-step Exercises

The following multi-step exercise allows you to practice a new concept
through repetition. Check it out!

**Steps**

1.  Submit the query in the editor! Don’t worry, you’ll learn how it
    works soon.

``` sql
SELECT 'SQL'
AS result;
```

| result |
|:-------|
| SQL    |

1 records

2.  Now change `'SQL'` to `'SQL is'` and click Submit!

``` sql
SELECT 'SQL is'
AS result;
```

| result |
|:-------|
| SQL is |

1 records

3.  Finally, change `'SQL is'` to `'SQL is cool'` and click Submit!

``` sql
SELECT 'SQL is cool'
AS result;
```

| result      |
|:------------|
| SQL is cool |

1 records

Well done! The time has come to actually fetch information from tables
now!

## Beginning your SQL journey

Now that you’re familiar with the interface, let’s get straight into it.

SQL, which stands for *Structured Query Language*, is a language for
interacting with data stored in something called a *relational
database*.

You can think of a relational database as a collection of tables. A
table is just a set of rows and columns, like a spreadsheet, which
represents exactly one type of entity. For example, a table might
represent employees in a company or purchases made, but not both.

Each row, or *record*, of a table contains information about a single
entity. For example, in a table representing employees, each row
represents a single person. Each column, or *field*, of a table contains
a single attribute for all rows in the table. For example, in a table
representing employees, we might have a column containing first and last
names for all employees.

The table of employees might look something like this:

|  id | name    | age | nationality |
|----:|:--------|----:|:------------|
|   1 | Jessica |  22 | Ireland     |
|   2 | Gabriel |  48 | France      |
|   3 | Laura   |  36 | USA         |

> ## *Question*
>
> How many fields does the employees table above contain?<br> <br> ⬜
> 1<br> ⬜ 2<br> ⬜ 3<br> ✅ 4<br>

Correct! The table contains four columns, or fields.

## SELECTing single columns

While SQL can be used to create and modify databases, the focus of this
course will be *querying* databases. A *query* is a request for data
from a database table (or combination of tables). Querying is an
essential skill for a data scientist, since the data you need for your
analyses will often live in databases.

In SQL, you can select data from a table using a `SELECT` statement. For
example, the following query selects the `name` column from the `people`
table:

``` sql
SELECT name
FROM people;
```

In this query, `SELECT` and `FROM` are called keywords. In SQL, keywords
are not case-sensitive, which means you can write the same query as:

``` sql
select name
from people;
```

That said, it’s good practice to make SQL keywords uppercase to
distinguish them from other parts of your query, like column and table
names.

It’s also good practice (but not necessary for the exercises in this
course) to include a semicolon at the end of your query. This tells SQL
where the end of your query is!

Remember, you can see the results of executing your query in the
**query** tab!

**Steps**

1.  Select the `title` column from the `films` table.

``` sql
SELECT title
FROM films;
```

| title                                            |
|:-------------------------------------------------|
| Intolerance: Love’s Struggle Throughout the Ages |
| Over the Hill to the Poorhouse                   |
| The Big Parade                                   |
| Metropolis                                       |
| Pandora’s Box                                    |
| The Broadway Melody                              |
| Hell’s Angels                                    |
| A Farewell to Arms                               |
| 42nd Street                                      |
| She Done Him Wrong                               |

Displaying records 1 - 10

2.  Select the `release_year` column from the `films` table.

``` sql
SELECT release_year
FROM films;
```

| release_year |
|-------------:|
|         1916 |
|         1920 |
|         1925 |
|         1927 |
|         1929 |
|         1929 |
|         1930 |
|         1932 |
|         1933 |
|         1933 |

Displaying records 1 - 10

3.  Select the `name` of each person in the `people` table.

``` sql
SELECT name
FROM people;
```

| name               |
|:-------------------|
| 50 Cent            |
| A. Michael Baldwin |
| A. Raven Cruz      |
| A.J. Buckley       |
| A.J. DeLucia       |
| A.J. Langer        |
| Aaliyah            |
| Aaron Ashmore      |
| Aaron Hann         |
| Aaron Hill         |

Displaying records 1 - 10

## SELECTing multiple columns

Well done! Now you know how to select single columns.

In the real world, you will often want to select multiple columns.
Luckily, SQL makes this really easy. To select multiple columns from a
table, simply separate the column names with commas!

For example, this query selects two columns, `name` and `birthdate`,
from the `people` table:

``` sql
SELECT name, birthdate
FROM people;
```

Sometimes, you may want to select all columns from a table. Typing out
every column name would be a pain, so there’s a handy shortcut:

``` sql
SELECT *
FROM people;
```

If you only want to return a certain number of results, you can use the
`LIMIT` keyword to limit the number of rows returned:

``` sql
SELECT *
FROM people
LIMIT 10;
```

Before getting started with the instructions below, check out the column
names in the `films` table!

**Steps**

1.  Get the title of every film from the `films` table.

``` sql
SELECT title
FROM films;
```

| title                                            |
|:-------------------------------------------------|
| Intolerance: Love’s Struggle Throughout the Ages |
| Over the Hill to the Poorhouse                   |
| The Big Parade                                   |
| Metropolis                                       |
| Pandora’s Box                                    |
| The Broadway Melody                              |
| Hell’s Angels                                    |
| A Farewell to Arms                               |
| 42nd Street                                      |
| She Done Him Wrong                               |

Displaying records 1 - 10

2.  Get the title and release year for every film.

``` sql
SELECT title, release_year
FROM films;
```

| title                                            | release_year |
|:-------------------------------------------------|-------------:|
| Intolerance: Love’s Struggle Throughout the Ages |         1916 |
| Over the Hill to the Poorhouse                   |         1920 |
| The Big Parade                                   |         1925 |
| Metropolis                                       |         1927 |
| Pandora’s Box                                    |         1929 |
| The Broadway Melody                              |         1929 |
| Hell’s Angels                                    |         1930 |
| A Farewell to Arms                               |         1932 |
| 42nd Street                                      |         1933 |
| She Done Him Wrong                               |         1933 |

Displaying records 1 - 10

3.  Get the title, release year and country for every film.

``` sql
SELECT title, release_year, country
FROM films;
```

| title                                            | release_year | country |
|:-------------------------------------------------|-------------:|:--------|
| Intolerance: Love’s Struggle Throughout the Ages |         1916 | USA     |
| Over the Hill to the Poorhouse                   |         1920 | USA     |
| The Big Parade                                   |         1925 | USA     |
| Metropolis                                       |         1927 | Germany |
| Pandora’s Box                                    |         1929 | Germany |
| The Broadway Melody                              |         1929 | USA     |
| Hell’s Angels                                    |         1930 | USA     |
| A Farewell to Arms                               |         1932 | USA     |
| 42nd Street                                      |         1933 | USA     |
| She Done Him Wrong                               |         1933 | USA     |

Displaying records 1 - 10

4.  Get all columns from the `films` table.

``` sql
SELECT *
FROM films;
```

| id  | title                                            | release_year | country | duration | language | certification |   gross |  budget |
|:----|:-------------------------------------------------|-------------:|:--------|---------:|:---------|:--------------|--------:|--------:|
| 1   | Intolerance: Love’s Struggle Throughout the Ages |         1916 | USA     |      123 | NA       | Not Rated     |      NA |  385907 |
| 2   | Over the Hill to the Poorhouse                   |         1920 | USA     |      110 | NA       | NA            | 3000000 |  100000 |
| 3   | The Big Parade                                   |         1925 | USA     |      151 | NA       | Not Rated     |      NA |  245000 |
| 4   | Metropolis                                       |         1927 | Germany |      145 | German   | Not Rated     |   26435 | 6000000 |
| 5   | Pandora’s Box                                    |         1929 | Germany |      110 | German   | Not Rated     |    9950 |      NA |
| 6   | The Broadway Melody                              |         1929 | USA     |      100 | English  | Passed        | 2808000 |  379000 |
| 7   | Hell’s Angels                                    |         1930 | USA     |       96 | English  | Passed        |      NA | 3950000 |
| 8   | A Farewell to Arms                               |         1932 | USA     |       79 | English  | Unrated       |      NA |  800000 |
| 9   | 42nd Street                                      |         1933 | USA     |       89 | English  | Unrated       | 2300000 |  439000 |
| 10  | She Done Him Wrong                               |         1933 | USA     |       66 | English  | Approved      |      NA |  200000 |

Displaying records 1 - 10

## SELECT DISTINCT

Often your results will include many duplicate values. If you want to
select all the unique values from a column, you can use the `DISTINCT`
keyword.

This might be useful if, for example, you’re interested in knowing which
languages are represented in the `films` table:

``` sql
SELECT DISTINCT language
FROM films;
```

Remember, you can check out the data in the tables by clicking on the
table name!

**Steps**

1.  Get all the unique countries represented in the `films` table.

``` sql
SELECT DISTINCT country
FROM films;
```

| country            |
|:-------------------|
| NA                 |
| Soviet Union       |
| Indonesia          |
| Italy              |
| Cameroon           |
| Czech Republic     |
| Sweden             |
| USA                |
| Dominican Republic |
| Cambodia           |

Displaying records 1 - 10

2.  Get all the different film certifications from the `films` table.

``` sql
SELECT DISTINCT certification
FROM films;
```

| certification |
|:--------------|
| Unrated       |
| M             |
| G             |
| NC-17         |
| GP            |
| PG            |
| Approved      |
| NA            |
| X             |
| PG-13         |

Displaying records 1 - 10

3.  Get the different types of film roles from the `roles` table.

``` sql
SELECT DISTINCT role
FROM roles;
```

| role     |
|:---------|
| director |
| actor    |

2 records

## Learning to COUNT

What if you want to count the number of employees in your employees
table? The `COUNT()` function lets you do this by returning the number
of rows in one or more columns.

For example, this code gives the number of rows in the `people` table:

``` sql
SELECT COUNT(*)
FROM people;
```

| count |
|------:|
|  8397 |

1 records

> ## *Question*
>
> How many records are contained in the `reviews` table?<br> <br> ⬜
> 9,468<br> ⬜ 8,397<br> ✅ 4,968<br> ⬜ 9,837<br> ⬜ 9,864<br>

## Practice with COUNT

As you’ve seen, `COUNT(*)` tells you how many rows are in a table.
However, if you want to count the number of *non-missing* values in a
particular column, you can call `COUNT()` on just that column.

For example, to count the number of birth dates present in the `people`
table:

``` sql
SELECT COUNT(birthdate)
FROM people;
```

It’s also common to combine `COUNT()` with `DISTINCT` to count the
number of *distinct* values in a column.

For example, this query counts the number of distinct birth dates
contained in the `people` table:

``` sql
SELECT COUNT(DISTINCT birthdate)
FROM people;
```

Let’s get some practice with `COUNT()`!

**Steps**

1.  Count the number of rows in the `people` table.

``` sql
SELECT COUNT(*)
FROM people;
```

| count |
|------:|
|  8397 |

1 records

2.  Count the number of (non-missing) birth dates in the `people` table.

``` sql
SELECT COUNT(birthdate)
FROM people;
```

| count |
|------:|
|  6152 |

1 records

3.  Count the number of unique birth dates in the `people` table.

``` sql
SELECT COUNT(DISTINCT birthdate)
FROM people;
```

| count |
|------:|
|  5398 |

1 records

4.  Count the number of unique languages in the `films` table.

``` sql
SELECT COUNT(DISTINCT language)
FROM films;
```

| count |
|------:|
|    47 |

1 records

5.  Count the number of unique countries in the `films` table.

``` sql
SELECT COUNT(DISTINCT country)
FROM films;
```

| count |
|------:|
|    64 |

1 records

# 2. Filtering rows

This chapter builds on the first by teaching you how to filter tables
for rows satisfying some criteria of interest. You’ll learn how to use
basic comparison operators, combine multiple criteria, match patterns in
text, and much more.

## Filtering results

Congrats on finishing the first chapter! You now know how to select
columns and perform basic counts. This chapter will focus on filtering
your results.

In SQL, the `WHERE` keyword allows you to filter based on both text and
numeric values in a table. There are a few different comparison
operators you can use:

-   `=` equal
-   `<>` not equal
-   `<` less than
-   `>` greater than
-   `<=` less than or equal to
-   `>=` greater than or equal to

For example, you can filter text records such as `title`. The following
code returns all films with the title `'Metropolis'`:

``` sql
SELECT title
FROM films
WHERE title = 'Metropolis';
```

Notice that the `WHERE` clause always comes after the `FROM` statement!

**Note that in this course we will use `<>` and not `!=` for the not
equal operator, as per the SQL standard.**

``` sql
SELECT title
FROM films
WHERE release_year > 2000;
```

> ## *Question*
>
> What does the following query return?<br> <br> ⬜ Films released
> before the year 2000<br> ✅ Films released after the year 2000<br> ⬜
> Films released after the year 2001<br> ⬜ Films released in 2000<br>

## Simple filtering of numeric values

As you learned in the previous exercise, the `WHERE` clause can also be
used to filter numeric records, such as years or ages.

For example, the following query selects all details for films with a
budget over ten thousand dollars:

``` sql
SELECT *
FROM films
WHERE budget > 10000;
```

Now it’s your turn to use the `WHERE` clause to filter numeric values!

**Steps**

1.  Get all details for all films released in 2016.

``` sql
SELECT *
FROM films
WHERE release_year = 2016;
```

| id   | title                           | release_year | country | duration | language | certification |    gross |    budget |
|:-----|:--------------------------------|-------------:|:--------|---------:|:---------|:--------------|---------:|----------:|
| 4821 | 10 Cloverfield Lane             |         2016 | USA     |      104 | English  | PG-13         | 71897215 |  15000000 |
| 4822 | 13 Hours                        |         2016 | USA     |      144 | English  | R             | 52822418 |  50000000 |
| 4823 | A Beginner’s Guide to Snuff     |         2016 | USA     |       87 | English  | NA            |       NA |        NA |
| 4824 | Airlift                         |         2016 | India   |      130 | Hindi    | NA            |       NA |   4400000 |
| 4825 | Alice Through the Looking Glass |         2016 | USA     |      113 | English  | PG            | 76846624 | 170000000 |
| 4826 | Allegiant                       |         2016 | USA     |      120 | English  | PG-13         | 66002193 | 110000000 |
| 4827 | Alleluia! The Devil’s Carnival  |         2016 | USA     |       97 | English  | NA            |       NA |    500000 |
| 4828 | Antibirth                       |         2016 | USA     |       94 | English  | NA            |       NA |   3500000 |
| 4829 | Bad Moms                        |         2016 | USA     |      100 | English  | R             | 55461307 |  20000000 |
| 4830 | Bad Moms                        |         2016 | USA     |      100 | English  | R             | 55461307 |  20000000 |

Displaying records 1 - 10

2.  Get the number of films released before 2000.

``` sql
SELECT COUNT(*)
FROM films
WHERE release_year < 2000;
```

| count |
|------:|
|  1337 |

1 records

3.  Get the title and release year of films released after 2000.

``` sql
SELECT title, release_year
FROM films
WHERE release_year > 2000;
```

| title                        | release_year |
|:-----------------------------|-------------:|
| 15 Minutes                   |         2001 |
| 3000 Miles to Graceland      |         2001 |
| A Beautiful Mind             |         2001 |
| A Knight’s Tale              |         2001 |
| A.I. Artificial Intelligence |         2001 |
| Ali                          |         2001 |
| Alias Betty                  |         2001 |
| All the Queen’s Men          |         2001 |
| Along Came a Spider          |         2001 |
| Amélie                       |         2001 |

Displaying records 1 - 10

Great job! After filtering of numeric values, it’s time to explore
filtering of text!

## Simple filtering of text

Remember, the `WHERE` clause can also be used to filter text results,
such as names or countries.

For example, this query gets the titles of all films which were filmed
in China:

``` sql
SELECT title
FROM films
WHERE country = 'China';
```

Now it’s your turn to practice using `WHERE` with text values!

**Important: in PostgreSQL (the version of SQL we’re using), you must
use single quotes with `WHERE`.**

**Steps**

1.  Get all details for all French language films.

``` sql
SELECT *
FROM films
WHERE language = 'French';
```

|   id | title                                   | release_year | country | duration | language | certification |   gross |    budget |
|-----:|:----------------------------------------|-------------:|:--------|---------:|:---------|:--------------|--------:|----------:|
|  108 | Une Femme Mariée                        |         1964 | France  |       94 | French   | NA            |      NA |    120000 |
|  111 | Pierrot le Fou                          |         1965 | France  |      110 | French   | Not Rated     |      NA |    300000 |
|  140 | Mississippi Mermaid                     |         1969 | France  |      123 | French   | R             |   26893 |   1600000 |
|  423 | Subway                                  |         1985 | France  |       98 | French   | R             |      NA |  17000000 |
|  662 | Les visiteurs                           |         1993 | France  |      107 | French   | R             |  700000 |  50000000 |
|  801 | The Horseman on the Roof                |         1995 | France  |      135 | French   | R             | 1877179 |        NA |
|  916 | When the Cat’s Away                     |         1996 | France  |       91 | French   | R             | 1652472 |    300000 |
| 1004 | The Chambermaid on the Titanic          |         1997 | France  |      101 | French   | NA            |  244465 |        NA |
| 1026 | The Swindle                             |         1997 | France  |      101 | French   | NA            |  231417 |  60000000 |
| 1088 | Les couloirs du temps: Les visiteurs II |         1998 | France  |      118 | French   | NA            |  146072 | 140000000 |

Displaying records 1 - 10

2.  Get the name and birth date of the person born on November
    11th, 1974. Remember to use ISO date format (`'1974-11-11'`)!

``` sql
SELECT name, birthdate
FROM people
WHERE birthdate = '1974-11-11';
```

| name              | birthdate  |
|:------------------|:-----------|
| Leonardo DiCaprio | 1974-11-11 |

1 records

3.  Get the number of Hindi language films.

``` sql
SELECT COUNT(*)
FROM films
WHERE language = 'Hindi';
```

| count |
|------:|
|    28 |

1 records

4.  Get all details for all films with an R certification.

``` sql
SELECT *
FROM films
WHERE certification = 'R';
```

|  id | title                     | release_year | country | duration | language | certification |    gross |   budget |
|----:|:--------------------------|-------------:|:--------|---------:|:---------|:--------------|---------:|---------:|
|  76 | Psycho                    |         1960 | USA     |      108 | English  | R             | 32000000 |   806947 |
|  99 | A Fistful of Dollars      |         1964 | Italy   |       99 | Italian  | R             |  3500000 |   200000 |
| 134 | Rosemary’s Baby           |         1968 | USA     |      136 | English  | R             |       NA |  2300000 |
| 140 | Mississippi Mermaid       |         1969 | France  |      123 | French   | R             |    26893 |  1600000 |
| 145 | The Wild Bunch            |         1969 | USA     |      144 | English  | R             |       NA |  6244087 |
| 149 | Catch-22                  |         1970 | USA     |      122 | English  | R             |       NA | 18000000 |
| 150 | Cotton Comes to Harlem    |         1970 | USA     |       97 | English  | R             |       NA |  1200000 |
| 153 | The Ballad of Cable Hogue |         1970 | USA     |      121 | English  | R             |       NA |  3716946 |
| 154 | The Conformist            |         1970 | Italy   |      106 | Italian  | R             |       NA |   750000 |
| 158 | Woodstock                 |         1970 | USA     |      215 | English  | R             | 13300000 |   600000 |

Displaying records 1 - 10

Wonderful! Let’s look at combining different conditions now!

## WHERE AND

Often, you’ll want to select data based on multiple conditions. You can
build up your `WHERE` queries by combining multiple conditions with the
`AND` keyword.

For example,

``` sql
SELECT title
FROM films
WHERE release_year > 1994
AND release_year < 2000;
```

gives you the titles of films released between 1994 and 2000.

Note that you need to specify the column name separately for every `AND`
condition, so the following would be invalid:

``` sql
SELECT title
FROM films
WHERE release_year > 1994 AND < 2000;
```

You can add as many `AND` conditions as you need!

**Steps**

1.  Get the title and release year for all Spanish language films
    released before 2000.

``` sql
SELECT title, release_year
FROM films
WHERE release_year < 2000
AND language = 'Spanish';
```

| title             | release_year |
|:------------------|-------------:|
| El Mariachi       |         1992 |
| La otra conquista |         1998 |
| Tango             |         1998 |

3 records

2.  Get all details for Spanish language films released after 2000.

``` sql
SELECT *
FROM films
WHERE release_year > 2000
AND language = 'Spanish';
```

|   id | title                                    | release_year | country   | duration | language | certification |    gross |   budget |
|-----:|:-----------------------------------------|-------------:|:----------|---------:|:---------|:--------------|---------:|---------:|
| 1695 | Y Tu Mamá También                        |         2001 | Mexico    |      106 | Spanish  | R             | 13622333 |  2000000 |
| 1757 | El crimen del padre Amaro                |         2002 | Mexico    |      118 | Spanish  | R             |  5709616 |  1800000 |
| 1807 | Mondays in the Sun                       |         2002 | Spain     |      113 | Spanish  | R             |   146402 |  4000000 |
| 2173 | Live-In Maid                             |         2004 | Argentina |       83 | Spanish  | Unrated       |       NA |   800000 |
| 2175 | Maria Full of Grace                      |         2004 | Colombia  |      101 | Spanish  | R             |  6517198 |  3000000 |
| 2246 | The Holy Girl                            |         2004 | Argentina |      106 | Spanish  | R             |   304124 |  1400000 |
| 2263 | The Sea Inside                           |         2004 | Spain     |      125 | Spanish  | PG-13         |  2086345 | 10000000 |
| 2458 | The Legend of Zorro                      |         2005 | USA       |      129 | Spanish  | PG            | 45356386 | 75000000 |
| 2542 | Captain Alatriste: The Spanish Musketeer |         2006 | Spain     |      145 | Spanish  | NA            |       NA | 24000000 |
| 2646 | Pan’s Labyrinth                          |         2006 | Spain     |      112 | Spanish  | R             | 37623143 | 13500000 |

Displaying records 1 - 10

3.  Get all details for Spanish language films released after 2000, but
    before 2010.

``` sql
SELECT *
FROM films
WHERE release_year > 2000
AND release_year < 2010
AND language = 'Spanish';
```

|   id | title                                    | release_year | country   | duration | language | certification |    gross |   budget |
|-----:|:-----------------------------------------|-------------:|:----------|---------:|:---------|:--------------|---------:|---------:|
| 1695 | Y Tu Mamá También                        |         2001 | Mexico    |      106 | Spanish  | R             | 13622333 |  2000000 |
| 1757 | El crimen del padre Amaro                |         2002 | Mexico    |      118 | Spanish  | R             |  5709616 |  1800000 |
| 1807 | Mondays in the Sun                       |         2002 | Spain     |      113 | Spanish  | R             |   146402 |  4000000 |
| 2173 | Live-In Maid                             |         2004 | Argentina |       83 | Spanish  | Unrated       |       NA |   800000 |
| 2175 | Maria Full of Grace                      |         2004 | Colombia  |      101 | Spanish  | R             |  6517198 |  3000000 |
| 2246 | The Holy Girl                            |         2004 | Argentina |      106 | Spanish  | R             |   304124 |  1400000 |
| 2263 | The Sea Inside                           |         2004 | Spain     |      125 | Spanish  | PG-13         |  2086345 | 10000000 |
| 2458 | The Legend of Zorro                      |         2005 | USA       |      129 | Spanish  | PG            | 45356386 | 75000000 |
| 2542 | Captain Alatriste: The Spanish Musketeer |         2006 | Spain     |      145 | Spanish  | NA            |       NA | 24000000 |
| 2646 | Pan’s Labyrinth                          |         2006 | Spain     |      112 | Spanish  | R             | 37623143 | 13500000 |

Displaying records 1 - 10

Great work! Being able to combine conditions with `AND` will prove to be
very useful if you only want your query to return a specific subset of
records!

## WHERE AND OR

What if you want to select rows based on multiple conditions where some
but not *all* of the conditions need to be met? For this, SQL has the
`OR` operator.

For example, the following returns all films released in *either* 1994
or 2000:

``` sql
SELECT title
FROM films
WHERE release_year = 1994
OR release_year = 2000;
```

Note that you need to specify the column for every `OR` condition, so
the following is invalid:

``` sql
SELECT title
FROM films
WHERE release_year = 1994 OR 2000;
```

When combining `AND` and `OR`, be sure to enclose the individual clauses
in parentheses, like so:

``` sql
SELECT title
FROM films
WHERE (release_year = 1994 OR release_year = 1995)
AND (certification = 'PG' OR certification = 'R');
```

Otherwise, due to SQL’s precedence rules, you may not get the results
you’re expecting!

> ## *Question*
>
> What does the `OR` operator do?<br> <br> ✅ Display only rows that
> meet at least **one** of the specified conditions.<br> ⬜ Display only
> rows that meet **all** of the specified conditions.<br> ⬜ Display
> only rows that meet **none** of the specified conditions.<br>

## WHERE AND OR (2)

You now know how to select rows that meet **some** but not **all**
conditions by combining `AND` and `OR`.

For example, the following query selects all films that were released in
1994 or 1995 which had a rating of PG or R.

``` sql
SELECT title
FROM films
WHERE (release_year = 1994 OR release_year = 1995)
AND (certification = 'PG' OR certification = 'R');
```

Now you’ll write a query to get the title and release year of films
released in the 90s which were in French or Spanish and which took in
more than $2M gross.

It looks like a lot, but you can build the query up one step at a time
to get comfortable with the underlying concept in each step. Let’s go!

**Steps**

1.  Get the title and release year for films released in the 90s.

``` sql
SELECT title, release_year
FROM films
WHERE release_year >= 1990 AND release_year < 2000;
```

| title                       | release_year |
|:----------------------------|-------------:|
| Arachnophobia               |         1990 |
| Back to the Future Part III |         1990 |
| Child’s Play 2              |         1990 |
| Dances with Wolves          |         1990 |
| Days of Thunder             |         1990 |
| Dick Tracy                  |         1990 |
| Die Hard 2                  |         1990 |
| Edward Scissorhands         |         1990 |
| Flatliners                  |         1990 |
| Ghost                       |         1990 |

Displaying records 1 - 10

2.  Now, build on your query to filter the records to only include
    French or Spanish language films.

``` sql
SELECT title, release_year
FROM films
WHERE (release_year >= 1990 AND release_year < 2000)
AND (language = 'French' OR language = 'Spanish');
```

| title                                   | release_year |
|:----------------------------------------|-------------:|
| El Mariachi                             |         1992 |
| Les visiteurs                           |         1993 |
| The Horseman on the Roof                |         1995 |
| When the Cat’s Away                     |         1996 |
| The Chambermaid on the Titanic          |         1997 |
| The Swindle                             |         1997 |
| La otra conquista                       |         1998 |
| Les couloirs du temps: Les visiteurs II |         1998 |
| Tango                                   |         1998 |
| The Red Violin                          |         1998 |

Displaying records 1 - 10

3.  Finally, restrict the query to only return films that took in more
    than $2M gross.

``` sql
SELECT title, release_year
FROM films
WHERE (release_year >= 1990 AND release_year < 2000)
AND (language = 'French' OR language = 'Spanish')
AND gross > 2000000;
```

| title          | release_year |
|:---------------|-------------:|
| El Mariachi    |         1992 |
| The Red Violin |         1998 |

2 records

That was pretty involved!

## BETWEEN

As you’ve learned, you can use the following query to get titles of all
films released in and between 1994 and 2000:

``` sql
SELECT title
FROM films
WHERE release_year >= 1994
AND release_year <= 2000;
```

Checking for ranges like this is very common, so in SQL the `BETWEEN`
keyword provides a useful shorthand for filtering values within a
specified range. This query is equivalent to the one above:

``` sql
SELECT title
FROM films
WHERE release_year
BETWEEN 1994 AND 2000;
```

It’s important to remember that `BETWEEN` is *inclusive*, meaning the
beginning and end values are included in the results!

> ## *Question*
>
> What does the `BETWEEN` keyword do?<br> <br> ⬜ Filter numeric
> values<br> ⬜ Filter text values<br> ⬜ Filter values in a specified
> list<br> ✅ Filter values in a specified range<br>

## BETWEEN (2)

Similar to the `WHERE` clause, the `BETWEEN` clause can be used with
multiple `AND` and `OR` operators, so you can build up your queries and
make them even more powerful!

For example, suppose we have a table called `kids`. We can get the names
of all kids between the ages of 2 and 12 from the United States:

``` sql
SELECT name
FROM kids
WHERE age BETWEEN 2 AND 12
AND nationality = 'USA';
```

Take a go at using `BETWEEN` with `AND` on the films data to get the
title and release year of all Spanish language films released between
1990 and 2000 (inclusive) with budgets over $100 million. We have broken
the problem into smaller steps so that you can build the query as you go
along!

**Steps**

1.  Get the title and release year of all films released between 1990
    and 2000 (inclusive).

``` sql
SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000;
```

| title                       | release_year |
|:----------------------------|-------------:|
| Arachnophobia               |         1990 |
| Back to the Future Part III |         1990 |
| Child’s Play 2              |         1990 |
| Dances with Wolves          |         1990 |
| Days of Thunder             |         1990 |
| Dick Tracy                  |         1990 |
| Die Hard 2                  |         1990 |
| Edward Scissorhands         |         1990 |
| Flatliners                  |         1990 |
| Ghost                       |         1990 |

Displaying records 1 - 10

2.  Now, build on your previous query to select only films that have
    budgets over $100 million.

``` sql
SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000
AND budget > 100000000;
```

| title                      | release_year |
|:---------------------------|-------------:|
| Terminator 2: Judgment Day |         1991 |
| True Lies                  |         1994 |
| Waterworld                 |         1995 |
| Batman & Robin             |         1997 |
| Dante’s Peak               |         1997 |
| Princess Mononoke          |         1997 |
| Speed 2: Cruise Control    |         1997 |
| Starship Troopers          |         1997 |
| Titanic                    |         1997 |
| Tomorrow Never Dies        |         1997 |

Displaying records 1 - 10

3.  Now restrict the query to only return Spanish language films.

``` sql
SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000
AND budget > 100000000
AND language = 'Spanish';
```

| title | release_year |
|:------|-------------:|
| Tango |         1998 |

1 records

4.  Finally, modify to your previous query to include all Spanish
    language *or* French language films with the same criteria as
    before. Don’t forget your parentheses!

``` sql
SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000
AND budget > 100000000
AND (language = 'Spanish' OR language = 'French');
```

| title                                   | release_year |
|:----------------------------------------|-------------:|
| Les couloirs du temps: Les visiteurs II |         1998 |
| Tango                                   |         1998 |

2 records

Well done! Off to the next filtering operator!

## WHERE IN

As you’ve seen, `WHERE` is very useful for filtering results. However,
if you want to filter based on many conditions, `WHERE` can get
unwieldy. For example:

``` sql
SELECT name
FROM kids
WHERE age = 2
OR age = 4
OR age = 6
OR age = 8
OR age = 10;
```

Enter the `IN` operator! The `IN` operator allows you to specify
multiple values in a `WHERE` clause, making it easier and quicker to
specify multiple `OR` conditions! Neat, right?

So, the above example would become simply:

``` sql
SELECT name
FROM kids
WHERE age IN (2, 4, 6, 8, 10);
```

Try using the `IN` operator yourself!

**Steps**

1.  Get the title and release year of all films released in 1990 or 2000
    that were longer than two hours. Remember, duration is in minutes!

``` sql
SELECT title, release_year
FROM films
WHERE release_year IN (1990, 2000)
AND duration > 120;
```

| title                    | release_year |
|:-------------------------|-------------:|
| Dances with Wolves       |         1990 |
| Die Hard 2               |         1990 |
| Ghost                    |         1990 |
| Goodfellas               |         1990 |
| Mo’ Better Blues         |         1990 |
| Pretty Woman             |         1990 |
| The Godfather: Part III  |         1990 |
| The Hunt for Red October |         1990 |
| All the Pretty Horses    |         2000 |
| Almost Famous            |         2000 |

Displaying records 1 - 10

2.  Get the title and language of all films which were in English,
    Spanish, or French.

``` sql
SELECT title, language
FROM films
WHERE language IN ('English', 'Spanish', 'French');
```

| title                           | language |
|:--------------------------------|:---------|
| The Broadway Melody             | English  |
| Hell’s Angels                   | English  |
| A Farewell to Arms              | English  |
| 42nd Street                     | English  |
| She Done Him Wrong              | English  |
| It Happened One Night           | English  |
| Top Hat                         | English  |
| Modern Times                    | English  |
| The Charge of the Light Brigade | English  |
| Snow White and the Seven Dwarfs | English  |

Displaying records 1 - 10

3.  Get the title and certification of all films with an NC-17 or R
    certification.

``` sql
SELECT title, certification
FROM films
WHERE certification IN ('NC-17', 'R');
```

| title                     | certification |
|:--------------------------|:--------------|
| Psycho                    | R             |
| A Fistful of Dollars      | R             |
| Rosemary’s Baby           | R             |
| Mississippi Mermaid       | R             |
| The Wild Bunch            | R             |
| Catch-22                  | R             |
| Cotton Comes to Harlem    | R             |
| The Ballad of Cable Hogue | R             |
| The Conformist            | R             |
| Woodstock                 | R             |

Displaying records 1 - 10

Your SQL vocabulary is growing by the minute!

## Introduction to NULL and IS NULL

In SQL, `NULL` represents a missing or unknown value. You can check for
`NULL` values using the expression `IS NULL`. For example, to count the
number of missing birth dates in the `people` table:

``` sql
SELECT COUNT(*)
FROM people
WHERE birthdate IS NULL;
```

As you can see, `IS NULL` is useful when combined with `WHERE` to figure
out what data you’re missing.

Sometimes, you’ll want to filter out missing values so you only get
results which are not `NULL`. To do this, you can use the `IS NOT NULL`
operator.

For example, this query gives the names of all people whose birth dates
are *not* missing in the `people` table.

``` sql
SELECT name
FROM people
WHERE birthdate IS NOT NULL;
```

> ## *Question*
>
> What does `NULL` represent?<br> <br> ⬜ A corrupt entry<br> ✅ A
> missing value<br> ⬜ An empty string<br> ⬜ An invalid value<br>

Correct! `NULL` is used to represent unknown values.

## NULL and IS NULL

Now that you know what `NULL` is and what it’s used for, it’s time for
some practice!

**Steps**

1.  Get the names of people who are still alive, i.e. whose death date
    is missing.

``` sql
SELECT name
FROM people
WHERE deathdate IS NULL;
```

| name               |
|:-------------------|
| 50 Cent            |
| A. Michael Baldwin |
| A. Raven Cruz      |
| A.J. Buckley       |
| A.J. DeLucia       |
| A.J. Langer        |
| Aaron Ashmore      |
| Aaron Hann         |
| Aaron Hill         |
| Aaron Hughes       |

Displaying records 1 - 10

2.  Get the title of every film which doesn’t have a budget associated
    with it.

``` sql
SELECT title
FROM films
WHERE budget IS NULL;
```

| title                             |
|:----------------------------------|
| Pandora’s Box                     |
| The Prisoner of Zenda             |
| The Blue Bird                     |
| Bambi                             |
| State Fair                        |
| Open Secret                       |
| Deadline - U.S.A.                 |
| Ordet                             |
| The Party’s Over                  |
| The Torture Chamber of Dr. Sadism |

Displaying records 1 - 10

3.  Get the number of films which don’t have a language associated with
    them.

``` sql
SELECT COUNT(*)
FROM films
WHERE language IS NULL;
```

| count |
|------:|
|    11 |

1 records

Alright! Are you ready for a last type of operator?

## LIKE and NOT LIKE

As you’ve seen, the `WHERE` clause can be used to filter text data.
However, so far you’ve only been able to filter by specifying the exact
text you’re interested in. In the real world, often you’ll want to
search for a *pattern* rather than a specific text string.

In SQL, the `LIKE` operator can be used in a `WHERE` clause to search
for a pattern in a column. To accomplish this, you use something called
a *wildcard* as a placeholder for some other values. There are two
wildcards you can use with `LIKE`:

The `%` wildcard will match zero, one, or many characters in text. For
example, the following query matches companies like `'Data'`, `'DataC'`
`'DataCamp'`, `'DataMind'`, and so on:

``` sql
SELECT name
FROM companies
WHERE name LIKE 'Data%';
```

The `_` wildcard will match a *single* character. For example, the
following query matches companies like `'DataCamp'`, `'DataComp'`, and
so on:

``` sql
SELECT name
FROM companies
WHERE name LIKE 'DataC_mp';
```

You can also use the `NOT LIKE` operator to find records that *don’t*
match the pattern you specify.

Got it? Let’s practice!

**Steps**

1.  Get the names of all people whose names begin with ‘B’. The pattern
    you need is `'B%'`.

``` sql
SELECT name
FROM people
WHERE name LIKE 'B%';
```

| name                         |
|:-----------------------------|
| B.J. Novak                   |
| Babak Najafi                 |
| Babar Ahmed                  |
| Bahare Seddiqi               |
| Bai Ling                     |
| Bailee Madison               |
| Balinese Tari Legong Dancers |
| Bálint Péntek                |
| Baltasar Kormákur            |
| Balthazar Getty              |

Displaying records 1 - 10

2.  Get the names of people whose names have ‘r’ as the second letter.
    The pattern you need is `'_r%'`.

``` sql
SELECT name
FROM people
WHERE name LIKE '_r%';
```

| name              |
|:------------------|
| Ara Celi          |
| Aramis Knight     |
| Arben Bajraktaraj |
| Arcelia Ramírez   |
| Archie Kao        |
| Archie Panjabi    |
| Aretha Franklin   |
| Ari Folman        |
| Ari Gold          |
| Ari Graynor       |

Displaying records 1 - 10

3.  Get the names of people whose names don’t start with A. The pattern
    you need is `'A%'`.

``` sql
SELECT name
FROM people
WHERE name NOT LIKE 'A%';
```

| name               |
|:-------------------|
| 50 Cent            |
| Álex Angulo        |
| Álex de la Iglesia |
| Ángela Molina      |
| B.J. Novak         |
| Babak Najafi       |
| Babar Ahmed        |
| Bahare Seddiqi     |
| Bai Ling           |
| Bailee Madison     |

Displaying records 1 - 10

This concludes the second chapter of the intro to SQL course. Rush over
to chapter 3 if you want to learn more about aggregate functions!

# 3. Aggregate Functions

This chapter teaches you how to use aggregate functions to summarize
data and gain useful insights. You’ll also learn about arithmetic in SQL
and how to use aliases to make your results more readable.

## Aggregate functions

Often, you will want to perform some calculation on the data in a
database. SQL provides a few functions, called *aggregate functions*, to
help you out with this.

For example,

``` sql
SELECT AVG(budget)
FROM films;
```

gives you the average value from the `budget` column of the `films`
table. Similarly, the `MAX()` function returns the highest budget:

``` sql
SELECT MAX(budget)
FROM films;
```

The `SUM()` function returns the result of adding up the numeric values
in a column:

``` sql
SELECT SUM(budget)
FROM films;
```

You can probably guess what the `MIN()` function does! Now it’s your
turn to try out some SQL functions.

**Steps**

1.  Use the `SUM()` function to get the total duration of all films.

``` sql
SELECT SUM(duration)
FROM films;
```

|    sum |
|-------:|
| 534882 |

1 records

2.  Get the average duration of all films.

``` sql
SELECT AVG(duration)
FROM films;
```

|      avg |
|---------:|
| 107.9479 |

1 records

3.  Get the duration of the shortest film.

``` sql
SELECT MIN(duration)
FROM films;
```

| min |
|----:|
|   7 |

1 records

4.  Get the duration of the longest film.

``` sql
SELECT MAX(duration)
FROM films;
```

| max |
|----:|
| 334 |

1 records

Sequelistic!

## Aggregate functions practice

Good work. Aggregate functions are important to understand, so let’s get
some more practice!

**Steps**

1.  Use the `SUM()` function to get the total amount grossed by all
    films.

``` sql
SELECT SUM(gross)
FROM films;
```

|          sum |
|-------------:|
| 202515840134 |

1 records

2.  Get the average amount grossed by all films.

``` sql
SELECT AVG(gross)
FROM films;
```

|      avg |
|---------:|
| 48705108 |

1 records

3.  Get the amount grossed by the worst performing film.

``` sql
SELECT MIN(gross)
FROM films;
```

| min |
|----:|
| 162 |

1 records

4.  Get the amount grossed by the best performing film.

``` sql
SELECT MAX(gross)
FROM films;
```

|       max |
|----------:|
| 936627416 |

1 records

Well done! Don’t forget about these functions. You’ll find yourself
using them over and over again to get a quick grasp of the data in a SQL
database.

## Combining aggregate functions with WHERE

Aggregate functions can be combined with the `WHERE` clause to gain
further insights from your data.

For example, to get the total budget of movies made in the year 2010 or
later:

``` sql
SELECT SUM(budget)
FROM films
WHERE release_year >= 2010;
```

Now it’s your turn!

**Steps**

1.  Use the `SUM()` function to get the total amount grossed by all
    films made in the year 2000 or later.

``` sql
SELECT SUM(gross)
FROM films
WHERE release_year >= 2000;
```

|          sum |
|-------------:|
| 150900926358 |

1 records

2.  Get the average amount grossed by all films whose titles start with
    the letter ‘A’.

``` sql
SELECT AVG(gross)
FROM films
where title LIKE 'A%';
```

|      avg |
|---------:|
| 47893236 |

1 records

3.  Get the amount grossed by the worst performing film in 1994.

``` sql
SELECT MIN(gross)
FROM films
WHERE release_year = 1994;
```

|    min |
|-------:|
| 125169 |

1 records

4.  Get the amount grossed by the best performing film between 2000 and
    2012, inclusive.

``` sql
SELECT MAX(gross)
FROM films
WHERE release_year BETWEEN 2000 AND 2012;
```

|       max |
|----------:|
| 760505847 |

1 records

Nice. Can you see how SQL basically provides you a bunch of building
blocks that you can combine in all kinds of ways? Hence the name:
Structured Query Language.

## A note on arithmetic

In addition to using aggregate functions, you can perform basic
arithmetic with symbols like `+`, `-`, `*`, and `/`.

So, for example, this gives a result of `12`:

``` sql
SELECT (4 * 3);
```

However, the following gives a result of `1`:

``` sql
SELECT (4 / 3);
```

What’s going on here?

SQL assumes that if you divide an integer by an integer, you want to get
an integer back. So be careful when dividing!

If you want more precision when dividing, you can add decimal places to
your numbers. For example,

``` sql
SELECT (4.0 / 3.0) AS result;
```

gives you the result you would expect: `1.333`.

> ## *Question*
>
> What is the result of `SELECT (10 / 3);`?<br> <br> ⬜ 2.333<br> ⬜
> 3.333<br> ✅ 3<br> ⬜ 3.0<br>

## It’s AS simple AS aliasing

You may have noticed in the first exercise of this chapter that the
column name of your result was just the name of the function you used.
For example,

``` sql
SELECT MAX(budget)
FROM films;
```

gives you a result with one column, named `max`. But what if you use two
functions like this?

``` sql
SELECT MAX(budget), MAX(duration)
FROM films;
```

Well, then you’d have two columns named `max`, which isn’t very useful!

To avoid situations like this, SQL allows you to do something called
*aliasing*. Aliasing simply means you assign a temporary name to
something. To alias, you use the `AS` keyword, which you’ve already seen
earlier in this course.

For example, in the above example we could use aliases to make the
result clearer:

``` sql
SELECT MAX(budget) AS max_budget,
       MAX(duration) AS max_duration
FROM films;
```

Aliases are helpful for making results more readable!

**Steps**

1.  Get the title and net profit (the amount a film grossed, minus its
    budget) for all films. Alias the net profit as `net_profit`.

``` sql
SELECT title, gross - budget AS net_profit
FROM films;
```

| title                                            | net_profit |
|:-------------------------------------------------|-----------:|
| Intolerance: Love’s Struggle Throughout the Ages |         NA |
| Over the Hill to the Poorhouse                   |    2900000 |
| The Big Parade                                   |         NA |
| Metropolis                                       |   -5973565 |
| Pandora’s Box                                    |         NA |
| The Broadway Melody                              |    2429000 |
| Hell’s Angels                                    |         NA |
| A Farewell to Arms                               |         NA |
| 42nd Street                                      |    1861000 |
| She Done Him Wrong                               |         NA |

Displaying records 1 - 10

2.  Get the title and duration in hours for all films. The duration is
    in minutes, so you’ll need to divide by 60.0 to get the duration in
    hours. Alias the duration in hours as `duration_hours`.

``` sql
SELECT title, duration / 60.0 AS duration_hours
FROM films;
```

| title                                            | duration_hours |
|:-------------------------------------------------|---------------:|
| Intolerance: Love’s Struggle Throughout the Ages |       2.050000 |
| Over the Hill to the Poorhouse                   |       1.833333 |
| The Big Parade                                   |       2.516667 |
| Metropolis                                       |       2.416667 |
| Pandora’s Box                                    |       1.833333 |
| The Broadway Melody                              |       1.666667 |
| Hell’s Angels                                    |       1.600000 |
| A Farewell to Arms                               |       1.316667 |
| 42nd Street                                      |       1.483333 |
| She Done Him Wrong                               |       1.100000 |

Displaying records 1 - 10

3.  Get the average duration in hours for all films, aliased as
    `avg_duration_hours`.

``` sql
SELECT AVG(duration) / 60.0 AS avg_duration_hours  
FROM films;
```

| avg_duration_hours |
|-------------------:|
|           1.799132 |

1 records

## Even more aliasing

Let’s practice your newfound aliasing skills some more before moving on!

**Recall:** SQL assumes that if you divide an integer by an integer, you
want to get an integer back.

This means that the following will erroneously result in `400.0`:

``` sql
SELECT 45 / 10 * 100.0;
```

This is because `45 / 10` evaluates to an integer (`4`), and not a
decimal number like we would expect.

So when you’re dividing make sure at least one of your numbers has a
decimal place:

``` sql
SELECT 45 * 100.0 / 10;
```

The above now gives the correct answer of `450.0` since the numerator
(`45 * 100.0`) of the division is now a decimal!

**Steps**

1.  Get the percentage of `people` who are no longer alive. Alias the
    result as `percentage_dead`. Remember to use `100.0` and not `100`!

``` sql
-- get the count(deathdate) and multiply by 100.0
-- then divide by count(*) 
SELECT COUNT(deathdate) * 100.0 / COUNT(*) AS percentage_dead
FROM people;
```

| percentage_dead |
|----------------:|
|        9.372395 |

1 records

2.  Get the number of years between the newest film and oldest film.
    Alias the result as `difference`.

``` sql
SELECT MAX(release_year) - MIN(release_year)
AS difference
FROM films;
```

| difference |
|-----------:|
|        100 |

1 records

3.  Get the number of decades the `films` table covers. Alias the result
    as `number_of_decades`. The top half of your fraction should be
    enclosed in parentheses.

``` sql
SELECT (MAX(release_year) - MIN(release_year)) / 10.0
AS number_of_decades
FROM films;
```

| number_of_decades |
|------------------:|
|                10 |

1 records

We’re at the end of chapter 3! In chapter 4, you will learn about
sorting, grouping and joins. Head over there quickly!

# 4. Sorting and grouping

This chapter provides a brief introduction to sorting and grouping your
results.

## ORDER BY

Congratulations on making it this far! You now know how to select and
filter your results.

In this chapter you’ll learn how to sort and group your results to gain
further insight. Let’s go!

In SQL, the `ORDER BY` keyword is used to sort results in ascending or
descending order according to the values of one or more columns.

By default `ORDER BY` will sort in ascending order. If you want to sort
the results in descending order, you can use the `DESC` keyword. For
example,

``` sql
SELECT title
FROM films
ORDER BY release_year DESC;
```

gives you the titles of films sorted by release year, from newest to
oldest.

> ## *Question*
>
> How do you think `ORDER BY` sorts a column of text values by
> default?<br> <br> ✅ Alphabetically (A-Z)<br> ⬜ Reverse
> alphabetically (Z-A)<br> ⬜ There’s no natural ordering to text
> data<br> ⬜ By number of characters (fewest to most)<br>

## Sorting single columns

Now that you understand how `ORDER BY` works, give these exercises a go!

**Steps**

1.  Get the names of people from the `people` table, sorted
    alphabetically.

``` sql
SELECT name
FROM people
ORDER BY name;
```

| name               |
|:-------------------|
| 50 Cent            |
| A. Michael Baldwin |
| A. Raven Cruz      |
| A.J. Buckley       |
| A.J. DeLucia       |
| A.J. Langer        |
| AJ Michalka        |
| Aaliyah            |
| Aaron Ashmore      |
| Aaron Hann         |

Displaying records 1 - 10

2.  Get the names of people, sorted by birth date.

``` sql
SELECT name
FROM people
ORDER BY birthdate;
```

| name              |
|:------------------|
| Robert Shaw       |
| Lucille La Verne  |
| Mary Carr         |
| D.W. Griffith     |
| Finlay Currie     |
| Lionel Barrymore  |
| Billy Gilbert     |
| Cecil B. DeMille  |
| Leopold Stokowski |
| Éric Tessier      |

Displaying records 1 - 10

3.  Get the birth date and name for every person, in order of when they
    were born.

``` sql
SELECT birthdate, name
FROM people
ORDER BY birthdate;
```

| birthdate  | name              |
|:-----------|:------------------|
| 1837-10-10 | Robert Shaw       |
| 1872-11-07 | Lucille La Verne  |
| 1874-03-14 | Mary Carr         |
| 1875-01-22 | D.W. Griffith     |
| 1878-01-20 | Finlay Currie     |
| 1878-04-28 | Lionel Barrymore  |
| 1880-03-21 | Billy Gilbert     |
| 1881-08-12 | Cecil B. DeMille  |
| 1882-04-18 | Leopold Stokowski |
| 1883-05-28 | Éric Tessier      |

Displaying records 1 - 10

## Sorting single columns (2)

Let’s get some more practice with `ORDER BY`!

**Steps**

1.  Get the title of films released in 2000 or 2012, in the order they
    were released.

``` sql
SELECT title
FROM films
WHERE release_year IN (2000, 2012)
ORDER BY release_year;
```

| title                 |
|:----------------------|
| 102 Dalmatians        |
| 28 Days               |
| 3 Strikes             |
| Aberdeen              |
| All the Pretty Horses |
| Almost Famous         |
| American Psycho       |
| Amores Perros         |
| An Everlasting Piece  |
| Anatomy               |

Displaying records 1 - 10

2.  Get all details for all films except those released in 2015 and
    order them by duration.

``` sql
SELECT *
FROM films
WHERE release_year <> 2015
ORDER BY duration;
```

|   id | title                                                 | release_year | country | duration | language | certification |   gross |   budget |
|-----:|:------------------------------------------------------|-------------:|:--------|---------:|:---------|:--------------|--------:|---------:|
| 2926 | The Touch                                             |         2007 | USA     |        7 | English  | NA            |      NA |    13000 |
| 4098 | Vessel                                                |         2012 | USA     |       14 | English  | NA            |      NA |       NA |
| 2501 | Wal-Mart: The High Cost of Low Price                  |         2005 | USA     |       20 | English  | Not Rated     |      NA |  1500000 |
|  566 | Marilyn Hotchkiss’ Ballroom Dancing and Charm School  |         1990 | USA     |       34 | English  | NA            |  333658 |    34000 |
| 2829 | Jesus People                                          |         2007 | USA     |       35 | English  | NA            |      NA |       NA |
|  462 | Evil Dead II                                          |         1987 | USA     |       37 | English  | X             | 5923044 |  3600000 |
| 3579 | Sea Rex 3D: Journey to a Prehistoric World            |         2010 | UK      |       41 | English  | NA            | 4074023 |  5000000 |
| 2985 | Dolphins and Whales 3D: Tribes of the Ocean           |         2008 | UK      |       42 | English  | NA            | 7518876 |  6000000 |
| 2997 | Flame and Citron                                      |         2008 | Denmark |       45 | Danish   | Not Rated     |  145109 | 45000000 |
| 4358 | Alpha and Omega 4: The Legend of the Saw Toothed Cave |         2014 | USA     |       45 | NA       | NA            |      NA |  7000000 |

Displaying records 1 - 10

3.  Get the title and gross earnings for movies which begin with the
    letter ‘M’ and order the results alphabetically.

``` sql
SELECT title, gross
FROM films
WHERE title LIKE 'M%'
ORDER BY title;
```

| title                       |    gross |
|:----------------------------|---------:|
| MacGruber                   |  8460995 |
| Machete                     | 26589953 |
| Machete Kills               |  7268659 |
| Machine Gun McCain          |       NA |
| Machine Gun Preacher        |   537580 |
| Mad City                    | 10556196 |
| Mad Hot Ballroom            |  8044906 |
| Mad Max                     |       NA |
| Mad Max 2: The Road Warrior |  9003011 |
| Mad Max Beyond Thunderdome  | 36200000 |

Displaying records 1 - 10

Can you feel the SQL power dawn on you?!

## Sorting single columns (DESC)

To order results in *descending* order, you can put the keyword `DESC`
after your `ORDER BY`. For example, to get all the names in the `people`
table, in reverse alphabetical order:

``` sql
SELECT name
FROM people
ORDER BY name DESC;
```

Now practice using `ORDER BY` with `DESC` to sort single columns in
descending order!

**Steps**

1.  Get the IMDB score and film ID for every film from the reviews
    table, sorted from highest to lowest score.

``` sql
SELECT imdb_score, film_id
FROM reviews
ORDER BY imdb_score DESC;
```

| imdb_score | film_id |
|-----------:|--------:|
|        9.5 |    4960 |
|        9.3 |     742 |
|        9.2 |     178 |
|        9.1 |    4866 |
|        9.0 |    3110 |
|        9.0 |     192 |
|        8.9 |     676 |
|        8.9 |      69 |
|        8.9 |     120 |
|        8.9 |     723 |

Displaying records 1 - 10

2.  Get the title for every film, in reverse order.

``` sql
SELECT title
FROM films
ORDER BY title DESC;
```

| title                   |
|:------------------------|
| Æon Flux                |
| xXx: State of the Union |
| xXx                     |
| eXistenZ                |
| \[Rec\] 2               |
| \[Rec\]                 |
| Zulu                    |
| Zoom                    |
| Zoolander 2             |
| Zoolander               |

Displaying records 1 - 10

3.  Get the title and duration for every film, in order of longest
    duration to shortest.

``` sql
SELECT title, duration
FROM films
ORDER BY duration DESC;
```

| title                                        | duration |
|:---------------------------------------------|---------:|
| Destiny                                      |       NA |
| Should’ve Been Romeo                         |       NA |
| Hum To Mohabbat Karega                       |       NA |
| Harry Potter and the Deathly Hallows: Part I |       NA |
| Barfi                                        |       NA |
| Romantic Schemer                             |       NA |
| Wolf Creek                                   |       NA |
| Dil Jo Bhi Kahey…                            |       NA |
| The Naked Ape                                |       NA |
| Black Water Transit                          |       NA |

Displaying records 1 - 10

Nice. Let’s explore how you can sort multiple columns!

## Sorting multiple columns

`ORDER BY` can also be used to sort on multiple columns. It will sort by
the first column specified, then sort by the next, then the next, and so
on. For example,

``` sql
SELECT birthdate, name
FROM people
ORDER BY birthdate, name;
```

sorts on birth dates first (oldest to newest) and then sorts on the
names in alphabetical order. **The order of columns is important!**

Try using `ORDER BY` to sort multiple columns! Remember, to specify
multiple columns you separate the column names with a comma.

**Steps**

1.  Get the birth date and name of people in the `people` table, in
    order of when they were born and alphabetically by name.

``` sql
SELECT birthdate, name
FROM people
ORDER BY birthdate, name;
```

| birthdate  | name              |
|:-----------|:------------------|
| 1837-10-10 | Robert Shaw       |
| 1872-11-07 | Lucille La Verne  |
| 1874-03-14 | Mary Carr         |
| 1875-01-22 | D.W. Griffith     |
| 1878-01-20 | Finlay Currie     |
| 1878-04-28 | Lionel Barrymore  |
| 1880-03-21 | Billy Gilbert     |
| 1881-08-12 | Cecil B. DeMille  |
| 1882-04-18 | Leopold Stokowski |
| 1883-05-28 | Éric Tessier      |

Displaying records 1 - 10

2.  Get the release year, duration, and title of films ordered by their
    release year and duration.

``` sql
SELECT release_year, duration, title
FROM films
ORDER BY release_year, duration;
```

| release_year | duration | title                                            |
|-------------:|---------:|:-------------------------------------------------|
|         1916 |      123 | Intolerance: Love’s Struggle Throughout the Ages |
|         1920 |      110 | Over the Hill to the Poorhouse                   |
|         1925 |      151 | The Big Parade                                   |
|         1927 |      145 | Metropolis                                       |
|         1929 |      100 | The Broadway Melody                              |
|         1929 |      110 | Pandora’s Box                                    |
|         1930 |       96 | Hell’s Angels                                    |
|         1932 |       79 | A Farewell to Arms                               |
|         1933 |       66 | She Done Him Wrong                               |
|         1933 |       89 | 42nd Street                                      |

Displaying records 1 - 10

3.  Get certifications, release years, and titles of films ordered by
    certification (alphabetically) and release year.

``` sql
SELECT certification, release_year, title
FROM films
ORDER BY certification, release_year;
```

| certification | release_year | title                           |
|:--------------|-------------:|:--------------------------------|
| Approved      |         1933 | She Done Him Wrong              |
| Approved      |         1935 | Top Hat                         |
| Approved      |         1936 | The Charge of the Light Brigade |
| Approved      |         1937 | Snow White and the Seven Dwarfs |
| Approved      |         1937 | The Prisoner of Zenda           |
| Approved      |         1938 | You Can’t Take It with You      |
| Approved      |         1938 | Alexander’s Ragtime Band        |
| Approved      |         1940 | Pinocchio                       |
| Approved      |         1940 | The Blue Bird                   |
| Approved      |         1941 | How Green Was My Valley         |

Displaying records 1 - 10

4.  Get the names and birthdates of people ordered by name and birth
    date.

``` sql
SELECT name, birthdate
FROM people
ORDER BY name, birthdate;
```

| name               | birthdate  |
|:-------------------|:-----------|
| 50 Cent            | 1975-07-06 |
| A. Michael Baldwin | 1963-04-04 |
| A. Raven Cruz      | NA         |
| A.J. Buckley       | 1978-02-09 |
| A.J. DeLucia       | NA         |
| A.J. Langer        | 1974-05-22 |
| AJ Michalka        | 1991-04-10 |
| Aaliyah            | 1979-01-16 |
| Aaron Ashmore      | 1979-10-07 |
| Aaron Hann         | NA         |

Displaying records 1 - 10

Well done. Notice how the second column you order on only steps in when
the first column is not decisive to tell the order. The second column
acts as a tie breaker.

## GROUP BY

Now you know how to sort results! Often you’ll need to aggregate
results. For example, you might want to count the number of male and
female employees in your company. Here, what you want is to group all
the males together and count them, and group all the females together
and count them. In SQL, `GROUP BY` allows you to group a result by one
or more columns, like so:

``` sql
SELECT sex, count(*)
FROM employees
GROUP BY sex;
```

This might give, for example:

| sex    | count |
|:-------|------:|
| male   |    15 |
| female |    19 |

Commonly, `GROUP BY` is used with *aggregate functions* like `COUNT()`
or `MAX()`. Note that `GROUP BY` always goes after the `FROM` clause!

> ## *Question*
>
> What is `GROUP BY` used for?<br> <br> ⬜ Performing operations by
> column<br> ⬜ Performing operations all at once<br> ⬜ Performing
> operations in a particular order<br> ✅ Performing operations by
> group<br>

Correct! `GROUP BY` is for performing operations within groups.

## GROUP BY practice

As you’ve just seen, combining aggregate functions with `GROUP BY` can
yield some powerful results!

A word of warning: SQL will return an error if you try to `SELECT` a
field that is not in your `GROUP BY` clause without using it to
calculate some kind of value about the entire group.

Note that you can combine `GROUP BY` with `ORDER BY` to group your
results, calculate something about them, and then order your results.
For example,

``` sql
SELECT sex, count(*)
FROM employees
GROUP BY sex
ORDER BY count DESC;
```

might return something like

| sex    | count |
|:-------|------:|
| female |    19 |
| male   |    15 |

because there are more females at our company than males. Note also that
`ORDER BY` always goes after `GROUP BY`. Let’s try some exercises!

**Steps**

1.  Get the release year and count of films released in each year.

``` sql
SELECT release_year, COUNT(*)
FROM films
GROUP BY release_year;
```

| release_year | count |
|-------------:|------:|
|         1954 |     5 |
|         1988 |    31 |
|         1959 |     3 |
|         1964 |    10 |
|         1969 |    10 |
|           NA |    42 |
|         2008 |   225 |
|         1991 |    31 |
|         1989 |    33 |
|         1945 |     4 |

Displaying records 1 - 10

2.  Get the release year and average duration of all films, grouped by
    release year.

``` sql
SELECT release_year, AVG(duration)
FROM films
GROUP BY release_year;
```

| release_year |       avg |
|-------------:|----------:|
|         1954 | 140.60000 |
|         1988 | 107.00000 |
|         1959 | 136.66667 |
|         1964 | 119.40000 |
|         1969 | 126.00000 |
|           NA |  77.43902 |
|         2008 | 105.38222 |
|         1991 | 113.06452 |
|         1989 | 113.12121 |
|         1945 | 103.75000 |

Displaying records 1 - 10

3.  Get the release year and largest budget for all films, grouped by
    release year.

``` sql
SELECT release_year, MAX(budget)
FROM films
GROUP BY release_year;
```

| release_year |        max |
|-------------:|-----------:|
|         1954 |    5000000 |
|         1988 | 1100000000 |
|         1959 |    5000000 |
|         1964 |   19000000 |
|         1969 |   20000000 |
|           NA |   15000000 |
|         2008 |  553632000 |
|         1991 |  102000000 |
|         1989 |   69500000 |
|         1945 |    2160000 |

Displaying records 1 - 10

4.  Get the IMDB score and count of film reviews grouped by IMDB score
    in the `reviews` table.

``` sql
SELECT imdb_score, COUNT(*)
FROM reviews
GROUP BY imdb_score;
```

| imdb_score | count |
|-----------:|------:|
|        5.7 |   117 |
|        8.7 |    11 |
|        9.0 |     2 |
|        9.1 |     1 |
|        8.3 |    37 |
|        5.6 |   112 |
|        5.9 |   144 |
|        9.3 |     1 |
|        4.4 |    25 |
|        2.1 |     3 |

Displaying records 1 - 10

Now that you’ve accustomed yourself with `GROUP BY`, let’s throw it in
the mix with other SQL constructs you already know!

## GROUP BY practice (2)

Now practice your new skills by combining `GROUP BY` and `ORDER BY` with
some more aggregate functions!

Make sure to always put the `ORDER BY` clause at the end of your query.
You can’t sort values that you haven’t calculated yet!

**Steps**

1.  Get the release year and lowest gross earnings per release year.

``` sql
SELECT release_year, MIN(gross)
FROM films
GROUP BY release_year;
```

| release_year |      min |
|-------------:|---------:|
|         1954 |   269061 |
|         1988 |   439162 |
|         1959 | 25000000 |
|         1964 |    12438 |
|         1969 |    26893 |
|           NA |   145118 |
|         2008 |     3478 |
|         1991 |   869325 |
|         1989 |   792966 |
|         1945 |       NA |

Displaying records 1 - 10

2.  Get the language and total gross amount films in each language made.

``` sql
SELECT language, SUM(gross)
FROM films
GROUP BY language;
```

| language |       sum |
|:---------|----------:|
| Danish   |   2403857 |
| Greek    |    110197 |
| Dzongkha |    505295 |
| None     |   2601847 |
| NA       |   4319281 |
| Tamil    |        NA |
| Swahili  |        NA |
| Mandarin | 163611530 |
| Urdu     |        NA |
| Filipino |  10166502 |

Displaying records 1 - 10

3.  Get the country and total budget spent making movies in each
    country.

``` sql
SELECT country, SUM(budget)
FROM films
GROUP BY country;
```

| country            |          sum |
|:-------------------|-------------:|
| NA                 |      3500000 |
| Soviet Union       |      1000000 |
| Indonesia          |      1100000 |
| Italy              |    261350000 |
| Cameroon           |           NA |
| Czech Republic     |    146450000 |
| Sweden             |     50400000 |
| USA                | 125693604035 |
| Dominican Republic |       500000 |
| Cambodia           |           NA |

Displaying records 1 - 10

4.  Get the release year, country, and highest budget spent making a
    film for each year, for each country. Sort your results by release
    year and country.

``` sql
SELECT release_year, country, MAX(budget)
FROM films
GROUP BY release_year, country
ORDER BY release_year, country;
```

| release_year | country |     max |
|-------------:|:--------|--------:|
|         1916 | USA     |  385907 |
|         1920 | USA     |  100000 |
|         1925 | USA     |  245000 |
|         1927 | Germany | 6000000 |
|         1929 | Germany |      NA |
|         1929 | USA     |  379000 |
|         1930 | USA     | 3950000 |
|         1932 | USA     |  800000 |
|         1933 | USA     |  439000 |
|         1934 | USA     |  325000 |

Displaying records 1 - 10

5.  Get the country, release year, and lowest amount grossed per release
    year per country. Order your results by country and release year.

``` sql
SELECT country, release_year, MIN(gross)
FROM films
GROUP BY country, release_year
ORDER BY country, release_year;
```

| country     | release_year |       min |
|:------------|-------------:|----------:|
| Afghanistan |         2003 |   1127331 |
| Argentina   |         2000 |   1221261 |
| Argentina   |         2004 |    304124 |
| Argentina   |         2009 |  20167424 |
| Aruba       |         1998 |  10076136 |
| Australia   |         1979 |        NA |
| Australia   |         1981 |   9003011 |
| Australia   |         1982 |        NA |
| Australia   |         1985 |  36200000 |
| Australia   |         1986 | 174635000 |

Displaying records 1 - 10

Off to the next statement!

## HAVING a great time

In SQL, aggregate functions can’t be used in `WHERE` clauses. For
example, the following query is invalid:

``` sql
SELECT release_year
FROM films
GROUP BY release_year
WHERE COUNT(title) > 10;
```

This means that if you want to filter based on the result of an
aggregate function, you need another way! That’s where the `HAVING`
clause comes in. For example,

``` sql
SELECT release_year
FROM films
GROUP BY release_year
HAVING COUNT(title) > 10;
```

shows only those years in which more than 10 films were released.

> ## *Question*
>
> In how many different years were more than 200 movies released?<br>
> <br> ⬜ 2<br> ✅ 13<br> ⬜ 44<br> ⬜ 63<br>

## All together now

Time to practice using `ORDER BY`, `GROUP BY` and `HAVING` together.

Now you’re going to write a query that returns the average budget and
average gross earnings for films in each year after 1990, if the average
budget is greater than $60 million.

This is going to be a big query, but you can handle it!

**Steps**

1.  Get the release year, budget and gross earnings for each film in the
    `films` table.

``` sql
SELECT release_year, budget, gross
FROM films;
```

| release_year |  budget |   gross |
|-------------:|--------:|--------:|
|         1916 |  385907 |      NA |
|         1920 |  100000 | 3000000 |
|         1925 |  245000 |      NA |
|         1927 | 6000000 |   26435 |
|         1929 |      NA |    9950 |
|         1929 |  379000 | 2808000 |
|         1930 | 3950000 |      NA |
|         1932 |  800000 |      NA |
|         1933 |  439000 | 2300000 |
|         1933 |  200000 |      NA |

Displaying records 1 - 10

2.  Modify your query so that only records with a `release_year` after
    1990 are included.

``` sql
SELECT release_year, budget, gross
FROM films
WHERE release_year > 1990;
```

| release_year |   budget |     gross |
|-------------:|---------:|----------:|
|         1991 |  6000000 |    869325 |
|         1991 | 20000000 |  38037513 |
|         1991 |  6000000 |  57504069 |
|         1991 | 35000000 |  79100000 |
|         1991 | 15000000 |  30102717 |
|         1991 | 35000000 |  14587732 |
|         1991 |  8500000 |  34872293 |
|         1991 | 23000000 |   7434726 |
|         1991 | 70000000 | 119654900 |
|         1991 |  5000000 |  19281235 |

Displaying records 1 - 10

3.  Remove the budget and gross columns, and group your results by
    release year.

``` sql
SELECT release_year
FROM films
WHERE release_year > 1990
GROUP BY release_year;
```

| release_year |
|-------------:|
|         2008 |
|         1991 |
|         2009 |
|         2005 |
|         2013 |
|         2003 |
|         2015 |
|         1993 |
|         2002 |
|         2004 |

Displaying records 1 - 10

4.  Modify your query to include the average budget and average gross
    earnings for the results you have so far. Alias the average budget
    as `avg_budget`; alias the average gross earnings as `avg_gross`.

``` sql
SELECT release_year, AVG(budget) AS avg_budget, AVG(gross) AS avg_gross
FROM films
WHERE release_year > 1990
GROUP BY release_year;
```

| release_year | avg_budget | avg_gross |
|-------------:|-----------:|----------:|
|         2008 |   41804886 |  44573509 |
|         1991 |   25176548 |  53844502 |
|         2009 |   37073287 |  46207440 |
|         2005 |   70323938 |  41159143 |
|         2013 |   40519045 |  56158358 |
|         2003 |   37208649 |  48727747 |
|         2015 |   39298329 |  72573303 |
|         1993 |   20729787 |  45302091 |
|         2002 |   32598511 |  43511151 |
|         2004 |   46865345 |  40726529 |

Displaying records 1 - 10

5.  Modify your query so that only years with an average budget of
    greater than $60 million are included.

``` sql
SELECT release_year, AVG(budget) AS avg_budget, AVG(gross) AS avg_gross
FROM films
WHERE release_year > 1990
GROUP BY release_year
HAVING AVG(budget) > 60000000;
```

| release_year | avg_budget | avg_gross |
|:-------------|-----------:|----------:|
| 2005         |   70323938 |  41159143 |
| 2006         |   93968930 |  39237856 |

2 records

6.  Finally, modify your query to order the results from highest average
    gross earnings to lowest.

``` sql
SELECT release_year, AVG(budget) AS avg_budget, AVG(gross) AS avg_gross
FROM films
WHERE release_year > 1990
GROUP BY release_year
HAVING AVG(budget) > 60000000
ORDER BY avg_gross DESC;
```

| release_year | avg_budget | avg_gross |
|:-------------|-----------:|----------:|
| 2005         |   70323938 |  41159143 |
| 2006         |   93968930 |  39237856 |

2 records

Wooooow! Let’s do another one!

## All together now (2)

Great work! Now try another large query. This time, all in one go!

Remember, if you only want to return a certain number of results, you
can use the `LIMIT` keyword to limit the number of rows returned

**Steps**

1.  Get the country, average budget, and average gross take of countries
    that have made more than 10 films. Order the result by country name,
    and limit the number of results displayed to 5. You should alias the
    averages as `avg_budget` and `avg_gross` respectively.

``` sql
-- select country, average budget, 
-- and average gross
SELECT country, AVG(budget) AS avg_budget, 
       AVG(gross) AS avg_gross
-- from the films table
FROM films
-- group by country 
GROUP BY country
-- where the country has more than 10 titles
HAVING COUNT(title) > 10
-- order by country
ORDER BY country
-- limit to only show 5 results
LIMIT 5;
```

| country   | avg_budget | avg_gross |
|:----------|-----------:|----------:|
| Australia |   31172110 |  40205910 |
| Canada    |   14798459 |  22432067 |
| China     |   62219000 |  14143041 |
| Denmark   |   13922222 |   1418469 |
| France    |   30672035 |  16350594 |

5 records

Superb work on a selection saga! `SELECT` queries can get rather long,
but breaking them down into individual clauses makes them easier to
write.

## A taste of things to come

Congrats on making it to the end of the course! By now you should have a
good understanding of the basics of SQL.

There’s one more concept we’re going to introduce. You may have noticed
that all your results so far have been from just one table, e.g.,
`films` or `people`.

In the real world however, you will often want to query multiple tables.
For example, what if you want to see the IMDB score for a particular
movie?

In this case, you’d want to get the ID of the movie from the `films`
table and then use it to get IMDB information from the `reviews` table.
In SQL, this concept is known as a **join**, and a basic join is shown
in the editor to the right.

The query in the editor gets the IMDB score for the film *To Kill a
Mockingbird*! Cool right?

As you can see, joins are incredibly useful and important to understand
for anyone using SQL.

We have a whole follow-up course dedicated to them called
<a href="https://learn.datacamp.com/courses/joining-data-in-postgresql">Joining
Data in SQL</a> for you to hone your database skills further!

**Steps**

1.  Submit the code in the editor and inspect the results.

``` sql
SELECT title, imdb_score
FROM films
JOIN reviews
ON films.id = reviews.film_id
WHERE title = 'To Kill a Mockingbird';
```

| title                 | imdb_score |
|:----------------------|-----------:|
| To Kill a Mockingbird |        8.4 |

1 records

> ## *Question*
>
> What is the IMDB score for the film *To Kill a Mockingbird*?<br> <br>
> ⬜ 8.1<br> ✅ 8.4<br> ⬜ 7.7<br> ⬜ 9.3<br>
