Introduction to R
================

# 1. Intro to basics

## How it works

In the console at the bottom you should type R code to solve the
exercises. When you hit the `Enter` button, every line of code is
interpreted and executed by R and you get a message whether or not your
code was correct. The output of your R code is shown in the console
below.

R makes use of the `#` sign to add comments, so that you and others can
understand what the R code is about. Just like Twitter! Comments are not
run as R code, so they will not influence your result.

You can also execute R commands straight in the console. This is a good
way to experiment with R code.

**Instructions:**

-   Below is already some sample code. Can you see which lines are
    actual R code and which are comments?
-   Add a line of code that calculates the sum of 6 and 12.

``` r
# Sample: Calculate 3 + 4
3 + 4
#> [1] 7

# Instruction: Calculate 6 + 12
6 + 12
#> [1] 18
```

<sup>Created on 2022-01-17 by the [reprex
package](https://reprex.tidyverse.org) (v2.0.1)</sup>

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

**Instructions:**

-   Type `2^5` in the editor to calculate 2 to the power 5.
-   Type `28 %% 6` to calculate 28 modulo 6.
-   Run the code and have a look at the R output in the console.
-   Note how the `#` symbol is used to add comments on the R code.

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

**Instructions:**

Complete the code in the editor such that it assigns the value 42 to the
variable `x` in the editor. Submit the answer. Notice that when you ask
R to print `x`, the value 42 appears.

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

**Instructions:**

-   Type the following code in the editor: `my_apples <- 5`. This will
    assign the value 5 to my_apples.
-   Type: `my_apples` below the second comment. This will print out the
    value of `my_apples.`
-   Submit your answer, and look at the output: you see that the number
    5 is printed. So R now links the variable `my_apples` to the value
    5.

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

**Instructions:**

-   Assign to `my_oranges` the value 6.
-   Add the variables `my_apples` and `my_oranges` and have R simply
    print the result.
-   Assign the result of adding `my_apples` and `my_oranges` to a new
    variable my_fruit.

``` r
# Assign a value to the variables my_apples and my_oranges
my_apples  <- 5
my_oranges <- 6
# my_oranges <- "six" Does not work

# Add these two variables together
my_apples + my_oranges
#> [1] 11

# Create the variable my_fruit
my_fruit <- my_apples + my_oranges
```

<sup>Created on 2022-01-17 by the [reprex
package](https://reprex.tidyverse.org) (v2.0.1)</sup>

Common knowledge tells you not to add apples and oranges. But hey, that
is what you just did, no :-)? The `my_apples` and `my_oranges` variables
both contained a number in the previous exercise. The `+` operator works
with numeric variables in R. If you really tried to add “apples” and
“oranges”, and assigned a text value to the variable `my_oranges`, you
would be trying to assign the addition of a numeric and a character
variable to the variable `my_fruit.` This is not possible.

**Instructions:**

-   Submit the wrong answer and read the error message. Make sure to
    understand why this did not work.

## Basic data types in R

R works with numerous data types. Some of the most basic types to get
started are:

-   Decimal values like 4.5 are called **numerics**.
-   Whole numbers like 4 are called **integers**. Integers are also
    numerics.
-   Boolean values (TRUE or FALSE) are called **logical**.
-   Text (or string) values are called **characters**.

Note how the quotation marks in the editor indicate that `"some text"`
is a string. Note that R is case sensitive!

``` r
# Create my_numeric and set it to 42
my_numeric   <- 42

# Create my_character and set it to "universe"
my_character <- "universe"

# Create my_logical and set it to FALSE
my_logical   <- FALSE
```

## What’s that data type?

Do you remember that when you added 5 + “six”, you got an error due to a
mismatch in data types? You can avoid such embarrassing situations by
checking the data type of a variable beforehand. You can do this with
the class() function, as the code in the editor shows.

**Instructions:**

-   Print out the classes of `my_character` and `my_logical`.

``` r
# Declare variables of different types
my_numeric   <- 42
my_character <- "universe"
my_logical   <- FALSE 

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

Feeling lucky? You better, because this chapter takes you on a trip to
the City of Sins, also known as Statisticians Paradise!

Thanks to R and your new data-analytical skills, you will learn how to
uplift your performance at the tables and fire off your career as a
professional gambler. This chapter will show how you can easily keep
track of your betting progress and how you can do some simple analyses
on past actions. Next stop, Vegas Baby… VEGAS!!

On your way from rags to riches, you will make extensive use of vectors.
Vectors are one-dimension arrays that can hold numeric data, character
data, or logical data. In other words, a vector is a simple tool to
store data. For example, you can store your daily gains and losses in
the casinos.

In R, you create a vector with the combine function **`c()`**. You place
the vector elements separated by a comma between the parentheses.

**Instructions:**

-   Write code such that `boolean_vector` contains the three elements:
    `TRUE`, `FALSE` and `TRUE` (in that order).

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

**Instructions:**

-   Assign the winnings/losses for roulette to the variable
    `roulette_vector`. You lost $24, then lost $50, won $100, lost $350,
    and won $10.

``` r
# Poker winnings from Monday to Friday
poker_vector    <- c(140, -50, 20, -120, 240)

# Roulette winnings from Monday to Friday
roulette_vector <- c(-24, -50, 100, -350, 10)
```

## Naming a vector

As a data analyst, it is important to have a clear view on the data that
you are using. Understanding what each element refers to is therefore
essential.

In the previous exercise, we created a vector with your winnings over
the week. Each vector element refers to a day of the week but it is hard
to tell which element belongs to which day. It would be nice if you
could show that in the vector itself.

You can give a name to the elements of a vector with the `names()`
function. Have a look at this example:

``` r
some_vector        <- c("John Doe", "poker player")
names(some_vector) <- c("Name", "Profession")
```

This code first creates a vector `some_vector` and then gives the two
elements a name. The first element is assigned the name `Name`, while
the second element is labeled `Profession`. Printing the contents to the
console yields following output:

``` r
some_vector
#>           Name     Profession 
#>     "John Doe" "poker player"
```

<sup>Created on 2022-01-17 by the [reprex
package](https://reprex.tidyverse.org) (v2.0.1)</sup>

**Instructions:**

-   The code in the editor names the elements in `poker_vector` with the
    days of the week. Add code to do the same thing for
    `roulette_vector`.

``` r
# Assign days as names of poker_vector
names(poker_vector)    <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")

# Assign days as names of roulette_vectors
names(roulette_vector) <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
```

If you want to become a good statistician, you have to become lazy. (If
you are already lazy, chances are high you are one of those exceptional,
natural-born statistical talents.)

In the previous exercises you probably experienced that it is boring and
frustrating to type and retype information such as the days of the week.
However, when you look at it from a higher perspective, there is a more
efficient way to do this, namely, to assign the days of the week vector
to a **variable**!

Just like you did with your poker and roulette returns, you can also
create a variable that contains the days of the week. This way you can
use and re-use it.

**Instructions:**

-   A variable `days_vector` that contains the days of the week has
    already been created for you.
-   Use `days_vector` to set the names of `poker_vector` and
    `roulette_vector`.

``` r
# The variable days_vector
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
 
# Assign the names of the day to roulette_vector and poker_vector
names(poker_vector)    <- days_vector 
names(roulette_vector) <- days_vector
```

## Calculating total winnings

Now that you have the poker and roulette winnings nicely as named
vectors, you can start doing some data analytical magic.

You want to find out the following type of information:

-   How much has been your overall profit or loss per day of the week?
-   Have you lost money over the week in total?
-   Are you winning/losing money on poker or on roulette?

To get the answers, you have to do arithmetic calculations on vectors.

It is important to know that if you sum two vectors in R, it takes the
element-wise sum. For example, the following three statements are
completely equivalent:

``` r
c(1, 2, 3) + c(4, 5, 6)
c(1 + 4, 2 + 5, 3 + 6)
c(5, 7, 9)
```

You can also do the calculations with variables that represent vectors:

``` r
a <- c(1, 2, 3) 
b <- c(4, 5, 6)
c <- a + b
```

**Instructions:**

-   Take the sum of the variables `A_vector` and `B_vector` and assign
    it to `total_vector`.
-   Inspect the result by printing out `total_vector`.

``` r
A_vector <- c(1, 2, 3)
B_vector <- c(4, 5, 6)

# Take the sum of A_vector and B_vector
total_vector <- A_vector + B_vector
  
# Print out total_vector
total_vector
#> [1] 5 7 9
```

<sup>Created on 2022-01-17 by the [reprex
package](https://reprex.tidyverse.org) (v2.0.1)</sup>

Now you understand how R does arithmetic with vectors, it is time to get
those Ferraris in your garage! First, you need to understand what the
overall profit or loss per day of the week was. The total daily profit
is the sum of the profit/loss you realized on poker per day, and the
profit/loss you realized on roulette per day.

In R, this is just the sum of `roulette_vector` and `poker_vector`.

**Instructions:**

-   Assign to the variable total_daily how much you won or lost on each
    day in total (poker and roulette combined).

``` r
# Assign to total_daily how much you won/lost on each day
total_daily            <- poker_vector + roulette_vector
```

Based on the previous analysis, it looks like you had a mix of good and
bad days. This is not what your ego expected, and you wonder if there
may be a very tiny chance you have lost money over the week in total?

A function that helps you to answer this question is `**sum()**`. It
calculates the sum of all elements of a vector. For example, to
calculate the total amount of money you have lost/won with poker you do:

``` r
total_poker <- sum(poker_vector)
```

**Instructions:**

-   Calculate the total amount of money that you have won/lost with
    roulette and assign to the variable `total_roulette`.
-   Now that you have the totals for roulette and poker, you can easily
    calculate `total_week` (which is the sum of all gains and losses of
    the week).
-   Print out `total_week`.

``` r
# Total winnings with poker
total_poker    <- sum(poker_vector)

# Total winnings with roulette
total_roulette <- sum(roulette_vector) 

# Total winnings overall
total_week <- total_roulette + total_poker

# Print out total_week
total_week
```

    ## [1] -84

### Comparing total winnings

Oops, it seems like you are losing money. Time to rethink and adapt your
strategy! This will require some deeper analysis…

After a short brainstorm in your hotel’s jacuzzi, you realize that a
possible explanation might be that your skills in roulette are not as
well developed as your skills in poker. So maybe your total gains in
poker are higher (or `>` ) than in roulette.

**Instructions:**

-   Calculate `total_poker` and `total_roulette` as in the previous
    exercise. Use the `sum()` function twice.
-   Check if your total gains in poker are higher than for roulette by
    using a comparison. Simply print out the result of this comparison.
    What do you conclude, should you focus on roulette or on poker?

``` r
# Check if you realized higher total gains in poker than in roulette 
total_poker > total_roulette
```

    ## [1] TRUE

### Vector selection: the good times

Your hunch seemed to be right. It appears that the poker game is more
your cup of tea than roulette.

Another possible route for investigation is your performance at the
beginning of the working week compared to the end of it. You did have a
couple of Margarita cocktails at the end of the week…

To answer that question, you only want to focus on a selection of the
`total_vector.` In other words, our goal is to select specific elements
of the vector. To select elements of a vector (and later matrices, data
frames, …), you can use square brackets. Between the square brackets,
you indicate what elements to select. For example, to select the first
element of the vector, you type `poker_vector[1]`. To select the second
element of the vector, you type `poker_vector[2]`, etc. Notice that the
first element in a vector has index 1, not 0 as in many other
programming languages.

**Instructions:**

-   Assign the poker results of Wednesday to the variable
    `poker_wednesday`.

``` r
# Define a new variable based on a selection
poker_wednesday <- poker_vector[3]
```

How about analyzing your midweek results?

To select multiple elements from a vector, you can add square brackets
at the end of it. You can indicate between the brackets what elements
should be selected. For example: suppose you want to select the first
and the fifth day of the week: use the vector c(1, 5) between the square
brackets. For example, the code below selects the first and fifth
element of poker_vector:

``` r
poker_vector[c(1, 5)]
```

**Instructions:**

-   Assign the poker results of Tuesday, Wednesday and Thursday to the
    variable `poker_midweek`.

``` r
# Define a new variable based on a selection
poker_midweek <- poker_vector[c(2,3,4)]
```

Selecting multiple elements of `poker_vector` with `c(2, 3, 4)` is not
very convenient. Many statisticians are lazy people by nature, so they
created an easier way to do this: `c(2, 3, 4)` can be abbreviated to
`2:4`, which generates a vector with all natural numbers from 2 up to 4.

So, another way to find the mid-week results is `poker_vector[2:4]`.
Notice how the vector 2:4 is placed between the square brackets to
select element 2 up to 4.

**Instructions:**

-   Assign to `roulette_selection_vector` the roulette results from
    Tuesday up to Friday; make use of : if it makes things easier for
    you.

``` r
# Define a new variable based on a selection
roulette_selection_vector <- roulette_vector[2:5]
```

Another way to tackle the previous exercise is by using the names of the
vector elements (Monday, Tuesday, …) instead of their numeric positions.
For example,

``` r
poker_vector["Monday"]
```

    ## Monday 
    ##    140

will select the first element of poker_vector since “Monday” is the name
of that first element.

Just like you did in the previous exercise with numerics, you can also
use the element names to select multiple elements, for example:

``` r
poker_vector[c("Monday","Tuesday")]
```

**Instructions:**

-   Select the first three elements in `poker_vector` by using their
    names: `"Monday"`, `"Tuesday"` and `"Wednesday"`. Assign the result
    of the selection to `poker_start`.
-   Calculate the average of the values in `poker_start` with the
    `**mean()**` function. Simply print out the result so you can
    inspect it.

``` r
# Select poker results for Monday, Tuesday and Wednesday
poker_start <- poker_vector[c("Monday", "Tuesday", "Wednesday")]
  
# Calculate the average of the elements in poker_start
mean(poker_start)
```

    ## [1] 36.66667

## Selection by comparison

### Step 1

By making use of comparison operators, we can approach the previous
question in a more proactive way.

The (logical) comparison operators known to R are:

-   `<` for less than
-   `>` for greater than
-   `<=` for less than or equal to
-   `>=` for greater than or equal to
-   `==` for equal to each other
-   `!=` not equal to each other

As seen in the previous chapter, stating `6 > 5` returns `TRUE`. The
nice thing about R is that you can use these comparison operators also
on vectors. For example:

``` r
c(4, 5, 6) > 5
#> [1] FALSE FALSE  TRUE
```

<sup>Created on 2022-01-17 by the [reprex
package](https://reprex.tidyverse.org) (v2.0.1)</sup>

**Instructions:**

-   Check which elements in `poker_vector` are positive (i.e. > 0) and
    assign this to `selection_vector`.
-   Print out `selection_vector` so you can inspect it. The printout
    tells you whether you won (`TRUE`) or lost (`FALSE`) any money for
    each day.

``` r
# Which days did you make money on poker?
selection_vector <- poker_vector > 0
  
# Print out selection_vector
selection_vector
```

    ##    Monday   Tuesday Wednesday  Thursday    Friday 
    ##      TRUE     FALSE      TRUE     FALSE      TRUE

### Step 2

Working with comparisons will make your data analytical life easier.
Instead of selecting a subset of days to investigate yourself (like
before), you can simply ask R to return only those days where you
realized a positive return for poker.

In the previous exercises you used
`selection_vector <- poker_vector > 0` to find the days on which you had
a positive poker return. Now, you would like to know not only the days
on which you won, but also how much you won on those days.

You can select the desired elements, by putting `selection_vector`
between the square brackets that follow `poker_vector`:

``` r
poker_vector[selection_vector]
```

R knows what to do when you pass a logical vector in square brackets: it
will only select the elements that correspond to TRUE in
selection_vector.

**Instructions:**

-   Use `selection_vector` in square brackets to assign the amounts that
    you won on the profitable days to the variable `poker_winning_days`.

``` r
# Select from poker_vector these days
poker_winning_days <- poker_vector[selection_vector]
poker_winning_days
```

    ##    Monday Wednesday    Friday 
    ##       140        20       240

### Advanced selection

Just like you did for poker, you also want to know those days where you
realized a positive return for roulette.

**Instructions:**

-   Create the variable selection_vector, this time to see if you made
    profit with roulette for different days.
-   Assign the amounts that you made on the days that you ended
    positively for roulette to the variable `roulette_winning_days`.
    This vector thus contains the positive winnings of
    `roulette_vector`.

``` r
# Which days did you make money on roulette?
selection_vector <- roulette_vector > 0

# Select from roulette_vector these days
roulette_winning_days <- roulette_vector[selection_vector]
roulette_winning_days
```

    ## Wednesday    Friday 
    ##       100        10

# 3. Matrices

## What’s a matrix?

In R, a matrix is a collection of elements of the same data type
(numeric, character, or logical) arranged into a fixed number of rows
and columns. Since you are only working with rows and columns, a matrix
is called two-dimensional.

You can construct a matrix in R with the **`matrix()`** function.
Consider the following example:

``` r
matrix(1:9, byrow = TRUE, nrow = 3)
```

In the **`matrix()`** function:

-   The first argument is the collection of elements that R will arrange
    into the rows and columns of the matrix. Here, we use `1:9` which is
    a shortcut for `c(1, 2, 3, 4, 5, 6, 7, 8, 9)`.
-   The argument `byrow` indicates that the matrix is filled by the
    rows. If we want the matrix to be filled by the columns, we just
    place `byrow = FALSE`.
-   The third argument `nrow` indicates that the matrix should have
    three rows.

**Instructions:**

-   Construct a matrix with 3 rows containing the numbers 1 up to 9,
    filled row-wise.

``` r
# Construct a matrix with 3 rows that contain the numbers 1 up to 9
matrix(1:9, byrow = TRUE, nrow = 3)
```

    ##      [,1] [,2] [,3]
    ## [1,]    1    2    3
    ## [2,]    4    5    6
    ## [3,]    7    8    9

## Analyze matrices, you shall

It is now time to get your hands dirty. In the following exercises you
will analyze the box office numbers of the Star Wars franchise. May the
force be with you!

In the editor, three vectors are defined. Each one represents the box
office numbers from the first three Star Wars movies. The first element
of each vector indicates the US box office revenue, the second element
refers to the Non-US box office (source: Wikipedia).

In this exercise, you’ll combine all these figures into a single vector.
Next, you’ll build a matrix from this vector.

**Instructions:**

-   Use `c(new_hope, empire_strikes, return_jedi)` to combine the three
    vectors into one vector. Call this vector `box_office`.
-   Construct a matrix with 3 rows, where each row represents a movie.
    Use the `matrix()` function to do this. The first argument is the
    vector `box_office`, containing all box office figures. Next, you’ll
    have to specify `nrow = 3` and `byrow = TRUE`. Name the resulting
    matrix `star_wars_matrix`.

``` r
# Box office Star Wars (in millions!)
new_hope       <- c(460.998, 314.4)
empire_strikes <- c(290.475, 247.900)
return_jedi    <- c(309.306, 165.8)

# Create box_office
box_office <- c(new_hope, empire_strikes, return_jedi)

# Construct star_wars_matrix
star_wars_matrix <- matrix(box_office, byrow=TRUE, nrow=3)
star_wars_matrix
```

    ##         [,1]  [,2]
    ## [1,] 460.998 314.4
    ## [2,] 290.475 247.9
    ## [3,] 309.306 165.8

## Naming a matrix

To help you remember what is stored in `star_wars_matrix`, you would
like to add the names of the movies for the rows. Not only does this
help you to read the data, but it is also useful to select certain
elements from the matrix.

Similar to vectors, you can add names for the rows and the columns of a
matrix

``` r
rownames(my_matrix) <- row_names_vector
colnames(my_matrix) <- col_names_vector
```

We went ahead and prepared two vectors for you: `region`, and `titles.`
You will need these vectors to name the columns and rows of
`star_wars_matrix`, respectively.

**Instructions:**

-   Use `colnames()` to name the columns of star_wars_matrix with the
    region vector.
-   Use `rownames()` to name the rows of star_wars_matrix with the
    titles vector.
-   Print out `star_wars_matrix` to see the result of your work.

``` r
# Vectors region and titles, used for naming
region <- c("US", "non-US")
titles <- c("A New Hope", "The Empire Strikes Back", "Return of the Jedi")

# Name the columns with region
colnames(star_wars_matrix) <- region

# Name the rows with titles
rownames(star_wars_matrix) <- titles

# Print out star_wars_matrix
star_wars_matrix
```

    ##                              US non-US
    ## A New Hope              460.998  314.4
    ## The Empire Strikes Back 290.475  247.9
    ## Return of the Jedi      309.306  165.8

## Calculating the worldwide box office

The single most important thing for a movie in order to become an
instant legend in Tinseltown is its worldwide box office figures.

To calculate the total box office revenue for the three Star Wars
movies, you have to take the sum of the US revenue column and the non-US
revenue column.

In R, the function **`rowSums()`** conveniently calculates the totals
for each row of a matrix. This function creates a new vector:

``` r
rowSums(my_matrix)
```

**Instructions:**

-   Calculate the worldwide box office figures for the three movies and
    put these in the vector named `worldwide_vector`.

``` r
# Calculate worldwide box office figures
worldwide_vector <- rowSums(star_wars_matrix)
worldwide_vector
```

    ##              A New Hope The Empire Strikes Back      Return of the Jedi 
    ##                 775.398                 538.375                 475.106

## Adding a column for the Worldwide box office

In the previous exercise you calculated the vector that contained the
worldwide box office receipt for each of the three Star Wars movies.
However, this vector is not yet part of `star_wars_matrix`.

You can add a column or multiple columns to a matrix with the
**`cbind()`** function, which merges matrices and/or vectors together by
column. For example:

``` r
big_matrix <- cbind(matrix1, matrix2, vector1, ...)
```

**Instructions:**

-   Add `worldwide_vector` as a new column to the `star_wars_matrix` and
    assign the result to `all_wars_matrix`. Use the **`cbind()`**
    function.

``` r
# Bind the new variable worldwide_vector as a column to star_wars_matrix
all_wars_matrix <- cbind(star_wars_matrix, worldwide_vector)
all_wars_matrix
```

    ##                              US non-US worldwide_vector
    ## A New Hope              460.998  314.4          775.398
    ## The Empire Strikes Back 290.475  247.9          538.375
    ## Return of the Jedi      309.306  165.8          475.106

## Adding a row

Just like every action has a reaction, every **`cbind()`** has an
`**rbind()**`. (We admit, we are pretty bad with metaphors.)

Your R workspace, where all variables you defined ‘live’ ([check out
what a workspace
is](https://www.statmethods.net/interface/workspace.html)), has already
been initialized and contains two matrices:

-   `star_wars_matrix` that we have used all along, with data on the
    original trilogy,
-   `star_wars_matrix2`, with similar data for the prequels trilogy.

Explore these matrices in the console if you want to have a closer look.
If you want to check out the contents of the workspace, you can type
`ls()` in the console.

**Instructions:**

-   Use `rbind()` to paste together `star_wars_matrix` and
    `star_wars_matrix2`, in this order. Assign the resulting matrix to
    `all_wars_matrix`.

``` r
# star_wars_matrix and star_wars_matrix2 are available in your workspace
box_office2       <- c(474.5, 552.5, 310.7, 338.7, 380.3, 468.5)
star_wars_matrix2 <- matrix(box_office2, nrow = 3, byrow = TRUE,
                           dimnames = list(c("The Phantom Menace", "Attack of the Clones", "Revenge of the Sith"), 
                                           c("US", "non-US")))

# Combine both Star Wars trilogies in one matrix
all_wars_matrix <- rbind(star_wars_matrix, star_wars_matrix2)
all_wars_matrix
```

    ##                              US non-US
    ## A New Hope              460.998  314.4
    ## The Empire Strikes Back 290.475  247.9
    ## Return of the Jedi      309.306  165.8
    ## The Phantom Menace      474.500  552.5
    ## Attack of the Clones    310.700  338.7
    ## Revenge of the Sith     380.300  468.5

# 4. Factors

# 5. Data frames

# 6. Lists
