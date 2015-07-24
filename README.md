# tidyData

## Tidy Data Set - Coursera Getting and Cleaning Data

While not part of the project description, I chose to create an R script that will download and unzip the data located at the URI that was given to us for the project.

**Download.R**, when sourced, will provide a function that will download the course data file and unzip it into the proper directory.

The main routine is found in **run_analysis.R.** It will, when sourced, provide a function (run_analysis()) which will perform all of the processing needed to create the summary data set.  A secondary function (makeAllData()) will return the data table that run_analysis() summarizes.

The other two functions that are  contained in **Download.R** are for internal use only.  They perform all of the parsing and joining required for the Train and Test data sets.
