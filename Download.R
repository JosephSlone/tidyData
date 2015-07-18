# This script downloads and unzips the data file
# to the root directory of the project.

library(RCurl)

download.data <- function(){
    URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    fileName <- "DastaSet.zip"
    message("Downloading File")
    fileBuffer <- getBinaryURL(URL, ssl.verifypeer=FALSE)
    fileHandle = file(fileName, open="wb")
    writeBin(fileBuffer, fileHandle)
    close(fileHandle)
    fileBuffer <- NULL
    message("Unzipping...")
    unzip(fileName)
    message("Finished")
}
