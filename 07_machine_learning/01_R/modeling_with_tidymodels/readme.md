Modeling with tidymodels in R
================
Joschka Schwarz

-   [1. Machine Learning with
    tidymodels](#1-machine-learning-with-tidymodels)
    -   [The tidymodels ecosystem](#the-tidymodels-ecosystem)
    -   [Tidymodels packages](#tidymodels-packages)
    -   [Creating training and test
        datasets](#creating-training-and-test-datasets)
    -   [Distribution of outcome variable
        values](#distribution-of-outcome-variable-values)
    -   [Linear regression with
        tidymodels](#linear-regression-with-tidymodels)
    -   [Fitting a linear regression
        model](#fitting-a-linear-regression-model)
    -   [Exploring estimated model
        parameters](#exploring-estimated-model-parameters)
    -   [Predicting home selling
        prices](#predicting-home-selling-prices)
    -   [Evaluating model performance](#evaluating-model-performance)
    -   [Model performance metrics](#model-performance-metrics)
    -   [R squared plot](#r-squared-plot)
    -   [Complete model fitting process with
        last_fit()](#complete-model-fitting-process-with-last_fit)
-   [2. Classification Models](#2-classification-models)
    -   [Classification models](#classification-models)
    -   [Data resampling](#data-resampling)
    -   [Fitting a logistic regression
        model](#fitting-a-logistic-regression-model)
    -   [Combining test dataset
        results](#combining-test-dataset-results)
    -   [Assessing model fit](#assessing-model-fit)
    -   [Calculating metrics from the confusion
        matrix](#calculating-metrics-from-the-confusion-matrix)
    -   [Evaluating performance with
        yardstick](#evaluating-performance-with-yardstick)
    -   [Creating custom metric sets](#creating-custom-metric-sets)
    -   [Visualizing model performance](#visualizing-model-performance)
    -   [Plotting the confusion matrix](#plotting-the-confusion-matrix)
    -   [ROC curves and area under the ROC
        curve](#roc-curves-and-area-under-the-roc-curve)
    -   [Automating the modeling
        workflow](#automating-the-modeling-workflow)
    -   [Streamlining the modeling
        process](#streamlining-the-modeling-process)
    -   [Collecting predictions and creating custom
        metrics](#collecting-predictions-and-creating-custom-metrics)
    -   [Complete modeling workflow](#complete-modeling-workflow)
-   [3. Feature Engineering](#3-feature-engineering)
    -   [Feature engineering](#feature-engineering)
    -   [Exploring recipe objects](#exploring-recipe-objects)
    -   [Creating recipe objects](#creating-recipe-objects)
    -   [Training a recipe object](#training-a-recipe-object)
    -   [Numeric predictors](#numeric-predictors)
    -   [Discovering correlated
        predictors](#discovering-correlated-predictors)
    -   [Removing correlated predictors with
        recipes](#removing-correlated-predictors-with-recipes)
    -   [Multiple feature engineering
        steps](#multiple-feature-engineering-steps)
    -   [Nominal predictors](#nominal-predictors)
    -   [Applying step_dummy() to
        predictors](#applying-step_dummy-to-predictors)
    -   [Ordering of step\_\*() functions](#ordering-of-step_-functions)
    -   [Complete feature engineering
        pipeline](#complete-feature-engineering-pipeline)
    -   [Complete modeling workflow](#complete-modeling-workflow-1)
    -   [Feature engineering process](#feature-engineering-process)
    -   [Model training and prediction](#model-training-and-prediction)
    -   [Model performance metrics](#model-performance-metrics-1)
-   [4. Workflows and Hyperparameter
    Tuning](#4-workflows-and-hyperparameter-tuning)
    -   [Machine learning workflows](#machine-learning-workflows)
    -   [Exploring the loans dataset](#exploring-the-loans-dataset)
    -   [Specifying a model and recipe](#specifying-a-model-and-recipe)
    -   [Creating workflows](#creating-workflows)
    -   [Estimating performance with cross
        validation](#estimating-performance-with-cross-validation)
    -   [Measuring performance with cross
        validation](#measuring-performance-with-cross-validation)
    -   [Cross validation with logistic
        regression](#cross-validation-with-logistic-regression)
    -   [Comparing model performance
        profiles](#comparing-model-performance-profiles)
    -   [Hyperparameter tuning](#hyperparameter-tuning)
    -   [Setting model hyperparameters](#setting-model-hyperparameters)
    -   [Random grid search](#random-grid-search)
    -   [Exploring tuning results](#exploring-tuning-results)
    -   [Selecting the best model](#selecting-the-best-model)
    -   [Finalizing a workflow](#finalizing-a-workflow)
    -   [Training a finalized workflow](#training-a-finalized-workflow)
    -   [Congratulations!](#congratulations)

**Short Description**

Learn to streamline your machine learning workflows with tidymodels.

**Long Description**

Tidymodels is a powerful suite of R packages designed to streamline
machine learning workflows. Learn to split datasets for
cross-validation, preprocess data with tidymodels’ recipe package, and
fine-tune machine learning algorithms. You’ll learn key concepts such as
defining model objects and creating modeling workflows. Then, you’ll
apply your skills to predict home prices and classify employees by their
risk of leaving a company.

# 1. Machine Learning with tidymodels

In this chapter, you’ll explore the rich ecosystem of R packages that
power tidymodels and learn how they can streamline your machine learning
workflows. You’ll then put your tidymodels skills to the test by
predicting house sale prices in Seattle, Washington.

## The tidymodels ecosystem

Theory. Coming soon …

**The tidymodels ecosystem**

Hi, my name is David Svancer. I am a data scientist and adjunct
professor of Business Analytics at George Mason University. This course
will introduce you to tidymodels, a powerful R package for machine
learning.

**Collection of machine learning packages**

Tidymodels is a collection of R packages designed to support machine
learning model development.

-   The `rsample` package supports data resampling, and is used for
    creating random subsets of a dataset for different activities in the
    modeling process.
-   The `recipes` package contains functions for transforming data for
    modeling. This step is often called feature engineering.
-   The `parsnip` package is an interface to the vast modeling libraries
    available in R. It is used for specifying and fitting models as well
    as obtaining model predictions.
-   The `tune` and `dials` packages provide functionality for
    fine-tuning models in order to achieve optimal prediction accuracy.
-   The `yardstick` package provides metrics for evaluating the quality
    of model predictions. Tidymodels was designed to easily iterate over
    model fitting, tuning, and evaluation, all with a unified R syntax!

**Supervised machine learning**

Tidymodels is primarily used for supervised machine learning, where
algorithms learn patterns from labeled data.There are two types of
supervised machine learning. Regression deals with predicting
quantitative outcomes such as home selling prices.Classification deals
with predicting categorical outcomes, such as whether an employee will
leave a company. The following dataset can be used for this task, where
each row represents an employee and each column is a characteristic of
that employee.The left_company column provides the labels, or true
outcome, for each row and is known as an outcome variable in tidymodels.
All other variables are assigned the role of predictor variable.

**Data resampling**

The first step in modeling is to randomly split the original data into
training and test datasets. This guards against a phenomenon known as
overfitting, where a model memorizes the patterns in a dataset and then
performs poorly on new data. Commonly 75% of the data is allocated into
training and 25% into test.The training data is used for feature
engineering and modeling while the test data is used to estimate the
model’s performance on previously unseen data.

**Data: Fuel efficiency data**

We will be using the mpg dataset to demonstrate regression modeling with
tidymodels. It contains fuel efficiency data for over 200 popular cars.
The outcome variable is the hwy column, which represents the average
highway miles per gallon of each car.

**Data resampling with tidymodels**

To begin the modeling process, we load the tidymodels package and create
a data split object with the initial_split function. A data split object
specifies instructions for creating training and test
datasets.Initial_split takes a dataset as the first argument, the
proportion to allocate to training as the second, and a stratification
variable. The outcome variable is used for stratification so that its
values have a similar range in both datasets. This prevents fitting a
model to data that is different from the typical data it will be given
in the future.By passing mpg_split to the training() function, we create
the mpg_training dataset that we’ll use to train our model, which
contains a random 75% of the data.Passing mpg_split to the testing()
function creates mpg_test, which we’ll use to evaluate our model’s
performance.

**12. Home sales data**

In the chapter exercises, you will be working with the home_sales data
which contains information on homes sold in the Seattle, Washington area
between 2015 and 2016. The outcome variable is the selling_price column.

## Tidymodels packages

`tidymodels` is a collection of machine learning packages designed to
simplify the machine learning workflow in R.

In this exercise, you will assign each package within the tidymodels
ecosystem to its corresponding process within the machine learning
workflow.

**Steps**

Drag each tidymodels package into the bucket that corresponds to its
functionality in the machine learning workflow:

| Data resampling and feature engineering | Model fitting and tuning | Model evaluation |
|-----------------------------------------|--------------------------|------------------|
| rsample                                 | dials                    | yardstick        |
| recipes                                 | tune                     |                  |
|                                         | dials                    |                  |

## Creating training and test datasets

The `rsample` package is designed to create training and test datasets.
Creating a test dataset is important for estimating how a trained model
will likely perform on new data. It also guards against overfitting,
where a model memorizes patterns that exist only in the training data
and performs poorly on new data.

In this exercise, you will create training and test datasets from the
`home_sales` data. This data contains information on homes sold in the
Seattle, Washington area between 2015 and 2016.

The outcome variable in this data is `selling_price`.

The `tidymodels` package will be pre-loaded in every exercise in the
course. The `home_sales` tibble has also been loaded for you.

**Steps**

1.  Create an `rsample` object, `home_split`, that contains the
    instructions for randomly splitting the `home_sales` data into a
    training and test dataset.
2.  Allocate 70% of the data into training and stratify the results by
    `selling_price`.

``` r
# Load packages
# library(tidymodels)
library(rsample)

# Load data
home_sales <- readRDS("data/home_sales.rds")

# Create a data split object
home_split <- initial_split(home_sales, 
                            prop = 0.7, 
                            strata = selling_price)
```

3.  Create a training dataset from `home_split` called `home_training`.
4.  Create the `home_test` tibble by passing `home_split`into the
    appropriate function for generating test datasets.

``` r
# Load package
library(magrittr)

# Create the training data
home_training <- home_split %>%
  training()

# Create the test data
home_test <- home_split %>% 
  testing()
```

5.  Check the number of rows in the training and test datasets by
    passing them into the `nrow()` function.

``` r
# Check number of rows in each dataset
nrow(home_training)
```

    ## [1] 1042

``` r
nrow(home_test)
```

    ## [1] 450

Great job! Since the `home_sales` data has nearly 1,500 rows, it is
appropriate to allocate more rows into the test set. This will provide
more data for the model evaluation step.

## Distribution of outcome variable values

Stratifying by the outcome variable when generating training and test
datasets ensures that the outcome variable values have a similar range
in both datasets.

Since the original data is split at random, stratification avoids
placing all the expensive homes in `home_sales` into the test dataset,
for example. In this case, your model would most likely perform poorly
because it was trained on less expensive homes.

In this exercise, you will calculate summary statistics for the
`selling_price` variable in the training and test datasets. The
`home_training` and `home_test` tibbles have been loaded from the
previous exercise.

**Steps**

1.  Calculate the minimum, maximum, mean, and standard deviation of the
    `selling_price` variable in `home_training`.

``` r
# Load package
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
# Distribution of selling_price in training data
home_training %>% 
  summarize(min_sell_price = min(selling_price),
            max_sell_price = max(selling_price),
            mean_sell_price = mean(selling_price),
            sd_sell_price = sd(selling_price))
```

    ## # A tibble: 1 × 4
    ##   min_sell_price max_sell_price mean_sell_price sd_sell_price
    ##            <dbl>          <dbl>           <dbl>         <dbl>
    ## 1         350000         650000         479235.        81014.

2.  Calculate the minimum, maximum, mean, and standard deviation of the
    `selling_price` variable in `home_test`.

``` r
# Distribution of selling_price in test data
home_test %>% 
  summarize(min_sell_price = min(selling_price),
            max_sell_price = max(selling_price),
            mean_sell_price = mean(selling_price),
            sd_sell_price = sd(selling_price))
```

    ## # A tibble: 1 × 4
    ##   min_sell_price max_sell_price mean_sell_price sd_sell_price
    ##            <dbl>          <dbl>           <dbl>         <dbl>
    ## 1         350000         650000         478735.        80987.

Excellent work! The minimum and maximum selling prices in both datasets
are the same. The mean and standard deviation are also similar.
Stratifying by the outcome variable ensures the model fitting process is
performed on a representative sample of the original data.

## Linear regression with tidymodels

Theory. Coming soon …

**1. Linear regression with tidymodels**

In this section, we will fit our first machine learning model, linear
regression!

**2. Model fitting with parsnip**

Within the tidymodels ecosystem, the parsnip package is used for fitting
models and calculating predictions.

**3. Linear regression model**

Linear regression estimates the outcome variable as a linear function of
the predictor variable. If we are predicting hwy using cty as a
predictor from the mpg dataset, then the functional form of the model is
written as hwy equals beta0 plus beta1 times cty. Beta0 and beta1 are
known as model parameters, and represent the intercept and slope of the
line, respectively.

**4. Linear regression model**

The model parameters are estimated using the training data. The
intercept and slope were estimated to be 0 point 77 and 1 point 35,
respectively using the mpg_training data. The blue line in the plot
graphs our estimated regression line with the mpg training data values.

**5. Model formulas**

Before parsnip can fit a model to data, it requires columns to be
assigned to either an outcome or predictor role. This is done with R
formulas and follows the general form of outcome variable on the left
followed by a tilde and then by one or more predictor variables
separated by plus signs.To use all available columns in a data frame as
predictors, the shorthand notation of outcome tilde dot can be used.To
predict hwy using cty, we would use hwy tilde cty in our model formula.

**6. The parsnip package**

The parsnip package provides a unified syntax for model specification in
R. Building a parsnip model object involves specifying the model type,
such as linear regression, the computational engine, which specifies the
underlying package that will be used to fit the model, and the mode
which is either regression or classification. With parsnip, it is
possible to fit a linear regression with the traditional ‘lm’ engine
provided in base R or the ‘stan’ engine, which estimates the model
parameters using Bayesian parameter estimation. The power of parsnip is
that it combines a large number of machine learning packages that fit
the same model type using common syntax.

**7. Fitting a linear regression model**

To fit our linear regression model, we start by defining a parsnip model
object named lm_model. We use the linear_reg() function to create a
linear regression model object. Then we pass it into the set_engine
function where we specify the ‘lm’ engine. Finally we pass the results
into the set_mode() function where we specify ‘regression’ since we are
predicting a numeric outcome variable.To train our model, we pass
lm_model to the fit() function and provide a model formula and the data
on which to train the model.

**8. Obtaining the estimated parameters**

Once the model is trained it can be passed into the tidy() function to
create a model summary tibble, which is a specialized data frame used in
tidymodels. The term and estimate columns provide the estimated model
parameters.

**9. Making predictions**

Model predictions are obtained by passing the trained model, lm_fit, to
the predict() function. The new_data argument specifies the dataset on
which to predict new values and is typically set to the testing
dataset.The predict() function returns standardized output that is
always a tibble, has the same row order as the data in the new_data
argument, and a column named dot-pred with model predictions.

**10. Adding predictions to the test data**

To evaluate model performance, we will need to add the model predictions
to the test dataset. The bind_cols() function can be used to combine
multiple data frames along the column axis.First we select the hwy and
cty columns in mpg_test and pass this to the bind_cols() function where
we add the hwy_predictions tibble.

**11. Let’s model!**

Let’s practice fitting linear regression models!

## Fitting a linear regression model

The `parsnip` package provides a unified syntax for the model fitting
process in R.

With `parsnip`, it is easy to define models using the various packages,
or engines, that exist in the R ecosystem.

In this exercise, you will define a `parsnip` linear regression object
and train your model to predict `selling_price` using `home_age` and
`sqft_living` as predictor variables from the `home_sales` data.

The `home_training` and `home_test` tibbles that you created in the
previous lesson have been loaded into this session.

**Steps**

1.  Initialize a linear regression object, `linear_model`, with the
    appropriate `parsnip` function.
2.  Use the `lm` engine.
3.  Set the mode to `regression`.

``` r
library(parsnip)

# Initialize a linear regression object, linear_model
linear_model <- linear_reg() %>% 
  # Set the model engine
  set_engine('lm') %>% 
  # Set the model mode
  set_mode('regression')
```

4.  Train your model to predict `selling_price` using `home_age` and
    `sqft_living` as predictor variables from the `home_training`
    dataset.
5.  Print `lm_fit` to view the model information.

``` r
# Specify a linear regression model, linear_model
linear_model <- linear_reg() %>% 
  # Set the model engine
  set_engine('lm') %>% 
  # Set the model mode
  set_mode('regression')

# Fit the model using the training data
lm_fit <- linear_model %>% 
  fit(selling_price ~ home_age + sqft_living,
      data = home_training)

# Print lm_fit to view model information
lm_fit
```

    ## parsnip model object
    ## 
    ## Fit time:  5ms 
    ## 
    ## Call:
    ## stats::lm(formula = selling_price ~ home_age + sqft_living, data = data)
    ## 
    ## Coefficients:
    ## (Intercept)     home_age  sqft_living  
    ##    288194.2      -1366.8        103.5

Excellent work! You have defined your model with `linear_reg()` and
trained it to predict `selling_price` using `home_age` and
`sqft_living`. Printing a `parsnip` model fit object displays useful
model information, such as the training time, model formula used during
training, and the estimated model parameters.

## Exploring estimated model parameters

In the previous exercise, you trained a linear regression model to
predict `selling_price` using `home_age` and `sqft_living` as predictor
variables.

> ## *Question*
>
> Pass your trained model object into the appropriate function to
> explore the estimated model parameters and select the true
> statement.<br> <br> ⬜ The standard error, `std.error`, for the
> `sqft_living` predictor variable is 175.<br> ⬜ The estimated
> parameter for the `home_age` predictor variable is 305.<br> ✅ \[The
> estimated parameter for the `sqft_living` predictor variable is
> 105.\]<br> ⬜ The estimated intercept is 127825.<br>

Great job! The `tidy()` function automatically creates a tibble of
estimated model parameters. Since `sqft_living` has a positive estimated
parameter, the selling price of homes increases with the square footage.
Conversely, since `home_age` has a negative estimated parameter, older
homes tend to have lower selling prices.

## Predicting home selling prices

After fitting a model using the training data, the next step is to use
it to make predictions on the test dataset. The test dataset acts as a
new source of data for the model and will allow you to evaluate how well
it performs.

Before you can evaluate model performance, you must add your predictions
to the test dataset.

In this exercise, you will use your trained model, `lm_fit`, to predict
`selling_price` in the `home_test` dataset.

Your trained model, `lm_fit`, as well as the test dataset, `home_test`
have been loaded into your session.

**Steps**

1.  Create a tibble, `home_predictions`, that contains the predicted
    selling prices of homes in the test dataset.

``` r
# Predict selling_price
home_predictions <- predict(lm_fit,
                            new_data = home_test)

# View predicted selling prices
home_predictions
```

    ## # A tibble: 450 × 1
    ##      .pred
    ##      <dbl>
    ##  1 432948.
    ##  2 380596.
    ##  3 629599.
    ##  4 430339.
    ##  5 410293.
    ##  6 471964.
    ##  7 564242.
    ##  8 526345.
    ##  9 532640.
    ## 10 460077.
    ## # … with 440 more rows

2.  Create a tibble with the `selling_price`, `home_age`, and
    `sqft_living` columns from the test dataset and the predicted home
    selling prices.

``` r
# Combine test data with predictions
home_test_results <- home_test %>% 
  select(selling_price, home_age, sqft_living) %>% 
  bind_cols(home_predictions)

# View results
home_test_results
```

    ## # A tibble: 450 × 4
    ##    selling_price home_age sqft_living   .pred
    ##            <dbl>    <dbl>       <dbl>   <dbl>
    ##  1        465000       10        1530 432948.
    ##  2        411000       18        1130 380596.
    ##  3        635000        4        3350 629599.
    ##  4        495000       21        1650 430339.
    ##  5        355000       19        1430 410293.
    ##  6        425000       11        1920 471964.
    ##  7        559900       20        2930 564242.
    ##  8        475000        0        2300 526345.
    ##  9        485000        6        2440 532640.
    ## 10        450000       25        1990 460077.
    ## # … with 440 more rows

Congratualtions! You have trained a linear regression model and used it
to predict the selling prices of homes in the test dataset! The model
only used two predictor variables, but the predicted values in the
`.pred` column seem reasonable!

## Evaluating model performance

Theory. Coming soon …

**1. Evaluating model performance**

After fitting a model with the parsnip package, the next step is to
evaluate its performance on the test dataset with the yardstick package.

**2. Input to yardstick functions**

All yardstick functions require a tibble with model results as the first
argument. The data must include a column with the true outcome variable
values and a column with the model predictions. The mpg_test_results
tibble from the previous section is an example of the required input -
it contains the true outcome values in the hwy column and model
predictions in the dot-pred column.

**3. Root mean squared error (RMSE)**

A common performance metric for regression models is the root mean
squared error, or RMSE. The RMSE estimates the average prediction error
of a model and is calculated with the rmse() function. To calculate the
RMSE on our mpg model, we pass mpg_test_results to the rmse() function
and specify hwy as the truth and dot-pred as the estimate. We see that
the average prediction error of our model is about 1 point 93 miles per
gallon for the estimated highway fuel efficiency values.

**4. R squared metric**

Another important regression metric is R squared, also known as the
coefficient of determination. R squared measures the squared correlation
between actual and predicted values and ranges from 0 to 1, where 1
indicates that all predictions equal the true outcome values. R squared
is calculated with the rsq() function and takes the same arguments as
the rmse() function.

**5. R squared plots**

R squared plots are a way to visualize R squared and consist of a
scatter plot with model predictions on the y-axis and true outcome
values on the x-axis. The line y = x is also plotted and represents the
case where all predictions and outcome values are equal, giving an R
squared value of 1. R squared plots are helpful for identifying problems
with model performance, such as non-linear relationships between the
outcome variable and predictors or regions where the model may be
systematically under or over-predicting.

**6. Plotting R squared plots**

R squared plots are made with ggplot2 and require a tibble of model
results, such as our mpg_test_results. The geom_point() function is used
to create the scatter plot of actual vs predicted values, while the
geom_abline() function is used to plot the line y = x. The special
coordinate function, coord_obs_pred(), adjusts the x and y axis to the
same scale.

**7. Streamlining model fitting**

The last_fit() function is used to streamline the model fitting and
evaluation process in tidymodels. It takes a parnsip model object, model
formula, and rsample data split object and performs the following steps.
It creates training and test datasets, fits the model to the training
data, calculates metrics and predictions on the test data, and returns
an object with all the results. To fit our linear regression model on
the mpg data, we pass the lm_model parsnip object to last_fit(), specify
our model formula, and provide the mpg_split data split object.

**8. Collecting metrics**

Once the model is trained with the last_fit() function, we pass the
lm_last_fit object to the collect_metrics() function to get a tibble
with calculated metrics on the test data. The default metrics for
regression models are RMSE and R squared and are always stored in the
column named dot-estimate. We get the same performance metrics on the
mpg_test data as before, just with a lot less work!

**9. Collecting predictions**

To collect the model predictions on the test data, we pass the
lm_last_fit object to the collect_predictions() function and obtain a
tibble with the test dataset predictions. The predictions column is
always named dot-pred. The outcome variable, hwy in our case, is also
included along with other row identifier columns.

**10. Let’s evaluate some models!**

Let’s practice evaluating model performance with yardstick!

## Model performance metrics

Evaluating model results is an important step in the modeling process.
Model evaluation should be done on the test dataset in order to see how
well a model will generalize to new datasets.

In the previous exercise, you trained a linear regression model to
predict `selling_price` using `home_age` and `sqft_living` as predictor
variables. You then created the `home_test_results` tibble using your
trained model on the `home_test` data.

In this exercise, you will calculate the RMSE and R squared metrics
using your results in `home_test_results`.

The `home_test_results` tibble has been loaded into your session.

**Steps**

1.  Using `home_test_results`, calculate the RMSE and R squared metrics.

``` r
# Load package
library(yardstick)
```

    ## For binary classification, the first factor level is assumed to be the event.
    ## Use the argument `event_level = "second"` to alter this as needed.

``` r
# Caculate the RMSE metric
home_test_results %>% 
  rmse(truth = selling_price, estimate = .pred)
```

    ## # A tibble: 1 × 3
    ##   .metric .estimator .estimate
    ##   <chr>   <chr>          <dbl>
    ## 1 rmse    standard      47380.

``` r
# Calculate the R squared metric
home_test_results %>% 
  rsq(truth = selling_price, estimate = .pred)
```

    ## # A tibble: 1 × 3
    ##   .metric .estimator .estimate
    ##   <chr>   <chr>          <dbl>
    ## 1 rsq     standard       0.657

Great job! The RMSE metric indicates that the average prediction error
for home selling prices is about $48,000. Not bad considering you only
used `home_age` and `sqft_living` as predictor variables!

## R squared plot

In the previous exercise, you got an R squared value of 0.651. The R
squared metric ranges from 0 to 1, 0 being the worst and 1 the best.

Calculating the R squared value is only the first step in studying your
model’s predictions.

Making an R squared plot is extremely important because it will uncover
potential problems with your model, such as non-linear patterns or
regions where your model is either over or under-predicting the outcome
variable.

In this exercise, you will create an R squared plot of your model’s
performance.

The `home_test_results` tibble has been loaded into your session.

**Steps**

1.  Create an R squared plot of your model’s performance. The x-axis
    should have the actual selling price and the y-axis should have the
    predicted values.
2.  Use the appropriate functions to add the line y = x to your plot and
    standardize the range of both axes.

``` r
# Load package
library(tune)
```

    ## Registered S3 method overwritten by 'tune':
    ##   method                   from   
    ##   required_pkgs.model_spec parsnip

``` r
library(ggplot2)

# Make an R2 plot using predictions_df
ggplot(home_test_results, aes(x = selling_price, y = .pred)) +
  geom_point(alpha = 0.5) + 
  geom_abline(color = 'blue', linetype = 2) +
  tune::coord_obs_pred() +
  labs(x = 'Actual Home Selling Price', y = 'Predicted Selling Price')
```

![](readme_files/figure-gfm/unnamed-chunk-11-1.png)<!-- -->

Good work! From the plot, you can see that your model tends to
over-predict selling prices for homes that sold for less than $400,000,
and under-predict for homes that sold for $600,000 or more. This
indicates that you will have to add more predictors to your model or
that linear regression may not be able to model the relationship as well
as more advanced modeling techniques!

## Complete model fitting process with last_fit()

In this exercise, you will train and evaluate the performance of a
linear regression model that predicts `selling_price` using all the
predictors available in the `home_sales` tibble.

This exercise will give you a chance to perform the entire model fitting
process with `tidymodels`, from defining your model object to evaluating
its performance on the test data.

Earlier in the chapter, you created an `rsample` object called
`home_split` by passing the `home_sales` tibble into `initial_split()`.
The `home_split` object contains the instructions for randomly splitting
`home_sales` into training and test sets.

The `home_sales` tibble, and `home_split` object have been loaded into
this session.

**Steps**

1.  Use the `linear_reg()` function to define a linear regression model
    object. Use the `lm` engine.

``` r
# Define a linear regression model
linear_model <- linear_reg() %>% 
  set_engine('lm') %>% 
  set_mode('regression')
```

2.  Train your linear regression object with the `last_fit()` function.
3.  In your model formula, use `selling_price` as the outcome variable
    and all other columns as predictor variables.
4.  Create a tibble with the model’s predictions on the test data.

``` r
# Train linear_model with last_fit()
linear_fit <- linear_model %>% 
  tune::last_fit(selling_price ~ ., split = home_split)

# Collect predictions and view results
predictions_df <- linear_fit %>% collect_predictions()
predictions_df
```

    ## # A tibble: 450 × 5
    ##    id                 .pred  .row selling_price .config             
    ##    <chr>              <dbl> <int>         <dbl> <chr>               
    ##  1 train/test split 420396.     2        465000 Preprocessor1_Model1
    ##  2 train/test split 396658.     3        411000 Preprocessor1_Model1
    ##  3 train/test split 687953.     4        635000 Preprocessor1_Model1
    ##  4 train/test split 439479.     6        495000 Preprocessor1_Model1
    ##  5 train/test split 401202.     7        355000 Preprocessor1_Model1
    ##  6 train/test split 439093.     9        425000 Preprocessor1_Model1
    ##  7 train/test split 582289.    14        559900 Preprocessor1_Model1
    ##  8 train/test split 463262.    16        475000 Preprocessor1_Model1
    ##  9 train/test split 560730.    17        485000 Preprocessor1_Model1
    ## 10 train/test split 479843.    21        450000 Preprocessor1_Model1
    ## # … with 440 more rows

5.  Create an R square plot of the model’s performance. The x-axis
    should have the actual selling price and the y-axis should have the
    predicted values.

``` r
# Collect predictions and view results
predictions_df <- linear_fit %>% collect_predictions()
predictions_df
```

    ## # A tibble: 450 × 5
    ##    id                 .pred  .row selling_price .config             
    ##    <chr>              <dbl> <int>         <dbl> <chr>               
    ##  1 train/test split 420396.     2        465000 Preprocessor1_Model1
    ##  2 train/test split 396658.     3        411000 Preprocessor1_Model1
    ##  3 train/test split 687953.     4        635000 Preprocessor1_Model1
    ##  4 train/test split 439479.     6        495000 Preprocessor1_Model1
    ##  5 train/test split 401202.     7        355000 Preprocessor1_Model1
    ##  6 train/test split 439093.     9        425000 Preprocessor1_Model1
    ##  7 train/test split 582289.    14        559900 Preprocessor1_Model1
    ##  8 train/test split 463262.    16        475000 Preprocessor1_Model1
    ##  9 train/test split 560730.    17        485000 Preprocessor1_Model1
    ## 10 train/test split 479843.    21        450000 Preprocessor1_Model1
    ## # … with 440 more rows

``` r
# Make an R squared plot using predictions_df
ggplot(predictions_df, aes(x = selling_price, y = .pred)) +
  geom_point(alpha = 0.5) + 
  geom_abline(color = 'blue', linetype = 2) +
  coord_obs_pred() +
  labs(x = 'Actual Home Selling Price', y = 'Predicted Selling Price')
```

![](readme_files/figure-gfm/unnamed-chunk-14-1.png)<!-- -->

Great work! You have created your first machine learning pipeline and
visualized the performance of your model. From the R squared plot, the
model still tends to over-predict selling prices for homes that sold for
less than $400,000 and under-predict for homes at $600,000 or more, but
it is a slight improvement over your previous model with only two
predictor variables.

# 2. Classification Models

Learn how to predict categorical outcomes by training classification
models. Using the skills you’ve gained so far, you’ll predict the
likelihood of customers canceling their service with a
telecommunications company.

## Classification models

Theory. Coming soon …

**1. Classification models**

In the previous chapter, we predicted continuous outcome variables with
regression models. This chapter focuses on the other branch of
supervised machine learning - classification.

**2. Predicting product purchases**

Classification models are used for predicting categorical outcome
variables.An example might be predicting whether a customer will
purchase a product based on the time they spent on a company website and
their total website visits. In the dataset below, each row represents a
customer and the outcome variable, purchased, consists of two
categories, yes and no.Plotting this data and coloring the points by the
outcome variable reveals that customers who do purchase products tend to
spend more time on the website.

**3. Classification algorithms**

Instead of predicting numbers, classification algorithms produce
non-overlapping regions where the same categorical outcome is predicted
for all combinations of predictor values.

**4. Classification algorithms**

Logistic regression is a classification model that separates the groups
within the outcome variable with a linear function along the set of
possible predictor values, also known as a decision boundary.

**5. Lead scoring data**

Throughout this chapter, we will train a logistic regression model on
the leads_df tibble, which contains information on whether customers
purchased a product based on their website behavior and other
demographics.

**6. Data resampling**

As before, the first step in fitting a model is to create training and
test datasets from the original data.For the leads_df data, we create a
data split object, leads_split, with the initial_split() function and
stratify by our outcome variable, purchased. This ensures that the
proportion of yes/no values in the outcome variable is similar in the
training and test datasets.Then we pass the data split object to the
training() and testing() functions to randomly divide our data.

**7. Logistic regression model specification**

The logistic_reg() function is the general interface to logistic
regression models in parsnip.To specify our logistic regression model,
we call the logistic_reg() function, pass it to set_engine() where we
select the commonly used ‘glm’ engine, and finally pass it to set_mode()
where we set the mode to ‘classification’.

**8. Model fitting**

As in the regression setting, once a model is specified, the fit()
function is used for model training.To train our model, we pass it to
the fit function and provide our model formula. Here we are predicting
purchased using total_visits and total_time as predictor variables. We
also pass the leads_training tibble to the data argument.

**9. Predicting outcome categories**

To obtain model predictions, we pass our trained model, logistic_fit, to
the predict() function and provide leads_test to the new_data argument.
We also need to add type is equal to ‘class’ in order to obtain
predicted outcome categories.The predict function always returns a
tibble and the predicted categories in a column named dot pred_class.

**10. Estimated probabilities**

When we set the type argument to ‘prob’ within the predict() function,
we get a tibble with the estimated probabilities for each outcome
variable category for each row in our test data. We will always get one
column per category in our outcome variable with the naming convention
dot-pred underscore outcome_category. For our model on the leads_df
data, we get the columns dot-pred_yes and dot-pred_no.

**11. Combining results**

To evaluate model performance with yardstick, we will need to combine
the outcome variable from the test dataset with the predicted categories
and estimated probabilities. As before, this can be done with the
bind_cols() function. In the next section we’ll explore how to use this
results dataset with yardstick metric functions.

**12. Telecommunications data**

Throughout the exercises in this chapter, you will be fitting models to
the telecom_df dataset which contains information on customers of a
telecommunications company. The outcome variable is canceled_service and
indicates whether a customer canceled their cellular and internet
service.

**13. Let’s practice!**

Let’s practice building classification models!

## Data resampling

The first step in a machine learning project is to create training and
test datasets for model fitting and evaluation. The test dataset
provides an estimate of how your model will perform on new data and
helps to guard against overfitting.

You will be working with the `telecom_df` dataset which contains
information on customers of a telecommunications company. The outcome
variable is `canceled_service` and it records whether a customer
canceled their contract with the company. The predictor variables
contain information about customers’ cell phone and internet usage as
well as their contract type and monthly charges.

The `telecom_df` tibble has been loaded into your session.

**Steps**

1.  Create an `rsample` object, `telecom_split`, that contains the
    instructions for randomly splitting the `telecom_df` data into
    training and test datasets.% of the data into training and stratify
    the results by `canceled_service`.
2.  Allocate 75% of the data into training and stratify the results by
    `canceled_service`.
3.  Pass the `telecom_split` object to the appropriate `rsample`
    functions to create the training and test datasets.
4.  Check the number of rows in each datasets by passing them to the
    `nrow()` function.

``` r
# Load data
telecom_df <- readRDS("data/telecom_df.rds")

# Create data split object
telecom_split <- initial_split(telecom_df, prop = 0.75,
                               strata = canceled_service)

# Create the training data
telecom_training <- telecom_split %>% 
  training()

# Create the test data
telecom_test <- telecom_split %>% 
  testing()

# Check the number of rows
nrow(telecom_training)
```

    ## [1] 731

``` r
nrow(telecom_test)
```

    ## [1] 244

Good job! You have 731 rows in your training data and
`r`nrow(telecom_test)`rows in your test dataset. Now you can begin the model fitting process using`telecom_training\`.

## Fitting a logistic regression model

In addition to regression models, the `parsnip` package also provides a
general interface to classification models in R.

In this exercise, you will define a `parsnip` logistic regression object
and train your model to predict `canceled_service` using
`avg_call_mins`, `avg_intl_mins`, and `monthly_charges` as predictor
variables from the `telecom_df` data.

The `telecom_training` and `telecom_test` tibbles that you created in
the previous lesson have been loaded into this session.

**Steps**

1.  Initialize a logistic regression object, `logistic_model`, with the
    appropriate `parsnip` function.
2.  Use the `'glm'` engine.
3.  Set the mode to `'classification'`.
4.  Print the `logistic_model` object to view its specification details.

``` r
# Specify a logistic regression model
logistic_model <- logistic_reg() %>% 
  # Set the engine
  set_engine('glm') %>% 
  # Set the mode
  set_mode('classification')

# Print the model specification
logistic_model
```

    ## Logistic Regression Model Specification (classification)
    ## 
    ## Computational engine: glm

5.  Train your model to predict `canceled_service` using
    `avg_call_mins`, `avg_intl_mins`, and `monthly_charges` as predictor
    variables from the `telecom_training` dataset.

``` r
# Specify a logistic regression model
logistic_model <- logistic_reg() %>% 
  # Set the engine
  set_engine('glm') %>% 
  # Set the mode
  set_mode('classification')

# Fit to training data
logistic_fit <- logistic_model %>% 
  fit(canceled_service ~ avg_call_mins + avg_intl_mins + monthly_charges,
      data = telecom_training)

# Print model fit object
logistic_fit
```

    ## parsnip model object
    ## 
    ## Fit time:  6ms 
    ## 
    ## Call:  stats::glm(formula = canceled_service ~ avg_call_mins + avg_intl_mins + 
    ##     monthly_charges, family = stats::binomial, data = data)
    ## 
    ## Coefficients:
    ##     (Intercept)    avg_call_mins    avg_intl_mins  monthly_charges  
    ##       1.5536790       -0.0095403        0.0238060       -0.0002804  
    ## 
    ## Degrees of Freedom: 730 Total (i.e. Null);  727 Residual
    ## Null Deviance:       932.4 
    ## Residual Deviance: 809.1     AIC: 817.1

Great job! You have defined your model with `logistic_reg()` and trained
it to predict `canceled_service` using `avg_call_mins`, `avg_intl_mins`,
and `monthly_charges`. Printing a `parsnip` model specification object
displays useful model information, such as the model type, computational
engine, and mode. Printing a model fit object will display the estimated
model coefficients.

## Combining test dataset results

Evaluating your model’s performance on the test dataset gives insights
into how well your model predicts on new data sources. These insights
will help you communicate your model’s value in solving problems or
improving decision making.

Before you can calculate classification metrics such as sensitivity or
specificity, you must create a results tibble with the required columns
for `yardstick` metric functions.

In this exercise, you will use your trained model to predict the outcome
variable in the `telecom_test` dataset and combine it with the true
outcome values in the `canceled_service` column.

Your trained model, `logistic_fit`, and test dataset, `telecom_test`,
have been loaded from the previous exercise.

**Steps**

1.  Use your trained model and the `predict()` function to create a
    tibble, `class_preds`, with predicted outcome variable categories
    using the test dataset.

``` r
# Predict outcome categories
class_preds <- predict(logistic_fit, new_data = telecom_test,
                       type = 'class')
```

2.  Now create a tibble, `prob_preds`, with the estimated probabilities
    for each category in the outcome variable using the test dataset.

``` r
# Predict outcome categories
class_preds <- predict(logistic_fit, new_data = telecom_test,
                       type = 'class')

# Obtain estimated probabilities for each outcome value
prob_preds <- predict(logistic_fit, new_data = telecom_test, 
                      type = 'prob')
```

3.  Select the outcome variable from the `telecom_test` data.
4.  Add the `class_preds` and `prob_preds` tibbles along the column
    axis.

``` r
# Combine test set results
telecom_results <- telecom_test %>% 
  select(canceled_service) %>% 
  bind_cols(class_preds, prob_preds)

# View results tibble
telecom_results
```

    ## # A tibble: 244 × 4
    ##    canceled_service .pred_class .pred_yes .pred_no
    ##    <fct>            <fct>           <dbl>    <dbl>
    ##  1 yes              yes            0.546     0.454
    ##  2 yes              no             0.397     0.603
    ##  3 no               no             0.213     0.787
    ##  4 yes              yes            0.763     0.237
    ##  5 no               no             0.180     0.820
    ##  6 yes              yes            0.564     0.436
    ##  7 yes              yes            0.568     0.432
    ##  8 no               no             0.415     0.585
    ##  9 no               no             0.0877    0.912
    ## 10 no               no             0.0228    0.977
    ## # … with 234 more rows

Good job! You have created a tibble of model results using the test
dataset. Your results tibble contains all the necessary columns for
calculating classification metrics. Next, you’ll use this tibble and the
`yardstick` package to evalute your model’s performance.

## Assessing model fit

Theory. Coming soon …

**1. Assessing model fit**

The next step in the modeling process is assessing model performance.

**2. Binary classification**

In binary classification, we have two possible categories.The positive
class is the category that is of interest to predict, such as ‘yes’ in
our purchased variable. The negative class is the remaining category.In
tidymodels, the outcome variable must be a factor with the first level
as the positive class. To check the ordering of a factor vector, pass it
into the levels() function. To change the ordering, assign a character
vector with the desired order to this levels() function call.

**3. Confusion matrix**

A confusion matrix displays the counts of all combinations of actual and
predicted outcomes from a binary classification model. The predicted
categories appear along the rows while the true outcomes appear along
the columns.There are two types of correct predictions, known as true
positives and true negatives along the diagonal.A binary classification
model can make two types of errors. Predicting a positive class for a
row that has an actual negative class, known as a false positive, and
predicting a negative class for a row with an actual positive class,
known as a false negative.

**4. Classification metrics with yardstick**

To calculate confusion matrices and other metrics we need a tibble of
model results that includes the true outcome, the predicted categories,
and estimated probabilities for each category.These correspond to the
columns in our leads_results tibble.

**5. Confusion matrix with yardstick**

To create a confusion matrix, we pass the leads_results tibble to the
conf_mat() function and set the truth argument to the purchased column
and the estimate argument to the dot_pred_class column.We see that our
model correctly classified 252 rows in the test dataset. It made 46
false negative errors, where it predicted that a customer will not
purchase when in fact they did, and 34 false positive errors, where it
predicted that a customer will purchase when in fact they did not.

**6. Classification accuracy**

The accuracy() function is used to calculate classification accuracy. It
takes the same arguments as conf_mat() and calculates the proportion of
correctly classified rows in the results tibble. yardstick functions
always return a tibble where the dot-metric column lists the name of the
calculated metric and the dot-estimate column contains the value.

**7. Sensitivity**

Accuracy is generally not the best metric. Classifying all rows as ‘no’
in our leads_df data would give an accuracy of 64%, for
example.Sensitivity is the proportion of all positive cases that were
correctly classified and improves with lower false negative rates.For
example, of the customers who did purchase a product, what proportion
did our model predict correctly?

**8. Calculating sensitivity**

The sens() function calculates sensitivity and takes the same arguments
as the conf_mat() and accuracy() functions.

**9. Specificity**

Specificity measures the proportion of all negative cases that were
correctly classified and improves with lower false positive rates.For
example, of the customers who did not purchase a product, what
proportion did our model predict correctly?Another common metric is the
false positive rate, which is just 1 minus the specificity and measures
the proportion of false positives among all negative cases.

**10. Calculating specificity**

The spec() function calculates specificity and takes the same arguments
as the sens() function.

**11. Creating a metric set**

Instead of calculating metrics one by one, we can create a custom metric
function with metric_set().We pass the desired yardstick functions by
name into metric_set() to create a new metric function. This new
function can be used to calculate our metrics all at once!

**12. Many metrics**

The yardstick package offers many more metrics, which can be found in
the documentation. Passing the results of conf_mat() to the summary()
function will calculate all binary classification metrics at once.

**13. Let’s practice!**

Let’s practice calculating performance metrics!

## Calculating metrics from the confusion matrix

The confusion matrix of a binary classification model lists the number
of correct and incorrect predictions obtained on the test dataset and is
useful for evaluating the performance of your model.

Suppose you have trained a classification model that predicts whether
customers will cancel their service at a telecommunications company and
obtained the following confusion matrix on your test dataset. Here `yes`
represents the positive class, while `no` represents the negative class.

<img src="https://assets.datacamp.com/production/repositories/5840/datasets/cee821f7fea3fea55283bc7db6eea97caab9904c/sample_confusion_matrix.png" alt="Confusion matrix with 30 true positives, 10 false positives, 40 true negatives, and 20 false negatives">

> ## *Question*
>
> Choose the true statement from the options below.<br> <br> ⬜ The
> accuracy of this classification model is 0.6.<br> ✅ The sensitivity
> of this classification model is 0.75.<br> ⬜ The specificity of this
> classification model is 0.10.<br> ⬜ The false positive rate (1 -
> specificity) of this classification model is 0.66.<br>

That’s correct. The sensitivity is calculated by taking the proportion
of true positives among predicted positives. Your model was able to
correctly classify 75% of all customers who actually canceled their
service.

## Evaluating performance with yardstick

In the previous exercise, you calculated classification metrics from a
sample confusion matrix. The `yardstick` package was designed to
automate this process.

For classification models, `yardstick` functions require a tibble of
model results as the first argument. This should include the actual
outcome values, predicted outcome values, and estimated probabilities
for each value of the outcome variable.

In this exercise, you will use the results from your logistic regression
model, `telecom_results`, to calculate performance metrics.

The `telecom_results` tibble has been loaded into your session.

**Steps**

1.  Use the appropriate `yardstick` function to create a confusion
    matrix using the `telecom_results` tibble.

``` r
# Calculate the confusion matrix
conf_mat(telecom_results, truth = canceled_service,
         estimate = .pred_class)
```

    ##           Truth
    ## Prediction yes  no
    ##        yes  42  29
    ##        no   40 133

2.  Calculate the **accuracy** of your model with the appropriate
    `yardstick` function.

``` r
# Calculate the accuracy
accuracy(telecom_results, truth = canceled_service,
         estimate = .pred_class)
```

    ## # A tibble: 1 × 3
    ##   .metric  .estimator .estimate
    ##   <chr>    <chr>          <dbl>
    ## 1 accuracy binary         0.717

3.  Calculate the **sensitivity** of your model.

``` r
# Calculate the sensitivity
sens(telecom_results, truth = canceled_service,
     estimate = .pred_class)
```

    ## # A tibble: 1 × 3
    ##   .metric .estimator .estimate
    ##   <chr>   <chr>          <dbl>
    ## 1 sens    binary         0.512

4.  Calculate the **specificity** of your model.

``` r
# Calculate the specificity
spec(telecom_results, truth = canceled_service,
     estimate = .pred_class)
```

    ## # A tibble: 1 × 3
    ##   .metric .estimator .estimate
    ##   <chr>   <chr>          <dbl>
    ## 1 spec    binary         0.821

Excellent work! The specificity of your logistic regression model is
0.895, which is more than double the sensitivity of 0.42. This indicates
that your model is much better at detecting customers who will not
cancel their telecommunications service versus the ones who will.

## Creating custom metric sets

The `yardstick` package also provides the ability to create custom sets
of model metrics. In cases where the cost of obtaining false negative
errors is different from the cost of false positive errors, it may be
important to examine a specific set of performance metrics.

Instead of calculating accuracy, sensitivity, and specificity
separately, you can create your own metric function that calculates all
three at the same time.

In this exercise, you will use the results from your logistic regression
model, `telecom_results`, to calculate a custom set of performance
metrics. You will also use a confusion matrix to calculate all available
binary classification metrics in `tidymodels`all at once.

The `telecom_results` tibble has been loaded into your session.

**Steps**

1.  Create a custom metric function named `telecom_metrics` using the
    appropriate `yardstick` function.the `accuracy()`, `sens()`, and
    `spec()` functions in your custom metric function.
2.  Include the `accuracy()`, `sens()`, and `spec()` functions in your
    custom metric function.

``` r
# Create a custom metric function
telecom_metrics <- metric_set(accuracy, sens, spec)
```

3.  Use your `telecom_metrics()` function to calculate metrics on the
    `telecom_results` tibble.

``` r
# Calculate metrics using model results tibble
telecom_metrics(telecom_results, truth = canceled_service,
                estimate = .pred_class)
```

    ## # A tibble: 3 × 3
    ##   .metric  .estimator .estimate
    ##   <chr>    <chr>          <dbl>
    ## 1 accuracy binary         0.717
    ## 2 sens     binary         0.512
    ## 3 spec     binary         0.821

4.  Create a confusion matrix using the `telecom_results` tibble.
5.  Pass your confusion matrix to the `summary()` function in base R.

``` r
# Create a confusion matrix
conf_mat(telecom_results,
         truth = canceled_service,
         estimate = .pred_class) %>% 
  # Pass to the summary() function
  summary()
```

    ## # A tibble: 13 × 3
    ##    .metric              .estimator .estimate
    ##    <chr>                <chr>          <dbl>
    ##  1 accuracy             binary         0.717
    ##  2 kap                  binary         0.345
    ##  3 sens                 binary         0.512
    ##  4 spec                 binary         0.821
    ##  5 ppv                  binary         0.592
    ##  6 npv                  binary         0.769
    ##  7 mcc                  binary         0.346
    ##  8 j_index              binary         0.333
    ##  9 bal_accuracy         binary         0.667
    ## 10 detection_prevalence binary         0.291
    ## 11 precision            binary         0.592
    ## 12 recall               binary         0.512
    ## 13 f_meas               binary         0.549

Nice work! You created a custom metric function to calculate accuracy,
sensitivity, and specificity. Oftentimes, you will be interested in
tracking certain performance metrics for a given modeling problem, but
passing a confusion matrix to the `summary()` function will calculate
all available binary classification metrics in `tidymodels` at once!

## Visualizing model performance

Theory. Coming soon …

**1. Visualizing model performance**

In this section we will explore some common ways to visualize the
results of a classification model.

**2. Plotting the confusion matrix**

Confusion matrices generated by the conf_mat() function can be plotted
with the autoplot() function. Simply pass the confusion matrix object
into autoplot() and set the type to ‘heatmap’. This creates a heat map
of the counts in the confusion matrix and will highlight the
combinations with the largest frequencies.

**3. Mosaic plot**

Setting the type to ‘mosaic’ within autoplot() will create a mosaic plot
of the confusion matrix which visualizes sensitivity and specificity.
Each column in this plot represents 100 percent of the actual outcome
value in that column. With the leads_results confusion matrix, the
height of the yes-yes combination represents the sensitivity

**4. Mosiac plot**

while the height of the no-no combination represents the specificity.

**5. Probability thresholds**

In binary classification, the default probability threshold is point-5.
This means that if the estimated probability of the positive class is
greater than or equal to point-5, the positive class is predicted.With
our leads_results tibble, if the dot-pred_yes column is greater than or
equal to point-5, then our predicted outcome, dot-pred_class is set to
‘yes’ by the predict() function.

**6. Exploring performance across thresholds**

It’s important to explore the performance of a classification model
across a range of probability thresholds to see if the model is able to
consistently predict well.One way to do this is by using the unique
values in the dot-pred_yes column of our leads_result tibble as
probability thresholds and calculating the specificity and sensitivity
for each one.

**7. Visualizing performance across thresholds**

The receiver operating characteristic curve, or ROC curve visualizes the
performance of a classification model across a range of probability
thresholds. For each unique threshold in the previous table, a point
that represents the sensitivity and one minus the specificity is added
to the plot on the y and x axis, respectively.

**8. Visualizing performance across thresholds**

In essence, this plot displays the proportion correct among actual
positives versus the proportion incorrect among actual negatives across
probability thresholds as a step function.

**9. ROC curves**

The optimal point on this graph is (0, 1) and a classification model
that produces points close to the left upper edge across all thresholds
is ideal.

**10. ROC curves**

A classification model that produces points along the diagonal line
where sensitivity is equal to one minus the specificity indicates poor
performance. This is the equivalent of a classification model that
predicts outcomes based on the result of randomly flipping a fair coin.

**11. Summarizing the ROC curve**

One way to summarize an ROC curve is to calculate the area under the
curve, known as ROC AUC in tidymodels. This metric has a useful
interpretation as a letter grade of classification performance, where
values from point-9 to 1 represent an “A” and so forth.

**12. Calculating performance across thresholds**

To plot an ROC curve, we first need to create a tibble with sensitivity
and specificity calculations for various thresholds.To do this, we pass
our leads_results tibble into the roc_curve() function and set the truth
argument to purchased and pass the dot-pred_yes column as the third
argument.This will return a tibble with specificity and sensitivity for
all unique thresholds in the dot-pred_yes column.

**13. Plotting the ROC curve**

Then we pass the results of roc_curve() to the autoplot() function to
display the ROC curve for our classification model.

**14. Calculating ROC AUC**

To calculate the ROC AUC, we use the roc_auc() function from yardstick.
This function takes a tibble of model results, the column with the true
outcome values, and the column with estimated probabilities of the
positive class.Our logistic regression model has a ROC AUC of point-763,
giving us a C in terms of model performance.

**15. Let’s practice!**

Let’s practice visualizing model performance!

## Plotting the confusion matrix

Calculating performance metrics with the `yardstick` package provides
insight into how well a classification model is performing on the test
dataset. Most `yardstick` functions return a single number that
summarizes classification performance.

Many times, it is helpful to create visualizations of the confusion
matrix to more easily communicate your results.

In this exercise, you will make a heat map and mosaic plot of the
confusion matrix from your logistic regression model on the `telecom_df`
dataset.

Your model results tibble, `telecom_results`, has been loaded into your
session.

**Steps**

1.  Create a confusion matrix from your model results,
    `telecom_results`.
2.  Pass your confusion matrix to the appropriate function for creating
    heat maps.

``` r
# Create a confusion matrix
conf_mat(telecom_results,
         truth = canceled_service,
         estimate = .pred_class) %>% 
  # Create a heat map
  autoplot(type = 'heatmap')
```

![](readme_files/figure-gfm/unnamed-chunk-28-1.png)<!-- -->

3.  Create a confusion matrix from your model results.
4.  Pass your confusion matrix to the appropriate function for creating
    mosaic plots.

``` r
# Create a confusion matrix
conf_mat(telecom_results,
         truth = canceled_service,
         estimate = .pred_class) %>% 
  # Create a mosaic plot
  autoplot(type = 'mosaic')
```

![](readme_files/figure-gfm/unnamed-chunk-29-1.png)<!-- -->

Great job! The mosaic plot clearly shows that your logistic regression
model performs much better in terms of specificity than sensitivity. You
can see that in the `yes` column, a large proportion of outcomes were
incorrectly predicted as `no`.

## ROC curves and area under the ROC curve

ROC curves are used to visualize the performance of a classification
model across a range of probability thresholds. An ROC curve with the
majority of points near the upper left corner of the plot indicates that
a classification model is able to correctly predict both the positive
and negative outcomes correctly across a wide range of probability
thresholds.

The area under this curve provides a letter grade summary of model
performance.

In this exercise, you will create an ROC curve from your logistic
regression model results and calculate the area under the ROC curve with
`yardstick`.

Your model results tibble, `telecom_results` has been loaded into your
session.

**Steps**

1.  Create a tibble, `threshold_df`, which contains the sensitivity and
    specificity of your classification model across the unique
    probability thresholds in `telecom_results`.
2.  Print `threshold_df` to view the results.

``` r
# Calculate metrics across thresholds
threshold_df <- telecom_results %>% 
  roc_curve(truth = canceled_service, .pred_yes)

# View results
threshold_df
```

    ## # A tibble: 246 × 3
    ##    .threshold specificity sensitivity
    ##         <dbl>       <dbl>       <dbl>
    ##  1  -Inf          0             1    
    ##  2     0.0155     0             1    
    ##  3     0.0228     0             0.988
    ##  4     0.0236     0.00617       0.988
    ##  5     0.0454     0.0123        0.988
    ##  6     0.0542     0.0185        0.988
    ##  7     0.0560     0.0247        0.988
    ##  8     0.0663     0.0309        0.988
    ##  9     0.0747     0.0370        0.988
    ## 10     0.0818     0.0432        0.988
    ## # … with 236 more rows

3.  Use `threshold_df` to to plot your model’s ROC curve.

``` r
# Plot ROC curve
threshold_df %>% 
  autoplot()
```

![](readme_files/figure-gfm/unnamed-chunk-31-1.png)<!-- -->

4.  Calculate the area under the ROC curve using the `telecom_results`
    tibble.

``` r
# Calculate ROC AUC
roc_auc(telecom_results,
        truth = canceled_service, 
        .pred_yes)
```

    ## # A tibble: 1 × 3
    ##   .metric .estimator .estimate
    ##   <chr>   <chr>          <dbl>
    ## 1 roc_auc binary         0.771

Nice work! The area under the ROC curve is 0.76. This indicates that
your model gets a C in terms of overall performance. This is mainly due
to the low sensitivity of the model.

## Automating the modeling workflow

Theory. Coming soon …

**1. Automating the modeling workflow**

In this section, we will focus on applying the last fit workflow that we
learned in the regression section to streamline our classification
modeling.

**2. Streamlining the workflow**

The last_fit() function also accepts classification models. This
function speeds up the modeling workflow by fitting models to the
training data as well as generating predictions on the test data.Before
using the last_fit() function, we must create a data split object with
rsample and specify our model with parsnip.

**3. Fitting the model and collecting metrics**

To train our logistic regression model with last_fit(), we pass our
logistic_regression model object to the last_fit function and add our
model formula followed by our data split object, leads_split.Once the
model is trained, we can use the collect_metrics() function to calculate
performance metrics on the test dataset. The default metrics are
accuracy and ROC AUC. Notice that we get the same performance metrics as
before, just with a lot less effort!

**4. Collecting predictions**

Passing a trained last fit model object into the collect_predictions()
function will create a tibble of model results on the test dataset. The
results tibble will contain all the required columns for calculating
performance metrics with yardstick functions.The important columns for
our logistic regression model on the leads_df data are dot-pred_yes,
dot-pred_no, dot-pred_class, and purchased.

**5. Custom metric sets**

A special adjustment must be made when creating custom metric functions
using metric_set() that include the roc_auc() function from yardstick.If
we would like to create a metric set with accuracy, sensitivity,
specificity, and ROC AUC, then we must remember that the accuracy(),
sens(), and spec() functions take slightly different arguments than the
roc_auc() function. The accuracy(), sens(), and spec() functions require
a truth and estimate column, while the roc_auc() function requires a
truth column and a column which has the estimated probabilities for the
positive class.For our last_fit_results tibble, the truth column is
purchased, the estimate column is dot-pred_class, and the estimated
probabilities for the positive class is the dot-pred_yes column.All
three of these must be passed to our custom metrics function, with
dot-pred_yes as the last argument, in order for it to work properly.

**6. Let’s practice!**

Let’s practice fitting logistic regression models with the last fit
workflow!

## Streamlining the modeling process

The `last_fit()` function is designed to streamline the modeling
workflow in `tidymodels`. Instead of training your model on the training
data and building a results tibble using the test data, `last_fit()`
accomplishes this with one function.

In this exercise, you will train the same logistic regression model as
you fit in the previous exercises, except with the `last_fit()`
function.

Your data split object, `telecom_split`, and model specification,
`logistic_model`, have been loaded into your session.

**Steps**

1.  Pass your `logistic_model` object into the `last_fit()` function.
2.  Predict `canceled_service` using `avg_call_mins`, `avg_intl_mins`,
    and `monthly_charges`.
3.  Display the performance metrics of your trained model,
    `telecom_last_fit`.

``` r
# Train model with last_fit()
telecom_last_fit <- logistic_model %>% 
  last_fit(canceled_service ~ avg_call_mins + avg_intl_mins + monthly_charges,
           split = telecom_split)

# View test set metrics
telecom_last_fit %>% 
  collect_metrics()
```

    ## # A tibble: 2 × 4
    ##   .metric  .estimator .estimate .config             
    ##   <chr>    <chr>          <dbl> <chr>               
    ## 1 accuracy binary         0.717 Preprocessor1_Model1
    ## 2 roc_auc  binary         0.771 Preprocessor1_Model1

Excellent work! Notice that you got the same area under the ROC curve as
before, just with a lot less effort!

## Collecting predictions and creating custom metrics

Using the `last_fit()` modeling workflow also saves time in collecting
model predictions. Instead of manually creating a tibble of model
results, there are helper functions that extract this information
automatically.

In this exercise, you will use your trained model, `telecom_last_fit`,
to create a tibble of model results on the test dataset as well as
calculate custom performance metrics.

You trained model, `telecom_last_fit`, has been loaded into this
session.

**Steps**

1.  Create a tibble, `last_fit_results`, that has the predictions from
    your `telecom_last_fit` model.
2.  Print the results to the console.

``` r
# Collect predictions
last_fit_results <- telecom_last_fit %>% 
  collect_predictions()

# View results
last_fit_results
```

    ## # A tibble: 244 × 7
    ##    id         .pred_yes .pred_no  .row .pred_class canceled_service .config     
    ##    <chr>          <dbl>    <dbl> <int> <fct>       <fct>            <chr>       
    ##  1 train/tes…    0.546     0.454     1 yes         yes              Preprocesso…
    ##  2 train/tes…    0.397     0.603     2 no          yes              Preprocesso…
    ##  3 train/tes…    0.213     0.787     5 no          no               Preprocesso…
    ##  4 train/tes…    0.763     0.237     7 yes         yes              Preprocesso…
    ##  5 train/tes…    0.180     0.820    10 no          no               Preprocesso…
    ##  6 train/tes…    0.564     0.436    11 yes         yes              Preprocesso…
    ##  7 train/tes…    0.568     0.432    12 yes         yes              Preprocesso…
    ##  8 train/tes…    0.415     0.585    15 no          no               Preprocesso…
    ##  9 train/tes…    0.0877    0.912    19 no          no               Preprocesso…
    ## 10 train/tes…    0.0228    0.977    22 no          no               Preprocesso…
    ## # … with 234 more rows

3.  Create a custom metric function, `last_fit_metrics`, using the
    `metric_set()` function.
4.  Include the accuracy, sensitivity, specificity, and area under the
    ROC curve in your metric function, in that order.

``` r
# Custom metrics function
last_fit_metrics <- metric_set(accuracy, sens,
                               spec, roc_auc)
```

5.  Use the `last_fit_metrics()` function to calculate your custom
    metrics on the `last_fit_results` tibble.

``` r
# Calculate metrics
last_fit_metrics(last_fit_results,
                 truth = canceled_service,
                 estimate = .pred_class,
                 .pred_yes)
```

    ## # A tibble: 4 × 3
    ##   .metric  .estimator .estimate
    ##   <chr>    <chr>          <dbl>
    ## 1 accuracy binary         0.717
    ## 2 sens     binary         0.512
    ## 3 spec     binary         0.821
    ## 4 roc_auc  binary         0.771

Great job! You were able to train and evaluate your logistic regression
model in half the time! Notice that all performance metrics match the
results you obtained in previous exercises.

## Complete modeling workflow

In this exercise, you will use the `last_fit()` function to train a
logistic regression model and evaluate its performance on the test data
by assessing the ROC curve and the area under the ROC curve.

Similar to previous exercises, you will predict `canceled_service` in
the `telecom_df` data, but with an additional predictor variable to see
if you can improve model performance.

The `telecom_df` tibble, `telecom_split`, and `logistic_model` objects
from the previous exercises have been loaded into your workspace. The
`telecom_split` object contains the instructions for randomly splitting
the `telecom_df` tibble into training and test sets. The
`logistic_model` object is a `parsnip` specification of a logistic
regression model.

**Steps**

1.  Train your model to predict `canceled_service` using
    `avg_call_mins`, `avg_intl_mins`, `monthly_charges`, and
    `months_with_company`.

``` r
# Train a logistic regression model
logistic_fit <- logistic_model %>% 
  last_fit(canceled_service ~ avg_call_mins + avg_intl_mins + monthly_charges + months_with_company, 
           split = telecom_split)
```

2.  Collect and print the performance metrics on the test dataset.

``` r
# Collect metrics
logistic_fit %>% 
  collect_metrics()
```

    ## # A tibble: 2 × 4
    ##   .metric  .estimator .estimate .config             
    ##   <chr>    <chr>          <dbl> <chr>               
    ## 1 accuracy binary         0.787 Preprocessor1_Model1
    ## 2 roc_auc  binary         0.845 Preprocessor1_Model1

3.  Collect your model predictions.
4.  Pass the predictions to the appropriate function to calculate
    sensitivity and specificity for different probability thresholds.
5.  Pass the results to the appropriate plotting function to create an
    ROC curve.

``` r
# Collect model predictions
logistic_fit %>% 
  collect_predictions() %>% 
  # Plot ROC curve
  roc_curve(truth = canceled_service, .pred_yes) %>% 
  autoplot()
```

![](readme_files/figure-gfm/unnamed-chunk-39-1.png)<!-- -->

Excellent work! The ROC curve shows that the logistic regression model
performs better than a model that guesses at random (the dashed line in
the plot). Adding the `months_with_company` predictor variable increased
your area under the ROC curve from 0.76 in your previous model to 0.837!

# 3. Feature Engineering

Find out how to bake feature engineering pipelines with the recipes
package. You’ll prepare numeric and categorical data to help machine
learning algorithms optimize your predictions.

## Feature engineering

Theory. Coming soon …

**1. Feature engineering**

In this chapter, we will explore the recipes package and feature
engineering, which is the process of transforming data to a format that
is suitable for machine learning algorithms.

**2. Feature engineering with the recipes package**

Feature engineering is accomplished with the recipes package. It is
designed to help with all stages of feature engineering, which include
assigning variable roles to the columns of our data, defining
preprocessing tasks and data transformations, training our data
transformations, and applying them to new data sources.

**3. Specifying variable types and roles**

The first step in feature engineering is assigning each column in our
data to either an outcome or predictor role and determining their data
type, which can be either numeric or categorical. The recipes() function
is used for this task.

**4. Data preprocessing steps**

The next step involves defining a sequence of data preprocessing steps,
which can include missing data imputation, centering and scaling numeric
variables, creating new variables from ratios of existing variables, and
many more possibilities.These transformations are encoded with unique
step\_\*() functions.

**5. Training preprocessing steps**

After preprocessing steps are defined, they need to be trained and
estimated with data. This includes things such as calculating the mean
and standard deviation of numeric columns for centering and scaling data
and storing formulas for creating new columns. The prep() function is
used for this task.

**6. Applying recipes to new data**

The final step of feature engineering is to apply the trained data
transformations to the training and test datasets as well as new sources
of data for future predictions. This is an important step, as machine
learning algorithms require the same data format as was used during
model training to predict new values.The bake() function from recipes is
used for this task.

**7. Simple feature engineering pipeline**

To demonstrate a simple feature engineering pipeline, let’s build a
recipe to log transform the total_time variable in the lead scoring
dataset. This is a common transformation for variables with large values
because it compresses the range of data values and can reduce
variability.

**8. Building a recipe object**

First we pass our model formula, purchased tilde dot, to the recipe
function. This will assign the purchased column as the outcome variable
and all other columns as predictor variables. Then we pass the
leads_training data to the data argument. This will be used to determine
the data types of each column in our data.Then we pass our recipe object
to the step_log() function and provide the total_time column and select
a base of 10.Printing a recipe object will display the number of outcome
and predictor variables as well as the encoded preprocessing operations.

**9. Explore variable roles and types**

When a recipe object is passed to the summary() function, a tibble with
variable information is returned. The type column lists the variable
data types, which is either numeric or nominal for categorical
variables. The role column captures variable roles for modeling based on
the provided model formula.

**10. Training a recipe object**

Next, we train our recipe by passing it to the prep() function. The
training argument of prep() specifies the data on which to train data
preprocessing steps. This should always be the training data.Printing a
trained recipe will display which operations were successfully trained.

**11. Transforming the training data**

To apply our recipe to existing or new data, we must pass it to the bake
function. The new_data argument of bake() specifies to which data to
apply the trained recipe. Since leads_training was used to train our
recipe, the transformations were retained by default in the prep()
function. Setting new_data to NULL will return the preprocessed training
data. Notice that total_time is now on a logarithm scale.

**12. Transforming new data**

To transform the test dataset, pass it to the new_data argument. The
trained recipe will apply all steps to the new data source.

**13. Let’s get baking!**

Let’s get baking!

## Exploring recipe objects

The first step in feature engineering is to specify a `recipe` object
with the `recipe()` function and add data preprocessing steps with one
or more `step_*()` functions. Storing all of this information in a
single `recipe` object makes it easier to manage complex feature
engineering pipelines and transform new data sources.

Use the R console to explore a `recipe` object named `telecom_rec`,
which was specified using the `telecom_training` data from the previous
chapter and the code below.

``` r
telecom_rec <- recipe(canceled_service ~ .,
                      data = telecom_df) %>% 
  step_log(avg_call_mins, base = 10)
```

> ## *Question*
>
> How many numeric and nominal predictor variables are encoded in the
> `telecom_rec` object?<br> <br> ⬜ There are 2 numeric and 4 nominal
> predictor variables.<br> ⬜ There are 4 numeric and 5 nominal
> predictor variables.<br> ✅ There are 5 numeric and 3 nominal
> predictor variables.<br> ⬜ There are 3 numeric and 4 nominal
> predictor variables.<br>

You got it! Based on the results from passing `telecom_rec` to the
`summary()` function, you can see that 5 predictor variables were
labeled as numeric and 3 as nominal by the `recipe()` function.

## Creating recipe objects

In the previous chapter, you fit a logistic regression model using a
subset of the predictor variables from the `telecom_df` data. This
dataset contains information on customers of a telecommunications
company and the goal is predict whether they will cancel their service.

In this exercise, you will use the `recipes` package to apply a log
transformation to the `avg_call_mins` and `avg_intl_mins` variables in
the telecommunications data. This will reduce the range of these
variables and potentially make their distributions more symmetric, which
may increase the accuracy of your logistic regression model.

**Steps**

1.  Create a `recipe` object, `telecom_log_rec`, that uses
    `canceled_service` as the outcome variable and all remaining columns
    in `telecom_training` as predictor variables.
2.  Add a step to the `recipe` object that will log transform
    `avg_call_mins` and `avg_intl_mins`.

``` r
# Specify feature engineering recipe
telecom_log_rec <- recipe(canceled_service ~ ., 
                          data = telecom_training) %>%
  # Add log transformation step
  step_log(avg_call_mins, avg_intl_mins, base = 10)

# Print recipe object
telecom_log_rec
```

    ## Recipe
    ## 
    ## Inputs:
    ## 
    ##       role #variables
    ##    outcome          1
    ##  predictor          8
    ## 
    ## Operations:
    ## 
    ## Log transformation on avg_call_mins, avg_intl_mins

3.  View the variable roles and data types that were assigned by the
    `recipe()` function in the `telecom_log_rec` object.

``` r
# View variable roles and data types
telecom_log_rec %>%
  summary()
```

    ## # A tibble: 9 × 4
    ##   variable            type    role      source  
    ##   <chr>               <chr>   <chr>     <chr>   
    ## 1 cellular_service    nominal predictor original
    ## 2 avg_data_gb         numeric predictor original
    ## 3 avg_call_mins       numeric predictor original
    ## 4 avg_intl_mins       numeric predictor original
    ## 5 internet_service    nominal predictor original
    ## 6 contract            nominal predictor original
    ## 7 months_with_company numeric predictor original
    ## 8 monthly_charges     numeric predictor original
    ## 9 canceled_service    nominal outcome   original

Great job! You have created a `recipe` object that assigned variable
roles and data types to the outcome and predictor variables in the
`telecom_training` dataset. You also added instructions for applying a
log transformation to the `avg_call_mins` and `avg_intl_mins` variables.
Now it’s time to train your `recipe` and apply it to new data!

## Training a recipe object

In the previous exercise, you created a `recipe` object with
instructions to apply a log transformation to the `avg_call_mins` and
`avg_intl_mins` predictor variables in the telecommunications data.

The next step in the feature engineering process is to train your
`recipe` object using the training data. Then you will be able to apply
your trained `recipe` to both the training and test datasets in order to
prepare them for use in model fitting and model evaluation.

Your `recipe` object, `telecom_log_rec`, and the `telecom_training` and
`telecom_test` datasets have been loaded into your session.

**Steps**

1.  Train your `telecom_log_rec` object using the `telecom_training`
    dataset.

``` r
# Train the telecom_log_rec object
telecom_log_rec_prep <- telecom_log_rec %>% 
  prep(training = telecom_training)

# View results
telecom_log_rec_prep
```

    ## Recipe
    ## 
    ## Inputs:
    ## 
    ##       role #variables
    ##    outcome          1
    ##  predictor          8
    ## 
    ## Training data contained 731 data points and no missing data.
    ## 
    ## Operations:
    ## 
    ## Log transformation on avg_call_mins, avg_intl_mins [trained]

2.  Use your trained `recipe` to obtain the transformed training
    dataset.

``` r
# Apply to training data
telecom_log_rec_prep %>% 
  bake(new_data = NULL)
```

    ## # A tibble: 731 × 9
    ##    cellular_service avg_data_gb avg_call_mins avg_intl_mins internet_service
    ##    <fct>                  <dbl>         <dbl>         <dbl> <fct>           
    ##  1 single_line            10.3           2.42          1.74 fiber_optic     
    ##  2 single_line             9.3           2.51          2.06 fiber_optic     
    ##  3 multiple_lines          9.4           2.49          2.17 fiber_optic     
    ##  4 multiple_lines         10.2           2.60          2.06 fiber_optic     
    ##  5 single_line             9.37          2.58          1.94 fiber_optic     
    ##  6 multiple_lines          4.11          2.57          1.81 digital         
    ##  7 multiple_lines          5.17          2.53          2.08 digital         
    ##  8 multiple_lines          7.86          2.58          2.21 digital         
    ##  9 multiple_lines         11.8           2.54          2.10 fiber_optic     
    ## 10 single_line             8.02          2.38          1.98 fiber_optic     
    ## # … with 721 more rows, and 4 more variables: contract <fct>,
    ## #   months_with_company <dbl>, monthly_charges <dbl>, canceled_service <fct>

3.  Apply your trained `recipe` to the test dataset.

``` r
# Train the telecom_log_rec object
telecom_log_rec_prep <- telecom_log_rec %>% 
  prep(training = telecom_training)

# Apply to test data
telecom_log_rec_prep %>% 
  bake(new_data = telecom_test)
```

    ## # A tibble: 244 × 9
    ##    cellular_service avg_data_gb avg_call_mins avg_intl_mins internet_service
    ##    <fct>                  <dbl>         <dbl>         <dbl> <fct>           
    ##  1 single_line             7.78          2.70          2.10 fiber_optic     
    ##  2 single_line             9.04          2.53          1.94 fiber_optic     
    ##  3 multiple_lines          8.05          2.52          2.09 digital         
    ##  4 multiple_lines          8.01          2.72          1.99 fiber_optic     
    ##  5 multiple_lines          9.96          2.53          2.13 fiber_optic     
    ##  6 single_line             5.87          2.61          1.94 digital         
    ##  7 single_line             6.23          2.63          1.98 fiber_optic     
    ##  8 single_line             6.69          2.55          1.96 digital         
    ##  9 multiple_lines         10.6           2.45          2.17 fiber_optic     
    ## 10 single_line             8.67          1.97          2.12 fiber_optic     
    ## # … with 234 more rows, and 4 more variables: contract <fct>,
    ## #   months_with_company <dbl>, monthly_charges <dbl>, canceled_service <fct>

Great work! You successfully trained your `recipe` to be able to
transform new data sources and applied it to the training and test
datasets. Notice that the `avg_call_mins` and `avg_intl_mins` variables
have been log transformed in the test dataset!

## Numeric predictors

Theory. Coming soon …

**1. Numeric predictors**

In this section, we will focus on common preprocessing techniques for
numeric predictor variables.

**2. Correlated predictor variables**

Correlation measures the linear relationship between two numeric
variables. Highly correlated predictors variables will have correlation
values near -1 or 1 and provide redundant information. This phenomenon,
known as multicollinearity, causes instability in machine learning
optimization algorithms and can lead to model fitting errors. The
total_clicks and pages_per_visit columns in the leads_training data are
an example of highly correlated predictors. We see that customers with
large total click values tend to have large average page views per
visit. Knowing the value of one variable gives us the likely value of
the other, so both are not needed.

**3. Finding correlated predictor variables**

We can discover correlated variables by creating a correlation matrix,
which lists all pairwise correlations in a numeric dataset. To create
one using the leads_training data, we pass it to the select_if()
function where we provide the is dot-numeric function as an argument.
This selects only the numeric columns. Then we pass the results to the
cor() function. As you can see, the pages_per_visit and total_clicks
variables have a correlation of 0-point-96.

**4. Processing correlated predictors**

To preprocess correlated predictor variables, we begin by specifying a
recipe. For the lead scoring data, we add the same model formula and
data argument. Then we pass our recipe object to the step_corr()
function, which has two Rs instead of one, and provide the names of all
numeric columns in the leads_training dataset separated by commas. We
also provide a correlation threshold of 0-point-9 to the threshold
argument. A correlation threshold is in absolute value terms, meaning
that a threshold of 0-point-9 will remove variables with a correlation
of 0-point-9 or more and negative 0 point 9 or less.

**5. Selecting predictors by type**

Instead of typing the names of all numeric columns in step_corr(), we
can use special selector functions. The all_outcomes() function selects
the outcome variable while the all_numeric() selector will select all
numeric variables. This will include the outcome variable if it is
numeric. An equivalent way of specifying our recipe would be to pass
all_numeric() to step_corr(). If we had a numeric outcome variable, we
would also pass minus all_outcomes() as well to exclude it from
preprocessing.

**6. Training and applying the recipe**

After training and applying our recipe to the test data, we see that
pages_per_visit was removed due to its high correlation value in the
leads_training data. When we use our recipe, it will be removed from all
future datasets as well.

**7. Normalization**

Another common task is centering and scaling numeric variables, known as
normalization. For each numeric column, we subtract the mean and divide
by the standard deviation. This transforms numeric variables to standard
deviation units with a mean of 0 and standard deviation of 1.
Interpreting normalized variable values is very intuitive. From the
normalized total_time value, we see that spending 1,273 seconds on the
website is 1-point-19 standard deviations greater than the average time
spent by customers.

**8. Combining data preprocessing steps**

To normalize variables, we add the step_normalize() function to our
preprocessing steps. The means and standard deviations from the training
data columns will be used to transform existing and new data sources.
Recipes can have multiple preprocessing steps. We just pass multiple
step functions to our sequence of steps in our recipe and they are
carried out in the order we enter them. In the leads_norm_rec recipe
object, correlated predictors will be removed first, followed by
normalization.

**9. Transforming the test data**

When we train and apply the leads_norm_rec recipe to the leads_test
data, we see that the pages_per_visit column is removed and all numeric
predictors are normalized.

**10. Let’s practice!**

Let’s practice transforming numeric predictor variables!

## Discovering correlated predictors

Correlated predictor variables provide redundant information and can
negatively impact the model fitting process. When two variables are
highly correlated, their values change linearly with each other and
hence provide the same information to your machine learning algorithms.
This phenomenon is know as multicollinearity.

Before beginning the model fitting process, it’s important to explore
your dataset to uncover these relationships and remove them in your
feature engineering steps.

In this exercise, you will explore the `telecom_training` dataset by
creating a correlation matrix of all the numeric predictor variables.

The `telecom_training` data has been loaded into your session.

**Steps**

1.  Select all of the numeric columns in the `telecom_training` data.
2.  Create a correlation matrix of the numeric columns of
    `telecom_training`.

``` r
telecom_training %>% 
  # Select numeric columns
  select_if(is.numeric) %>% 
  # Calculate correlation matrix
  cor()
```

    ##                     avg_data_gb avg_call_mins avg_intl_mins months_with_company
    ## avg_data_gb           1.0000000    0.17005846     0.1623071          0.40600989
    ## avg_call_mins         0.1700585    1.00000000     0.1041689          0.02179842
    ## avg_intl_mins         0.1623071    0.10416887     1.0000000          0.24015770
    ## months_with_company   0.4060099    0.02179842     0.2401577          1.00000000
    ## monthly_charges       0.9567417    0.16913418     0.1636031          0.42792048
    ##                     monthly_charges
    ## avg_data_gb               0.9567417
    ## avg_call_mins             0.1691342
    ## avg_intl_mins             0.1636031
    ## months_with_company       0.4279205
    ## monthly_charges           1.0000000

> ## *Question*
>
> Based on your correlation matrix, which variables have the largest
> correlation?<br> <br> ⬜ `avg_data_gb` and `avg_call_mins`<br> ⬜
> `months_with_company` and `avg_intl_mins`<br> ✅ \[`avg_data_gb` and
> `monthly_charges`\]<br> ⬜ `avg_call_mins` and `monthly_charges`<br>

3.  Create a scatter plot with `avg_data_gb` on the x-axis and
    `monthly_charges` on the y-axis.
4.  Add `Monthly Charges vs. Average Data Usage` to the title of your
    plot.

``` r
# Plot correlated predictors
ggplot(telecom_training, aes(x = avg_data_gb, y = monthly_charges)) + 
  # Add points
  geom_point()  + 
  # Add title
  labs(title = 'Monthly Charges vs. Average Data Usage',
       y = 'Monthly Charges ($)', x = 'Average Data Usage (GB)') 
```

![](readme_files/figure-gfm/unnamed-chunk-47-1.png)<!-- -->

Great job! You explored the `telecom_training` data and discovered that
`monthly_charges` and `avg_data_gb` have a correlation of 0.96. From the
scatter plot, you can see that the more data customers use, the more
they are charged every month. You will have to remove this redundant
information with your feature engineering steps.

## Removing correlated predictors with recipes

Removing correlated predictor variables from your training and test
datasets is an important feature engineering step to ensure your model
fitting runs as smoothly as possible.

Now that you have discovered that `monthly_charges` and `avg_data_gb`
are highly correlated, you must add a correlation filter with
`step_corr()` to your feature engineering pipeline for the
telecommunications data.

In this exercise, you will create a `recipe` object that removes
correlated predictors from the telecommunications data.

The `telecom_training` and `telecom_test` datasets have been loaded into
your session.

**Steps**

1.  Create a `recipe` object, `telecom_cor_rec`, that sets the outcome
    variable to `canceled_service` and all remaining columns in
    `telecom_training` to predictor variables.
2.  Add a preprocessing step that removes highly correlated predictor
    variables using the `all_numeric()` selector function and a
    correlation threshold of 0.8.

``` r
# Specify a recipe object
telecom_cor_rec <- recipe(canceled_service ~ .,
                          data = telecom_training) %>% 
  # Remove correlated variables
  step_corr(all_numeric(), threshold = 0.8)
```

3.  Train your `telecom_cor_rec` object using the `telecom_training`
    dataset.

``` r
# Train the recipe
telecom_cor_rec_prep <- telecom_cor_rec %>% 
  prep(training = telecom_training)
```

4.  Use your trained `recipe` to obtain the transformed training
    dataset.

``` r
# Apply to training data
telecom_cor_rec_prep %>% 
  bake(new_data = NULL)
```

    ## # A tibble: 731 × 8
    ##    cellular_service avg_data_gb avg_call_mins avg_intl_mins internet_service
    ##    <fct>                  <dbl>         <dbl>         <dbl> <fct>           
    ##  1 single_line            10.3            262            55 fiber_optic     
    ##  2 single_line             9.3            326           114 fiber_optic     
    ##  3 multiple_lines          9.4            312           147 fiber_optic     
    ##  4 multiple_lines         10.2            402           116 fiber_optic     
    ##  5 single_line             9.37           382            87 fiber_optic     
    ##  6 multiple_lines          4.11           371            64 digital         
    ##  7 multiple_lines          5.17           341           119 digital         
    ##  8 multiple_lines          7.86           378           164 digital         
    ##  9 multiple_lines         11.8            343           126 fiber_optic     
    ## 10 single_line             8.02           240            95 fiber_optic     
    ## # … with 721 more rows, and 3 more variables: contract <fct>,
    ## #   months_with_company <dbl>, canceled_service <fct>

5.  Apply your trained `recipe` to the test dataset.

``` r
# Apply to test data
telecom_cor_rec_prep %>% 
  bake(new_data = telecom_test)
```

    ## # A tibble: 244 × 8
    ##    cellular_service avg_data_gb avg_call_mins avg_intl_mins internet_service
    ##    <fct>                  <dbl>         <dbl>         <dbl> <fct>           
    ##  1 single_line             7.78           497           127 fiber_optic     
    ##  2 single_line             9.04           336            88 fiber_optic     
    ##  3 multiple_lines          8.05           328           122 digital         
    ##  4 multiple_lines          8.01           525            97 fiber_optic     
    ##  5 multiple_lines          9.96           340           136 fiber_optic     
    ##  6 single_line             5.87           408            88 digital         
    ##  7 single_line             6.23           429            96 fiber_optic     
    ##  8 single_line             6.69           352            91 digital         
    ##  9 multiple_lines         10.6            281           147 fiber_optic     
    ## 10 single_line             8.67            93           131 fiber_optic     
    ## # … with 234 more rows, and 3 more variables: contract <fct>,
    ## #   months_with_company <dbl>, canceled_service <fct>

Excellent! You have trained your recipe to remove all correlated
predictors that exceed the 0.8 correlation threshold. Notice that your
recipe found the high correlation between `monthly_charges` and
`avg_data_gb` in the training data and when applied to the
`telecom_test` data, it removed the `monthly_charges` column.

## Multiple feature engineering steps

The power of the `recipes` package is that you can include multiple
preprocessing steps in a single `recipe` object. These steps will be
carried out in the order they are entered with the `step_*()` functions.

In this exercise, you will build upon your feature engineering from the
last exercise. In addition to removing correlated predictors, you will
create a `recipe` object that also normalizes all numeric predictors in
the telecommunications data.

The `telecom_training` and `telecom_test` datasets have been loaded into
your session.

**Steps**

1.  Create a `recipe` object, `telecom_norm_rec`, that sets the outcome
    variable to `canceled_service` and all remaining columns in
    `telecom_training` to predictor variables.
2.  Specify your `recipe` to first remove correlated predictors at the
    0.8 threshold and then normalize all numeric predictor variables.

``` r
# Specify a recipe object
telecom_norm_rec <- recipe(canceled_service ~ .,
                          data = telecom_training) %>% 
  # Remove correlated variables
  step_corr(all_numeric(), threshold = 0.8) %>% 
  # Normalize numeric predictors
  step_normalize(all_numeric())
```

3.  Train your `telecom_norm_rec` object using the `telecom_training`
    dataset.

``` r
# Train the recipe
telecom_norm_rec_prep <- telecom_norm_rec %>% 
  prep(training = telecom_training)
```

4.  Apply your trained `recipe` to the test dataset.

``` r
# Apply to test data
telecom_norm_rec_prep %>% 
  bake(new_data = telecom_test)
```

    ## # A tibble: 244 × 8
    ##    cellular_service avg_data_gb avg_call_mins avg_intl_mins internet_service
    ##    <fct>                  <dbl>         <dbl>         <dbl> <fct>           
    ##  1 single_line          -0.239         1.99           0.557 fiber_optic     
    ##  2 single_line           0.412        -0.142         -0.663 fiber_optic     
    ##  3 multiple_lines       -0.0995       -0.247          0.400 digital         
    ##  4 multiple_lines       -0.120         2.36          -0.382 fiber_optic     
    ##  5 multiple_lines        0.887        -0.0887         0.839 fiber_optic     
    ##  6 single_line          -1.23          0.810         -0.663 digital         
    ##  7 single_line          -1.04          1.09          -0.413 fiber_optic     
    ##  8 single_line          -0.802         0.0698        -0.570 digital         
    ##  9 multiple_lines        1.24         -0.868          1.18  fiber_optic     
    ## 10 single_line           0.221        -3.35           0.682 fiber_optic     
    ## # … with 234 more rows, and 3 more variables: contract <fct>,
    ## #   months_with_company <dbl>, canceled_service <fct>

Great job! When you applied your trained `recipe` to the `telecom_test`
data, it removed the `monthly_charges` column, due to its large
correlation with `avg_data_gb`, and normalized the numeric predictor
variables!

## Nominal predictors

Theory. Coming soon …

**1. Nominal predictors**

In the previous lesson we focused on preprocessing numeric variables. We
learned how to center and scale our data with step_normalize() and how
to remove highly correlated variables with step_corr().In this lesson we
will learn how to train a recipe to process nominal predictor variables.

**2. Nominal data**

Nominal data values identify characteristics or groups.Think of them as
a set of categories with no meaningful order.Some examples of nominal
data include a department within a company, a person’s native language,
or the type of car you drive. In all of these examples, the values serve
as labels for a particular category or group.

**3. Transforming nominal predictors**

Nominal data must be transformed to numeric data during feature
engineering because many machine learning algorithms require numeric
input.One-Hot encoding is a transformation that maps the distinct values
of a nominal variable to a sequence of 0/1 indicator variables.Each
unique value gets its own indicator variable.Suppose we have a nominal
variable that records the department in which employees work at a
company. This variable has three unique values: Finance, Marketing and
Technology. In the example, one-hot encoding will create a sequence of
three indicator variables for this data. Notice how each indicator
variable has a 1 in the row that matches the category in the original
data. Since every row in the one-hot encoded results must sum to 1, it
is redundant to have a column of every unique value in our data. For
example, if department_marketing and department_technology are both
equal to 0, then we know that the department value must be finance.

**4. Transforming nominal predictors**

Dummy variable encoding takes a different approach and removes that
redundant information by excluding one value from the original set of
data values.If we have n distinct values in our categorical data, we
will get n - 1 indicator variables.This is the preferred method for
tidymodels and is the default in the recipes package.With this method
our department variable is mapped to a sequence of two indicator
variables.

**5. Lead scoring data**

In our lead scoring data, lead_source and us_location are nominal
predictor variables.

**6. Creating dummy variables**

To transform these variables, we start by specifying a recipe with our
model formula and leads_training data. Then we pass this to the
step_dummy function where we select the lead_source and us_location
variables for processing.We then pass the results to the prep function
where the recipe is trained on the leads_training data. Finally, this is
passed into the bake function where we apply the transform on our
leads_test data.The results show that dummy variables have been created
for both variables in the test data.

**7. Selecting columns by type**

A more robust way to perform feature engineering is to select columns by
type. This can be done by passing a sequence of selector functions
separated by commas into the step function of a recipe. To select all
factor or character columns in a data frame, we can use the
all_nominal() selector function. To exclude the outcome variable,
purchased, we use the all_outcomes() selector preceded by a minus
sign.With this code, we will get the same results. However, if our
variable names change in the future, our code won’t give us an error.

**8. Preprocessing nominal predictor variables**

Many modeling engines in R include automatic dummy variable creation, so
it is possible to fit models without having to use step_dummy().
However, these methods are not consistent across engines in using
one-hot versus dummy variables or naming conventions.Using the recipes
package standardizes this process and will make your code less
susceptible to errors.

**9. Let’s practice!**

Let’s practice by applying step_dummy to our feature engineering
pipeline on the telecommunications data!

## Applying step_dummy() to predictors

You are using the telecom_training data to predict canceled_service
using avg_data_gb and contract as predictor variables.

| canceled_service | avg_data_gb | contract       |
|------------------|-------------|----------------|
| yes              | 7.78        | month_to_month |
| yes              | 9.04        | month_to_month |
| yes              | 5.08        | one_year       |
| no               | 8.05        | two_year       |

In your feature engineering pipeline, you would like to create dummy
variables from the `contract` column and leave `avg_data_gb` and
`canceled_service` as is.

Which `step_*()` function from the options will correctly encode your
recipe object?

Determine whether each `step_*()` specification will correctly encode
your recipe object and drag it to the appropriate section.

| Correct specification                        | Incorrect specification                     |
|----------------------------------------------|---------------------------------------------|
| `step_dummy(all_nominal(), -all_outcomes())` | `step_dummy(all_nominal(), all_outcomes())` |
| `step_dummy(contract)`                       | `step_dummy(all_nominal())`                 |

Congratulations! The special selector functions are helpful for
specifying feature engineering steps without having to type out all
individual variables for processing.

## Ordering of step\_\*() functions

The `step_*()` functions within a recipe are carried out in sequential
order. It’s important to keep this in mind so that you avoid unexpected
results in your feature engineering pipeline!

In this exercise, you will combine different `step_*()` functions into a
single `recipe` and see what effect the ordering of `step_*()` functions
has on the final result.

The `telecom_training` and `telecom_test` datasets have been loaded into
this session.

**Steps**

1.  Specify the `telecom_recipe_1` object to normalize all numeric
    predictors and then create dummy variables for all nominal
    predictors in the training data, `telecom_training`.
2.  Select columns **by role** in your `recipe` specification.

``` r
telecom_recipe_1 <- 
  recipe(canceled_service ~ avg_data_gb + contract, data = telecom_training)  %>% 
  # Normalize numeric predictors
  step_normalize(all_numeric()) %>% 
  # Create dummy variables for nominal predictors
  step_dummy(all_nominal(), -all_outcomes())
```

3.  Train `telecom_recipe_1` and use it to transform the test data,
    `telecom_test`.

``` r
# Train and apply telecom_recipe_1 on the test data
telecom_recipe_1 %>% 
  prep(training = telecom_training) %>% 
  bake(new_data = telecom_test)
```

    ## # A tibble: 244 × 4
    ##    avg_data_gb canceled_service contract_one_year contract_two_year
    ##          <dbl> <fct>                        <dbl>             <dbl>
    ##  1     -0.239  yes                              0                 0
    ##  2      0.412  yes                              0                 0
    ##  3     -0.0995 no                               0                 1
    ##  4     -0.120  yes                              0                 0
    ##  5      0.887  no                               0                 0
    ##  6     -1.23   yes                              1                 0
    ##  7     -1.04   yes                              0                 0
    ##  8     -0.802  no                               0                 0
    ##  9      1.24   no                               0                 1
    ## 10      0.221  no                               0                 1
    ## # … with 234 more rows

4.  Now specify `telecom_recipe_2` to create dummy variables for all
    nominal predictors and then normalize all numeric predictors in the
    training data, `telecom_training`.
5.  Select columns **by role** in your `recipe` specification.

``` r
telecom_recipe_2 <- 
  recipe(canceled_service ~ avg_data_gb + contract, data = telecom_training)  %>% 
  # Create dummy variables for nominal predictors
  step_dummy(all_nominal(), -all_outcomes()) %>% 
  # Normalize numeric predictors
  step_normalize(all_numeric(), -all_outcomes())
```

6.  Train `telecom_recipe_2` and use it to transform the test data,
    `telecom_test`.

``` r
# Train and apply telecom_recipe_2 on the test data
telecom_recipe_2 %>% 
  prep(training = telecom_training) %>% 
  bake(new_data = telecom_test)
```

    ## # A tibble: 244 × 4
    ##    avg_data_gb canceled_service contract_one_year contract_two_year
    ##          <dbl> <fct>                        <dbl>             <dbl>
    ##  1     -0.239  yes                         -0.491            -0.486
    ##  2      0.412  yes                         -0.491            -0.486
    ##  3     -0.0995 no                          -0.491             2.05 
    ##  4     -0.120  yes                         -0.491            -0.486
    ##  5      0.887  no                          -0.491            -0.486
    ##  6     -1.23   yes                          2.04             -0.486
    ##  7     -1.04   yes                         -0.491            -0.486
    ##  8     -0.802  no                          -0.491            -0.486
    ##  9      1.24   no                          -0.491             2.05 
    ## 10      0.221  no                          -0.491             2.05 
    ## # … with 234 more rows

Great job! Notice that `telecom_recipe_1` produced \[0, 1\] values in
the dummy variable columns while `telecom_recipe_2` produced dummy
variables which were then normalized! The predictor `contract_two_year`
created by `telecom_recipe_2` is -0.486 instead of 0 and 2.05 instead of
1 due to normalization. For model interpretation, it’s best to normalize
variables before creating dummy variables. Also notice that since you
only specified two predictor variables in your model formula, the rest
of the columns are ignored by your `recipe` objects when transforming
new data sources.

## Complete feature engineering pipeline

The `recipes` package is designed to encode multiple feature engineering
steps into one object, making it easier to maintain data transformations
in a machine learning workflow.

In this exercise, you will train a feature engineering pipeline to
prepare the telecommunications data for modeling.

The `telecom_df` tibble, as well as your `telecom_training` and
`telecom_test` datasets from the previous exercises, have been loaded
into your workspace.

**Steps**

1.  Create a recipe that predicts `canceled_service` using all predictor
    variables in the training data.
2.  Remove correlated predictor variables using a 0.8 threshold value.
3.  Normalize all numeric predictors.
4.  Create dummy variables for all nominal predictors.
5.  Train your recipe on the training data and apply it to the test
    data.

``` r
# Create a recipe that predicts canceled_service using the training data
telecom_recipe <- recipe(canceled_service ~ ., data = telecom_training) %>% 
  # Remove correlated predictors
  step_corr(all_numeric(), threshold = 0.8) %>% 
  # Normalize numeric predictors
  step_normalize(all_numeric()) %>% 
  # Create dummy variables
  step_dummy(all_nominal(), -all_outcomes())

# Train your recipe and apply it to the test data
telecom_recipe %>% 
  prep(training = telecom_training) %>% 
  bake(new_data = telecom_test)
```

    ## # A tibble: 244 × 9
    ##    avg_data_gb avg_call_mins avg_intl_mins months_with_company canceled_service
    ##          <dbl>         <dbl>         <dbl>               <dbl> <fct>           
    ##  1     -0.239         1.99           0.557             -1.05   yes             
    ##  2      0.412        -0.142         -0.663             -0.932  yes             
    ##  3     -0.0995       -0.247          0.400              0.668  no              
    ##  4     -0.120         2.36          -0.382             -0.572  yes             
    ##  5      0.887        -0.0887         0.839              1.11   no              
    ##  6     -1.23          0.810         -0.663              0.468  yes             
    ##  7     -1.04          1.09          -0.413             -0.0120 yes             
    ##  8     -0.802         0.0698        -0.570             -1.09   no              
    ##  9      1.24         -0.868          1.18               0.828  no              
    ## 10      0.221        -3.35           0.682              0.868  no              
    ## # … with 234 more rows, and 4 more variables:
    ## #   cellular_service_single_line <dbl>, internet_service_digital <dbl>,
    ## #   contract_one_year <dbl>, contract_two_year <dbl>

Great job! You are now a feature engineering ninja! Transforming your
training data for modeling is an important part of the machine learning
process. In the next section, we will incorporate your feature
engineering skills to the entire model fitting process for the
telecommunications data.

## Complete modeling workflow

Theory. Coming soon …

**1. Complete modeling workflow**

We have covered many common feature engineering steps for numeric and
nominal predictor variables. In this section, we will go through a
complete modeling workflow which incorporates feature engineering on the
lead scoring dataset. Although many steps will be reviewed, it will be
helpful to see everything come together in one modeling process.

**2. Data resampling**

The modeling process begins with data resampling, where we use the
initial_split() function to create a data split object from our leads_df
data.Then we use the training() and testing() functions to create our
training and test datasets.

**3. Model specification**

Next, we specify our logistic regression model with the logistic_reg()
function, setting the engine to glm and mode to classification.

**4. Feature engineering**

The next step is to build our feature engineering pipeline. For the lead
scoring data, we specify a recipe object that labels purchased as the
outcome variable and the remaining columns in leads_training as
predictors. For our preprocessing steps, we add a correlation filter
with a threshold of 0 point 9, normalize all numeric predictors, and
create dummy variables for all nominal predictors.

**5. Recipe training**

We then train our recipe with the prep() function and the leads_training
data. Now it can be used to transform our training and test datasets for
modeling.

**6. Preprocess training data**

We apply our trained recipe to the training data and store the results
in leads_training_prep.We see from the output, that the transformations
were processed correctly. Numeric variables are normalized,
pages_per_visit has been removed, and dummy variables have been created.

**7. Preprocess test data**

Next, we transform our test dataset using our trained recipe and store
the results in leads_test_prep.

**8. Model fitting and predictions**

We then train our logistic regression model using the
leads_training_prep data.Once the model is fit, we can obtain model
predictions with the predict() function. For predicted outcome values we
provide type is equal to class to the predict function. For estimated
probabilities, we provide type is equal to prob. In both cases, however,
we must set new_data equal to the preprocessed test dataset,
leads_test_prep.

**9. Combining prediction results**

As in our prior modeling workflows, we combine the actual outcome
variable from the test dataset, leads_test, with the datasets of
predictions using bind_cols().This produces a model results data frame
with all the required columns for yardstick metric functions.

**10. Model evaluation**

The final step is model evaluation. Using our leads_results data we can
calculate a confusion matrix, sensitivity, specificity, or any other
metrics that we covered in chapter 2. The difference in this modeling
workflow, is that we were able to incorporate feature engineering and
use all available predictor variables in the lead scoring dataset.

**11. Let’s practice!**

Let’s practice building complete modeling workflows!

## Feature engineering process

To incorporate feature engineering into the modeling process, the
training and test datasets must be preprocessed before the model fitting
stage. With the new skills you have learned in this chapter, you will be
able to use all of the available predictor variables in the
telecommunications data to train your logistic regression model.

In this exercise, you will create a feature engineering pipeline on the
telecommunications data and use it to transform the training and test
datasets.

The `telecom_training` and `telecom_test` datasets as well as your
logistic regression model specification, `logistic_model`, have been
loaded into your session.

**Steps**

1.  Create a `recipe` object, `telecom_recipe`, that sets the outcome
    variable to `canceled_service` and all remaining columns in
    `telecom_training` to predictor variables.
2.  Using selector functions, remove correlated predictors at a 0.8
    threshold, log transform all numeric predictors, normalize all
    numeric predictors, and create dummy variables for all nominal
    predictor variables.

``` r
telecom_recipe <- recipe(canceled_service ~ ., data = telecom_training) %>% 
  # Removed correlated predictors
  step_corr(all_numeric(), threshold = 0.8) %>% 
  # Log transform numeric predictors
  step_log(all_numeric(), base = 10) %>%
  # Normalize numeric predictors
  step_normalize(all_numeric()) %>% 
  # Create dummy variables
  step_dummy(all_nominal(), -all_outcomes())
```

3.  Train the `telecom_recipe` object using the `telecom_training` data.
4.  Use your trained `recipe` object to obtained the preprocessed
    training dataset.

``` r
# Train recipe
telecom_recipe_prep <- telecom_recipe %>% 
  prep(training = telecom_training)

# Transform training data
telecom_training_prep <- telecom_recipe_prep %>% 
  bake(new_data = NULL)
```

5.  Apply your trained `recipe` object to the test dataset and view the
    results.

``` r
# Transform test data
telecom_test_prep <- telecom_recipe_prep %>% 
  bake(new_data = telecom_test)

telecom_test_prep
```

    ## # A tibble: 244 × 9
    ##    avg_data_gb avg_call_mins avg_intl_mins months_with_company canceled_service
    ##          <dbl>         <dbl>         <dbl>               <dbl> <fct>           
    ##  1    -0.103          1.62           0.622            -0.738   yes             
    ##  2     0.477         -0.0212        -0.531            -0.473   yes             
    ##  3     0.0287        -0.122          0.495             0.724   no              
    ##  4     0.00944        1.85          -0.225             0.00471 yes             
    ##  5     0.852          0.0285         0.837             0.872   no              
    ##  6    -1.19           0.794         -0.531             0.646   yes             
    ##  7    -0.962          1.00          -0.258             0.415   yes             
    ##  8    -0.687          0.174         -0.426            -0.853   no              
    ##  9     1.11          -0.771          1.08              0.782   no              
    ## 10     0.316         -5.41           0.719             0.795   no              
    ## # … with 234 more rows, and 4 more variables:
    ## #   cellular_service_single_line <dbl>, internet_service_digital <dbl>,
    ## #   contract_one_year <dbl>, contract_two_year <dbl>

Excellent work! You have preprocessed your training and test datasets
with your `recipe` object and are now ready to use them for the model
fitting and evaluation steps. Looking at the transformed test dataset,
you can see that your feature engineering steps have been applied
correctly.

## Model training and prediction

You have preprocessed your training and test datasets in the previous
exercise. Since you incorporated feature engineering into your modeling
workflow, you are able to use all of the predictor variables available
in the telecommunications data!

The next step is training your logistic regression model and using it to
obtain predictions on your new preprocessed test dataset.

Your preprocessed training and test datasets, `telecom_training_prep`
and `telecom_test_prep`, as well as your model object, `logistic_model`,
have been loaded into your session.

**Steps**

1.  Train your `logistic_model` object to predict `canceled_service`
    using all available predictor variables in the
    `telecom_training_prep` data.

``` r
# Train logistic model
logistic_fit <- logistic_model %>% 
  fit(canceled_service ~ ., data = telecom_training_prep)
```

2.  Use your trained model, `logistic_fit`, to predict the outcome
    variable values on the preprocessed test dataset.
3.  Use your model to predict the estimated probabilities of the
    positive and negative classes on the preprocessed test dataset.

``` r
# Obtain class predictions
class_preds <- predict(logistic_fit, new_data = telecom_test_prep,
                       type = 'class')

# Obtain estimated probabilities
prob_preds <- predict(logistic_fit, new_data = telecom_test_prep, 
                      type = 'prob')
```

4.  Combine the actual outcome variable from the preprocessed test
    dataset and the two prediction tibbles into a single results
    dataset.

``` r
# Combine test set results
telecom_results <- telecom_test_prep %>% 
  select(canceled_service) %>% 
  bind_cols(class_preds, prob_preds)

telecom_results
```

    ## # A tibble: 244 × 4
    ##    canceled_service .pred_class .pred_yes .pred_no
    ##    <fct>            <fct>           <dbl>    <dbl>
    ##  1 yes              yes          0.639       0.361
    ##  2 yes              yes          0.554       0.446
    ##  3 no               no           0.0141      0.986
    ##  4 yes              yes          0.812       0.188
    ##  5 no               no           0.237       0.763
    ##  6 yes              no           0.0772      0.923
    ##  7 yes              no           0.372       0.628
    ##  8 no               no           0.371       0.629
    ##  9 no               no           0.0174      0.983
    ## 10 no               no           0.000370    1.00 
    ## # … with 234 more rows

Good job! You have created a tibble of model results on the test dataset
with the actual outcome variable value, predicted outcome values, and
estimated probabilities of the positive and negative classes. Now you
can evaluate the performance of your model with `yardstick`.

## Model performance metrics

In this exercise, you will use `yardstick` metric functions to evaluate
your model’s performance on the test dataset.

When you fit a logistic regression model to the telecommunications data
in Chapter 2, you predicted `canceled_service` using `avg_call_mins`,
`avg_intl_mins`, and `monthly_charges`. The sensitivity of your model
was 0.42 while the specificity was 0.895.

Now that you have incorporated all available predictor variables using
feature engineering, you can compare your new model’s performance to
your previous results.

Your model results, `telecom_results`, have been loaded into your
session.

**Steps**

1.  Create a confusion matrix of your model’s classification outcomes.

``` r
# Create a confusion matrix
telecom_results %>% 
  conf_mat(truth = canceled_service, estimate = .pred_class)
```

    ##           Truth
    ## Prediction yes  no
    ##        yes  52  23
    ##        no   30 139

2.  Calculate the sensitivity of your model.

``` r
# Calculate sensitivity
telecom_results %>% 
  sens(truth = canceled_service, estimate = .pred_class)
```

    ## # A tibble: 1 × 3
    ##   .metric .estimator .estimate
    ##   <chr>   <chr>          <dbl>
    ## 1 sens    binary         0.634

3.  Calculate the specificity of your model.

``` r
# Calculate specificity
telecom_results %>% 
  spec(truth = canceled_service, estimate = .pred_class)
```

    ## # A tibble: 1 × 3
    ##   .metric .estimator .estimate
    ##   <chr>   <chr>          <dbl>
    ## 1 spec    binary         0.858

4.  Create an ROC curve plot of your model’s performance.

``` r
# Plot ROC curve
telecom_results %>% 
  roc_curve(truth = canceled_service, .pred_yes) %>% 
  autoplot()
```

![](readme_files/figure-gfm/unnamed-chunk-69-1.png)<!-- -->

Fantastic work! You have really come a long way in developing your
modeling skills with `tidymodels`! From the results of your metric
calculations, using feature engineering and incorporating all predictor
variables increased your model’s sensitivity to 0.57, up from 0.42, and
specificity to 0.901, up from 0.895!

# 4. Workflows and Hyperparameter Tuning

Now it’s time to streamline the modeling process using workflows and
fine-tune models with cross-validation and hyperparameter tuning. You’ll
learn how to tune a decision tree classification model to predict
whether a bank’s customers are likely to default on their loan.

## Machine learning workflows

Theory. Coming soon …

**1. Machine learning workflows**

In this section, we will introduce decision tree models and learn how to
create workflows that combine models and recipes into a single object.

**2. Classification with decision trees**

Decision trees differ from logistic regression by their ability to
segment the predictor space into rectangular regions.A popular algorithm
for creating these regions is known as recursive binary splitting.To
demonstrate this algorithm, let’s use the lead scoring dataset where we
have customers who either did or did not purchase products based on
their website behavior.

**3. Classification with decision trees**

The algorithm makes a series of horizontal or vertical cut points, known
as splits.In this example, the first split is horizontal along the total
time on website variable.

**4. Classification with decision trees**

Next, a vertical split is created in the top portion of the first split
along the total website visits predictor.

**5. Classification with decision trees**

And finally, another vertical split along the total website visits
predictor is added in the bottom portion of the first split.

**6. Classification with decision trees**

This produces 4 distinct rectangular regions. The decision tree will
predict the majority class in each region. For some datasets, this
approach may produce better predictions when compared to the linear
decision boundaries of logistic regression models.

**7. Tree diagrams**

Tree diagrams are another way to visualize the prediction regions of
decision trees and are made up of a series of nodes. Interior nodes are
the splits of a decision tree and are represented by the dark boxes in
the diagram below.Terminal nodes provide the model predictions and are
represented by the green and purple boxes.Comparing a tree diagram to
the plot of rectangular regions in the lead scoring dataset, we see that
interior nodes correspond to the dashed lines in the plot while terminal
nodes correspond to the 4 rectangular regions.

**8. Model specification**

A decision tree model is specified with the decision_tree() function.
The common engine is ‘rpart’ and the mode can be either classification
or regression.For the lead scoring data, we need a mode of
classification.

**9. Feature engineering recipe**

From our previous work, we have our leads_recipe object which removes
multicollinearity, normalizes numeric predictors, and creates dummy
variables for nominal predictors.We have two R objects to manage during
the modeling process, our decision tree model and our feature
engineering recipe. Combining these into a single object would make the
process easier to manage.

**10. Combining models and recipes**

The workflows package provides the ability to combine models and recipes
into a single object.To create our workflow, we initialize an empty
workflow with the workflow() function, then add our decision tree model
with add_model() and finally our recipe with the add_recipe()
function.This produces a workflow that bundles our model with our
feature engineering steps.

**11. Model fitting with workflows**

To train our workflow, we pass it to last_fit() and provide our
leads_split object. Like before, performance metrics can be gathered
with the collect_metrics() function.Behind the scenes, these few lines
of code created training and test datasets, trained and applied our
recipe, fit our decision tree to the training data, and calculated
performance metrics on the test dataset. Pretty amazing!

**12. Collecting predictions**

The collect_predictions() function will create detailed prediction
results from a trained workflow for use in yardstick metric functions.

**13. Exploring custom metrics**

We can create a custom metric function that includes the area under the
roc curve, sensitivity, and specificity using the metric_set()
function.When we pass our predictions data to our function, we see that
our decision tree model had a ROC AUC of 0 point 775 on the test data.

**14. Loan default dataset**

In the exercises, you will be working with the loans_df dataset, which
contains financial data on consumer loans at a bank. The outcome
variable is loan_default and indicates whether a customer defaulted on
their loan or not.

**15. Let’s practice building workflows!**

Let’s practice building workflows!

## Exploring the loans dataset

The `workflows` package provides the ability to bundle `parsnip` models
and `recipe` objects into a single modeling `workflow` object. This
makes managing a machine learning project much easier and removes the
need to keep track of multiple modeling objects.

In this exercise, you will working with the `loans_df` dataset, which
contains financial information on consumer loans at a bank. The outcome
variable in this data is `loan_default`.

You will create a decision tree model object and specify a feature
engineering pipeline for the loan data. The `loans_df` tibble has been
loaded into your session.

**Steps**

1.  Create a data split object, `loans_split`, using the `loans_df`
    tibble making sure to stratify by the outcome variable.
2.  Create the training dataset.
3.  Create the test dataset.

``` r
# Load data
loans_df <- readRDS("data/loan_df.rds")

# Create data split object
loans_split <- initial_split(loans_df, 
                             strata = loan_default)

# Build training data
loans_training <- loans_split %>% 
  training()

# Build test data
loans_test <- loans_split %>% 
  testing()
```

4.  Select the numeric columns from `loans_training` and create a
    correlation matrix.

``` r
# Create data split object
loans_split <- initial_split(loans_df, 
                             strata = loan_default)

# Build training data
loans_training <- loans_split %>% 
  training()

# Build test data
loans_test <- loans_split %>% 
  testing()

# Check for correlated predictors
loans_training %>% 
  # Select numeric columns
  select_if(is.numeric) %>% 
  # Calculate correlation matrix
  cor()
```

    ##                 loan_amount interest_rate installment annual_income
    ## loan_amount     1.000000000  -0.004939285   0.9398740     0.3780620
    ## interest_rate  -0.004939285   1.000000000   0.0362389    -0.1068373
    ## installment     0.939874045   0.036238904   1.0000000     0.3240807
    ## annual_income   0.378062000  -0.106837328   0.3240807     1.0000000
    ## debt_to_income  0.118815701   0.155043643   0.1667754    -0.1868498
    ##                debt_to_income
    ## loan_amount         0.1188157
    ## interest_rate       0.1550436
    ## installment         0.1667754
    ## annual_income      -0.1868498
    ## debt_to_income      1.0000000

Great work! You have created your training and test datasets and
discovered that `loan_amount` and `installment` are highly correlated
predictor variables. To remove one of these predictors, you will have to
incorporate `step_corr()` into your feature engineering pipeline for
this data.

## Specifying a model and recipe

Now that you have created your training and test datasets, the next step
is to specify your model and feature engineering pipeline. These are the
two components that are needed to create a `workflow` object for the
model training process.

In this exercise, you will define a decision tree model object with
`decision_tree()` and a `recipe` specification with the `recipe()`
function.

Your `loans_training` data has been loaded into this session.

**Steps**

1.  Use the `decision_tree()` function to specify a decision tree
    classification model with the `rpart` engine.

``` r
dt_model <- decision_tree() %>% 
  # Specify the engine
  set_engine('rpart') %>% 
  # Specify the mode
  set_mode('classification')
```

2.  Create a `recipe` object with the `loans_training` data. Use all
    available predictor variables to predict the outcome,
    `loan_default`.
3.  Add a correlation filter to remove multicollinearity at a 0.85
    threshold, normalize all numeric predictors, and create dummy
    variables for all nominal predictors.

``` r
# Build feature engineering pipeline
loans_recipe <- recipe(loan_default ~ .,
                        data = loans_training) %>% 
  # Correlation filter
  step_corr(all_numeric(), threshold = 0.85) %>% 
  # Normalize numeric predictors
  step_normalize(all_numeric()) %>% 
  # Create dummy variables
  step_dummy(all_nominal(), -all_outcomes())

loans_recipe
```

    ## Recipe
    ## 
    ## Inputs:
    ## 
    ##       role #variables
    ##    outcome          1
    ##  predictor          7
    ## 
    ## Operations:
    ## 
    ## Correlation filter on all_numeric()
    ## Centering and scaling for all_numeric()
    ## Dummy variables from all_nominal(), -all_outcomes()

Nice work! Now that you have your model and feature engineering steps
specified, you can create a `workflow` object for model training.

## Creating workflows

`workflow` objects simplify the modeling process in `tidymodels`. With
`workflows`, it’s possible to train a `parsnip` model and `recipe`
object at the same time.

In this exercise, you will combine your decision tree model and feature
engineering `recipe` into a single `workflow` object and perform model
fitting and evaluation.

Your model object, `dt_model`, `recipe` object, `loans_recipe`, and data
split, `loans_split` have been loaded into this session.

**Steps**

1.  Create a `workflow` object, `loans_dt_wkfl`, that combines your
    decision tree model and feature engineering `recipe`.

``` r
# Create a workflow
loans_dt_wkfl <- workflow() %>% 
  # Include the model object
  add_model(dt_model) %>% 
  # Include the recipe object
  add_recipe(loans_recipe)

# View workflow specification
loans_dt_wkfl
```

    ## ══ Workflow ════════════════════════════════════════════════════════════════════
    ## Preprocessor: Recipe
    ## Model: decision_tree()
    ## 
    ## ── Preprocessor ────────────────────────────────────────────────────────────────
    ## 3 Recipe Steps
    ## 
    ## • step_corr()
    ## • step_normalize()
    ## • step_dummy()
    ## 
    ## ── Model ───────────────────────────────────────────────────────────────────────
    ## Decision Tree Model Specification (classification)
    ## 
    ## Computational engine: rpart

2.  Train your `workflow` with the `last_fit()` function.

``` r
# Train the workflow
loans_dt_wkfl_fit <- loans_dt_wkfl %>% 
  last_fit(split = loans_split)
```

3.  Display the performance metrics on the test dataset.

``` r
# Calculate performance metrics on test data
loans_dt_wkfl_fit %>% 
  collect_metrics()
```

    ## # A tibble: 2 × 4
    ##   .metric  .estimator .estimate .config             
    ##   <chr>    <chr>          <dbl> <chr>               
    ## 1 accuracy binary         0.813 Preprocessor1_Model1
    ## 2 roc_auc  binary         0.866 Preprocessor1_Model1

Good job! You have trained a `workflow` with `last_fit()` that created
training and test datasets, trained and applied your `recipe`, fit your
decision tree model to the training data and calculated performance
metrics on the test data all with just a few lines of code! The model
performed really well, with an area under the ROC curve of 0.849.

## Estimating performance with cross validation

Theory. Coming soon …

**1. Estimating performance with cross validation**

In this section, we will learn how to improve the model evaluation
process with a method known as cross validation.

**2. Training and test datasets**

We have been creating training and test datasets in our modeling process
where the training data is used for model fitting while the test data is
reserved for model evaluation to guard against overfitting.One downside
of this method is that we only get one estimate of model performance.

**3. K-fold cross validation**

K-fold cross validation is a technique that provides K estimates of
model performance and is typically used to compare different model
types, such as logistic regression and decision trees.

**4. K-fold cross validation**

The training data is randomly partitioned into K sets of roughly equal
size, known as folds,which are used to perform K iterations of model
fitting and evaluation. The test dataset is left out of this process so
it can provide a final, independent estimate of model performance once a
model type is chosen.

**5. Machine learning with cross validation**

If we have 5 folds, we will have five iterations of model training and
evaluation.

**6. Machine learning with cross validation**

In the first iteration, fold 1 is reserved for model evaluation while
the others are used for model training.

**7. Machine learning with cross validation**

In the second iteration, fold 2 is reserved for model evaluation while
the others are used for model training.

**8. Machine learning with cross validation**

This process continues until the fifth iteration, where fold 5 is used
for model evaluation. In total, this provides five estimates of model
performance.

**9. Creating cross validation folds**

The vfold_cv() function creates cross validation folds and takes a
tibble as the first argument, number of folds as the second, and a
stratification variable as the third. To create 10 folds from our
leads_training data, we set v equal to 10, and stratify by purchased to
ensure each fold has similar proportions of the outcome values.Executing
the set-dot-seed() function before the vfold_cv() function ensures
reproducibility. This function takes any integer as an argument and sets
the seed of R’s random number generator.This results in a tibble with a
list column named splits and an id column that identifies each fold.
Each row in splits contains a data split object that has the
instructions for splitting that row’s fold into a training or evaluation
set.

**10. Model training with cross validation**

The fit_resamples() function performs cross validation in tidymodels. To
train our leads_workflow on each fold, we pass it to fit_resamples(),
provide leads_folds to the resamples argument and our custom metric
function to the optional metrics argument. By default, accuracy and ROC
AUC are calculated.This returns a resamples object on which we can
collect metrics. We see that each metric was estimated 10 times, one per
each fold. The average of these estimates is provided in the mean
column.

**11. Detailed cross validation results**

Passing summarize equals false into collect_metrics() will create a
tibble with detailed results. For our leads_rs_fit, this gives us 30
total rows which represents our 3 metrics times our 10 folds. The
dot_metric column identifies the metric while the dot-estimate column
provides the estimated value for each fold.

**12. Summarizing cross validation results**

The results of collect_metrics() can be summarized with dplyr. Starting
with rs_metrics, we group by the dot-metric column, then calculate
summary statistics with the summarize() function for each metric in the
dot-metric column. This provides a summary of the distribution of
estimated metric values in our cross validation process.

**13. Cross validation methodology**

Resample model objects are not able to provide predictions on new data
sources. Passing leads_rs_fit to predict() yields an error.The purpose
of cross validation in tidymodels is not to fit a final model, but to
compare the performance of different model types to discover which one
works best for our data.

**14. Let’s cross validate!**

Let’s put our cross validation skills to use!

## Measuring performance with cross validation

Cross validation is a method that uses training data to provide multiple
estimates of model performance. When trying different model types on
your data, it is important to study their performance profile to help
decide which model type performs consistently well.

In this exercise, you will perform cross validation with your decision
tree model `workflow` to explore its performance.

The training data, `loans_training`, and your `workflow` object,
`loans_dt_wkfl`, have been loaded into your session.

**Steps**

1.  Create a cross validation object with 5 folds using the training
    data, making sure to stratify by the outcome variable.

``` r
# Create cross validation folds
set.seed(290)
loans_folds <- vfold_cv(loans_training, v = 5,
                       strata = loan_default)

loans_folds
```

    ## #  5-fold cross-validation using stratification 
    ## # A tibble: 5 × 2
    ##   splits            id   
    ##   <list>            <chr>
    ## 1 <split [521/132]> Fold1
    ## 2 <split [522/131]> Fold2
    ## 3 <split [523/130]> Fold3
    ## 4 <split [523/130]> Fold4
    ## 5 <split [523/130]> Fold5

2.  Create a custom metric function that includes the area under the ROC
    curve (ROC AUC), sensitivity, and specificity.

``` r
# Create custom metrics function
loans_metrics <- metric_set(roc_auc, sens, spec)
```

3.  Use your decision tree `workflow` to perform cross validation using
    your folds and custom metric function.

``` r
# Fit resamples
loans_dt_rs <- loans_dt_wkfl %>% 
  fit_resamples(resamples = loans_folds,
                metrics = loans_metrics)
```

4.  Explore the summarized results of your cross validation.

``` r
# View performance metrics
loans_dt_rs %>% 
  collect_metrics()
```

    ## # A tibble: 3 × 6
    ##   .metric .estimator  mean     n std_err .config             
    ##   <chr>   <chr>      <dbl> <int>   <dbl> <chr>               
    ## 1 roc_auc binary     0.804     5  0.0191 Preprocessor1_Model1
    ## 2 sens    binary     0.674     5  0.0510 Preprocessor1_Model1
    ## 3 spec    binary     0.868     5  0.0202 Preprocessor1_Model1

Excellent work! You have used cross validation to evaluate the
performance of your decision tree workflow. Across the 5 cross
validation folds, the average area under the ROC curve was 0.846. The
average sensitivity and specificity were 0.672 and 0.876, respectively.

## Cross validation with logistic regression

Cross validation provides the ability to compare the performance profile
of multiple model types. This is helpful in the early stages of
modeling, when you are trying to determine which model type will perform
best with your data.

In this exercise, you will perform cross validation on the
`loans_training` data using logistic regression and compare the results
to your decision tree model.

The `loans_folds` and `loans_metrics` objects from the previous exercise
have been loaded into your session. Your feature engineering `recipe`
from the previous section, `loans_recipe`, has also been loaded.

**Steps**

1.  Create a logistic regression model object with `parsnip` using the
    `glm` engine.

``` r
logistic_model <- logistic_reg() %>% 
  # Specify the engine
  set_engine('glm') %>% 
  # Specify the mode
  set_mode('classification')
```

2.  Create a `workflow` that combines your logistic regression model and
    feature engineering `recipe` into one object.

``` r
# Create workflow
loans_logistic_wkfl <- workflow() %>% 
  # Add model
  add_model(logistic_model) %>% 
  # Add recipe
  add_recipe(loans_recipe)
```

3.  Use your logistic regression `workflow` to perform cross validation
    using your folds and custom metric function.

``` r
# Fit resamples
loans_logistic_rs <- loans_logistic_wkfl %>% 
  fit_resamples(resamples = loans_folds,
                metrics = loans_metrics)
```

4.  Explore the summarized results of your cross validation.

``` r
# View performance metrics
loans_logistic_rs %>% 
  collect_metrics()
```

    ## # A tibble: 3 × 6
    ##   .metric .estimator  mean     n std_err .config             
    ##   <chr>   <chr>      <dbl> <int>   <dbl> <chr>               
    ## 1 roc_auc binary     0.841     5  0.0160 Preprocessor1_Model1
    ## 2 sens    binary     0.663     5  0.0433 Preprocessor1_Model1
    ## 3 spec    binary     0.858     5  0.0158 Preprocessor1_Model1

Great job! For logistic regression, across the 5 cross validation folds,
the average area under the ROC curve was 0.848. The average sensitivity
and specificity were 0.648 and 0.873, respectively. ROC AUC and
specificity are very close to the decision tree cross validation
results. However, the decision tree model performed slightly better on
sensitivity, with an average value of 0.672.

## Comparing model performance profiles

The benefit of the `collect_metrics()` function is that it returns a
tibble of cross validation results. This makes it easy to calculate
custom summary statistics with the `dplyr` package.

In this exercise, you will use `dplyr` to explore the cross validation
results of your decision tree and logistic regression models.

Your cross validation results, `loans_dt_rs` and `loans_logistic_rs`
have been loaded into your session.

**Steps**

1.  Collect the detailed cross validation results for your decision tree
    model.
2.  Calculate the minimum, median, and maximum estimated metric values
    by metric type.

``` r
# Detailed cross validation results
dt_rs_results <- loans_dt_rs %>% 
  collect_metrics(summarize = FALSE)

# Explore model performance for decision tree
dt_rs_results %>% 
  group_by(.metric) %>% 
  summarize(min = min(.estimate),
            median = median(.estimate),
            max = max(.estimate))
```

    ## # A tibble: 3 × 4
    ##   .metric   min median   max
    ##   <chr>   <dbl>  <dbl> <dbl>
    ## 1 roc_auc 0.770  0.779 0.869
    ## 2 sens    0.56   0.647 0.82 
    ## 3 spec    0.825  0.85  0.938

3.  Collect the detailed cross validation results for your logistic
    regression model.
4.  Calculate the minimum, median, and maximum estimated metric values
    by metric type.

``` r
# Detailed cross validation results
logistic_rs_results <- loans_logistic_rs %>% 
  collect_metrics(summarize = FALSE)

# Explore model performance for logistic regression
logistic_rs_results %>% 
  group_by(.metric) %>% 
  summarize(min = min(.estimate),
            median = median(.estimate),
            max = max(.estimate))
```

    ## # A tibble: 3 × 4
    ##   .metric   min median   max
    ##   <chr>   <dbl>  <dbl> <dbl>
    ## 1 roc_auc 0.802  0.826 0.891
    ## 2 sens    0.549  0.66  0.8  
    ## 3 spec    0.815  0.85  0.912

Great job! Both models have similar average values across all metrics.
However, logistic regression tends to have a wider range of values on
all metrics. This provides evidence that a decision tree model may
produce more stable prediction accuarcy on the loans dataset.

## Hyperparameter tuning

Theory. Coming soon …

**1. Hyperparameter tuning**

In this section, we will focus on hyperparameter tuning which is another
method of optimizing model performance.

**2. Hyperparameters**

Hyperparameters are model parameters whose values are set prior to model
training and control model complexity. In parsnip, decision trees have
three hyperparameters. cost_complexity is a number that is used to
penalize trees with large numbers of terminal nodes. tree_depth controls
how long the path from the root to any terminal node can be. min_n
controls the minimum data points required in a node for further
splitting.

**3. Default hyperparameter values**

When no arguments are provided to the decision_tree() function,
cost_complexity is set to 0-point-01, tree_depth to 30, and min_n to
20.These values, however, may not be optimal for all datasets. Changing
them might improve overall performance.Hyperparameter tuning is the
process of using cross validation to find the optimal set of
hyperparameter values for a model.

**4. Labeling hyparameters for tuning**

The tune() function from the tune package is used to label model
hyperparameters.We simply set the values of each hyperparameter to
tune() within decision_tree().This creates a model object with tuning
parameters and will let other methods know that they need to be
optimized. When we print our dt_tune_model object, the hyperparameters
appear under main arguments.

**5. Creating a tuning workflow**

To perform hyperparameter tuning, we first create a new workflow by
updating our previous one with our new decision tree model. We pass
leads_wkfl to update_model() and replace our prior decision tree with
our new one.When we print our new workflow, we see that the
hyperparameters appear in the model specification along with our feature
engineering recipe.

**6. Grid search**

Hyperparameter tuning is accomplished using grid search, a method where
a grid of hyperparameter values is generated.For each combination, cross
validation is used to estimate model performance and the best performing
combination is chosen.

**7. Identifying hyperparameters**

The parameters function from the dials package can be used to identify
the hyperparameters in a parsnip model object.This function returns a
tibble with the hyperparameters labeled by tune(), if any. This tibble
is used to help generate grids for tuning.

**8. Random grid**

A popular method for grid search is to generate random combinations of
hyperparameter values. Since there can be an infinite number of
hyperparameter combinations, choosing them at random will provide a
greater chance of discovering optimal combinations. Choosing them in a
systematic way may limit the range of values that are chosen which could
lead to poor results.To create a random grid, we pass the results of the
parameters() function on our dt_tune_model to the grid_random() function
and select the number of combinations to generate. To reproduce this
grid, execute the set-dot-seed() function before grid_random().This
creates a tibble with random combinations.

**9. Saving a tuning grid**

To perform hyperparameter tuning on our decision tree model, we first
save the results of grid_random(), where we have 5 combinations.

**10. Hyperparameter tuning with cross validation**

We then pass our leads_tune_wkfl to the tune_grid() function. This
function also requires a cross validation object, a tuning grid, and
optional custom metrics function. For our workflow, we use leads_folds,
our dt_grid, and our custom leads_metrics function.tune_grid() returns a
tibble of tuning results. The dot-metrics column is a list column with
the results for each fold.

**11. Exploring tuning results**

The collect_metrics() functions can be used on a tuning object to
collect results. By default, the average performance metric is returned
for each combination of hyperparameter values and performance metric.
Since our decision tree has 5 random hyperparameter combinations and we
are tracking 3 metrics, we get 15 total rows in the output. Since we
have 10 folds in our cross validation object, each row is the average of
the performance across the 10 folds.

**12. Let’s get tuning!**

Let’s practice tuning decision trees!

## Setting model hyperparameters

Hyperparameter tuning is a method for fine-tuning the performance of
your models. In most cases, the default hyperparameters values of
`parsnip` model objects will not be the optimal values for maximizing
model performance.

In this exercise, you will define a decision tree model with
hyperparameters for tuning and create a tuning `workflow` object.

Your decision tree `workflow` object, `loans_dt_wkfl`, has been loaded
into your session.

**Steps**

1.  Create a `parsnip` decision tree model and set all three of its
    hyperparameters for tuning.
2.  Use the `rpart` engine.

``` r
# Set tuning hyperparameters
dt_tune_model <- decision_tree(cost_complexity = tune(),
                               tree_depth = tune(),
                               min_n = tune()) %>% 
  # Specify engine
  set_engine('rpart') %>% 
  # Specify mode
  set_mode('classification')

dt_tune_model
```

    ## Decision Tree Model Specification (classification)
    ## 
    ## Main Arguments:
    ##   cost_complexity = tune()
    ##   tree_depth = tune()
    ##   min_n = tune()
    ## 
    ## Computational engine: rpart

3.  Create a tuning `workflow` by updating your `loans_dt_wkfl` object
    with your new decision tree model.

``` r
# Create a tuning workflow
loans_tune_wkfl <- loans_dt_wkfl %>% 
  # Replace model
  update_model(dt_tune_model)

loans_tune_wkfl
```

    ## ══ Workflow ════════════════════════════════════════════════════════════════════
    ## Preprocessor: Recipe
    ## Model: decision_tree()
    ## 
    ## ── Preprocessor ────────────────────────────────────────────────────────────────
    ## 3 Recipe Steps
    ## 
    ## • step_corr()
    ## • step_normalize()
    ## • step_dummy()
    ## 
    ## ── Model ───────────────────────────────────────────────────────────────────────
    ## Decision Tree Model Specification (classification)
    ## 
    ## Main Arguments:
    ##   cost_complexity = tune()
    ##   tree_depth = tune()
    ##   min_n = tune()
    ## 
    ## Computational engine: rpart

Good job! When you print your new `workflow` object, the decision tree
hyperparameters now appear under the main arguments section.

## Random grid search

The most common method of hyperparameter tuning is grid search. This
method creates a tuning grid with unique combinations of hyperparameter
values and uses cross validation to evaluate their performance. The goal
of hyperparameter tuning is to find the optimal combination of values
for maximizing model performance.

In this exercise, you will create a random hyperparameter grid and tune
your loans data decision tree model.

Your cross validation folds, `loans_folds`, `workflow` object,
`loans_tune_wkfl`, custom metrics function, `loans_metrics`, and
`dt_tune_model` have been loaded into your session.

**Steps**

1.  Create a random grid of 5 hyperparameter value combinations using
    the hyperparameters of your `dt_tune_model` object.

``` r
# Hyperparameter tuning with grid search
set.seed(214)
dt_grid <- grid_random(parameters(dt_tune_model),
                       size = 5)

dt_grid
```

    ## # A tibble: 5 × 3
    ##   cost_complexity tree_depth min_n
    ##             <dbl>      <int> <int>
    ## 1    0.0000000758         14    39
    ## 2    0.0243                5    34
    ## 3    0.00000443           11     8
    ## 4    0.000000600           3     5
    ## 5    0.00380               5    36

2.  Use your `loans_tune_wkfl` object to perform hyperparameter tuning
    on your tuning grid with your cross validation folds and custom
    metrics function.

``` r
# Hyperparameter tuning
dt_tuning <- loans_tune_wkfl %>% 
  tune_grid(resamples = loans_folds,
            grid = dt_grid,
            metrics = loans_metrics)
```

3.  Extract the summarized tuning results from your tuning object.

``` r
# View results
dt_tuning %>% 
  collect_metrics()
```

    ## # A tibble: 15 × 9
    ##    cost_complexity tree_depth min_n .metric .estimator  mean     n std_err
    ##              <dbl>      <int> <int> <chr>   <chr>      <dbl> <int>   <dbl>
    ##  1    0.0000000758         14    39 roc_auc binary     0.843     5  0.0125
    ##  2    0.0000000758         14    39 sens    binary     0.667     5  0.0444
    ##  3    0.0000000758         14    39 spec    binary     0.845     5  0.0156
    ##  4    0.0243                5    34 roc_auc binary     0.770     5  0.0191
    ##  5    0.0243                5    34 sens    binary     0.639     5  0.0468
    ##  6    0.0243                5    34 spec    binary     0.900     5  0.0157
    ##  7    0.00000443           11     8 roc_auc binary     0.799     5  0.0191
    ##  8    0.00000443           11     8 sens    binary     0.628     5  0.0370
    ##  9    0.00000443           11     8 spec    binary     0.798     5  0.0379
    ## 10    0.000000600           3     5 roc_auc binary     0.762     5  0.0173
    ## 11    0.000000600           3     5 sens    binary     0.623     5  0.0406
    ## 12    0.000000600           3     5 spec    binary     0.903     5  0.0149
    ## 13    0.00380               5    36 roc_auc binary     0.828     5  0.0179
    ## 14    0.00380               5    36 sens    binary     0.678     5  0.0549
    ## 15    0.00380               5    36 spec    binary     0.848     5  0.0294
    ## # … with 1 more variable: .config <chr>

Good work! Since you have 5 random hyperparameter combinations and 3
performance metrics, there are 15 results in your summarized tuning
results. Each row shows the average of the 5 cross validation estimates
of each metric and hyperparameter combination.

## Exploring tuning results

The `collect_metrics()` function is able to produce a detailed tibble of
tuning results from a tuning object. Since this function returns a
tibble, it works well with the `dplyr` package for further data
exploration and analysis.

In this exercise, you will explore your tuning results, `dt_tuning`, to
gain further insights into your hyperparameter tuning.

Your `dt_tuning` object has been loaded into this session.

**Steps**

1.  Extract the detailed tuning results from your `dt_tuning` object.

``` r
# Collect detailed tuning results
dt_tuning_results <- dt_tuning %>% 
  collect_metrics(summarize = FALSE)

dt_tuning_results
```

    ## # A tibble: 75 × 8
    ##    id    cost_complexity tree_depth min_n .metric .estimator .estimate .config  
    ##    <chr>           <dbl>      <int> <int> <chr>   <chr>          <dbl> <chr>    
    ##  1 Fold1    0.0000000758         14    39 sens    binary         0.765 Preproce…
    ##  2 Fold1    0.0000000758         14    39 spec    binary         0.840 Preproce…
    ##  3 Fold1    0.0000000758         14    39 roc_auc binary         0.825 Preproce…
    ##  4 Fold2    0.0000000758         14    39 sens    binary         0.608 Preproce…
    ##  5 Fold2    0.0000000758         14    39 spec    binary         0.875 Preproce…
    ##  6 Fold2    0.0000000758         14    39 roc_auc binary         0.838 Preproce…
    ##  7 Fold3    0.0000000758         14    39 sens    binary         0.62  Preproce…
    ##  8 Fold3    0.0000000758         14    39 spec    binary         0.862 Preproce…
    ##  9 Fold3    0.0000000758         14    39 roc_auc binary         0.840 Preproce…
    ## 10 Fold4    0.0000000758         14    39 sens    binary         0.56  Preproce…
    ## # … with 65 more rows

2.  Calculate the minimum, median, and maximum area under the ROC curve
    for each fold in the detailed tuning results.

``` r
# Explore detailed ROC AUC results for each fold
dt_tuning_results %>% 
  filter(.metric == 'roc_auc') %>% 
  group_by(id) %>% 
  summarize(min_roc_auc = min(.estimate),
            median_roc_auc = median(.estimate),
            max_roc_auc = max(.estimate))
```

    ## # A tibble: 5 × 4
    ##   id    min_roc_auc median_roc_auc max_roc_auc
    ##   <chr>       <dbl>          <dbl>       <dbl>
    ## 1 Fold1       0.728          0.772       0.825
    ## 2 Fold2       0.720          0.819       0.838
    ## 3 Fold3       0.773          0.822       0.849
    ## 4 Fold4       0.735          0.771       0.834
    ## 5 Fold5       0.793          0.838       0.891

Excellent work! You have now had the chance to explore the detailed
results of your decision tree hyperparameter tuning. The next step will
be selecting the best combination and finalizing your `workflow` object!

## Selecting the best model

Theory. Coming soon …

**1. Selecting the best model**

In the previous section, we performed hyperparameter tuning and obtained
a tibble of results. The next step is to select the best performing
hyperparameter value combinations and finalize our workflow.

**2. Detailed tuning results**

By default, the collect_metrics() function provides summarized results
from hyperparameter tuning. Just like in the resampling case with
fit_resamples(), passing summarize equals FALSE into collect_metrics()
will produce a tibble of detailed results. The detailed results for our
dt_tuning object includes 150 rows. This is because we have 10 folds, 3
metrics, and 5 random hyperparameter combinations that were evaluated.

**3. Exploring tuning results**

Since collect_metrics() returns a tibble, we can easily pass it to dplyr
functions to create custom summaries. For example, we can look at the
minimum, median, and maximum ROC AUC values that occurred within each
cross validation fold during tuning.To do this, we filter for dot-metric
being roc_auc, then group by the id column which has the fold identifier
values, and calculate summary statistics of the dot-estimate column with
the summarize() function. Here we are looking to see if the estimated
values are fairly consistent across folds. Wild fluctuations would be an
indicator of model overfitting.

**4. Viewing the best performing models**

To make exploring tuning results easier, we can use the show_best()
function to display the top performing hyperparameter combinations. This
function takes our dt_tuning object as the first argument, the metric
for evaluation as the second, and the number of model combinations to
display.From the results, the hyperparameter combination labeled as
Model1 in the dot-config column has the largest average ROC AUC.

**5. Selecting a model**

The select_best() function is used to select the best performing
hyperparameters. We pass our dt_tuning object to select_best() and
provide the metric on which to evaluate performance.This function
returns a tibble with the hyperparameter values that produced the
largest average performance metric value. For our results, it was Model1
for the ROC AUC metric.

**6. Finalizing the workflow**

The results of select_best() can be used to finalize a workflow object
with the finalize_workflow() function. To finalize a workflow, pass it
to the finalize_workflow() function and provide the results of the
select_best() function as an argument. In our case, we pass the
leads_tune_wkfl to finalize_workflow() and provide the best_dt_model
tibble.This returns an updated workflow object with the model
hyperparameter values set to the optimal values found during the tuning
process.

**7. Model fitting**

After a workflow has been finalized, it can be trained with the
last_fit() function and the original data split object, leads_split in
our example.Behind the scenes, the training and test datasets are
created from leads_split, our recipe is trained and applied, our tuned
decision tree model is trained with the entire training dataset, and
predictions and metrics are generated with the test dataset. For our
model, we got a ROC AUC of 0-point-793 on the test dataset, which was
held out of the process until this final step. This is in line with our
tuning results, which had ROC AUC values near 0-point-8 for most
combinations. In general, having similar performance between cross
validation and the test dataset indicates that a model will perform
similarly on new data sources.

**8. Let’s practice!**

Let’s practice finalizing workflows based on tuning results!

## Finalizing a workflow

To incorporate hyperparameter tuning into your modeling process, an
optimal hyperparameter combination must be selected based on the average
value of a performance metric. Then you will be able to finalize your
tuning workflow and fit your final model.

In this exercise, you will explore the best performing models from your
hyperparameter tuning and finalize your tuning `workflow` object.

The `dt_tuning` and `loans_tune_wkfl` objects from your previous session
have been loaded into your environment.

**Steps**

1.  Display the 5 best performing hyperparameter combinations from your
    tuning results based on the area under the ROC curve.

``` r
# Display 5 best performing models
dt_tuning %>% 
  show_best(metric = 'roc_auc', n = 5)
```

    ## # A tibble: 5 × 9
    ##   cost_complexity tree_depth min_n .metric .estimator  mean     n std_err
    ##             <dbl>      <int> <int> <chr>   <chr>      <dbl> <int>   <dbl>
    ## 1    0.0000000758         14    39 roc_auc binary     0.843     5  0.0125
    ## 2    0.00380               5    36 roc_auc binary     0.828     5  0.0179
    ## 3    0.00000443           11     8 roc_auc binary     0.799     5  0.0191
    ## 4    0.0243                5    34 roc_auc binary     0.770     5  0.0191
    ## 5    0.000000600           3     5 roc_auc binary     0.762     5  0.0173
    ## # … with 1 more variable: .config <chr>

2.  Select the best hyperparameter combination from your tuning results
    based on the area under the ROC curve.

``` r
# Select based on best performance
best_dt_model <- dt_tuning %>% 
  # Choose the best model based on roc_auc
  select_best(metric = 'roc_auc')

best_dt_model
```

    ## # A tibble: 1 × 4
    ##   cost_complexity tree_depth min_n .config             
    ##             <dbl>      <int> <int> <chr>               
    ## 1    0.0000000758         14    39 Preprocessor1_Model1

3.  Finalize your `loans_tune_wkfl` with the best hyperparameter
    combination.

``` r
# Finalize your workflow
final_loans_wkfl <- loans_tune_wkfl %>% 
  finalize_workflow(best_dt_model)

final_loans_wkfl
```

    ## ══ Workflow ════════════════════════════════════════════════════════════════════
    ## Preprocessor: Recipe
    ## Model: decision_tree()
    ## 
    ## ── Preprocessor ────────────────────────────────────────────────────────────────
    ## 3 Recipe Steps
    ## 
    ## • step_corr()
    ## • step_normalize()
    ## • step_dummy()
    ## 
    ## ── Model ───────────────────────────────────────────────────────────────────────
    ## Decision Tree Model Specification (classification)
    ## 
    ## Main Arguments:
    ##   cost_complexity = 7.58290839567418e-08
    ##   tree_depth = 14
    ##   min_n = 39
    ## 
    ## Computational engine: rpart

Good job! When you printed your finalized `workflow` object, the optimal
hyperparameter combination is displayed in the main arguments section of
the output. Your `workflow` is now ready for model fitting and
prediction on new data sources!

## Training a finalized workflow

Congratulations on successfully tuning your decision tree model and
finalizing your workflow! Your `final_loans_wkfl` object can now be used
for model training and prediction on new data sources.

In this last exercise, you will train your finalized `workflow` on the
entire `loans_training` dataset and evaluate its performance on the
`loans_test` data.

The `final_loans_wkfl` and `loans_split` objects have been loaded into
your session.

**Steps**

1.  Train your finalized `workflow` with the `last_fit()` function.

``` r
# Train finalized decision tree workflow
loans_final_fit <- final_loans_wkfl %>% 
  last_fit(split = loans_split)
```

2.  Gather the performance metrics on the test data.

``` r
# View performance metrics
loans_final_fit %>% 
  collect_metrics()
```

    ## # A tibble: 2 × 4
    ##   .metric  .estimator .estimate .config             
    ##   <chr>    <chr>          <dbl> <chr>               
    ## 1 accuracy binary         0.813 Preprocessor1_Model1
    ## 2 roc_auc  binary         0.866 Preprocessor1_Model1

3.  Use your trained `workflow` object to create an ROC curve.

``` r
# Create an ROC curve
loans_final_fit %>% 
  # Collect predictions
  collect_predictions() %>%
  # Calculate ROC curve metrics
  roc_curve(truth = loan_default, .pred_yes) %>%
  # Plot the ROC curve
  autoplot()
```

![](readme_files/figure-gfm/unnamed-chunk-99-1.png)<!-- -->

Great job! You were able to train your finalized `workflow` with
`last_fit()` and generate predictions on the test data. The tuned
decision tree model produced an area under the ROC curve of 0.875.
That’s a great model! The ROC curve shows that the sensitivity and
specificity remain high across a wide range of probability threshold
values.

## Congratulations!

Theory. Coming soon …

**1. Congratulations!**

Congratulations on completing the course! You have truly accomplished a
lot and are well on your way to mastering machine learning with
tidymodels!

**2. The tidymodels ecosystem**

In chapter 1, you learned about the various roles that each tidymodels
package plays within in the machine learning process.

**3. Regression modeling**

You also learned how to specify models with the parsnip package and
train and evaluate linear regression models.

**4. Classification modeling**

In chapter 2, you trained logistic regression models and learned how to
evaluate their performance with sensitivity, specificity, and ROC
curves.

**5. Feature engineering**

In chapter 3, you built feature engineering pipelines to prepare
datasets for modeling.

**6. Fine tuning models with cross validation**

And finally, in chapter 4, you learned how to improve prediction
accuracy with cross validation and hyperparameter tuning.

**7. Thank you!**

Thanks again for taking the course and I hope you bring tidymodels into
your daily data science work!
