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
setwd("UCI HAR Dataset/test/")
subjectData <- read.table("subject_test.txt")
trainData <- read.table("X_test.txt")

# Apparently, this is dangerous. The order doesn't stay, I think.


allTrain<- merge(subjectData, trainData, by="row.names")

# Exploring


Aaarrggh!

paste file1 file2 | column -s $' ' -t    would be so simple.