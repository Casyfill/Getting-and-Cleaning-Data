Getting and Cleaning data course project
========
**Philipp Kats, May 2015**

##Summary
This course project aims to merge and tidy train and test parts for the **Human Activity Recognition Using Smartphones Data Set**.

[dataset documentation](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
[source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

##Instructions
Script requires data to be unziped and stored in **/data** folder.
It also requires **plyr** package.

####0. Setup and read data
At this point we read 3 files (data, labels and subjects) for each dataset (train and test). Also, we read the file with all variable names and attach those names to columns in both datasets

####1. Merges the training and the test sets to create one data set
Here we merge train ad test datasets into one.

####2.Extracts only the measurements on the mean and standard deviation for each measurement
Now we define a checkName function, which answers whatever chosen column is needed, depending on column name - we keep "subject", "labels" and all other columns with "mean()" and "std()", skipping all others.
Then we apply this function to filter, creating new, reduced dataset.

####3. Describtive variables - we can skip this step as columns are already renamed with discribtive labels in step 1

####4. Uses descriptive activity names to name the activities in the data set
Now we transform both **subject** and **labels** to factor levels. 
then, using **mapvalues** function from **plyr** package we rename labels in **labels** with the given vector of names (I hardwrited labels as ther is only six of them)
####5.
Now we aggregate averages for each activity type and subject using **aggregate** function.

####6. Saving file
now lets save new dataframe