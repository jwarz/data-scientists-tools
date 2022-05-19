Hackerrank SQL
================
Joschka Schwarz

-   [Create User](#create-user)
-   [Create database](#create-database)
-   [Create table](#create-table)
-   [Basic Select](#basic-select)
    -   [Revising the Select Query I](#revising-the-select-query-i)
    -   [Revising the Select Query II](#revising-the-select-query-ii)
    -   [Select All](#select-all)
    -   [Select BY ID](#select-by-id)
    -   [Japanese Cities’ Attributes](#japanese-cities-attributes)
    -   [Japanese Cities’ Names](#japanese-cities-names)
    -   [Weather Observation Station 1](#weather-observation-station-1)
    -   [Weather Observation Station 2](#weather-observation-station-2)
    -   [Weather Observation Station 3](#weather-observation-station-3)
    -   [Weather Observation Station 4](#weather-observation-station-4)
    -   [Weather Observation Station 5](#weather-observation-station-5)
    -   [Weather Observation Station 6](#weather-observation-station-6)
    -   [Weather Observation Station 7](#weather-observation-station-7)
    -   [Weather Observation Station 8](#weather-observation-station-8)
    -   [Weather Observation Station 9](#weather-observation-station-9)
    -   [Weather Observation Station
        10](#weather-observation-station-10)
    -   [Weather Observation Station
        11](#weather-observation-station-11)

# Create User

``` sql
CREATE USER 'jwarz'@localhost IDENTIFIED BY '***';
GRANT ALL PRIVILEGES ON *.* TO 'jwarz'@localhost IDENTIFIED BY '***';
# GRANT ALL PRIVILEGES ON 'DBname'.* TO 'jwarz'@localhost; 
```

# Create database

``` sql
DROP DATABASE IF EXISTS hackerrank_cities;
CREATE DATABASE hackerrank_cities;
USE hackerrank_cities;
```

# Create table

``` sql
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
```

# Basic Select

## Revising the Select Query I

The CITY table is described as follows:

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

Create new table

``` sql
create table city2
(
    ID int primary key,
    NAME varchar(17),
    COUNTRYCODE varchar(3),
    DISTRICT varchar(20),
    POPULATION int
);

insert into city2 values (6,"Rotterdam","NLD", "Zuid-Holland",593321);
insert into city2 values (19,"Zaanstad", "NLD", "Noord-Holland",135621);
insert into city2 values (214,"Porto Alegre","BRA", "Rio Grande do Sul",1314032);
insert into city2 values (397,"Lauro de Freitas", "BRA","Bahia",109236);
insert into city2 values (547,"Dobric", "BGR","Varna",100399);
insert into city2 values (552,"Bujumbura", "BDI","Bujumbura",300000);
insert into city2 values (554,"Santiago de Chile", "CHL","Santiago",4703954);
insert into city2 values (626, "al-Minya","EGY", "al-Minya",201360);
insert into city2 values (646,"Santa Ana", "SLV","Santa Ana",139389);
insert into city2 values (762,"Bahir Dar", "ETH","Amhara",96140);
insert into city2 values (796,"Baguio", "PHL","CAR",252386);
insert into city2 values (896,"Malungon", "PHL","Southern Mindanao",93232);
insert into city2 values (904,"Banjul", "GMB","Banjul",42326);
insert into city2 values (924,"Villa Nueva", "GTM","Guatemala",101295);
insert into city2 values (990,"Waru", "IDN","East Java",124300);
insert into city2 values (1155,"Latur", "IND","Maharashtra",197408);
insert into city2 values (1222,"Tenali", "IND","Andhra Pradesh",143726);
insert into city2 values (1235,"Tirunelveli", "IND","Tamil Nadu",135825);
insert into city2 values (1256,"Alandur", "IND","Tamil Nadu",125244);
insert into city2 values (1279,"Neyveli", "IND","Tamil Nadu",118080);
insert into city2 values (1293,"Pallavaram", "IND","Tamil Nadu",111866);
insert into city2 values (1350,"Dehri", "IND","Bihar",94526);
insert into city2 values (1383,"Tabriz", "IRN","East Azerbaidzan",1191043);
insert into city2 values (1385,"Karaj", "IRN","Teheran",940968);
insert into city2 values (1508,"Bolzano", "ITA", "Trentino-Alto Adige",97232);
insert into city2 values (1520,"Cesena", "ITA", "Emilia-Romagna",89852);
insert into city2 values (1613,"Neyagawa", "JPN","Osaka",257315);
insert into city2 values (1630,"Ageo", "JPN","Saitama",209442);
insert into city2 values (1661,"Sayama", "JPN","Saitama",162472);
insert into city2 values (1681,"Omuta", "JPN","Fukuoka",142889);
insert into city2 values (1739,"Tokuyama", "JPN","Yamaguchi",107078);
insert into city2 values (1793,"Novi Sad","YUG", "Vojvodina",179626);
insert into city2 values (1857,"Kelowna", "CAN","British Colombia",89442);
insert into city2 values (1895,"Harbin", "CHN","Heilongjiang",4289800);
insert into city2 values (1900,"Changchun", "CHN","Jilin",2812000);
insert into city2 values (1913,"Lanzhou", "CHN","Gansu",1565800);
insert into city2 values (1947,"Changzhou", "CHN","Jiangsu",530000);
insert into city2 values (2070,"Dezhou", "CHN","Shandong",195485);
insert into city2 values (2081,"Heze", "CHN","Shandong",189293);
insert into city2 values (2111,"Chenzhou", "CHN","Hunan",169400);
insert into city2 values (2153,"Xianning", "CHN","Hubei",136811);
insert into city2 values (2192,"Lhasa", "CHN","Tibet",120000);
insert into city2 values (2193,"Lianyuan", "CHN","Hunan",118858);
insert into city2 values (2227,"Xingcheng", "CHN","Liaoning",102384);
insert into city2 values (2273,"Villavicencio", "COL","Meta",273140);
insert into city2 values (2384, "Tong-yong","KOR", "Kyongsangnam",131717);
insert into city2 values (2386,"Yongju", "KOR","Kyongsangbuk",131097);
insert into city2 values (2387,"Chinhae", "KOR","Kyongsangnam",125997);
insert into city2 values (2388,"Sangju", "KOR","Kyongsangbuk",124116);
insert into city2 values (2406,"Herakleion", "GRC","Crete",116178);
insert into city2 values (2440,"Monrovia", "LBR","Montserrado",850000);
insert into city2 values (2462,"Lilongwe", "MWI","Lilongwe",435964);
insert into city2 values (2505,"Taza", "MAR", "Taza-Al Hoceima-Taou",92700);
insert into city2 values (2555,"Xalapa", "MEX","Veracruz",390058);
insert into city2 values (2602,"Ocosingo", "MEX","Chiapas",171495);
insert into city2 values (2609,"Nogales", "MEX","Sonora",159103);
insert into city2 values (2670,"San Pedro Cholula", "MEX","Puebla",99734);
insert into city2 values (2689,"Palikir", "FSM","Pohnpei",8600);
insert into city2 values (2706,"Tete", "MOZ","Tete",101984);
insert into city2 values (2716, "Sittwe (Akyab)","MMR", "Rakhine",137600);
insert into city2 values (2922,"Carolina", "PRI","Carolina",186076);
insert into city2 values (2967,"Grudziadz", "POL", "Kujawsko-Pomorskie",102434);
insert into city2 values (2972,"Malabo", "GNQ","Bioko",40000);
insert into city2 values (3073,"Essen", "DEU", "Nordrhein-Westfalen",599515);
insert into city2 values (3169,"Apia", "WSM","Upolu",35900);
insert into city2 values (3198,"Dakar", "SEN", "Cap-Vert",785071);
insert into city2 values (3253,"Hama", "SYR","Hama",343361);
insert into city2 values (3288,"Luchou", "TWN","Taipei",160516);
insert into city2 values (3309,"Tanga", "TZA","Tanga",137400);
insert into city2 values (3353,"Sousse", "TUN","Sousse",145900);
insert into city2 values (3377,"Kahramanmaras", "TUR","Kahramanmaras",245772);
insert into city2 values (3430,"Odesa", "UKR","Odesa",1011000);
insert into city2 values (3581,"St Petersburg", "RUS","Pietari",4694000);
insert into city2 values (3770,"Hanoi", "VNM","Hanoi",1410000);
insert into city2 values (3815,"El Paso", "USA","Texas",563662);
insert into city2 values (3878,"Scottsdale", "USA","Arizona",202705);
insert into city2 values (3965,"Corona", "USA","California",124966);
insert into city2 values (3973,"Concord", "USA","California",121780);
insert into city2 values (3977,"Cedar Rapids", "USA","Iowa",120758);
insert into city2 values (3982,"Coral Springs", "USA","Florida",117549);
insert into city2 values (4054,"Fairfield", "USA","California",92256);
insert into city2 values (4058,"Boulder", "USA","Colorado",91238);
insert into city2 values (4061,"Fall River", "USA","Massachusetts",90555);
```

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

## Weather Observation Station 1

New table:

### Create database

``` sql
DROP DATABASE IF EXISTS hackerrank_station;
CREATE DATABASE hackerrank_station;
USE hackerrank_station;
```

``` sql
create table STATION
(
    ID int,
    CITY varchar(21),
    STATE varchar(2),
    LAT_N decimal(10,0),
    LONG_W decimal(10,0)
);
LOAD DATA LOCAL INFILE "/Users/jschwarz/03_repos/data-scientists-tools/10_hackerrank/01_sql/data/STATION.csv" INTO TABLE STATION
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
```

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

Query a list of CITY and STATE from the STATION table.

``` sql
SELECT CITY, STATE FROM STATION;
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

??? Does not exist ???

## Weather Observation Station 3

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

Query the list of CITY names starting with vowels (i.e., a, e, i, o, or
u) from STATION. Your result cannot contain duplicates.

1.  MS SQL Server

````` sql
# MS SQL SERVER
SELECT DISTINCT city 
from station 
where city LIKE '[a, e, i, o, u]%';
````

2. MySQL (RLIKE)
`````

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

3.  MySQL (REGEXP)

``` sql
SELECT DISTINCT CITY 
FROM STATION  
WHERE CITY REGEXP '^[aeiou]';
```

| CITY       |
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

4.  MySQL (SUBSTRING & IN)

``` sql
SELECT DISTINCT(CITY)
FROM STATION 
WHERE LOWER(SUBSTR(CITY, 1,1)) in ('a','e','i','o','u');
```

| CITY       |
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

5.  MySQL (LEFT,RIGHT & IN)

``` sql
SELECT DISTINCT CITY
FROM STATION
WHERE LOWER(LEFT(CITY,1)) IN ('a', 'e', 'i', 'o', 'u');
```

| CITY       |
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

## Weather Observation Station 7

Query the list of CITY names ending with vowels (a, e, i, o, u) from
STATION. Your result cannot contain duplicates.

1.  MS SQL Server

````` sql
# MS SQL SERVER
SELECT DISTINCT city 
from station 
where city LIKE '%[a, e, i, o, u]';
````

2. MySQL (RLIKE)
`````

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

3.  MySQL (REGEXP)

``` sql
SELECT DISTINCT CITY 
FROM STATION  
WHERE CITY REGEXP '[aeiou]$';
```

| CITY        |
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

4.  MySQL (SUBSTRING & IN)

``` sql
select distinct(CITY) from STATION 
where LOWER(SUBSTR(CITY, -1)) in ('a','e','i','o','u');
```

| CITY        |
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

5.  MySQL (LEFT,RIGHT & IN)

``` sql
SELECT DISTINCT CITY
FROM STATION
WHERE LOWER(RIGHT(CITY,1)) IN ('a', 'e', 'i', 'o', 'u');
```

| CITY        |
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

## Weather Observation Station 8

Query the list of CITY names from STATION which have vowels (i.e., a, e,
i, o, and u) as both their first and last characters. Your result cannot
contain duplicates.

1.  MS SQL Server

````` sql
# MS SQL SERVER
SELECT DISTINCT city 
from station 
where city LIKE '[a, e, i, o, u]%[a, e, i, o, u]';
````

2. MySQL (RLIKE)
`````

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

3.  MySQL (REGEXP)

``` sql
SELECT DISTINCT CITY 
FROM STATION  
WHERE CITY REGEXP '^[aeiou]' AND CITY REGEXP '[aeiou]$';
```

| CITY          |
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

4.  MySQL (SUBSTRING & IN)

``` sql
select distinct(CITY) from STATION 
where LOWER(SUBSTR(CITY, -1)) in ('a','e','i','o','u') 
      and LOWER(SUBSTR(CITY, 1,1)) in ('a','e','i','o','u');
```

| CITY          |
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

5.  MySQL (LEFT,RIGHT & IN)

``` sql
SELECT DISTINCT CITY
FROM STATION
WHERE LOWER(LEFT(CITY,1)) IN ('a', 'e', 'i', 'o', 'u') AND
      LOWER(RIGHT(CITY,1)) IN ('a', 'e', 'i', 'o', 'u');
```

| CITY          |
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

## Weather Observation Station 9

## Weather Observation Station 10

## Weather Observation Station 11
