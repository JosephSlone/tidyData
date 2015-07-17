library(RCurl)
library(data.table)

# Get the zip file and unzip it.
# This needs to be a function call.
#
# Be carefull here, it looks like the rubic calls for the
# zip file to be downloaded before running the script.
#
# Maybe provide a .R that pulls the file down, but assume that the .zip
# file is already downloaded when running run_analysis.R
#


library(RCurl)
URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
fileName <- "DastaSet.zip"
fileBuffer <- getBinaryURL(URL, ssl.verifypeer=FALSE)
fileHandle = file(fileName, open="wb")
writeBin(fileBuffer, fileHandle)
close(fileHandle)
fileBuffer <- NULL
unzip(fileName)

# Import tables and name columns

setwd("UCI HAR Dataset/")
feature.names <- read.table("features.txt")
setwd('../')
setwd("UCI HAR Dataset/test/")
subjectData <- read.table("subject_test.txt")
colnames(subjectData) = c('Subject')

trainData <- read.table("X_test.txt")
colnames(trainData) = feature.names[,2]

# Add Column with row numbers to tables ... (row_id)
subjectData$row_id <- 1:nrow(subjectData)
trainData$row_id <- 1:nrow(trainData)

# I suppose thatwe could use dplyr's mutate
#
# ... For Example: x <- mutate(flights, row_id = row_number() )
# ... Add's a row number
#
# This is neater and makes use of what is being covered in the
# lectures (I think).

# Merges data tables on the common column name ... row_id
merged <- merge(subjectData, trainData, all=TRUE)

# Apparently, this is dangerous. The order doesn't stay, I think.

allTrain<- merge(subjectData, trainData, by="row.names")


# Aaarrggh!

# paste file1 file2 | column -s $' ' -t    would be so simple.





library(RCurl)
library(data.table)
URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
fileName <- "DastaSet.zip"
fileBuffer <- getBinaryURL(URL, ssl.verifypeer=FALSE)
fileHandle = file(fileName, open="wb")
writeBin(fileBuffer, fileHandle)
close(fileHandle)
fileBuffer <- NULL
unzip(fileName)

feature.names <- read.table("UCI HAR Dataset/features.txt")
test.subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
colnames(test.subjects) = c('Subject')
test.activity <- read.table("UCI HAR Dataset/test/y_test.txt")
colnames(test.activity) <- c("ActivityCode")
activity.labels <- read.table("UCI HAR Dataset/activity_labels.txt")
colnames(activity.labels) <- c("ActivityCode", "ActivityName")

test.data <- read.table("UCI HAR Dataset/test/X_test.txt")
colnames(test.data) = feature.names[,2]

# testData <- merge(subjectData, trainData, by="row.names")

test.activity.labeled <- merge(test.activity, activity.labels, all.x=TRUE, all.y=FALSE)

