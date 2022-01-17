Introduction to R
================

# 1. Intro to basics

## Arithmetic with R

In its most basic form, R can be used as a simple calculator. Consider
the following arithmetic operators:

-   Addition: `+`
-   Subtraction: `-`
-   Multiplication: `*`
-   Division: `/`
-   Exponentiation: `^`
-   Modulo: `%%`

The last two might need some explaining:

-   The `^` operator raises the number to its left to the power of the
    number to its right: for example `3^2` is 9.
-   The modulo returns the remainder of the division of the number to
    the left by the number on its right, for example 5 modulo 3 or
    `5 %% 3` is 2.

``` r
# An addition
5 + 5 
#> [1] 10

# A subtraction
5 - 5 
#> [1] 0

# A multiplication
3 * 5
#> [1] 15

# A division
(5 + 5) / 2 
#> [1] 5

# Exponentiation
2^5
#> [1] 32

# Modulo
28%%6
#> [1] 4
```

<sup>Created on 2022-01-17 by the [reprex
package](https://reprex.tidyverse.org) (v2.0.1)</sup>

## Variable assignment

A basic concept in (statistical) programming is called a **variable**.

A variable allows you to store a value (e.g. 4) or an object (e.g. a
function description) in R. You can then later use this variable’s name
to easily access the value or the object that is stored within this
variable.

``` r
# Assign the value 42 to x
x <- 42

# Print out the value of the variable x
x
#> [1] 42
```

<sup>Created on 2022-01-17 by the [reprex
package](https://reprex.tidyverse.org) (v2.0.1)</sup>

Suppose you have a fruit basket with five apples. As a data analyst in
training, you want to store the number of apples in a variable with the
name my_apples.

``` r
# Assign the value 5 to the variable my_apples
my_apples <- 5

# Print out the value of the variable my_apples
my_apples
#> [1] 5
```

<sup>Created on 2022-01-17 by the [reprex
package](https://reprex.tidyverse.org) (v2.0.1)</sup>

Every tasty fruit basket needs oranges, so you decide to add six
oranges. As a data analyst, your reflex is to immediately create the
variable my_oranges and assign the value 6 to it. Next, you want to
calculate how many pieces of fruit you have in total. Since you have
given meaningful names to these values, you can now code this in a clear
way:

``` r
# Assign a value to the variables my_apples and my_oranges
my_apples  <- 5
my_oranges <- 6

# Add these two variables together
my_apples + my_oranges
#> [1] 11

# Create the variable my_fruit
my_fruit <- my_apples + my_oranges
```

<sup>Created on 2022-01-17 by the [reprex
package](https://reprex.tidyverse.org) (v2.0.1)</sup>

## Basic data types in R

R works with numerous data types. Some of the most basic types to get
started are:

-   Decimal values like 4.5 are called **numerics**.
-   Whole numbers like 4 are called **integers**. Integers are also
    numerics.
-   Boolean values (TRUE or FALSE) are called **logical**.
-   Text (or string) values are called **characters**.

Note how the quotation marks in the editor indicate that `"some text"`
is a string.

Note that R is case sensitive!

``` r
# Change my_numeric to be 42
my_numeric <- 42

# Change my_character to be "universe"
my_character <- "universe"

# Change my_logical to be FALSE
my_logical <- FALSE
```

What’s that data type?

Do you remember that when you added 5 + “six”, you got an error due to a
mismatch in data types? You can avoid such embarrassing situations by
checking the data type of a variable beforehand. You can do this with
the class() function, as the code in the editor shows.

``` r
# Declare variables of different types
my_numeric <- 42
my_character <- "universe"
my_logical <- FALSE 

# Check class of my_numeric
class(my_numeric)
#> [1] "numeric"

# Check class of my_character
class(my_character)
#> [1] "character"

# Check class of my_logical
class(my_logical)
#> [1] "logical"
```

<sup>Created on 2022-01-17 by the [reprex
package](https://reprex.tidyverse.org) (v2.0.1)</sup>

# 2. Vectors

## Create a vector

On your way from rags to riches, you will make extensive use of vectors.
Vectors are one-dimension arrays that can hold numeric data, character
data, or logical data. In other words, a vector is a simple tool to
store data. For example, you can store your daily gains and losses in
the casinos.

In R, you create a vector with the combine function **`c()`**. You place
the vector elements separated by a comma between the parentheses. For
example:

``` r
numeric_vector   <- c(1, 10, 49)
character_vector <- c("a", "b", "c")
boolean_vector   <- c(TRUE, FALSE, TRUE)
```

Once you have created these vectors in R, you can use them to do
calculations.

After one week in Las Vegas and still zero Ferraris in your garage, you
decide that it is time to start using your data analytical superpowers.

Before doing a first analysis, you decide to first collect all the
winnings and losses for the last week:

For `poker_vector`:

-   On Monday you won $140
-   Tuesday you lost $50
-   Wednesday you won $20
-   Thursday you lost $120
-   Friday you won $240

For `roulette_vector`:

-   On Monday you lost $24
-   Tuesday you lost $50
-   Wednesday you won $100
-   Thursday you lost $350
-   Friday you won $10

You only played poker and roulette, since there was a delegation of
mediums that occupied the craps tables. To be able to use this data in
R, you decide to create the variables `poker_vector` and
`roulette_vector`.

``` r
# Poker winnings from Monday to Friday
poker_vector <- c(140, -50, 20, -120, 240)

# Roulette winnings from Monday to Friday
roulette_vector <-  c(-24, -50, 100, -350, 10)
```

### Naming a vector

As a data analyst, it is important to have a clear view on the data that
you are using. Understanding what each element refers to is therefore
essential.

In the previous exercise, we created a vector with your winnings over
the week. Each vector element refers to a day of the week but it is hard
to tell which element belongs to which day. It would be nice if you
could show that in the vector itself.

You can give a name to the elements of a vector with the names()
function. Have a look at this example:

``` r
# Poker winnings from Monday to Friday
poker_vector <- c(140, -50, 20, -120, 240)

# Roulette winnings from Monday to Friday
roulette_vector <- c(-24, -50, 100, -350, 10)

# Assign days as names of poker_vector
names(poker_vector) <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")

# Assign days as names of roulette_vectors
names(roulette_vector) <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
```

This code first creates the vectors `poker_vector` & `roulette_vector`
and then gives the five elements a name. The first element is assigned
the name `Monday`, while the second element is labeled `Tuesday` (and so
on …).

If you want to become a good statistician, you have to become lazy. (If
you are already lazy, chances are high you are one of those exceptional,
natural-born statistical talents.)

In the previous exercises you probably experienced that it is boring and
frustrating to type and retype information such as the days of the week.
However, when you look at it from a higher perspective, there is a more
efficient way to do this, namely, to assign the days of the week vector
to a variable!

Just like you did with your poker and roulette returns, you can also
create a variable that contains the days of the week. This way you can
use and re-use it.

``` r
# Poker winnings from Monday to Friday
poker_vector <- c(140, -50, 20, -120, 240)

# Roulette winnings from Monday to Friday
roulette_vector <- c(-24, -50, 100, -350, 10)

# The variable days_vector
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
 
# Assign the names of the day to roulette_vector and poker_vector
names(poker_vector)    <- days_vector 
names(roulette_vector) <- days_vector
```

### Calculating total winnings

# 3. Matrices

# 4. Factors

# 5. Data frames

# 6. Lists
