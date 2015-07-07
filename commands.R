library(RCurl)
library(data.table)
URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
fileName <- "DastaSet.zip"
fileBuffer <- getBinaryURL(URL, ssl.verifypeer=FALSE)
fileHandle = file(fileName, open="wb")
writeBin(fileBuffer, fileHandle)
close(fileHandle)
unzip(fileName)
setwd("UCI HAR Dataset/test/")
subjectData <- read.table("subject_test.txt")
trainData <- read.table("X_test.txt")
allTrain<- merge(subjectData, trainData, by="row.names")