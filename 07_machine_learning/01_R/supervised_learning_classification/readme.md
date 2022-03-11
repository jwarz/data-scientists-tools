Supervised Learning in R: Classification
================
Joschka Schwarz

-   [1. Chapter 1: k-Nearest Neighbors
    (kNN)](#1-chapter-1-k-nearest-neighbors-knn)
    -   [Classification with Nearest
        Neighbors](#classification-with-nearest-neighbors)
    -   [Recognizing a road sign with
        kNN](#recognizing-a-road-sign-with-knn)
    -   [Thinking like kNN](#thinking-like-knn)
    -   [Exploring the traffic sign
        dataset](#exploring-the-traffic-sign-dataset)
    -   [Classifying a collection of road
        signs](#classifying-a-collection-of-road-signs)
    -   [What about the ‘k’ in kNN?](#what-about-the-k-in-knn)
    -   [Understanding the impact of
        ‘k’](#understanding-the-impact-of-k)
    -   [Testing other ‘k’ values](#testing-other-k-values)
    -   [Seeing how the neighbors
        voted](#seeing-how-the-neighbors-voted)
    -   [Data preparation for kNN](#data-preparation-for-knn)
    -   [Why normalize data?](#why-normalize-data)
-   [2. Chapter 2: Naive Bayes](#2-chapter-2-naive-bayes)
    -   [Understanding Bayesian
        methods](#understanding-bayesian-methods)
    -   [Computing probabilities](#computing-probabilities)
    -   [Understanding dependent
        events](#understanding-dependent-events)
    -   [A simple Naive Bayes location
        model](#a-simple-naive-bayes-location-model)
    -   [Examining “raw” probabilities](#examining-raw-probabilities)
    -   [Understanding independence](#understanding-independence)
    -   [Understanding NB’s “naivety”](#understanding-nbs-naivety)
    -   [Who are you calling naive?](#who-are-you-calling-naive)
    -   [A more sophisticated location
        model](#a-more-sophisticated-location-model)
    -   [Preparing for unforeseen
        circumstances](#preparing-for-unforeseen-circumstances)
    -   [Understanding the Laplace
        correction](#understanding-the-laplace-correction)
    -   [Applying Naive Bayes to other
        problems](#applying-naive-bayes-to-other-problems)
    -   [Handling numeric predictors](#handling-numeric-predictors)
-   [3. Chapter 3: Logistic
    Regression](#3-chapter-3-logistic-regression)
    -   [Making binary predictions with
        regression](#making-binary-predictions-with-regression)
    -   [Building simple logistic regression
        models](#building-simple-logistic-regression-models)
    -   [Making a binary prediction](#making-a-binary-prediction)
    -   [The limitations of accuracy](#the-limitations-of-accuracy)
    -   [Model performance tradeoffs](#model-performance-tradeoffs)
    -   [Calculating ROC Curves and
        AUC](#calculating-roc-curves-and-auc)
    -   [Comparing ROC curves](#comparing-roc-curves)
    -   [Dummy variables, missing data, and
        interactions](#dummy-variables-missing-data-and-interactions)
    -   [Coding categorical features](#coding-categorical-features)
    -   [Handling missing data](#handling-missing-data)
    -   [Understanding missing value
        indicators](#understanding-missing-value-indicators)
    -   [Building a more sophisticated
        model](#building-a-more-sophisticated-model)
    -   [Automatic feature selection](#automatic-feature-selection)
    -   [The dangers of stepwise
        regression](#the-dangers-of-stepwise-regression)
    -   [Building a stepwise regression
        model](#building-a-stepwise-regression-model)
-   [4. Chapter 4: Classification
    Trees](#4-chapter-4-classification-trees)
    -   [Making decisions with trees](#making-decisions-with-trees)
    -   [Building a simple decision
        tree](#building-a-simple-decision-tree)
    -   [Visualizing classification
        trees](#visualizing-classification-trees)
    -   [Understanding the tree’s
        decisions](#understanding-the-trees-decisions)
    -   [Growing larger classification
        trees](#growing-larger-classification-trees)
    -   [Why do some branches split?](#why-do-some-branches-split)
    -   [Creating random test datasets](#creating-random-test-datasets)
    -   [Building and evaluating a larger
        tree](#building-and-evaluating-a-larger-tree)
    -   [Conducting a fair performance
        evaluation](#conducting-a-fair-performance-evaluation)
    -   [Tending to classification
        trees](#tending-to-classification-trees)
    -   [Preventing overgrown trees](#preventing-overgrown-trees)
    -   [Creating a nicely pruned tree](#creating-a-nicely-pruned-tree)
    -   [Why do trees benefit from
        pruning?](#why-do-trees-benefit-from-pruning)
    -   [Seeing the forest from the
        trees](#seeing-the-forest-from-the-trees)
    -   [Understanding random forests](#understanding-random-forests)
    -   [Building a random forest
        model](#building-a-random-forest-model)

**Short Description**

Basics of machine learning for classification.

**Long Description**

This beginner-level introduction to machine learning covers four of the
most common classification algorithms. You will come away with a basic
understanding of how each algorithm approaches a learning task, as well
as learn the R functions needed to apply these tools to your own work.

# 1. Chapter 1: k-Nearest Neighbors (kNN)

As the kNN algorithm literally “learns by example” it is a case in point
for starting to understand supervised machine learning. This chapter
will introduce classification while working through the application of
kNN to self-driving vehicle road sign recognition.

## Classification with Nearest Neighbors

Theory. Coming soon …

**1. Classification with nearest neighbors**

Hi! My name is Brett Lantz and I’m a data scientist at the University of
Michigan and the author of the book “Machine Learning with R.” Machine
learning utilizes computers to turn data into insight and action.This
course focuses on a subset of machine learning. The sub-domain called
supervised learning focuses on training a machine to learn from prior
examples.When the concept to be learned is a set of categories, the task
is called classification. From identifying diseases, predicting the
weather, or detecting whether an image contains a cat, classification
tasks are diverse yet common.In this course, you’ll learn classification
methods while exploring four real-world applications. Let’s get started!

**2. Classification tasks for driverless cars**

If your experiences on the road are anything like mine, self-driving
cars can’t get here soon enough! It’s easy to imagine aspects of
autonomous driving that involve classification; for example, when a
vehicle’s camera observes an object, it must classify the object before
it can react.Though the algorithms that govern autonomous cars are
sophisticated, we can simulate aspects of their behavior. In this
example, we’ll suppose the vehicle can see but not distinguish the
roadway signs. Your job will be to use machine learning to classify the
sign’s type.

**3. Understanding Nearest Neighbors**

To start training a self-driving car, you might supervise it by
demonstrating the desired behavior as it observes each type of sign. You
stop at intersections, yield to pedestrians, and change speed as
needed.After some time under your instruction, the vehicle has built a
database that records the sign as well as the target behavior. The image
here illustrates this dataset.I suspect you already see some
similarities, the machine can too! A nearest neighbor classifier takes
advantage of the fact that signs that look alike should be similar to,
or “nearby” other signs of the same type. For example, if the car
observes a sign that seems similar to those in the group of stop signs,
the car will probably need to stop.

**4. Measuring similarity with distance**

So how does a nearest neighbor learner decide whether two signs are
similar? It does so by literally measuring the distance between
them.That’s not to say that it measures the distance between signs in
physical space, a stop sign in New York is the same as a stop sign in
Los Angeles, but instead, it imagines the properties of the signs as
coordinates in what is called a feature space.Consider, for instance,
the sign’s color. By imagining the color as a 3-dimensional feature
space measuring levels of red, green, and blue, signs of similar color
are located naturally close to one another.Once the feature space has
been constructed in this way, you can measure distance using a formula
like those you may have seen in a geometry class. Many nearest neighbor
learners use the Euclidean distance formula here, which measures the
straight-line distance between two points. If the formula is confusing,
don’t worry; R will compute it for you.

**5. Applying nearest neighbors in R**

An algorithm called k-Nearest Neighbors, or kNN, uses the principle of
nearest neighbors to classify unlabeled examples. We’ll get into the
specifics later, but for now it suffices to know that, by default, R’s
knn function searches a dataset for the historic observation most
similar to the newly-observed one.The knn function is part of the class
package, and requires three parameters: first, the set of training data;
second, the test data to be classified; and third, the labels for the
training data.

**6. Let’s practice!**

The test car is ready at the track. Can you help it drive away?

## Recognizing a road sign with kNN

After several trips with a human behind the wheel, it is time for the
self-driving car to attempt the test course alone.

As it begins to drive away, its camera captures the following image:

<img src="https://assets.datacamp.com/production/course_2906/datasets/knn_stop_99.gif" alt="Stop Sign">

Can you apply a kNN classifier to help the car recognize this sign?

The dataset `signs` is loaded in your workspace along with the dataframe
`next_sign`, which holds the observation you want to classify.

**Steps**

1.  Load the `class` package.
2.  Create a vector of sign labels to use with kNN by extracting the
    column `sign_type` from `signs`.
3.  Identify the `next_sign` using the `knn()` function.the `train`
    argument equal to the `signs` data frame *without* the first
    column.the `test` argument equal to the data frame `next_sign`.the
    vector of labels you created as the `cl` argument.
4.  Set the `train` argument equal to the `signs` data frame *without*
    the first column.
5.  Set the `test` argument equal to the data frame `next_sign`.
6.  Use the vector of labels you created as the `cl` argument.

``` r
# Load the 'class' package
library(class)
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
# Load & create data
signs_all  <- readr::read_csv("data/knn_traffic_signs.csv")
```

    ## Rows: 206 Columns: 51

    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr  (2): sample, sign_type
    ## dbl (49): id, r1, g1, b1, r2, g2, b2, r3, g3, b3, r4, g4, b4, r5, g5, b5, r6...
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

``` r
signs      <- signs_all |> filter(sample == "train")   |> select(-c(1:2))
next_sign  <- signs_all |> filter(sample == "example") |> select(-c(1:3))
signs_test <- signs_all |> filter(sample == "test")    |> select(-c(1:2))

# Create a vector of labels
sign_types <- signs$sign_type

# Classify the next sign observed
knn(train = signs[-1], test = next_sign, cl = sign_types)
```

    ## [1] stop
    ## Levels: pedestrian speed stop

Awesome! You’ve trained your first nearest neighbor classifier!

## Thinking like kNN

With your help, the test car successfully identified the sign and
stopped safely at the intersection.

> ## *Question*
>
> How did the `knn()` function correctly classify the stop sign?<br>
> <br> ⬜ It learned that stop signs are red<br> ✅ The sign was in some
> way similar to another stop sign<br> ⬜ Stop signs have eight
> sides<br> ⬜ The other types of signs were less likely<br>

Correct! kNN isn’t really learning anything; it simply looks for the
most similar example.

## Exploring the traffic sign dataset

To better understand how the `knn()` function was able to classify the
stop sign, it may help to examine the training dataset it used.

Each previously observed street sign was divided into a 4x4 grid, and
the red, green, and blue level for each of the 16 center pixels is
recorded as illustrated here.

<img src="https://assets.datacamp.com/production/course_2906/datasets/knn_sign_data.png" alt="Stop Sign Data Encoding">

The result is a dataset that records the `sign_type` as well as 16 x 3 =
48 color properties of each sign.

**Steps**

1.  Use the `str()` function to examine the `signs` dataset.
2.  Use `table()` to count the number of observations of each sign type
    by passing it the column containing the labels.
3.  Run the provided `aggregate()` command to see whether the average
    red level might vary by sign type.

``` r
# Examine the structure of the signs dataset
str(signs[1:5])
#> tibble [146 × 5] (S3: tbl_df/tbl/data.frame)
#>  $ sign_type: chr [1:146] "pedestrian" "pedestrian" "pedestrian" "pedestrian" ...
#>  $ r1       : num [1:146] 155 142 57 22 169 75 136 149 13 123 ...
#>  $ g1       : num [1:146] 228 217 54 35 179 67 149 225 34 124 ...
#>  $ b1       : num [1:146] 251 242 50 41 170 60 157 241 28 107 ...
#>  $ r2       : num [1:146] 135 166 187 171 231 131 200 34 5 83 ...

# Count the number of signs of each type
table(signs$sign_type)
#> 
#> pedestrian      speed       stop 
#>         46         49         51

# Check r10's average red level by sign type
aggregate(r10 ~ sign_type, data = signs, mean)
#>    sign_type       r10
#> 1 pedestrian 113.71739
#> 2      speed  80.63265
#> 3       stop 132.39216
```

Great work! As you might have expected, stop signs tend to have a higher
average red value. This is how kNN identifies similar signs.

## Classifying a collection of road signs

Now that the autonomous vehicle has successfully stopped on its own,
your team feels confident allowing the car to continue the test course.

The test course includes 59 additional road signs divided into three
types:

<img src="https://assets.datacamp.com/production/course_2906/datasets/knn_stop_28.gif" alt="Stop Sign">
<img src="https://assets.datacamp.com/production/course_2906/datasets/knn_speed_55.gif" alt="Speed Limit Sign">
<img src="https://assets.datacamp.com/production/course_2906/datasets/knn_peds_47.gif" alt="Pedestrian Sign">

At the conclusion of the trial, you are asked to measure the car’s
overall performance at recognizing these signs.

The `class` package and the dataset `signs` are already loaded in your
workspace. So is the dataframe `test_signs`, which holds a set of
observations you’ll test your model on.

**Steps**

1.  Classify the `test_signs` data using `knn()`.`train` equal to the
    observations in `signs` *without* labels.`test_signs` for the `test`
    argument, again without labels.the `cl` argument, use the vector of
    labels provided for you.

    -   Set `train` equal to the observations in `signs` *without*
        labels.
    -   Use `test_signs` for the `test` argument, again without labels.
    -   For the `cl` argument, use the vector of labels provided for
        you.

2.. Use `table()` to explore the classifier’s performance at identifying
the three sign types (the confusion matrix).the vector `signs_actual` by
extracting the labels from `test_signs`.the vector of predictions and
the vector of actual signs to `table()` to cross tabulate them.

    * Create the vector `signs_actual` by extracting the labels from `test_signs`.
    * Pass the vector of predictions and the vector of actual signs to `table()` to cross tabulate them.

``` r
# Use kNN to identify the test road signs
sign_types <- signs$sign_type
signs_pred <- knn(train = signs[-1], test = signs_test[-1], cl = sign_types)

# Create a confusion matrix of the predicted versus actual values
signs_actual <- signs_test$sign_type
table(signs_pred, signs_actual)
```

    ##             signs_actual
    ## signs_pred   pedestrian speed stop
    ##   pedestrian         19     2    0
    ##   speed               0    17    0
    ##   stop                0     2   19

3.  Compute the overall accuracy of the kNN learner using the `mean()`
    function.

``` r
# Compute the accuracy
mean(signs_pred == signs_actual)
```

    ## [1] 0.9322034

Fantastic! That self-driving car is really coming along! The confusion
matrix lets you look for patterns in the classifier’s errors.

## What about the ‘k’ in kNN?

Theory. Coming soon …

**1. What about the ‘k’ in kNN?**

You may be wondering why kNN is called ‘k’ Nearest Neighbors, what
exactly is ‘k’? The letter k is a variable that specifies the number of
neighbors to consider when making the classification. You can imagine it
as determining the size of the neighborhoods. Until now, we’ve ignored
k, and thus R has used the default value of ‘1’. This means that only
the single nearest, most similar, neighbor was used to classify the
unlabeled example. While this seems OK on the surface, let’s work
through an example to see why the value of k may have a substantial
impact on the performance of our classifier.

**2. Choosing ‘k’ neighbors**

Suppose our vehicle observed the sign at the center of the image here.
Its five nearest neighbors are depicted. The single nearest neighbor is
a speed limit sign, which shares a very similar background color.
Unfortunately, in this case, a kNN classifier with k set to one would
make an incorrect classification. Slightly further away are the second,
third, and fourth nearest neighbors, which are all pedestrian crossing
signs. Suppose we set k to three. What would happen? The three nearest
neighbors, a speed limit sign and two pedestrian crossing signs, would
take a vote. The category with the majority of nearest neighbors, in
this case the pedestrian crossing sign, is the winner. Increasing k to
five allows the five nearest neighbors to vote. The pedestrian crossing
sign still wins with a margin of 3-to-2. Note that in the case of a tie,
the winner is typically decided at random.

**3. Bigger ‘k’ is not always better**

In the previous example, setting k to a higher value resulted in a
correct prediction. But it is not always the case that bigger is better.
A small k creates very small neighborhoods; the classifier is able to
discover very subtle patterns. As this image illustrates, you might
imagine it as being able to distinguish between groups even when their
boundary is somewhat “fuzzy.” On the other hand, sometimes a “fuzzy”
boundary is not a true pattern, but rather due to some other factor that
adds randomness into the data. This is called noise. Setting k larger,
as this image shows, ignores some potentially-noisy points in an effort
to discover a broader, more general pattern.

**4. Choosing ‘k’**

So, how should you set k? Unfortunately, there is no universal rule. In
practice, the optimal value depends on the complexity of the pattern to
be learned, as well as the impact of noisy data. Some suggest a rule of
thumb starting with k equal to the square root of the number of
observations in the training data. For example, if the car had observed
100 previous road signs, you might set k to 10. An even better approach
is to test several different values of k and compare the performance on
data it has not seen before.

**5. Let’s practice!**

In the next coding exercise, you’ll have an opportunity to see the
impact of k on the vehicle’s ability to correctly classify signs.

## Understanding the impact of ‘k’

There is a complex relationship between k and classification accuracy.
Bigger is not always better.

> ## *Question*
>
> Which of these is a valid reason for keeping k as small as possible
> (but no smaller)?<br> <br> ⬜ A smaller k requires less processing
> power<br> ⬜ A smaller k reduces the impact of noisy data<br> ⬜ A
> smaller k minimizes the chance of a tie vote<br> ✅ A smaller k may
> utilize more subtle patterns<br>

Yes! With smaller neighborhoods, kNN can identify more subtle patterns
in the data.

## Testing other ‘k’ values

By default, the `knn()` function in the `class` package uses only the
single nearest neighbor.

Setting a `k` parameter allows the algorithm to consider additional
nearby neighbors. This enlarges the collection of neighbors which will
vote on the predicted class.

Compare `k` values of 1, 7, and 15 to examine the impact on traffic sign
classification accuracy.

The `class` package is already loaded in your workspace along with the
datasets `signs`, `signs_test`, and `sign_types`. The object
`signs_actual` holds the true values of the signs.

**Steps**

1.  Compute the accuracy of the default `k = 1` model using the given
    code, then find the accuracy of the model using `mean()` to compare
    `signs_actual` and the model’s predictions.

``` r
# Compute the accuracy of the baseline model (default k = 1)
k_1 <- knn(train = signs[-1], test = signs_test[-1], cl = sign_types)
mean(signs_actual == k_1)
```

    ## [1] 0.9322034

2.  Modify the `knn()` function call by setting `k = 7` and again find
    accuracy value.

``` r
# Modify the above to set k = 7
k_7 <- knn(train = signs[-1], test = signs_test[-1], cl = sign_types, k = 7)
mean(signs_actual == k_7)
```

    ## [1] 0.9661017

3.  Revise the code once more by setting `k = 15`, plus find the
    accuracy value one more time.

``` r
# Set k = 15 and compare to the above
k_15 <- knn(train = signs[-1], test = signs_test[-1], cl = sign_types, k = 15)
mean(signs_actual == k_15)
```

    ## [1] 0.8983051

You’re a kNN pro! Which value of k gave the highest accuracy?

## Seeing how the neighbors voted

When multiple nearest neighbors hold a vote, it can sometimes be useful
to examine whether the voters were unanimous or widely separated.

For example, knowing more about the voters’ confidence in the
classification could allow an autonomous vehicle to use caution in the
case there is *any chance at all* that a stop sign is ahead.

In this exercise, you will learn how to obtain the voting results from
the `knn()` function.

The `class` package has already been loaded in your workspace along with
the datasets `signs`, `sign_types`, and `signs_test`.

**Steps**

1.  Build a kNN model with the `prob = TRUE` parameter to compute the
    vote proportions. Set `k = 7`.
2.  Use the `attr()` function to obtain the vote proportions for the
    predicted class. These are stored in the attribute `"prob"`.

``` r
# Use the prob parameter to get the proportion of votes for the winning class
sign_pred <- knn(train = signs[-1], test = signs_test[-1], cl = sign_types, k = 7, prob = TRUE)

# Get the "prob" attribute from the predicted classes
sign_prob <- attr(sign_pred, "prob")

# Examine the first several predictions
head(sign_pred)
```

    ## [1] pedestrian pedestrian pedestrian stop       pedestrian pedestrian
    ## Levels: pedestrian speed stop

3.  Examine the first several vote outcomes and percentages using the
    `head()` function to see how the confidence varies from sign to
    sign.

``` r
# Examine the proportion of votes for the winning class
head(sign_prob)
```

    ## [1] 0.5714286 0.5714286 0.8571429 0.5714286 0.8571429 0.5714286

Wow! Awesome job! Now you can get an idea of how certain your kNN
learner is about its classifications.

## Data preparation for kNN

Theory. Coming soon …

**1. Data preparation for kNN**

You’ve now seen the kNN algorithm in action while simulating aspects of
a self-driving vehicle. You’ve gained an understanding of the impact of
k on the algorithm’s performance, and know how to examine the neighbors’
votes to better understand which predictions are closer to unanimous.But
before applying kNN to your own projects, you’ll need to know one more
thing: how to prepare your data for nearest neighbors.

**2. kNN assumes numeric data**

As noted previously, nearest neighbor learners use distance functions to
identify the most similar, or nearest examples. Many common distance
functions assume that your data are in numeric format, as it is
difficult to define the distance between categories.For example, there’s
no obvious way to define the distance between “red” and “yellow”;
consequently, the traffic sign dataset represented these using numeric
color intensities. But suppose that you have a property that cannot be
measured numerically, such as whether a road sign is a rectangle,
diamond, or octagon. A common solution uses 1/0 indicators to represent
these categories. This is called dummy coding.A binary “dummy” variable
is created for each category except one. This variable is set to ‘1’ if
the category applies and ‘0’ otherwise. The category that is left out
can be easily deduced, if the stop sign is not a rectangle or a diamond,
then it must be an octagon.Dummy coded data can be used directly in a
distance function; two rectangle signs, both having values of ‘1’, will
be found to be closer together than a rectangle and a diamond.

**3. kNN benefits from normalized data**

It is also important to be aware that when calculating distance, each
feature of the input data should be measured with the same range of
values.This was true for the traffic sign data; each color component
ranged from a minimum of zero to a maximum of 255.However, suppose that
we added the 1/0 dummy variables for sign shapes into the distance
calculation. Two different shapes may differ by at most one unit, but
two different colors may differ by as much as 255 units!Such a different
scale allows the features with a wider range to have more influence over
the distance calculation, as this figure illustrates. Here, the topmost
speed limit sign is closer to the pedestrian sign than it is to its
correct neighbors, simply because the range of blue values is wider than
the 0-to-1 range of shape values.Compressing the blue axis so that it
also follows a 0-to-1 range corrects this issue, and the speed limit
sign is now closer to its true neighborhood.

**4. Normalizing data in R**

R does not have a built-in function in R to rescale data to a given
range, so you’ll need to create one yourself. The code here defines a
function called normalize which can be used to perform min-max
normalization. This rescales a vector x such that it its minimum value
is zero and its maximum value is one. It does this by subtracting the
minimum value from each value of x and dividing by the range of x
values.After applying this function to r-one, one of the color vectors,
we can use the summary function to see that the new minimum and maximum
values are 0 and 1 respectively. Calculating the same summary statistics
for the unnormalized data shows a minimum of 3 and a maximum of 251.

**5. Let’s practice!**

I hope you enjoyed your time simulating the training of an autonomous
car. After a brief test of what you’ve learned about normalization,
you’ll get started on another interesting classification task.

## Why normalize data?

Before applying kNN to a classification task, it is common practice to
rescale the data using a technique like **min-max normalization**.

> ## *Question*
>
> What is the purpose of this step?<br> <br> ✅ To ensure all data
> elements may contribute equal shares to distance.<br> ⬜ To help the
> kNN algorithm converge on a solution faster.<br> ⬜ To convert all of
> the data elements to numbers.<br> ⬜ To redistribute the data as a
> normal bell curve.<br>

Yes! Rescaling reduces the influence of extreme values on kNN’s distance
function.

# 2. Chapter 2: Naive Bayes

Naive Bayes uses principles from the field of statistics to make
predictions. This chapter will introduce the basics of Bayesian methods
while exploring how to apply these techniques to iPhone-like destination
suggestions.

## Understanding Bayesian methods

Theory. Coming soon …

**1. Understanding Bayesian methods**

Some smartphones and apps predict the user’s destination to offer routes
and traffic estimates without the user even asking. If you didn’t know
about machine learning, the phone’s ability to predict the future this
way might seem a bit like magic!The phone obviously keeps a record of
the user’s past locations. It then uses this data to forecast the user’s
most probable future location, much like a meteorologist estimates the
precipitation probability in a weather report.A branch of statistics
called Bayesian methods apply the work of 18th century statistician
Thomas Bayes, who proposed rules for estimating probabilities in light
of historic data. By applying these methods to my own location tracking
data, you will learn how probability estimates can forecast action.
Let’s see where the data finds me!

**2. Estimating probability**

This map shows the number of times my phone recorded my position at four
different locations. Based on this data, my phone can predict that at
any given time my most probable location is at work, because I was there
57-point-5 percent of the time: 23 of the past 40 times it checked.This
illustrates how the probability of an event is estimated from historic
data; it the number of times the event happened, divided by the number
of times it could have happened.But even though I am at work a lot, the
phone should not predict I am there all the time. Instead, it should
incorporate additional data like time of day to better tailor its
predictions to the situation. This requires an understanding of how to
combine information from several events into a single probability
estimate.

**3. Joint probability and independent events**

When events occur together, they have a joint probability. Their
intersection can be depicted using a Venn diagram like those shown here.
These show that there is a much greater probability that I am at work in
the afternoon than the evening; the overlap is much greater for work and
afternoon.The joint probability of two events is computed by finding the
proportion of observations they occurred together.Sometimes one event
does not influence the probability of another. These are said to be
independent events. For example, my location is unrelated to most other
users’ locations. Knowing where they are does not provide information
about where I might be. This notion of independent events will be
important later on.However, many of the other data elements my phone
collects, such as the time and date, are VERY predictive of where I may
be. When one event is predictive of another, they are called dependent.

**4. Conditional probability and dependent events**

These are the basis of prediction with Bayesian methods.Conditional
probability expresses exactly how one event depends on another. The
formula shows that the probability of event A given B is equal to their
joint probability divided by the probability of B.We can use this to
compute the 4% probability that I am at work, given the knowledge that
it is evening. In comparison, there is an 80% chance I am at work in the
afternoon.

**5. Making predictions with Naive Bayes**

The algorithm known as “Naive Bayes” applies Bayesian methods to
estimate the conditional probability of an outcome.The naivebayes
package provides a function to build this model. Because the location
depends on the time of day, it is specified as
location-tilde-time-of-day; this form is called the R formula interface,
which relates the outcome to be predicted to its predictors.The
corresponding predict() function computes conditional probabilities to
predict a future location based on the future conditions.

**6. Let’s practice!**

In the next exercises, you’ll apply what you’ve learned to a real
dataset that tracked my location over time.

## Computing probabilities

The `where9am` data frame contains 91 days (thirteen weeks) worth of
data in which Brett recorded his `location` at 9am each day as well as
whether the `daytype` was a weekend or weekday.

Using the conditional probability formula below, you can compute the
probability that Brett is working in the office, given that it is a
weekday.

<img src="https://render.githubusercontent.com/render/math?math={\color{red}P(A|B)=\frac{P(A%20and%20B)}{P(B)}}">

Calculations like these are the basis of the Naive Bayes destination
prediction model you’ll develop in later exercises.

**Steps**

1.  Find P(office) using `nrow()` and `subset()` to count rows in the
    dataset and save the result as `p_A`.
2.  Find P(weekday), using `nrow()` and `subset()` again, and save the
    result as `p_B`.
3.  Use `nrow()` and `subset()` a final time to find P(office and
    weekday). Save the result as `p_AB`.
4.  Compute P(office \| weekday) and save the result as `p_A_given_B`.
5.  Print the value of `p_A_given_B`.

``` r
# Load package
library(readr)

# Load data
locations <- read_csv("data/locations.csv")
```

    ## Rows: 2184 Columns: 7
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr (4): weekday, daytype, hourtype, location
    ## dbl (3): month, day, hour
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

``` r
where9am  <- locations |> 
                filter(hour == 9) |> 
                select(daytype, location) |> 
                mutate(across(everything(), as.factor))

# Compute P(A) 
p_A <- nrow(subset(where9am, location == "office")) / nrow(where9am)

# Compute P(B)
p_B <- nrow(subset(where9am, daytype == "weekday")) / nrow(where9am)

# Compute the observed P(A and B)
p_AB <- nrow(subset(where9am, location == "office" & daytype == "weekday")) / nrow(where9am)

# Compute P(A | B) and print its value
p_A_given_B <- p_AB / p_B
p_A_given_B
```

    ## [1] 0.6

Great work! In a lot of cases, calculating probabilities is as simple as
counting.

## Understanding dependent events

> ## *Question*
>
> In the previous exercise, you found that there is a 60% chance Brett
> is in the office at 9am given that it is a weekday. On the other hand,
> if Brett is never in the office on a weekend, which of the following
> is/are true?<br> <br> ⬜ P(office and weekend) = 0.<br> ⬜ P(office \|
> weekend) = 0.<br> ⬜ Brett’s location is dependent on the day of the
> week.<br> ✅ All of the above.<br>

Correct! Because the events do not overlap, knowing that one occurred
tells you much about the status of the other.

## A simple Naive Bayes location model

The previous exercises showed that the probability that Brett is at work
or at home at 9am is highly dependent on whether it is the weekend or a
weekday.

To see this finding in action, use the `where9am` data frame to build a
Naive Bayes model on the same data.

You can then use this model to predict the future: where does the model
think that Brett will be at 9am on Thursday and at 9am on Saturday?

The data frame `where9am` is available in your workspace. This dataset
contains information about Brett’s location at 9am on different days.

**Steps**

1.  Load the `naivebayes` package.
2.  Use `naive_bayes()` with a formula like `y ~ x` to build a model of
    `location` as a function of `daytype`.

``` r
# Load the naivebayes package
library(naivebayes)
```

    ## naivebayes 0.9.7 loaded

``` r
# Build the location prediction model
locmodel <- naive_bayes(location ~ daytype, data = where9am)
```

    ## Warning: naive_bayes(): Feature daytype - zero probabilities are present.
    ## Consider Laplace smoothing.

3.  Forecast the Thursday 9am location using `predict()` with the
    `thursday9am` object as the `newdata` argument.

``` r
thursday9am <- tibble(daytype = factor("weekday", levels = c("weekday", "weekend")))

# Predict Thursday's 9am location
predict(locmodel, thursday9am)
```

    ## [1] office
    ## Levels: appointment campus home office

4.  Do the same for predicting the `saturday9am` location.

``` r
saturday9am <- tibble(daytype = factor("weekend", levels = c("weekday", "weekend")))

# Predict Saturdays's 9am location
predict(locmodel, saturday9am)
```

    ## [1] home
    ## Levels: appointment campus home office

Awesome job! Not surprisingly, Brett is most likely at the office at 9am
on a Thursday, but at home at the same time on a Saturday!

## Examining “raw” probabilities

The `naivebayes` package offers several ways to peek inside a Naive
Bayes model.

Typing the name of the model object provides the *a priori* (overall)
and conditional probabilities of each of the model’s predictors. If one
were so inclined, you might use these for calculating *posterior*
(predicted) probabilities by hand.

Alternatively, R will compute the posterior probabilities for you if the
`type = "prob"` parameter is supplied to the `predict()` function.

Using these methods, examine how the model’s predicted 9am location
probability varies from day-to-day. The model `locmodel` that you fit in
the previous exercise is in your workspace.

**Steps**

1.  Print the `locmodel` object to the console to view the computed *a
    priori* and conditional probabilities.

``` r
# The 'naivebayes' package is loaded into the workspace
# and the Naive Bayes 'locmodel' has been built

# Examine the location prediction model
locmodel
```

    ## 
    ## ================================== Naive Bayes ================================== 
    ##  
    ##  Call: 
    ## naive_bayes.formula(formula = location ~ daytype, data = where9am)
    ## 
    ## --------------------------------------------------------------------------------- 
    ##  
    ## Laplace smoothing: 0
    ## 
    ## --------------------------------------------------------------------------------- 
    ##  
    ##  A priori probabilities: 
    ## 
    ## appointment      campus        home      office 
    ##  0.01098901  0.10989011  0.45054945  0.42857143 
    ## 
    ## --------------------------------------------------------------------------------- 
    ##  
    ##  Tables: 
    ## 
    ## --------------------------------------------------------------------------------- 
    ##  ::: daytype (Bernoulli) 
    ## --------------------------------------------------------------------------------- 
    ##          
    ## daytype   appointment    campus      home    office
    ##   weekday   1.0000000 1.0000000 0.3658537 1.0000000
    ##   weekend   0.0000000 0.0000000 0.6341463 0.0000000
    ## 
    ## ---------------------------------------------------------------------------------

2.  Use the `predict()` function similarly to the previous exercise, but
    with `type = "prob"` to see the predicted probabilities for Thursday
    at 9am.

``` r
# Obtain the predicted probabilities for Thursday at 9am
predict(locmodel, thursday9am, type = "prob")
```

    ##      appointment    campus      home office
    ## [1,]  0.01538462 0.1538462 0.2307692    0.6

3.  Compare these to the predicted probabilities for Saturday at 9am.

``` r
# Obtain the predicted probabilities for Saturday at 9am
predict(locmodel, saturday9am, type = "prob")
```

    ##       appointment       campus      home      office
    ## [1,] 3.838772e-05 0.0003838772 0.9980806 0.001497121

Fantastic! Did you notice the predicted probability of Brett being at
the office on a Saturday is zero?

## Understanding independence

> ## *Question*
>
> Understanding the idea of event independence will become important as
> you learn more about how “naive” Bayes got its name. Which of the
> following is true about independent events?<br> <br> ⬜ The events
> cannot occur at the same time.<br> ⬜ A Venn diagram will always show
> no intersection.<br> ✅ Knowing the outcome of one event does not help
> predict the other.<br> ⬜ At least one of the events is completely
> random.<br>

Yes! One event is independent of another if knowing one doesn’t give you
information about how likely the other is. For example, knowing if it’s
raining in New York doesn’t help you predict the weather in San
Francisco. The weather events in the two cities are independent of each
other.

## Understanding NB’s “naivety”

Theory. Coming soon …

**1. Understanding NB’s “naivety”**

In the previous exercises, you built a simple Naive Bayes model that
used historic location data to predict my future location. To build a
more sophisticated model, you might add additional data points to help
inform the estimated probability of my location.But until now, we’ve
only considered conditional probability when a single event predicts
another. Adding more predictors complicates matters and is the reason
why this method is called “naive.” Keep listening to find out why.

**2. The challenge of multiple predictors**

With a single predictor, conditional probability is based on the overlap
between the two events, as the Venn diagram here illustrates.When we
start adding more events, the Venn diagram can start to look a bit
messy. Here it is with three events, imagine it with dozens or more!
And, as confusing as this looks to us, for a number of reasons it also
becomes more inefficient for a computer to calculate the overlap.

**3. A “naive” simplification**

Instead, the Naive Bayes algorithm uses a shortcut to approximate the
conditional probability we hope to compute.Rather than treating the
problem as the intersection of all of the related events, the algorithm
makes a so-called “naive” assumption about the data. Specifically, it
assumes that the events are independent.When events are independent, the
joint probability can be computed by multiplying the individual
probabilities. Therefore, under the naive assumption, the algorithm does
not need to observe all of the possible intersections in the full Venn
diagram. Instead, it simply multiplies the probabilities from a series
of much simpler intersections.Researchers have found that although the
naive assumption is rarely true in practice, the Naive Bayes model still
performs admirably on many real-world tasks. So there’s little need to
worry about a potential downside.

**4. An “infrequent” problem**

There is one other potential issue to be aware of when building a Naive
Bayes model. Suppose you have a set of predictors, chained together
under the naive assumption. Suppose further that one of those events has
never been observed previously in combination with the outcome. For
instance, I may never have gone into work on a weekend. I may do this
someday in the future, I just haven’t done so before.In this case, the
Venn diagram for work and weekend has no overlap; the joint probability
of these two events is zero. And whenever zero is multiplied in a chain,
the entire sequence becomes zero. For this reason, the weekend event
seems to have “veto” power over the entire prediction. No matter how
overwhelming the rest of the evidence, any predicted probability of work
on a weekend will always be zero.

**5. The Laplace correction**

The solution to this problem involves adding a small number, usually
‘1’, to each event and outcome combination to eliminate this veto power.
This is called the Laplace correction or Laplace estimator. After adding
this correction, each Venn diagram now has at least a small bit of
overlap; there is no longer any joint probability of zero. As a result,
there will be at least some predicted probability for every future
outcome even if it has never been seen before.

**6. Let’s practice!**

The Naive Bayes function you’ve used so far will let you set the Laplace
parameter; you’ll see its impact in the coming exercises as you build a
more sophisticated location model.

## Who are you calling naive?

The Naive Bayes algorithm got its name because it makes a “naive”
assumption about event independence.

> ## *Question*
>
> What is the purpose of making this assumption?<br> <br> ⬜ Independent
> events can never have a joint probability of zero.<br> ✅ The joint
> probability calculation is simpler for independent events.<br> ⬜
> Conditional probability is undefined for dependent events.<br> ⬜
> Dependent events cannot be used to make predictions.<br>

Yes! The joint probability of independent events can be computed much
more simply by multiplying their individual probabilities.

## A more sophisticated location model

The `locations` dataset records Brett’s location every hour for 13
weeks. Each hour, the tracking information includes the `daytype`
(weekend or weekday) as well as the `hourtype` (morning, afternoon,
evening, or night).

Using this data, build a more sophisticated model to see how Brett’s
predicted location not only varies by the day of week but also by the
time of day. The dataset `locations` is already loaded in your
workspace.

You can specify additional independent variables in your formula using
the `+` sign (e.g. `y ~ x + b`).

**Steps**

1.  Use the R formula interface to build a model where location depends
    on both `daytype` and `hourtype`. Recall that the function
    `naive_bayes()` takes 2 arguments: `formula` and `data`.
2.  Predict Brett’s location on a weekday afternoon using the dataframe
    `weekday_afternoon` and the `predict()` function.

``` r
# Build a NB model of location
locmodel <- naive_bayes(location ~ daytype + hourtype, data = locations)
```

    ## Warning: naive_bayes(): Feature daytype - zero probabilities are present.
    ## Consider Laplace smoothing.

    ## Warning: naive_bayes(): Feature hourtype - zero probabilities are present.
    ## Consider Laplace smoothing.

``` r
# Data
weekday_afternoon <- tibble(daytype  = factor("weekday",   levels = c("weekday", "weekend")),
                            hourtype = factor("afternoon", levels = c("afternoon", "evening", "morning", "night")),
                            location = factor("office",    levels = c("appointment", "campus", "home", "office", "restaurant", "store", "theater")))

# Predict Brett's location on a weekday afternoon
predict(locmodel, weekday_afternoon)
```

    ## Warning: predict.naive_bayes(): more features in the newdata are provided as
    ## there are probability tables in the object. Calculation is performed based on
    ## features to be found in the tables.

    ## [1] office
    ## Levels: appointment campus home office restaurant store theater

3.  Do the same for a `weekday_evening`.

``` r
# Data
weekday_evening <- tibble(daytype  = factor("weekday", levels = c("weekday", "weekend")),
                          hourtype = factor("evening", levels = c("afternoon", "evening", "morning", "night")),
                          location = factor("home",    levels = c("appointment", "campus", "home", "office", "restaurant", "store", "theater")))

# Predict Brett's location on a weekday evening
predict(locmodel, weekday_evening)
```

    ## Warning: predict.naive_bayes(): more features in the newdata are provided as
    ## there are probability tables in the object. Calculation is performed based on
    ## features to be found in the tables.

    ## [1] home
    ## Levels: appointment campus home office restaurant store theater

Great job! Your Naive Bayes model forecasts that Brett will be at the
office on a weekday afternoon and at home in the evening.

## Preparing for unforeseen circumstances

While Brett was tracking his location over 13 weeks, he never went into
the office during the weekend. Consequently, the joint probability of
P(office and weekend) = 0.

Explore how this impacts the predicted probability that Brett may go to
work on the weekend in the future. Additionally, you can see how using
the Laplace correction will allow a small chance for these types of
unforeseen circumstances.

The model `locmodel` is already in your workspace, along with the
dataframe `weekend_afternoon`.

**Steps**

1.  Use the `locmodel` to output predicted probabilities for a weekend
    afternoon by using the `predict()` function. Remember to set the
    `type` argument.

``` r
# The 'naivebayes' package is loaded into the workspace already
# The Naive Bayes location model (locmodel) has already been built

# Data
weekend_afternoon <- tibble(daytype  = factor("weekend",   levels = c("weekday", "weekend")),
                            hourtype = factor("afternoon", levels = c("afternoon", "evening", "morning", "night")),
                            location = factor("home",      levels = c("appointment", "campus", "home", "office", "restaurant", "store", "theater")))

# Observe the predicted probabilities for a weekend afternoon
predict(locmodel, weekend_afternoon, type = "prob")
```

    ## Warning: predict.naive_bayes(): more features in the newdata are provided as
    ## there are probability tables in the object. Calculation is performed based on
    ## features to be found in the tables.

    ##      appointment       campus      home      office restaurant      store
    ## [1,]  0.02462883 0.0004802622 0.8439145 0.003349521  0.1111338 0.01641922
    ##          theater
    ## [1,] 7.38865e-05

2.  Create a new naive Bayes model with the Laplace smoothing parameter
    set to `1`. You can do this by setting the `laplace` argument in
    your call to `naive_bayes()`. Save this as `locmodel2`.
3.  See how the new predicted probabilities compare by using the
    `predict()` function on your new model.

``` r
# Build a new model using the Laplace correction
locmodel2 <- naive_bayes(location ~ daytype + hourtype, data = locations, laplace = 1)

# Observe the new predicted probabilities for a weekend afternoon
predict(locmodel2, weekend_afternoon, type = "prob")
```

    ## Warning: predict.naive_bayes(): more features in the newdata are provided as
    ## there are probability tables in the object. Calculation is performed based on
    ## features to be found in the tables.

    ##      appointment      campus      home      office restaurant      store
    ## [1,]  0.02013872 0.006187715 0.8308154 0.007929249  0.1098743 0.01871085
    ##          theater
    ## [1,] 0.006343697

Fantastic work! Adding the Laplace correction allows for the small
chance that Brett might go to the office on the weekend in the future.

## Understanding the Laplace correction

> ## *Question*
>
> By default, the `naive_bayes()` function in the `naivebayes` package
> does not use the Laplace correction. What is the risk of leaving this
> parameter unset?<br> <br> ✅ Some potential outcomes may be predicted
> to be impossible.<br> ⬜ The algorithm may have a divide by zero
> error.<br> ⬜ Naive Bayes will ignore features with zero values.<br>
> ⬜ The model may not estimate probabilities for some cases.<br>

Correct! The small probability added to every outcome ensures that they
are all possible even if never previously observed.

## Applying Naive Bayes to other problems

Theory. Coming soon …

**1. Applying Naive Bayes to other problems**

Smartphone destination suggestions are a very specific application of
Naive Bayes. But the algorithm can also be used for many other types of
problems. Naive Bayes tends to work well on problems where the
information from multiple attributes needs to be considered
simultaneously and evaluated as a whole. The process is somewhat
analogous to how a medical doctor might evaluate symptoms and test
results to make a final diagnosis. Historically, Naive Bayes has also
been frequently used for classifying text data, like identifying whether
or not an email is spam. In this video, I’ll present some of the
challenges you may encounter when applying the algorithm to other
classification tasks.

**2. How Naive Bayes uses data**

Consider the fact that Naive Bayes makes predictions by computing
conditional probabilities of events and outcomes. Beginning with a
tabular dataset, it builds frequency tables that count the number of
times each event overlaps with the outcome of interest. The
probabilities are then multiplied, naively, in a chain of all the
events. A consequence of this approach is that each of the predictors
used in Naive Bayes typically comprises a set of categories. Numeric
properties, like age or time-of-day, are difficult for Naive Bayes to
use as-is without knowing more about the properties of the data.
Similarly, unstructured text data also defies categorization. Thus, it
is generally necessary to prepare these types of data before using them
with Naive Bayes.

**3. Binning numeric data for Naive Bayes**

A technique called binning is a simple method for creating categories
from numeric data. The idea is to divide a range of numbers into a
series of sets called “bins.” For instance, you might divide a numbers
into bins based on percentiles by creating a category for the bottom
25%, the next 25%, and so on. Perhaps a better approach is to group
ranges of values into meaningful bins. For instance, you might group
times into categories like afternoon and evening, and temperature
readings into values like hot, warm, and cold. You can use R’s data
preparation functions to recode data this way.

**4. Preparing text data for Naive Bayes**

Text documents are considered unstructured data because they do not
conform to the typical table or spreadsheet format of most datasets. A
common process for adding structure to text data uses a model called
bag-of-words. The bag-of-words model does not consider word order,
grammar, or semantics. It simply creates an event for each word that
appears in a particular collection of text documents. For example, the
bag-of-words for this document on Naive Bayes would include events for
words like “naive” and “bayes” and “understanding.” In spreadsheet form,
this results in a wide table where the rows are documents and the
columns are words that may appear in the documents. Each spreadsheet
cell indicates whether or not the word appeared in that document. When
the Naive Bayes algorithm is applied to the bag of words, it can
estimate the probability of the outcome given the evidence provided by
the words in the text. For instance, a document with the words “viagra”
and “prescription” is more likely to be spam than a document with the
words “naive” and “bayes.” Naive Bayes models trained with bag of words
can be very effective text classifiers.

**5. Let’s practice!**

You can learn more about this in DataCamp’s course on text mining, which
will teach you how to apply R’s tm package to build datasets you can use
with Naive Bayes.

## Handling numeric predictors

Numeric data is often **binned** before it is used with Naive Bayes.
Which of these is not an example of binning?

> ## *Question*
>
> ???<br> <br> ⬜ age values recoded as ‘child’ or ‘adult’
> categories<br> ⬜ geographic coordinates recoded into geographic
> regions (West, East, etc.)<br> ⬜ test scores divided into four groups
> by percentile<br> ✅ income values standardized to follow a normal
> bell curve<br>

Right! Transforming income values into a bell curve doesn’t create a set
of categories.

# 3. Chapter 3: Logistic Regression

Logistic regression involves fitting a curve to numeric data to make
predictions about binary events. Arguably one of the most widely used
machine learning methods, this chapter will provide an overview of the
technique while illustrating how to apply it to fundraising data.

## Making binary predictions with regression

Theory. Coming soon …

**1. Making binary predictions with regression**

If you’ve spent any time at all studying data science, you are likely to
have encountered regression analysis, which is a branch of statistics
interested in modeling numeric relationships within data.Regression
methods are perhaps the single most common form of machine learning. The
technique can be adapted to virtually any type of problem in any domain.
In this video, you’ll see how regression methods can be used to classify
a binary outcome.Later, you’ll use what you learn to predict whether or
not someone will donate to charity a topic directly related to my own
work as a fund-raising data scientist.

**2. Introducing linear regression**

In its most basic form, regression involves predicting an outcome y
using one or more predictors, labeled as x variables. The y variable is
known as the dependent variable, as it seems to depend upon the
x’s.Suppose you have a numeric y which you plot versus a numeric x term,
resulting in the figure seen here. The y might reflect something like
income or life expectancy, while the x-axis could represent age or
education.Linear regression involves fitting the straight line to this
data that best captures the relationship between the x and y terms.

**3. Regression for binary classification**

Suppose you have a binary y outcome instead something that can take only
‘1’ or ‘0’ values, like “donate” or “not donate.” Constructing a plot of
y versus x, the points fall in two flat rows rather than spread along
the diagonal.You can still apply a straight line to the data, but this
doesn’t seem to fit very well. Additionally, for some values of x, the
model will predict values less than 0 or greater than 1. This is
obviously not ideal.

**4. Introducing logistic regression**

Now imagine the same binary outcome, but rather than trying to model it
with a straight line, we use a curve instead. This is the idea behind
logistic regression.A type of S-shaped curve called a logistic function
has the property that for any input value of x, the output is always
between 0 and 1 just like a probability.The greater this probability,
the more likely the outcome is to be the one labeled ‘1’.

**5. Making predictions with logistic regression**

In R, logistic regression uses the glm function with the syntax as shown
here. First, the terms y, x1, x2, and x3 specify the dependent and
independent variables that will go into your model. This is called the R
formula interface, and is a way to define the model’s form.You will
replace the y and x terms with the outcome and predictors needed for
your analysis.The family parameter specifies the type of model you are
building, because GLM can be be used to do many different types of
regression. In this case, family = “binomial” tells R to perform
logistic regression.Once the model has been built, it can be used to
estimate probabilities. Supplying the type = “response” parameter to the
predict function produces the predicted probabilities which are easier
to interpret than the default log-odds values.To make predictions, the
probabilities must be converted into the outcome of interest using an
ifelse step. This if/else predicts ‘1’ if the predicted probability is
greater than 50%, and ‘0’ otherwise. Sometimes you may need to set this
threshold higher or lower to make the model more or less aggressive.

**6. Let’s practice!**

Though this may seem confusing at first, you’ll have an opportunity to
practice building logistic regression models and making predictions in
the coming exercises.

## Building simple logistic regression models

The `donors` dataset contains 93,462 examples of people mailed in a
fundraising solicitation for paralyzed military veterans. The `donated`
column is `1` if the person made a donation in response to the mailing
and `0` otherwise. This binary outcome will be the *dependent* variable
for the logistic regression model.

The remaining columns are features of the prospective donors that may
influence their donation behavior. These are the model’s *independent
variables*.

When building a regression model, it is often helpful to form a
hypothesis about which independent variables will be predictive of the
dependent variable. The `bad_address` column, which is set to `1` for an
invalid mailing address and `0` otherwise, seems like it might reduce
the chances of a donation. Similarly, one might suspect that religious
interest (`interest_religion`) and interest in veterans affairs
(`interest_veterans`) would be associated with greater charitable
giving.

In this exercise, you will use these three factors to create a simple
model of donation behavior. The dataset `donors` is available in your
workspace.

**Steps**

1.  Examine `donors` using the `str()` function.

``` r
# Load data
donors <- read_csv("data/donors.csv") |> 
              mutate(across(where(is.numeric), as.integer),
                     across(where(is.character), as.factor))
```

    ## Rows: 93462 Columns: 13
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr  (3): recency, frequency, money
    ## dbl (10): donated, veteran, bad_address, age, has_children, wealth_rating, i...
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

``` r
# Examine the dataset to identify potential independent variables
str(donors)
```

    ## spec_tbl_df [93,462 × 13] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
    ##  $ donated          : int [1:93462] 0 0 0 0 0 0 0 0 0 0 ...
    ##  $ veteran          : int [1:93462] 0 0 0 0 0 0 0 0 0 0 ...
    ##  $ bad_address      : int [1:93462] 0 0 0 0 0 0 0 0 0 0 ...
    ##  $ age              : int [1:93462] 60 46 NA 70 78 NA 38 NA NA 65 ...
    ##  $ has_children     : int [1:93462] 0 1 0 0 1 0 1 0 0 0 ...
    ##  $ wealth_rating    : int [1:93462] 0 3 1 2 1 0 2 3 1 0 ...
    ##  $ interest_veterans: int [1:93462] 0 0 0 0 0 0 0 0 0 0 ...
    ##  $ interest_religion: int [1:93462] 0 0 0 0 1 0 0 0 0 0 ...
    ##  $ pet_owner        : int [1:93462] 0 0 0 0 0 0 1 0 0 0 ...
    ##  $ catalog_shopper  : int [1:93462] 0 0 0 0 1 0 0 0 0 0 ...
    ##  $ recency          : Factor w/ 2 levels "CURRENT","LAPSED": 1 1 1 1 1 1 1 1 1 1 ...
    ##  $ frequency        : Factor w/ 2 levels "FREQUENT","INFREQUENT": 1 1 1 1 1 2 2 1 2 2 ...
    ##  $ money            : Factor w/ 2 levels "HIGH","MEDIUM": 2 1 2 2 2 2 2 2 2 2 ...
    ##  - attr(*, "spec")=
    ##   .. cols(
    ##   ..   donated = col_double(),
    ##   ..   veteran = col_double(),
    ##   ..   bad_address = col_double(),
    ##   ..   age = col_double(),
    ##   ..   has_children = col_double(),
    ##   ..   wealth_rating = col_double(),
    ##   ..   interest_veterans = col_double(),
    ##   ..   interest_religion = col_double(),
    ##   ..   pet_owner = col_double(),
    ##   ..   catalog_shopper = col_double(),
    ##   ..   recency = col_character(),
    ##   ..   frequency = col_character(),
    ##   ..   money = col_character()
    ##   .. )
    ##  - attr(*, "problems")=<externalptr>

2.  Count the number of occurrences of each level of the `donated`
    variable using the `table()` function.

``` r
# Explore the dependent variable
table(donors$donated)
```

    ## 
    ##     0     1 
    ## 88751  4711

3.  Fit a logistic regression model using the formula interface and the
    three independent variables described above. `glm()` with the
    formula as its first argument and the dataframe as the `data`
    argument.the result as `donation_model`.
4.  Call `glm()` with the formula as its first argument and the
    dataframe as the `data` argument.
5.  Save the result as `donation_model`.
6.  Summarize the model object with `summary()`.

``` r
# Build the donation model
donation_model <- glm(donated ~ bad_address + interest_religion + interest_veterans, 
                      data = donors, family = "binomial")

# Summarize the model results
summary(donation_model)
```

    ## 
    ## Call:
    ## glm(formula = donated ~ bad_address + interest_religion + interest_veterans, 
    ##     family = "binomial", data = donors)
    ## 
    ## Deviance Residuals: 
    ##     Min       1Q   Median       3Q      Max  
    ## -0.3480  -0.3192  -0.3192  -0.3192   2.5678  
    ## 
    ## Coefficients:
    ##                   Estimate Std. Error  z value Pr(>|z|)    
    ## (Intercept)       -2.95139    0.01652 -178.664   <2e-16 ***
    ## bad_address       -0.30780    0.14348   -2.145   0.0319 *  
    ## interest_religion  0.06724    0.05069    1.327   0.1847    
    ## interest_veterans  0.11009    0.04676    2.354   0.0186 *  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## (Dispersion parameter for binomial family taken to be 1)
    ## 
    ##     Null deviance: 37330  on 93461  degrees of freedom
    ## Residual deviance: 37316  on 93458  degrees of freedom
    ## AIC: 37324
    ## 
    ## Number of Fisher Scoring iterations: 5

Great work! With the model built, you can now use it to make
predictions!

## Making a binary prediction

In the previous exercise, you used the `glm()` function to build a
logistic regression model of donor behavior. As with many of R’s machine
learning methods, you can apply the `predict()` function to the model
object to forecast future behavior. By default, `predict()` outputs
predictions in terms of *log odds* unless `type = "response"` is
specified. This converts the log odds to *probabilities*.

Because a logistic regression model estimates the *probability* of the
outcome, it is up to you to determine the threshold at which the
probability implies action. One must balance the extremes of being too
cautious versus being too aggressive. For example, if you were to
solicit only the people with a 99% or greater donation probability, you
may miss out on many people with lower estimated probabilities that
still choose to donate. This balance is particularly important to
consider for severely imbalanced outcomes, such as in this dataset where
donations are relatively rare.

The dataset `donors` and the model `donation_model` are already loaded
in your workspace.

**Steps**

1.  Use the `predict()` function to estimate each person’s donation
    probability. Use the `type` argument to get probabilities. Assign
    the predictions to a new column called `donation_prob`.
2.  Find the actual probability that an average person would donate by
    passing the `mean()` function the appropriate column of the `donors`
    dataframe.

``` r
# Estimate the donation probability
donors$donation_prob <- predict(donation_model, type = "response")

# Find the donation probability of the average prospect
mean(donors$donated)
```

    ## [1] 0.05040551

3.  Use `ifelse()` to predict a donation if their predicted donation
    probability is greater than average. Assign the predictions to a new
    column called `donation_pred`.
4.  Use the `mean()` function to calculate the model’s accuracy.

``` r
# Predict a donation if probability of donation is greater than average
donors$donation_pred <- ifelse(donors$donation_prob > 0.0504, 1, 0)

# Calculate the model's accuracy
mean(donors$donated == donors$donation_pred)
```

    ## [1] 0.794815

Nice work! With an accuracy of nearly 80%, the model seems to be doing
its job. But is it too good to be true?

## The limitations of accuracy

In the previous exercise, you found that the logistic regression model
made a correct prediction nearly 80% of the time. Despite this
relatively high accuracy, the result is misleading due to the rarity of
outcome being predicted.

> ## *Question*
>
> What would the accuracy have been if a model had simply predicted “no
> donation” for each person?<br> <br> ⬜ 80%<br> ⬜ 85%<br> ⬜ 90%<br>
> ✅ 95%<br>

Correct! With an accuracy of only 80%, the model is actually performing
WORSE than if it were to predict non-donor for every record.

## Model performance tradeoffs

Theory. Coming soon …

**1. Model performance tradeoffs**

As the previous exercise illustrated, rare events create challenges for
classification models. When one outcome is very rare, predicting the
opposite can result in a very high accuracy. This was the case in the
donations dataset; because only about 5% of people were donors,
predicting non-donation resulted in an overall accuracy of 95% but an
accuracy of zero on the outcome that mattered the most: the donations.In
cases like these, it may be necessary to to sacrifice a bit of overall
accuracy in order to better target the outcome of interest.

**2. Understanding ROC curves**

A visualization called an ROC curve provides a way to better understand
a model’s ability to distinguish between positive and negative
predictions the outcome of interest versus all others.To understand how
it works, imagine that you were working on a project where the positive
outcome is ‘X’ and the negative outcome is ‘O’. The classifier is trying
to distinguish between the two. If the classifier is poor, the X’s and
O’s will remain very mixed as shown here.The ROC curve depicts the
relationship between the percentage of positive examples as it relates
to the percentage of the other outcomes. Here, because the X’s and O’s
are even, the ROC curve makes a diagonal line showing that the
proportion of interesting examples rises evenly with the proportion of
negative examples.On the other hand, suppose we have a machine learning
model that is able to sort the examples of interest so they appear at
the front of the dataset. The outcomes might be arranged as shown here,
with more X’s on the left than on the right.When the ROC curve is drawn
for this arrangement, it is no longer on the diagonal because the model
is able to identify several positive examples for each negative example
it accidentally prioritized.The diagonal line is the baseline
performance for a very poor model. The further another curve is away
from this, the better it is performing. Conversely, a model that is very
close to the diagonal line is not performing very well at all. To

**3. Area under the ROC curve**

quantify this performance, a measurement called AUC, or Area Under the
Curve, is used. The AUC literally measures the area under the ROC
curve.The baseline model that is no better than random chance has an AUC
of 0-point-50, because it divides the 1-by-1 unit square perfectly in
half.A perfect model has an AUC of 1-point-00, with a curve all the way
in the upper-left of the square.Most real-world results are somewhere in
between. Generally speaking, the closer the AUC is to 1-point-00, the
better, but there are some cases where AUC can be misleading.

**4. Using AUC and ROC appropriately**

Curves of varying shapes can have the same AUC value. For this reason,
it is important to look not only at the AUC but also how the shape of
each curve indicates how a model is performing across the range of
predictions.For example, one model may do extremely well at identifying
a few easy cases at first but perform poorly on more difficult cases.
Another model may do just the opposite. As this figure shows, both may
end up with the same AUC.ROC curves are an important tool for comparing
models and selecting the best model for your specific project needs.
When used with a single model, it can help to visualize the tradeoff
between true positives and false positives for the outcome of interest.

**5. Let’s practice!**

In the next exercise, you’ll have the opportunity to plot an ROC curve
for the donation data, to see how well the model is really performing.

## Calculating ROC Curves and AUC

The previous exercises have demonstrated that accuracy is a very
misleading measure of model performance on imbalanced datasets. Graphing
the model’s performance better illustrates the tradeoff between a model
that is overly agressive and one that is overly passive.

In this exercise you will create a ROC curve and compute the area under
the curve (AUC) to evaluate the logistic regression model of donations
you built earlier.

**Steps**

1.  Load the `pROC` package.
2.  Create a ROC curve with `roc()` and the columns of actual and
    predicted donations. Store the result as `ROC`.
3.  Use `plot()` to draw the `ROC` object. Specify `col = "blue"` to
    color the curve blue.

``` r
# Load the pROC package
library(pROC)
```

    ## Type 'citation("pROC")' for a citation.

    ## 
    ## Attaching package: 'pROC'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     cov, smooth, var

``` r
# Create a ROC curve
ROC <- roc(donors$donated, donors$donation_prob)
```

    ## Setting levels: control = 0, case = 1

    ## Setting direction: controls < cases

``` r
# Plot the ROC curve
plot(ROC, col = "blue")
```

![](readme_files/figure-gfm/unnamed-chunk-26-1.png)<!-- -->

4.  Compute the area under the curve with `auc()`.

``` r
# Calculate the area under the curve (AUC)
auc(ROC)
```

    ## Area under the curve: 0.5102

Awesome job! Based on this visualization, the model isn’t doing much
better than baseline— a model doing nothing but making predictions at
random.

## Comparing ROC curves

Which of the following ROC curves illustrates the best model?

<img src="https://assets.datacamp.com/production/course_2906/datasets/lr_auc_compare.png" width="600" height="200" alt="3 ROC Curves">

> ## *Question*
>
> ???<br> <br> ⬜ AUC 0.55<br> ⬜ AUC 0.59<br> ⬜ AUC 0.62<br> ✅ I need
> more information!<br>

Correct! When AUC values are very close, it’s important to know more
about how the model will be used.

## Dummy variables, missing data, and interactions

Theory. Coming soon …

**1. Dummy variables, missing data, and interactions**

All of the predictors used in a regression analysis must be numeric.
This means that all categorical data must be represented as a number.
Missing data also poses a problem, as the empty value cannot be used to
make predictions.In this video, you will learn tips for preparing these
types of data to be used in a logistic regression model. You will also
learn about how to model the interactions among predictors an important
step in building more powerful predictive models.

**2. Dummy coding categorical data**

In chapter 1, you learned about dummy coding, which creates a set of
binary (one-zero) variables that represent each category except one that
serves as the reference group.Dummy coding is the most common method for
handling categorical data for logistic regression. The glm function will
automatically dummy code any factor type variables used in the model.
Simply apply the factor function to the data as in the example here.Keep
in mind that you may run into a case where a categorical feature is
represented with numbers, such as 1, 2, 3 for ‘hot’, ‘warm’, and ‘cold’.
Even in the case, it may be advisable to convert this to a factor. This
allows each category to have a unique impact on the outcome.

**3. Imputing missing data**

By default, the regression model will exclude any observation with
missing values on its predictors. This may not be a big deal for small
amounts of missing data, but can very quickly become a much larger
problem.With categorical missing data, a missing value can be treated
like any other category. You might construct categories for male,
female, other, and missing.When a numeric value is missing, the solution
is less clear. One potential solution uses a technique called
imputation. This fills, or imputes, the missing value with a guess about
what the value may be. A very simple strategy is called mean imputation,
which as you might expect, imputes the average. Because records having
missing data may differ systematically from those without, a binary 1/0
missing value indicator can be added to model the fact that a value was
imputed. Sometimes, this becomes one of the model’s most important
predictors!It is important to note that although this strategy is OK for
simple predictive models, it is not appropriate for every regression
application. More sophisticated forms of imputation use models to
predict the missing data based on the non-missing values.

**4. Interaction effects**

An interaction effect considers the fact that two predictors, when
combined, may have a different impact on an outcome than the sum of
their separate individual impacts. Their combination may strengthen,
weaken, or completely eliminate the impact of the individual
predictors.For example, obesity and smoking are both known to be harmful
to one’s health, but put together they may be even more harmful.
Alternatively, two predictors may be harmful when applied separately,
but when combined they neutralize, suppress, or nullify each other.Being
able to model these combinations is important for creating the best
predictive models. As illustrated here, the R formula interface uses the
multiplication symbol to create an interaction between two predictors.
The resulting model will include terms for each of the individual
components as well as the combined effect.

**5. Let’s practice!**

In the next series of exercises, you will apply dummy coding, missing
value imputation, and interaction effects to build a stronger donation
model.

## Coding categorical features

Sometimes a dataset contains numeric values that represent a categorical
feature.

In the `donors` dataset, `wealth_rating` uses numbers to indicate the
donor’s wealth level:

-   **0** = Unknown
-   **1** = Low
-   **2** = Medium
-   **3** = High

This exercise illustrates how to prepare this type of categorical
feature and examines its impact on a logistic regression model. The
dataframe `donors` is loaded in your workspace.

**Steps**

1.  Create a factor `wealth_levels` from the numeric `wealth_rating`
    with labels as shown above by passing the `factor()` function the
    column you want to convert, the individual levels, and the labels.
2.  Use `relevel()` to change the reference category to `Medium`. The
    first argument should be your new `factor` column.
3.  Build a logistic regression model using the column `wealth_levels`
    to predict `donated` and display the result with `summary()`.

``` r
# Convert the wealth rating to a factor
donors$wealth_levels <- factor(donors$wealth_rating, levels = c(0, 1, 2, 3), labels = c("Unknown", "Low", "Medium", "High"))

# Use relevel() to change reference category
donors$wealth_levels <- relevel(donors$wealth_levels, ref = "Medium")

# See how our factor coding impacts the model
model <- glm(donated ~ wealth_levels, data = donors, family = "binomial") 
summary(model)
```

    ## 
    ## Call:
    ## glm(formula = donated ~ wealth_levels, family = "binomial", data = donors)
    ## 
    ## Deviance Residuals: 
    ##     Min       1Q   Median       3Q      Max  
    ## -0.3320  -0.3243  -0.3175  -0.3175   2.4582  
    ## 
    ## Coefficients:
    ##                      Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)          -2.91894    0.03614 -80.772   <2e-16 ***
    ## wealth_levelsUnknown -0.04373    0.04243  -1.031    0.303    
    ## wealth_levelsLow     -0.05245    0.05332  -0.984    0.325    
    ## wealth_levelsHigh     0.04804    0.04768   1.008    0.314    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## (Dispersion parameter for binomial family taken to be 1)
    ## 
    ##     Null deviance: 37330  on 93461  degrees of freedom
    ## Residual deviance: 37323  on 93458  degrees of freedom
    ## AIC: 37331
    ## 
    ## Number of Fisher Scoring iterations: 5

Great job! What would the model output have looked like if this variable
had been left as a numeric column?

## Handling missing data

Some of the prospective donors have missing `age` data. Unfortunately, R
will exclude any cases with `NA` values when building a regression
model.

One workaround is to replace, or **impute**, the missing values with an
estimated value. After doing so, you may also create a missing data
indicator to model the possibility that cases with missing data are
different in some way from those without.

**Steps**

1.  Use `summary()` on `donors$age` to find the average age of prospects
    with non-missing data.

``` r
# Load data
donors <- read_csv("data/donors.csv") |> 
              mutate(across(where(is.numeric), as.integer),
                     across(where(is.character), as.factor))
```

    ## Rows: 93462 Columns: 13
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr  (3): recency, frequency, money
    ## dbl (10): donated, veteran, bad_address, age, has_children, wealth_rating, i...
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

``` r
# Find the average age among non-missing values
summary(donors$age)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
    ##    1.00   48.00   62.00   61.65   75.00   98.00   22546

2.  Use `ifelse()` and the test `is.na(donors$age)` to impute the
    average (rounded to 2 decimal places) for cases with missing `age`.
    Be sure to also ignore `NA`s.
3.  Create a binary dummy variable named `missing_age` indicating the
    presence of missing data using another `ifelse()` call and the same
    test.

``` r
# Impute missing age values with the mean age
donors$imputed_age <- ifelse(is.na(donors$age), round(mean(donors$age, na.rm = TRUE), 2), donors$age)

# Create missing value indicator for age
donors$missing_age <- ifelse(is.na(donors$age), 1, 0)
```

Super! This is one way to handle missing data, but be careful! Sometimes
missing data has to be dealt with using more complicated methods.

## Understanding missing value indicators

A missing value indicator provides a reminder that, before imputation,
there was a missing value present on the record.

> ## *Question*
>
> Why is it often useful to include this indicator as a predictor in the
> model?<br> <br> ⬜ A missing value may represent a unique category by
> itself<br> ⬜ There may be an important difference between records
> with and without missing data<br> ⬜ Whatever caused the missing value
> may also be related to the outcome<br> ✅ All of the above<br>

Yes! Sometimes a missing value says a great deal about the record it
appeared on!

## Building a more sophisticated model

One of the best predictors of future giving is a history of recent,
frequent, and large gifts. In marketing terms, this is known as R/F/M:

-   Recency
-   Frequency
-   Money

Donors that haven’t given both recently and frequently may be especially
likely to give again; in other words, the *combined* impact of recency
and frequency may be greater than the sum of the separate effects.

Because these predictors together have a greater impact on the dependent
variable, their joint effect must be modeled as an interaction. The
`donors` dataset has been loaded for you.

**Steps**

1.  Create a logistic regression model of `donated` as a function of
    `money` plus the interaction of `recency` and `frequency`. Use `*`
    to add the interaction term.
2.  Examine the model’s `summary()` to confirm the interaction effect
    was added.

``` r
# Build a recency, frequency, and money (RFM) model
rfm_model <- glm(donated ~ recency * frequency + money, data = donors, family = "binomial")

# Summarize the RFM model to see how the parameters were coded
summary(rfm_model)
```

    ## 
    ## Call:
    ## glm(formula = donated ~ recency * frequency + money, family = "binomial", 
    ##     data = donors)
    ## 
    ## Deviance Residuals: 
    ##     Min       1Q   Median       3Q      Max  
    ## -0.3696  -0.3696  -0.2895  -0.2895   2.7924  
    ## 
    ## Coefficients:
    ##                                   Estimate Std. Error z value Pr(>|z|)    
    ## (Intercept)                       -3.01142    0.04279 -70.375   <2e-16 ***
    ## recencyLAPSED                     -0.86677    0.41434  -2.092   0.0364 *  
    ## frequencyINFREQUENT               -0.50148    0.03107 -16.143   <2e-16 ***
    ## moneyMEDIUM                        0.36186    0.04300   8.415   <2e-16 ***
    ## recencyLAPSED:frequencyINFREQUENT  1.01787    0.51713   1.968   0.0490 *  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## (Dispersion parameter for binomial family taken to be 1)
    ## 
    ##     Null deviance: 37330  on 93461  degrees of freedom
    ## Residual deviance: 36938  on 93457  degrees of freedom
    ## AIC: 36948
    ## 
    ## Number of Fisher Scoring iterations: 6

3.  Save the model’s predicted probabilities as `rfm_prob`. Use the
    `predict()` function, and remember to set the `type` argument.
4.  Plot a ROC curve by using the function `roc()`. Remember, this
    function takes the column of outcomes and the vector of predictions.

``` r
# Compute predicted probabilities for the RFM model
rfm_prob <- predict(rfm_model, data = donors, type = "response")

# Plot the ROC curve for the new model
ROC <- roc(donors$donated, rfm_prob)
```

    ## Setting levels: control = 0, case = 1

    ## Setting direction: controls < cases

``` r
plot(ROC, col = "red")
```

![](readme_files/figure-gfm/unnamed-chunk-32-1.png)<!-- -->

5.  Compute the AUC for the new model with the function `auc()` and
    compare performance to the simpler model.

``` r
auc(ROC)
```

    ## Area under the curve: 0.5785

Great work! Based on the ROC curve, you’ve confirmed that past giving
patterns are certainly predictive of future giving.

## Automatic feature selection

Theory. Coming soon …

**1. Automatic feature selection**

Unlike some machine learning methods, regression typically asks the
human to specify the model’s predictors ahead of time. Thus, each of the
donation models you’ve built so far required a little bit of
fund-raising subject-matter expertise to identify the variables that may
be predictive of donations.Sometimes you may not have this type of
insight ahead of time. You may not know what all of the predictors mean,
or you may have so many predictors there’s no easy way to sort through
them all.A process called automatic feature selection can be used here,
but as you’ll soon see, with this great power comes great responsibility
to apply it carefully.

**2. Stepwise regression**

Stepwise regression involves building a regression model step by step,
evaluating each predictor to see which ones add value to the final
model. A procedure called backward deletion begins with a model
containing all of the predictors. It then checks to see what happens
when each one of the predictors is removed from the model. If removing a
predictor does not substantially impact the model’s ability to predict
the outcome, then it can be safely deleted. At each step, the predictor
that impacts the model the least is removed– assuming, of course, it has
minimal impact. This continues step-by-step until only important
predictors remain.The same idea applied in the other direction is called
forward selection. Beginning with a model containing no predictors, it
examines each potential predictor to see which one, if any, offers the
greatest improvement to the model’s predictive power. Predictors are
added step-by-step until no new predictors add substantial value to the
model.Keep in mind that although the figures here show the same final
model for backward and forward stepwise, this is not always the case. It
is possible that the two could come to completely different conclusions
about the most important predictors.

**3. Stepwise regression caveats**

This is just one of the potential caveats of stepwise regression. Not
only can backward and forward selection create completely different
models, but neither is guaranteed to find the best possible model.
Statisticians also raise concerns about the fact that a stepwise model
violates some of the principles that allow a regression model to explain
data as well as predict. Of course, if you only care about the
PREDICTIVE power, this may not be a very big concern– the use of
stepwise doesn’t mean the model’s predictions are worthless; it simply
means that the model may over or understate the importance of some of
the predictors.Perhaps most importantly, feature selection methods like
stepwise regression allow the model to be built in the absence of theory
or even common sense. This can result in a model that seems
counterintuitive in the real world.It may be best to consider stepwise
regression as just one tool for exploring potential models in the
absence of another good starting point.

**4. Let’s practice!**

You’ll have a chance to see how to build a stepwise regression model
during the next coding exercise.

## The dangers of stepwise regression

> ## *Question*
>
> In spite of its utility for feature selection, stepwise regression is
> not frequently used in disciplines outside of machine learning due to
> some important caveats. Which of these is NOT one of these
> concerns?<br> <br> ⬜ It is not guaranteed to find the best possible
> model<br> ✅ A stepwise model’s predictions can not be trusted<br> ⬜
> The stepwise regression procedure violates some statistical
> assumptions<br> ⬜ It can result in a model that makes little sense in
> the real world<br>

Correct! Though stepwise regression is frowned upon, it may still be
useful for building predictive models in the absence of another starting
place.

## Building a stepwise regression model

In the absence of subject-matter expertise, **stepwise regression** can
assist with the search for the most important predictors of the outcome
of interest.

In this exercise, you will use a forward stepwise approach to add
predictors to the model one-by-one until no additional benefit is seen.
The `donors` dataset has been loaded for you.

**Steps**

1.  Use the R formula interface with `glm()` to specify the base model
    with no predictors. Set the explanatory variable equal to `1`.
2.  Use the R formula interface again with `glm()` to specify the model
    with all predictors.
3.  Apply `step()` to these models to perform forward stepwise
    regression. Set the first argument to `null_model` and set
    `direction = "forward"`. This might take a while (up to 10 or 15
    seconds) as your computer has to fit quite a few different models to
    perform stepwise selection.
4.  Create a vector of predicted probabilities using the `predict()`
    function.
5.  Plot the ROC curve with `roc()` and `plot()` and compute the AUC of
    the stepwise model with `auc()`.

``` r
# Specify a null model with no predictors
null_model <- glm(donated ~ 1, data = donors, family = "binomial")

# Specify the full model using all of the potential predictors
full_model <- glm(donated ~ ., data = donors, family = "binomial")

# Use a forward stepwise algorithm to build a parsimonious model
step_model <- step(null_model, scope = list(lower = null_model, upper = full_model), direction = "forward")
```

    ## Start:  AIC=37332.13
    ## donated ~ 1

    ## Warning in add1.glm(fit, scope$add, scale = scale, trace = trace, k = k, : using
    ## the 70916/93462 rows from a combined fit

    ##                     Df Deviance   AIC
    ## + frequency          1    28502 37122
    ## + money              1    28621 37241
    ## + wealth_rating      1    28705 37326
    ## + has_children       1    28705 37326
    ## + age                1    28707 37328
    ## + imputed_age        1    28707 37328
    ## + interest_veterans  1    28709 37330
    ## + catalog_shopper    1    28710 37330
    ## + pet_owner          1    28711 37331
    ## <none>                    28714 37332
    ## + interest_religion  1    28712 37333
    ## + recency            1    28713 37333
    ## + bad_address        1    28714 37334
    ## + veteran            1    28714 37334
    ## 
    ## Step:  AIC=37024.77
    ## donated ~ frequency

    ## Warning in add1.glm(fit, scope$add, scale = scale, trace = trace, k = k, : using
    ## the 70916/93462 rows from a combined fit

    ##                     Df Deviance   AIC
    ## + money              1    28441 36966
    ## + wealth_rating      1    28493 37018
    ## + has_children       1    28494 37019
    ## + interest_veterans  1    28498 37023
    ## + catalog_shopper    1    28499 37024
    ## + age                1    28499 37024
    ## + imputed_age        1    28499 37024
    ## + pet_owner          1    28499 37024
    ## <none>                    28502 37025
    ## + interest_religion  1    28501 37026
    ## + recency            1    28501 37026
    ## + bad_address        1    28502 37026
    ## + veteran            1    28502 37027
    ## 
    ## Step:  AIC=36949.71
    ## donated ~ frequency + money

    ## Warning in add1.glm(fit, scope$add, scale = scale, trace = trace, k = k, : using
    ## the 70916/93462 rows from a combined fit

    ##                     Df Deviance   AIC
    ## + wealth_rating      1    28431 36942
    ## + has_children       1    28432 36943
    ## + interest_veterans  1    28438 36948
    ## + catalog_shopper    1    28438 36949
    ## + age                1    28438 36949
    ## + imputed_age        1    28438 36949
    ## + pet_owner          1    28439 36949
    ## <none>                    28441 36950
    ## + interest_religion  1    28440 36951
    ## + recency            1    28440 36951
    ## + bad_address        1    28441 36951
    ## + veteran            1    28441 36952
    ## 
    ## Step:  AIC=36945.26
    ## donated ~ frequency + money + wealth_rating

    ## Warning in add1.glm(fit, scope$add, scale = scale, trace = trace, k = k, : using
    ## the 70916/93462 rows from a combined fit

    ##                     Df Deviance   AIC
    ## + has_children       1    28421 36937
    ## + interest_veterans  1    28429 36945
    ## + catalog_shopper    1    28429 36945
    ## + age                1    28429 36945
    ## + imputed_age        1    28429 36945
    ## <none>                    28431 36945
    ## + pet_owner          1    28430 36945
    ## + interest_religion  1    28431 36947
    ## + recency            1    28431 36947
    ## + bad_address        1    28431 36947
    ## + veteran            1    28431 36947
    ## 
    ## Step:  AIC=36938.08
    ## donated ~ frequency + money + wealth_rating + has_children

    ## Warning in add1.glm(fit, scope$add, scale = scale, trace = trace, k = k, : using
    ## the 70916/93462 rows from a combined fit

    ##                     Df Deviance   AIC
    ## + pet_owner          1    28418 36937
    ## + catalog_shopper    1    28418 36937
    ## + interest_veterans  1    28418 36937
    ## <none>                    28421 36938
    ## + interest_religion  1    28420 36939
    ## + recency            1    28421 36940
    ## + age                1    28421 36940
    ## + imputed_age        1    28421 36940
    ## + bad_address        1    28421 36940
    ## + veteran            1    28421 36940
    ## 
    ## Step:  AIC=36932.08
    ## donated ~ frequency + money + wealth_rating + has_children + 
    ##     pet_owner

    ## Warning in add1.glm(fit, scope$add, scale = scale, trace = trace, k = k, : using
    ## the 70916/93462 rows from a combined fit

    ##                     Df Deviance   AIC
    ## <none>                    28418 36932
    ## + interest_veterans  1    28416 36932
    ## + catalog_shopper    1    28416 36932
    ## + age                1    28417 36933
    ## + imputed_age        1    28417 36933
    ## + recency            1    28417 36934
    ## + interest_religion  1    28417 36934
    ## + bad_address        1    28418 36934
    ## + veteran            1    28418 36934

``` r
# Estimate the stepwise donation probability
step_prob  <- predict(step_model, type = "response")

# Plot the ROC of the stepwise model
ROC <- roc(donors$donated, step_prob)
```

    ## Setting levels: control = 0, case = 1

    ## Setting direction: controls < cases

``` r
plot(ROC, col = "red")
```

![](readme_files/figure-gfm/unnamed-chunk-34-1.png)<!-- -->

``` r
auc(ROC)
```

    ## Area under the curve: 0.5855

Fantastic work! Despite the caveats of stepwise regression, it seems to
have resulted in a relatively strong model!

# 4. Chapter 4: Classification Trees

Classification trees use flowchart-like structures to make decisions.
Because humans can readily understand these tree structures,
classification trees are useful when transparency is needed, such as in
loan approval. We’ll use the Lending Club dataset to simulate this
scenario.

## Making decisions with trees

Theory. Coming soon …

**1. Making decisions with trees**

Sometimes a difficult or complex decision can be made simpler by
breaking it down into a series of smaller decisions. If you’re
considering whether to take a new job offer, you might define
requirements for accepting the position. Does it offer a high enough
salary? Does it have a long commute or require long hours? Does it
provide free coffee?Classification trees, also known as decision trees,
work much the same way. They are used to find a set of if/else
conditions that are helpful for taking action. As you will see soon,
because their decisions are easily understood without statistics, they
can be useful for business strategy, especially in areas where
transparency is needed, like loan application approval.

**2. A decision tree model**

Let’s start by considering the decision tree structure. As you might
expect, it closely resembles real-world trees. The goal is to model the
relationship between predictors and an outcome of interest.Beginning at
the root node, data flows through if/else decision nodes that split the
data according to its attributes.The branches indicate the potential
choices, and the leaf nodes denote the final decisions. These are also
known as terminal nodes because they terminate the decision making
process.

**3. Decision trees for prediction**

To understand how the tree structure is built, let’s consider a business
process like whether or not to provide someone a loan. After an
applicant fills out a form with personal information like income, credit
history, and loan purpose, the bank must quickly decide whether or not
the individual is likely to repay the debt.Using historical applicant
data and loan outcomes, a classification tree can be built to learn the
criteria that were most predictive of future loan repayment.

**4. Divide-and-conquer**

Growing the decision tree uses a process called divide-and-conquer
because it attempts to divide the dataset into partitions with similar
values for the outcome of interest. For loan applications, it needs to
separate the applicants who are likely to repay from those who are
likely to default on the debt.Suppose the tree considers two aspects of
each applicant: the credit score and the requested loan amount. This
figure visualizes these characteristics in relation to whether the loan
was repaid.To divide-and-conquer, the algorithm looks for an initial
split that creates the two most homogeneous groups.

**5. Divide-and-conquer**

First, it splits into groups of “high” and “low” credit scores.

**6. Divide-and-conquer**

Then, it divides-and-conquers again with another split, creating groups
for “high” and “low” requested loan amounts.

**7. The resulting tree**

Each one of these splits results in an if/else decision in the tree
structure, as shown here. If the credit score is low, it predicts “loan
default.” If the credit score is high and the loan value is large, it
also predicts “default.” Otherwise, it predicts “repaid.”Obviously, a
decision tree built on actual lending data is likely to be much more
complex. But this illustrates the basic process of how such a tree might
be built; you’ll learn more about how it works shortly. For now, let’s
ignore the implementation details to focus on putting the algorithm to
work.

**8. Building trees in R**

There are several packages that can be used to build classification
trees in R. One of the most widely used is called rpart for recursive
partitioning, a synonym for divide-and-conquer.Simply use the rpart
function with the R formula interface to specify the outcome and
predictors. The “class” parameter tells rpart to build a classification
tree.And like the other machine learning methods you’ve seen before, the
predict function obtains the predicted class values for the test
dataset.

**9. Let’s practice!**

In the next exercise, you’ll have a chance to apply what you’ve learned
to actual Lending Club loan data.

## Building a simple decision tree

The `loans` dataset contains 11,312 randomly-selected people who applied
for and later received loans from Lending Club, a US-based peer-to-peer
lending company.

You will use a decision tree to try to learn patterns in the outcome of
these loans (either repaid or default) based on the requested loan
amount and credit score at the time of application.

Then, see how the tree’s predictions differ for an applicant with good
credit versus one with bad credit.

The dataset `loans` is already in your workspace.

**Steps**

1.  Load the `rpart` package.

2.  Fit a decision tree model with the function `rpart()`.the R formula
    that specifies `outcome` as a function of `loan_amount` and
    `credit_score` as the first argument. the `control` argument alone
    for now. (You’ll learn more about that later!)

    -   Supply the R formula that specifies `outcome` as a function of
        `loan_amount` and `credit_score` as the first argument.
    -   Leave the `control` argument alone for now. (You’ll learn more
        about that later!)

``` r
# Load the rpart package
library(rpart)
library(forcats)

# Load data
loans <- read_csv("data/loans.csv", col_types = cols(.default = "f")) |> 
            filter(keep == "1") |> 
            mutate(outcome = default |> fct_recode(default = "1", repaid = "0") |> fct_rev()) |> 
            select(-c(keep, rand, default))

# Build a lending model predicting loan outcome versus loan amount and credit score
loan_model <- rpart(outcome ~ loan_amount + credit_score, data = loans, method = "class", control = rpart.control(cp = 0))
```

3.  Use `predict()` with the resulting loan model to predict the outcome
    for the `good_credit` applicant. Use the `type` argument to predict
    the `"class"` of the outcome.

``` r
# Create good_credit applicant
good_credit <- loans |> slice(8)

# Make a prediction for someone with good credit
predict(loan_model, good_credit, type = "class")
```

    ##      1 
    ## repaid 
    ## Levels: default repaid

4.  Do the same for the `bad_credit` applicant.

``` r
# Create bad_credit applicant
bad_credit <- loans |> slice(3)

# Make a prediction for someone with bad credit
predict(loan_model, bad_credit, type = "class")
```

    ##       1 
    ## default 
    ## Levels: default repaid

Great job! Growing a decision tree is certainly faster than growing a
real tree!

## Visualizing classification trees

Due to government rules to prevent illegal discrimination, lenders are
required to explain why a loan application was rejected.

The structure of classification trees can be depicted visually, which
helps to understand how the tree makes its decisions. The model
`loan_model` that you fit in the last exercise is in your workspace.

**Steps**

1.  Type `loan_model` to see a text representation of the classification
    tree.
2.  Load the `rpart.plot` package.
3.  Apply the `rpart.plot()` function to the loan model to visualize the
    tree.

``` r
# Examine the loan_model object
loan_model
```

    ## n= 11312 
    ## 
    ## node), split, n, loss, yval, (yprob)
    ##       * denotes terminal node
    ## 
    ##  1) root 11312 5654 repaid (0.4998232 0.5001768)  
    ##    2) credit_score=AVERAGE,LOW 9490 4437 default (0.5324552 0.4675448)  
    ##      4) credit_score=LOW 1667  631 default (0.6214757 0.3785243) *
    ##      5) credit_score=AVERAGE 7823 3806 default (0.5134859 0.4865141)  
    ##       10) loan_amount=HIGH 2472 1079 default (0.5635113 0.4364887) *
    ##       11) loan_amount=LOW,MEDIUM 5351 2624 repaid (0.4903756 0.5096244)  
    ##         22) loan_amount=LOW 1810  874 default (0.5171271 0.4828729) *
    ##         23) loan_amount=MEDIUM 3541 1688 repaid (0.4767015 0.5232985) *
    ##    3) credit_score=HIGH 1822  601 repaid (0.3298573 0.6701427) *

``` r
# Load the rpart.plot package
library(rpart.plot)

# Plot the loan_model with default settings
rpart.plot(loan_model)
```

![](readme_files/figure-gfm/unnamed-chunk-38-1.png)<!-- -->

4.  See how changing other plotting parameters impacts the visualization
    by running the supplied command.

``` r
# Plot the loan_model with customized settings
rpart.plot(loan_model, type = 3, box.palette = c("red", "green"), fallen.leaves = TRUE)
```

![](readme_files/figure-gfm/unnamed-chunk-39-1.png)<!-- -->

Awesome! What do you think of the fancy visualization?

## Understanding the tree’s decisions

The following image shows the structure of a classification tree
predicting loan outcome from the applicant’s credit score and requested
loan amount.

<img src="https://assets.datacamp.com/production/course_2906/datasets/dtree_plot.png" alt="Decision Tree Plot">

Based on this tree structure, which of the following applicants would be
predicted to repay the loan?

> ## *Question*
>
> ???<br> <br> ⬜ Someone with an average credit score and a low
> requested loan amount.<br> ⬜ Someone with a low credit score and a
> medium requested loan amount.<br> ⬜ Someone with a high requested
> loan amount and average credit.<br> ✅ Someone with a low requested
> loan amount and high credit.<br>

Correct! Using the tree structure, you can clearly see how the tree
makes its decisions.

## Growing larger classification trees

Theory. Coming soon …

**1. Growing larger classification trees**

Starting from a seed, real-world trees need the proper combination of
soil, water, air, and light to grow. Just like understanding these
principles helps you become a better gardener, knowing a bit about the
growing conditions of decision trees will help you produce more robust
classification models.In this lesson, you’ll learn more about how trees
grow, branch out, and sometimes even outgrow their environment.

**2. Choosing where to split**

Earlier, you learned that classification trees use divide-and-conquer to
identify splits that create the most “pure”, or homogeneous,
partitions.To see how this works in practice, let’s consider the tree
being built with data on loan applicants’ credit and requested amount.
For each of these predictors, the algorithm attempts a split on the
feature values and then calculates the purity of the resulting
partitions. The split that produces the purest partitions will be used
first.Here, split A divides the data into partitions with high and low
credit scores, while split B divides the data into large and small loan
amounts. Split B results in one very homogeneous partition, but its
other partition is very mixed. In comparison, split A results in two
partitions that are both relatively pure.As a result, the tree will
choose split A first. It then continues to divide-and-conquer further.

**3. Axis-parallel splits**

As the tree continues to grow, it creates smaller and more homogeneous
partitions as shown here. You may have noticed, however, that there was
an easier way to create a set of perfectly-pure partitions simply use a
diagonal line to divide the outcomes.Unfortunately, a decision tree
cannot discover this itself because a diagonal line requires a it to
consider two features at once, which is not possible in the
divide-and-conquer process.Instead, a decision tree always creates
so-called axis-parallel splits. This limitation is a potential weakness
of decision trees; they can be overly complex when modeling certain
patterns in the data.

**4. The problem of overfitting**

Generally speaking, decision trees have the tendency to become very
complex very quickly. A tree can happily divide-and-conquer until it
classifies every example correctly, or until it runs out of feature
values to split upon.When a tree has grown overly large and overly
complex, it may experience the problem of overfitting. Rather than
modeling the most important trends in the data, a tree that has been
over-fitted tends to model the noise. It focuses on extremely subtle
patterns that may not apply more generally.More-so than many other
machine learning algorithms, classification trees have this tendency to
overfit the dataset it is trained on.

**5. Evaluating model performance**

When a machine learning model has been over-fitted to its training
dataset, you must take care not to over-estimate how well the model will
perform in the future. Just because it perfectly classifies every
training example correctly does not mean it will do so on unseen
data.Thus, it is important to simulate unseen future data by
constructing a test dataset that the algorithm cannot use when growing
the tree. A simple method for constructing test sets involves holding
out a small random portion of the full dataset. This is a fair estimate
of the tree’s performance; if the tree performs much more poorly on the
test set than the training set, it suggests the model may have been
over-fitted.

**6. Let’s practice!**

You’ll get a chance to construct random test sets in the next exercises.
Good luck!

## Why do some branches split?

A classification tree grows using a **divide-and-conquer** process. Each
time the tree grows larger, it splits groups of data into smaller
subgroups, creating new branches in the tree.

> ## *Question*
>
> Given a dataset to divide-and-conquer, which groups would the
> algorithm prioritize to split first?<br> <br> ⬜ The group with the
> largest number of examples.<br> ⬜ The group creating branches that
> improve the model’s prediction accuracy.<br> ✅ The group it can split
> to create the greatest improvement in subgroup homogeneity.<br> ⬜ The
> group that has not been split already.<br>

Correct! Divide-and-conquer always looks to create the split resulting
in the greatest improvement to purity.

## Creating random test datasets

Before building a more sophisticated lending model, it is important to
hold out a portion of the loan data to simulate how well it will predict
the outcomes of future loan applicants.

As depicted in the following image, you can use 75% of the observations
for training and 25% for testing the model.

<img src="https://assets.datacamp.com/production/course_2906/datasets/dtree_test_set.png" height="150">

The `sample()` function can be used to generate a random sample of rows
to include in the training set. Simply supply it the total number of
observations and the number needed for training.

Use the resulting vector of row IDs to subset the loans into training
and testing datasets. The dataset `loans` is loaded in your workspace.

**Steps**

1.  Apply the `nrow()` function to determine how many observations are
    in the `loans` dataset, and the number needed for a 75% sample.

``` r
# Determine the number of rows for training
nrow(loans) * 0.75
```

    ## [1] 8484

2.  Use the `sample()` function to create an integer vector of row IDs
    for the 75% sample. The first argument of `sample()` should be the
    number of rows in the data set, and the second is the number of rows
    you need in your training set.
3.  Subset the `loans` data using the row IDs to create the training
    dataset. Save this as `loans_train`.
4.  Subset `loans` again, but this time select all the rows that are
    *not* in `sample_rows`. Save this as `loans_test`

``` r
# Create a random sample of row IDs
sample_rows <- sample(nrow(loans), nrow(loans) * 0.75)

# Create the training dataset
loans_train <- loans[sample_rows, ]

# Create the test dataset
loans_test <- loans[-sample_rows, ]
```

Amazing work! Creating a test set is an easy way to check your model’s
performance.

## Building and evaluating a larger tree

Previously, you created a simple decision tree that used the applicant’s
credit score and requested loan amount to predict the loan outcome.

Lending Club has additional information about the applicants, such as
home ownership status, length of employment, loan purpose, and past
bankruptcies, that may be useful for making more accurate predictions.

Using all of the available applicant data, build a more sophisticated
lending model using the random training dataset created previously.
Then, use this model to make predictions on the testing dataset to
estimate the performance of the model on future loan applications.

The `rpart` package is loaded into the workspace and the `loans_train`
and `loans_test` datasets have been created.

**Steps**

1.  Use `rpart()` to build a loan model using the training dataset and
    all of the available predictors. Again, leave the `control` argument
    alone.
2.  Applying the `predict()` function to the testing dataset, create a
    vector of predicted outcomes. Don’t forget the `type` argument.
3.  Create a `table()` to compare the predicted values to the actual
    `outcome` values.

``` r
# Grow a tree using all of the available applicant data
loan_model <- rpart(outcome ~ ., data = loans_train, method = "class", control = rpart.control(cp = 0))

# Make predictions on the test dataset
loans_test$pred <- predict(loan_model, loans_test, type = "class")

# Examine the confusion matrix
table(loans_test$pred, loans_test$outcome)
```

    ##          
    ##           default repaid
    ##   default     780    613
    ##   repaid      617    818

4.  Compute the accuracy of the predictions using the `mean()` function.

``` r
# Compute the accuracy on the test dataset
mean(loans_test$pred == loans_test$outcome)
```

    ## [1] 0.5650636

Awesome! How did adding more predictors change the model’s performance?

## Conducting a fair performance evaluation

Holding out test data reduces the amount of data available for growing
the decision tree. In spite of this, it is very important to evaluate
decision trees on data it has not seen before.

Which of these is NOT true about the evaluation of decision tree
performance?

> ## *Question*
>
> ???<br> <br> ⬜ Decision trees sometimes overfit the training
> data.<br> ✅ The model’s accuracy is unaffected by the rarity of the
> outcome.<br> ⬜ Performance on the training dataset can overestimate
> performance on future data.<br> ⬜ Creating a test dataset simulates
> the model’s performance on unseen data.<br>

Right! Rare events cause problems for many machine learning approaches.

## Tending to classification trees

Theory. Coming soon …

**1. Tending to classification trees**

In the previous video, you learned that decision trees have a tendency
to grow overly large and complex very quickly. If this were to happen to
trees in your yard, you’d be outside with clippers, looking to trim away
some of the excess greenery. Grooming healthy classification trees
likewise requires this kind of attention. In this lesson, you’ll learn
about pruning strategies, which help ensure the trees are just right not
too large and not too small.

**2. Pre-pruning**

One method of preventing a tree from becoming too large involves
stopping the growing process early. This is known as pre-pruning.Perhaps
the simplest approach to pre-pruning stops divide-and-conquer once the
tree reaches a predefined size. The figure here shows a tree that has
been stopped early because it reached a maximum depth of three levels.
Another pre-pruning method requires a minimum number of observations at
a node in order for a split to occur. For example, this figure stops the
tree from growing any branch with fewer than 10 observations.Both of
these pre-pruning strategies prevent the tree from growing too large.
However, a tree stopped too early may fail to discover subtle or
important patterns it might have discovered later.

**3. Post-pruning**

To address this concern, it is also possible to grow a very large tree,
knowing that it will be overly complex, but then prune it back to reduce
the size. This is known as post-pruning.In post-pruning, nodes and
branches with only a minor impact on the tree’s overall accuracy are
removed after the fact. This figure illustrates a tree that grew to four
levels deep, but had a branch pruned away because its presence did not
substantially improve the classification accuracy.The relationship
between the tree’s complexity and the accuracy can be depicted visually
as illustrated here. As the tree becomes increasingly complex, the model
makes fewer errors. However, though the performance improves a lot at
first, it then improves only slightly for the later increases in
complexity. This trend provides insight into the optimal point at which
to prune the tree; simply look for the point at which the curve
flattens. The horizontal dotted line identifies the point at which the
error rate becomes statistically similar to the most complex model.
Typically, you should prune the tree at the complexity level that
results in a classification error rate just under this line.

**4. Pre- and post-pruning with R**

The rpart decision tree package provides a function for creating this
visualization, as well as performing pre- and post-pruning.Pre-pruning
is performed when building the decision tree model. The
rpart-dot-control function can be supplied with a maxdepth parameter
that controls the maximum depth of the decision tree, or a minsplit
parameter that dictates the minimum number of observations a branch must
contain in order for the tree to be allowed to split. Then, simply
supply the resulting control object to the rpart function when building
the tree.Post-pruning is applied to a decision tree model that has been
previously built. The plotcp function will generate a visualization of
the error rate versus model complexity, which provides insight into the
optimal cutpoint for pruning. When this value has been identified, it
can be supplied to the prune function’s complexity parameter, cp, to
create a simpler pruned tree.

**5. Let’s practice!**

In the next several exercises, you will have a chance to apply both pre-
and post-pruning methods to the Lending Club data to examine the impact
on the tree complexity and test set accuracy. Let’s see what happens!

## Preventing overgrown trees

The tree grown on the full set of applicant data grew to be extremely
large and extremely complex, with hundreds of splits and leaf nodes
containing only a handful of applicants. This tree would be almost
impossible for a loan officer to interpret.

Using the **pre-pruning** methods for early stopping, you can prevent a
tree from growing too large and complex. See how the `rpart` control
options for maximum tree depth and minimum split count impact the
resulting tree.

`rpart` is loaded.

**Steps**

1.  Use `rpart()` to build a loan model using the training dataset and
    all of the available predictors. the model `control`s using
    `rpart.control()` with parameters `cp` set to `0` and `maxdepth` set
    to `6`.

    -   Set the model `control`s using `rpart.control()` with parameters
        `cp` set to `0` and `maxdepth` set to `6`. 2.. See how the test
        set accuracy of the simpler model compares to the original
        accuracy of 58.3%.create a vector of predictions using the
        `predict()` function.the predictions to the actual outcomes and
        use `mean()` to calculate the accuracy.

    -   First create a vector of predictions using the `predict()`
        function.

    -   Compare the predictions to the actual outcomes and use `mean()`
        to calculate the accuracy.

``` r
# Grow a tree with maxdepth of 6
loan_model <- rpart(outcome ~ ., data = loans_train, method = "class", control = rpart.control(cp = 0, maxdepth = 6))

# Make a class prediction on the test set
loans_test$pred <- predict(loan_model, loans_test, type = "class")

# Compute the accuracy of the simpler tree
mean(loans_test$pred == loans_test$outcome)
```

    ## [1] 0.5753182

3.  In the model controls, remove `maxdepth` and add a minimum split
    parameter, `minsplit`, set to `500`.

``` r
# Swap maxdepth for a minimum split of 500 
loan_model <- rpart(outcome ~ ., data = loans_train, method = "class", control = rpart.control(cp = 0, minsplit = 500))

# Run this. How does the accuracy change?
loans_test$pred <- predict(loan_model, loans_test, type = "class")
mean(loans_test$pred == loans_test$outcome)
```

    ## [1] 0.5753182

Nice work! It may seem surprising, but creating a simpler decision tree
may actually result in greater performance on the test dataset.

## Creating a nicely pruned tree

Stopping a tree from growing all the way can lead it to ignore some
aspects of the data or miss important trends it may have discovered
later.

By using **post-pruning**, you can intentionally grow a large and
complex tree then prune it to be smaller and more efficient later on.

In this exercise, you will have the opportunity to construct a
visualization of the tree’s performance versus complexity, and use this
information to prune the tree to an appropriate level.

The `rpart` package is loaded into the workspace, along with
`loans_test` and `loans_train`.

**Steps**

1.  Use all of the applicant variables and no pre-pruning to create an
    overly complex tree. Make sure to set `cp = 0` in `rpart.control()`
    to prevent pre-pruning.
2.  Create a complexity plot by using `plotcp()` on the model.

``` r
# Grow an overly complex tree
loan_model <- rpart(outcome ~ ., data = loans_train, method = "class", control = rpart.control(cp = 0))

# Examine the complexity plot
plotcp(loan_model)
```

![](readme_files/figure-gfm/unnamed-chunk-46-1.png)<!-- -->

3.  Based on the complexity plot, prune the tree to a complexity of
    0.0014 using the `prune()` function with the tree and the complexity
    parameter.
4.  Compare the accuracy of the pruned tree to the original accuracy of
    58.3%. To calculate the accuracy use the `predict()` and `mean()`
    functions.

``` r
# Prune the tree
loan_model_pruned <- prune(loan_model, cp = 0.0014)

# Compute the accuracy of the pruned tree
loans_test$pred <- predict(loan_model_pruned, loans_test, type = "class")
mean(loans_test$pred == loans_test$outcome)
```

    ## [1] 0.5880481

Great job! As with pre-pruning, creating a simpler tree actually
improved the performance of the tree on the test dataset.

## Why do trees benefit from pruning?

Classification trees can grow indefinitely, until they are told to stop
or run out of data to divide-and-conquer.

Just like trees in nature, classification trees that grow overly large
can require pruning to reduce the excess growth. However, this generally
results in a tree that classifies fewer training examples correctly.

> ## *Question*
>
> Why, then, are pre-pruning and post-pruning almost always used?<br>
> <br> ⬜ Simpler trees are easier to interpret<br> ⬜ Simpler trees
> using early stopping are faster to train<br> ⬜ Simpler trees may
> perform better on the testing data<br> ✅ All of the above<br>

Yes! There are many benefits to creating carefully pruned decision
trees!

## Seeing the forest from the trees

Theory. Coming soon …

**1. Seeing the forest from the trees**

Consider the ways that decision trees parallel trees in the natural
environment: from a root node that grows into branches and leaf nodes
that sometimes need pruning, you might think that by now we would have
exhausted the tree metaphors.In fact, there is one more.Just as living
trees can be grouped as a forest, a number of classification trees can
be combined into a collection known as a decision tree forest. For
reasons that you will soon see, these forests are among the most
powerful machine learning classifiers, yet remain remarkably efficient
and easy to use.

**2. Understanding random forests**

Because of their combine versatility and power, decision tree forests
have become one of the most popular approaches for classification.This
power does not come from a single tree that has grown large and complex,
but rather from a collection of smaller, simpler trees that together
reflect the data’s complexity. Each of the forest’s trees is diverse,
and may reflect some subtle pattern in the outcome to be
modeled.Generating this diversity is the key to building powerful
decision tree forests. However, if you were to grow 100 trees on the
same set of data, you’d have 100 times the same tree. Growing diverse
trees requires the growing conditions to be varied from tree to
tree.This is done by allocating each tree a random subset of data; one
may receive a vastly different training set than another. The term
random forests refers to a specific growing algorithm in which both the
features and examples may differ from tree to tree.

**3. Making decisions as an ensemble**

It seems somewhat counterintuitive to think that a group of trees built
on small, random subsets of the data could perform any better than a
single really complex tree that had the benefit of learning the entire
dataset.But the forest’s power is based on the same principles that
govern successful team work in business or on the athletic field. In
these cases, it is certainly advantageous to have team members that are
extremely good at some tasks. However, these people typically have
weaknesses in other areas. For this reason, it is even better for the
team to have members with complementary skills. Even if none of the
members is especially strong, good teamwork usually wins.Machine
learning methods like random forests that apply this principle are
called ensemble methods. All ensemble methods are based on the principle
that weaker learners become stronger with teamwork. In a random forest,
each tree is asked to make a prediction, and the group’s overall
prediction is determined by a majority vote. Though each tree may
reflect only a narrow portion of the data, the overall consensus is
strengthened by these diverse perspectives.

**4. Random forests in R**

The R package randomForest implements the random forest algorithm. The
function offers two parameters of note.The first, ntree, dictates the
number of trees to include in the forest. Setting this sufficiently
large will ensure good representation of the complete set of data. Don’t
worry even with a large number of trees, the model typically runs
relatively quickly as it uses only a portion of the full dataset.The
second parameter, mtry, is the number of features selected at random for
each tree. By default, it uses the square root of the total number of
predictors. Generally, this parameter is OK to leave as is.As usual, the
predict function uses the model to make predictions.

**5. Let’s practice!**

By now I’m sure you’re excited to see a random forest in action. In the
next exercises you’ll have a chance to grow one and compare its
performance to the best decision tree.

## Understanding random forests

Groups of classification trees can be combined into an **ensemble** that
generates a single prediction by allowing the trees to “vote” on the
outcome.

> ## *Question*
>
> Why might someone think that this could result in more accurate
> predictions than a single tree?<br> <br> ⬜ Each tree in the forest is
> larger and more complex than a typical single tree.<br> ⬜ Every tree
> in a random forest uses the complete set of predictors.<br> ✅ \[The
> diversity among the trees may lead it to discover more subtle
> patterns.\]<br> ⬜ The random forest is not affected by noisy
> data.<br>

Yes! The teamwork-based approach of the random forest may help it find
important trends a single tree may miss.

## Building a random forest model

In spite of the fact that a forest can contain hundreds of trees,
growing a decision tree forest is perhaps even easier than creating a
single highly-tuned tree.

Using the `randomForest` package, build a random forest and see how it
compares to the single trees you built previously.

Keep in mind that due to the random nature of the forest, the results
may vary slightly each time you create the forest.

**Steps**

1.  Load the `randomForest` package.
2.  Build a random forest model using all of the loan application
    variables. The `randomForest` function also uses the formula
    interface.
3.  Compute the accuracy of the random forest model to compare to the
    original tree’s accuracy of 58.3% using `predict()` and `mean()`.

``` r
# Load the randomForest package
library(randomForest)
```

    ## randomForest 4.7-1

    ## Type rfNews() to see new features/changes/bug fixes.

    ## 
    ## Attaching package: 'randomForest'

    ## The following object is masked from 'package:dplyr':
    ## 
    ##     combine

``` r
# Build a random forest model
loan_model <- randomForest(outcome ~ ., data = loans_train)

# Compute the accuracy of the random forest
loans_test$pred <- predict(loan_model, loans_test)
mean(loans_test$pred == loans_test$outcome)
```

    ## [1] 0.6004243

Wow! Great job! Now you’re really a classification pro! Classification
is only one of the problems you’ll have to tackle as a data scientist.
Check out some other machine learning courses to learn more about
supervised and unsupervised learning.
