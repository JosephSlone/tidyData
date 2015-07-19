# Merge files together

library(data.table)
library(dplyr)

makeTestData <- function(){
    # Columns that we are interested in ...
    # contains std or mean in the name.
    feature.names <- fread("UCI HAR Dataset/features.txt")
    columnsToDelete <- feature.names[grep("mean|std", feature.names$V2, invert=TRUE)]
    columnsToDelete$V3 <- paste("V", columnsToDelete$V1, sep="")
    columnsToKeep <-  feature.names[grep("mean|std", feature.names$V2)]
    columnsToKeep$V3 <- paste("V", columnsToKeep$V1, sep="")

    # Data.Table of subjects with a row index
    test.subjects <- fread("UCI HAR Dataset/test/subject_test.txt")
    setnames(test.subjects, c('Subject'))
    idxCol <- sequence(length(test.subjects$Subject))
    test.subjects$Index <-idxCol

    # The activity labels (with a row index)
    test.activity <- fread("UCI HAR Dataset/test/y_test.txt")
    setnames(test.activity, c("ActivityCode"))
    activity.labels <- fread("UCI HAR Dataset/activity_labels.txt")
    setnames(activity.labels, c("ActivityCode", "ActivityName"))
    test.activity.labeled <-
        merge(test.activity, activity.labels, by=c("ActivityCode"), all.x=TRUE, all.y=FALSE)
    test.activity.labeled$Index <- idxCol

    # X_test data frame
    # Because fread has trouble with this file
    test.data.frame <- read.table("UCI HAR Dataset/test/X_test.txt")
    test.data <- data.table(test.data.frame)
    test.data.frame <- NULL
    test.data$Index <- idxCol

    # Merge Everything together
    test.data.subjects <- merge(test.subjects, test.data, by="Index")
    test.data.activity <- merge(test.data.subjects, test.activity.labeled, by="Index")

    # Drop the columns we don't need
    test.data.activity[ ,columnsToDelete$V3 := NULL]
	test.data.activity[ ,c("Index") := NULL]

    # Rename the columns that we are keeping
    setnames(test.data.activity, old=columnsToKeep$V3, new=columnsToKeep$V2)


    return(test.data.activity)
}

makeTrainData <- function(){
    # Columns that we are interested in ...
    # contains std or mean in the name.
    feature.names <- fread("UCI HAR Dataset/features.txt")
    columnsToDelete <- feature.names[grep("mean|std", feature.names$V2, invert=TRUE)]
    columnsToDelete$V3 <- paste("V", columnsToDelete$V1, sep="")
    columnsToKeep <-  feature.names[grep("mean|std", feature.names$V2)]
    columnsToKeep$V3 <- paste("V", columnsToKeep$V1, sep="")

    # Data.Table of subjects with a row index
    train.subjects <- fread("UCI HAR Dataset/train/subject_train.txt")
    setnames(train.subjects, c('Subject'))
    idxCol <- sequence(length(train.subjects$Subject))
    train.subjects$Index <-idxCol

    # The activity labels (with a row index)
    train.activity <- fread("UCI HAR Dataset/train/y_train.txt")
    setnames(train.activity, c("ActivityCode"))
    activity.labels <- fread("UCI HAR Dataset/activity_labels.txt")
    setnames(activity.labels, c("ActivityCode", "ActivityName"))
    train.activity.labeled <-
        merge(train.activity, activity.labels, by=c("ActivityCode"), all.x=TRUE, all.y=FALSE)
    train.activity.labeled$Index <- idxCol

    # X_train data frame
    # Because fread has trouble with this file
    train.data.frame <- read.table("UCI HAR Dataset/train/X_train.txt")
    train.data <- data.table(train.data.frame)
    train.data.frame <- NULL
    train.data$Index <- idxCol

    # Merge Everything together
    train.data.subjects <- merge(train.subjects, train.data, by="Index")
    train.data.activity <- merge(train.data.subjects, train.activity.labeled, by="Index")

    # Drop the columns we don't need
    train.data.activity[ ,columnsToDelete$V3 := NULL]
	train.data.activity[ ,c("Index") := NULL]

    # Rename the columns that we are keeping
    setnames(train.data.activity, old=columnsToKeep$V3, new=columnsToKeep$V2)


    return(train.data.activity)
}

run_analysis <- function() {

	train.data <- makeTrainData()
	test.data <- makeTestData()
	all.data <- rbindlist(list(train.data, test.data))
	all.data.summary <- all.data %>% group_by(Subject, ActivityName) %>% summarise_each(funs(mean), matches("std|mean"))
	setorderv(all.data.summary, c("Subject","ActivityName"))
    return(all.data.summary)
}