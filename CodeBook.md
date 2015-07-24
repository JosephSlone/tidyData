---
output: html_document
---
# Code Book 
## Original Data Source
### Source URL
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

A full description is available at the site where the data was obtained: 

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

### Human Activity Recognition Using Smartphones Dataset
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.[1]

## Processing Description

1. Import data sets - **For both train and test data sets.**
  1. Import data into tables
  2. Determine which columns to keep or drop.
  3. Import the subject list, name the subject column, and add an index column to the table.
  4. Import the activity labels and merge it with the activity table (y_test) and add an index column to the table.
  5. Import the test data and add an index column to the table.
  6. Join all three tables together by the common index column.
  7. Drop the columns that we don't need 
  8. Name the columns from the test data that we are keeping.
2. Merge the train and test data sets together.
3. Calculate the mean of all the **std** and **mean** columns.

## Data Set Description

The data consists of 40 rows made up of 81 columns each.  

- an identifier of the subject who carried out the experiment (Subject). Its range is from 1 to 30.
- an activity label (Activity): WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
- the mean of all other variables are measurements collected from the accelerometer and gyroscope 3-axial raw signal (numeric value)

The measurement variable names are defined in three sections, separated by hyphen, as follows:

- **Section 1**  The actual measurement.
- **Section 2**  Mean/Std: mean or standard deviation of the measurement
- **Section 3**  x/y/z: one direction of a 3-axial signal


[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012