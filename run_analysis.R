# Merging and tyding data. Course Project, Coursera
#Philipp Kats, May 2015

# data https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# dataset describtion http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

#Setup
dir <- '/Users/casy/Dropbox/My_Projects/Coursera/Coursera_cleaning/Getting-and-Cleaning-Data/'
setwd(dir)


#0. read data and setup
#colnames
colnames <- read.table('data/features.txt', header=FALSE, sep='', "\"'", dec = ".")

# test data
sybj <- read.table('data/test/subject_test.txt', header=FALSE, sep='', "\"'", dec = ".")
labels <- read.table('data/test/y_test.txt', header=FALSE, sep='', "\"'", dec = ".")
testDatum <- read.table('data/test/X_test.txt', header=FALSE, sep='', "\"'", dec = ".")
names(testDatum)<- colnames$V2
testDatum$labels <-labels$V1           
testDatum$subject <- sybj$V1

#train data
sybj <- read.table('data/train/subject_train.txt', header=FALSE, sep='', "\"'", dec = ".")
labels <- read.table('data/train/y_train.txt', header=FALSE, sep='', "\"'", dec = ".")
trainDatum <- read.table('data/train/X_train.txt', header=FALSE, sep='', "\"'", dec = ".")
names(trainDatum)<- colnames$V2
trainDatum$labels <-labels$V1           
trainDatum$subject <- sybj$V1


#1. Merges the training and the test sets to create one data set.
datum <- rbind(testDatum, trainDatum)
#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
checkName <- function(name){
  #deside if we need this column to stay
  r <- any(sapply(c("mean()",'std()','labels','subject'), grepl, name, fixed = TRUE))
  return(r)
  }

filter <- sapply(names(datum), checkName)
dataTiny <- datum[,filter]
#3. Uses descriptive activity names to name the activities in the data set
dataTiny$labels <- as.factor(dataTiny$labels)
dataTiny$subject <- as.factor(dataTiny$subject)

#4. Appropriately labels the data set with descriptive variable names. 
library(plyr)

dataTiny$labels <- mapvalues(dataTiny$labels, from = c("1", "2","3","4","5","6"), to = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING" ,"LAYING"))

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

resultCols <- names(dataTiny)[! names(dataTiny) %in% c('labels', 'subject')]
tidyData <- aggregate( . ~ labels+subject,  data = dataTiny,  FUN = mean)

#6 save tidyData as txt
write.table(tidyData, file = 'data/tidy.txt', quote=T, row.name=FALSE)
