Hackerrank SQL
================
Joschka Schwarz

-   [SETUP](#setup)
-   [Basic Select](#basic-select)
-   [Advanced Select](#advanced-select)
-   [Aggregation](#aggregation)
-   [Basic Join](#basic-join)
-   [Advanced Join](#advanced-join)
-   [Alternative Queries](#alternative-queries)

# SETUP

## Create User

``` sql
CREATE USER 'jwarz'@localhost IDENTIFIED BY '***';
GRANT ALL PRIVILEGES ON *.* TO 'jwarz'@localhost IDENTIFIED BY '***';
# GRANT ALL PRIVILEGES ON 'DBname'.* TO 'jwarz'@localhost; 
```

## Create databases

``` sql
DROP DATABASE IF EXISTS hackerrank_cities;
CREATE DATABASE hackerrank_cities;

DROP DATABASE IF EXISTS hackerrank_station;
CREATE DATABASE hackerrank_station;
# USE hackerrank_station;
```

## Create tables

``` sql
#########
# city1 #
#########
create table city1
(
    ID int primary key,
    NAME varchar(17),
    COUNTRYCODE varchar(3),
    DISTRICT varchar(20),
    POPULATION int
);

insert into city1 values (6, "Rotterdam", "NLD", "Zuid-Holland", 593321);
insert into city1 values (3878, "Scottsdale", "USA", "Arizona", 202705);
insert into city1 values (3965, "Corona", "USA", "California", 124966);
insert into city1 values (3973, "Concord", "USA", "California", 121780);
insert into city1 values (3977, "Cedar Rapids", "USA", "Iowa", 120758);
insert into city1 values (3982, "Coral Springs", "USA", "Florida", 117549);
insert into city1 values (4054, "Fairfield", "USA", "California", 92256);
insert into city1 values (4058, "Boulder", "USA", "Colorado", 91238);
insert into city1 values (4061, "Fall River", "USA", "Massachusetts", 90555);

#########
# city2 #
#########
create table city2
(
    ID int primary key,
    NAME varchar(17),
    COUNTRYCODE varchar(3),
    DISTRICT varchar(20),
    POPULATION int
);
LOAD DATA LOCAL INFILE "data/city2.csv" INTO TABLE city2
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

###########
# STATION #
###########
create table STATION
(
    ID int,
    CITY varchar(21),
    STATE varchar(2),
    LAT_N decimal(10,0),
    LONG_W decimal(10,0)
);
LOAD DATA LOCAL INFILE "data/STATION.csv" INTO TABLE STATION
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
```

# Basic Select

## City Data

The CITY1 / CITY2 tables are described as follows:

``` sql
select column_name, column_type 
from INFORMATION_SCHEMA.COLUMNS 
where TABLE_NAME='city1';
```

| column_name | column_type |
|:------------|:------------|
| ID          | int(11)     |
| NAME        | varchar(17) |
| COUNTRYCODE | varchar(3)  |
| DISTRICT    | varchar(20) |
| POPULATION  | int(11)     |

5 records

## Revising the Select Query I

Query all columns for all American cities in the CITY table with
populations larger than 100000. The CountryCode for America is USA.

``` sql
SELECT *
FROM CITY1
WHERE POPULATION > 100000
AND COUNTRYCODE = "USA";
```

|   ID | NAME          | COUNTRYCODE | DISTRICT   | POPULATION |
|-----:|:--------------|:------------|:-----------|-----------:|
| 3878 | Scottsdale    | USA         | Arizona    |     202705 |
| 3965 | Corona        | USA         | California |     124966 |
| 3973 | Concord       | USA         | California |     121780 |
| 3977 | Cedar Rapids  | USA         | Iowa       |     120758 |
| 3982 | Coral Springs | USA         | Florida    |     117549 |

5 records

## Revising the Select Query II

Query the NAME field for all American cities in the CITY table with
populations larger than 120000. The CountryCode for America is USA.

``` sql
SELECT NAME
FROM CITY1
WHERE POPULATION > 120000
AND COUNTRYCODE = "USA";
```

| NAME         |
|:-------------|
| Scottsdale   |
| Corona       |
| Concord      |
| Cedar Rapids |

4 records

## Select All

Query all columns (attributes) for every row in the CITY table.

``` sql
SELECT *
FROM city1;
```

|   ID | NAME          | COUNTRYCODE | DISTRICT      | POPULATION |
|-----:|:--------------|:------------|:--------------|-----------:|
|    6 | Rotterdam     | NLD         | Zuid-Holland  |     593321 |
| 3878 | Scottsdale    | USA         | Arizona       |     202705 |
| 3965 | Corona        | USA         | California    |     124966 |
| 3973 | Concord       | USA         | California    |     121780 |
| 3977 | Cedar Rapids  | USA         | Iowa          |     120758 |
| 3982 | Coral Springs | USA         | Florida       |     117549 |
| 4054 | Fairfield     | USA         | California    |      92256 |
| 4058 | Boulder       | USA         | Colorado      |      91238 |
| 4061 | Fall River    | USA         | Massachusetts |      90555 |

9 records

## Select BY ID

*Table: CITY2*

Query all columns for a city in CITY with the ID 1661.

``` sql
SELECT * 
FROM CITY2
WHERE ID = 1661; 
```

|   ID | NAME   | COUNTRYCODE | DISTRICT | POPULATION |
|-----:|:-------|:------------|:---------|-----------:|
| 1661 | Sayama | JPN         | Saitama  |     162472 |

1 records

## Japanese Cities’ Attributes

Query all attributes of every Japanese city in the CITY table. The
COUNTRYCODE for Japan is JPN.

``` sql
SELECT * 
FROM CITY2 
WHERE COUNTRYCODE = 'JPN';        
```

|   ID | NAME     | COUNTRYCODE | DISTRICT  | POPULATION |
|-----:|:---------|:------------|:----------|-----------:|
| 1613 | Neyagawa | JPN         | Osaka     |     257315 |
| 1630 | Ageo     | JPN         | Saitama   |     209442 |
| 1661 | Sayama   | JPN         | Saitama   |     162472 |
| 1681 | Omuta    | JPN         | Fukuoka   |     142889 |
| 1739 | Tokuyama | JPN         | Yamaguchi |     107078 |

5 records

## Japanese Cities’ Names

Query the names of all the Japanese cities in the CITY table. The
COUNTRYCODE for Japan is JPN.

``` sql
SELECT NAME 
FROM CITY2 
WHERE COUNTRYCODE = 'JPN';              
```

| NAME     |
|:---------|
| Neyagawa |
| Ageo     |
| Sayama   |
| Omuta    |
| Tokuyama |

5 records

## Weather Observation Station data

The STATION table is described as follows:

``` sql
select column_name, column_type 
from INFORMATION_SCHEMA.COLUMNS 
where TABLE_NAME='STATION';
```

| column_name | column_type   |
|:------------|:--------------|
| ID          | int(11)       |
| CITY        | varchar(21)   |
| STATE       | varchar(2)    |
| LAT_N       | decimal(10,0) |
| LONG_W      | decimal(10,0) |

5 records

## Weather Observation Station 1

*SIMPLE SELECT*

Query a list of CITY and STATE from the STATION table.

``` sql
SELECT CITY, STATE 
FROM STATION;
```

| CITY         | STATE |
|:-------------|:------|
| Kissee Mills | MO    |
| Loma Mar     | CA    |
| Sandy Hook   | CT    |
| Tipton       | IN    |
| Arlington    | CO    |
| Turner       | AR    |
| Slidell      | LA    |
| Negreet      | LA    |
| Glencoe      | KY    |
| Chelsea      | IA    |

Displaying records 1 - 10

## Weather Observation Station 2

Does not exist …

## Weather Observation Station 3

*MODULO*

Query a list of CITY names from STATION with even ID numbers only. You
may print the results in any order, but must exclude duplicates from
your answer.

``` sql
SELECT DISTINCT CITY
FROM STATION
WHERE MOD(ID,2)=0
ORDER BY CITY ASC;  
```

| CITY          |
|:--------------|
| Aguanga       |
| Alba          |
| Albany        |
| Amo           |
| Andersonville |
| Archie        |
| Athens        |
| Atlantic Mine |
| Bainbridge    |
| Baker         |

Displaying records 1 - 10

## Weather Observation Station 4

*MATH INSIDE SELECT*

Find the difference between the total number of CITY entries in the
table and the number of distinct CITY entries in the table.

``` sql
select (count(CITY) - count(distinct CITY))
from STATION; 
```

| (count(CITY) - count(distinct CITY)) |
|-------------------------------------:|
|                                   13 |

1 records

## Weather Observation Station 5

*STRINGLENGTH* *ORDER BY* *LIMIT*

Query the two cities in STATION with the shortest and longest CITY
names, as well as their respective lengths (i.e.: number of characters
in the name). If there is more than one smallest or largest city, choose
the one that comes first when ordered alphabetically.

**Note** You can write two separate queries to get the desired output.
It need not be a single query.

``` sql
(SELECT CITY, LENGTH(CITY) AS length FROM STATION ORDER BY length ASC, CITY ASC LIMIT 1 ) 
UNION 
(SELECT CITY, LENGTH(CITY) AS length FROM STATION ORDER BY length DESC, CITY ASC LIMIT 1 );
```

| CITY                  | length |
|:----------------------|-------:|
| Amo                   |      3 |
| Marine On Saint Croix |     21 |

2 records

## Weather Observation Station 6

*SUBSTRING CONDITION (FIRST LETTER)*

Query the list of CITY names starting with vowels (i.e., a, e, i, o, or
u) from STATION. Your result cannot contain duplicates.

**1. MySQL**

-   RLIKE

``` sql
SELECT DISTINCT(city) 
FROM station 
WHERE city RLIKE '^[aeiou]';
```

| city       |
|:-----------|
| Arlington  |
| Albany     |
| Upperco    |
| Aguanga    |
| Odin       |
| East China |
| Algonac    |
| Onaway     |
| Irvington  |
| Arrowsmith |

Displaying records 1 - 10

-   REGEXP

``` sql
SELECT DISTINCT CITY 
FROM STATION  
WHERE CITY REGEXP '^[aeiou]';
```

-   SUBSTRING & IN

``` sql
SELECT DISTINCT(CITY)
FROM STATION 
WHERE LOWER(SUBSTR(CITY, 1,1)) in ('a','e','i','o','u');
```

-   LEFT,RIGHT & IN

``` sql
SELECT DISTINCT CITY
FROM STATION
WHERE LOWER(LEFT(CITY,1)) IN ('a', 'e', 'i', 'o', 'u');
```

**2. MS SQL Server**

``` sql
# MS SQL SERVER
SELECT DISTINCT city 
from station 
where city LIKE '[a, e, i, o, u]%';
```

## Weather Observation Station 7

*SUBSTRING CONDITION (LAST LETTER)*

Query the list of CITY names ending with vowels (a, e, i, o, u) from
STATION. Your result cannot contain duplicates.

1.  MySQL

-   RLIKE

``` sql
SELECT DISTINCT(city) 
FROM station 
WHERE city RLIKE '[aeiou]$';
```

| city        |
|:------------|
| Glencoe     |
| Chelsea     |
| Pelahatchie |
| Dorrance    |
| Cahone      |
| Upperco     |
| Waipahu     |
| Millville   |
| Aguanga     |
| Morenci     |

Displaying records 1 - 10

-   REGEXP

``` sql
SELECT DISTINCT CITY 
FROM STATION  
WHERE CITY REGEXP '[aeiou]$';
```

-   SUBSTRING & IN

``` sql
select distinct(CITY) from STATION 
where LOWER(SUBSTR(CITY, -1)) in ('a','e','i','o','u');
```

-   LEFT,RIGHT & IN

``` sql
SELECT DISTINCT CITY
FROM STATION
WHERE LOWER(RIGHT(CITY,1)) IN ('a', 'e', 'i', 'o', 'u');
```

**2. MS SQL Server**

``` sql
# MS SQL SERVER
SELECT DISTINCT city 
from station 
where city LIKE '%[a, e, i, o, u]';
```

## Weather Observation Station 8

*SUBSTRING CONDITION (FIRST AND LAST LETTER)*

Query the list of CITY names from STATION which have vowels (i.e., a, e,
i, o, and u) as both their first and last characters. Your result cannot
contain duplicates.

**1. MySQL**

-   RLIKE

``` sql
SELECT DISTINCT(city) 
FROM station 
WHERE city RLIKE '^[aeiou]' AND city RLIKE '[aeiou]$';
```

| city          |
|:--------------|
| Upperco       |
| Aguanga       |
| East China    |
| East Irvine   |
| Amo           |
| Eleele        |
| Oconee        |
| Amazonia      |
| Aliso Viejo   |
| Andersonville |

Displaying records 1 - 10

-   REGEXP

``` sql
SELECT DISTINCT CITY 
FROM STATION  
WHERE CITY REGEXP '^[aeiou]' AND CITY REGEXP '[aeiou]$';
```

-   SUBSTRING & IN

``` sql
select distinct(CITY) from STATION 
where LOWER(SUBSTR(CITY, -1)) in ('a','e','i','o','u') 
      and LOWER(SUBSTR(CITY, 1,1)) in ('a','e','i','o','u');
```

-   LEFT,RIGHT & IN

``` sql
SELECT DISTINCT CITY
FROM STATION
WHERE LOWER(LEFT(CITY,1)) IN ('a', 'e', 'i', 'o', 'u') AND
      LOWER(RIGHT(CITY,1)) IN ('a', 'e', 'i', 'o', 'u');
```

**2. MS SQL Server**

``` sql
# MS SQL SERVER
SELECT DISTINCT city 
from station 
where city LIKE '[a, e, i, o, u]%[a, e, i, o, u]';
```

## Weather Observation Station 9

*SUBSTRING CONDITION (NEGATE FIRST LETTER)*

Query the list of CITY names from STATION that do not start with vowels.
Your result cannot contain duplicates.

**1. MySQL**

-   RLIKE

``` sql
SELECT DISTINCT(city) 
FROM station 
WHERE city NOT RLIKE '^[aeiou]';
```

| city           |
|:---------------|
| Kissee Mills   |
| Loma Mar       |
| Sandy Hook     |
| Tipton         |
| Turner         |
| Slidell        |
| Negreet        |
| Glencoe        |
| Chelsea        |
| Chignik Lagoon |

Displaying records 1 - 10

-   REGEXP

``` sql
SELECT DISTINCT CITY 
FROM STATION  
WHERE CITY NOT REGEXP '^[aeiou]';
```

-   SUBSTRING & IN

``` sql
SELECT DISTINCT(CITY)
FROM STATION 
WHERE LOWER(SUBSTR(CITY, 1,1)) not in ('a','e','i','o','u');
```

-   LEFT,RIGHT & IN

``` sql
SELECT DISTINCT CITY
FROM STATION
WHERE LOWER(LEFT(CITY,1)) NOT IN ('a', 'e', 'i', 'o', 'u');
```

**2. MS SQL Server**

``` sql
# MS SQL SERVER
SELECT DISTINCT city 
from station 
where city NOT LIKE '[a, e, i, o, u]%';
```

## Weather Observation Station 10

*SUBSTRING CONDITION (NEGATE LAST LETTER)*

Query the list of CITY names from STATION that do not end with vowels.
Your result cannot contain duplicates.

**1. MySQL**

-   RLIKE

``` sql
SELECT DISTINCT(city) 
FROM station 
WHERE city NOT RLIKE '[aeiou]$';
```

| city           |
|:---------------|
| Kissee Mills   |
| Loma Mar       |
| Sandy Hook     |
| Tipton         |
| Arlington      |
| Turner         |
| Slidell        |
| Negreet        |
| Chignik Lagoon |
| Hanna City     |

Displaying records 1 - 10

…

## Weather Observation Station 11

*SUBSTRING CONDITION (NEGATE & OR)*

Query the list of CITY names from STATION that either do not start with
vowels or do not end with vowels. Your result cannot contain duplicates.

``` sql
SELECT DISTINCT(city) 
FROM station 
WHERE city NOT RLIKE '^[aeiou]' OR city NOT RLIKE '[aeiou]$';
```

| city         |
|:-------------|
| Kissee Mills |
| Loma Mar     |
| Sandy Hook   |
| Tipton       |
| Arlington    |
| Turner       |
| Slidell      |
| Negreet      |
| Glencoe      |
| Chelsea      |

Displaying records 1 - 10

…

## Weather Observation Station 12

*SUBSTRING CONDITION (NEGATE & AND)*

Query the list of CITY names from STATION that do not start with vowels
and do not end with vowels. Your result cannot contain duplicates.

``` sql
SELECT DISTINCT(city) 
FROM station 
WHERE city NOT RLIKE '^[aeiou]' AND city NOT RLIKE '[aeiou]$';
```

| city           |
|:---------------|
| Kissee Mills   |
| Loma Mar       |
| Sandy Hook     |
| Tipton         |
| Turner         |
| Slidell        |
| Negreet        |
| Chignik Lagoon |
| Hanna City     |
| Monument       |

Displaying records 1 - 10

# Advanced Select

coming soon …

# Aggregation

coming soon …

# Basic Join

coming soon …

# Advanced Join

coming soon …

# Alternative Queries

coming soon …
