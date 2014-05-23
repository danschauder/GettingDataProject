## This script assumes you have the following files in your working
## directory: "X_train.txt", "X_test.txt", "y_train.txt", "y_test.txt",
## "features.txt", "subject_train.txt", "subject_test.txt".

##The script takes these files and combines them, producing 2 key
##outputs: a dataframe called combined_frame which includes
##all of the observations relating to mean and standard deviation
##organized appropriately; and a dataframe called tidy_dataset which 
##contains the means of each variable for each subject and each activity.
##tidy_dataset is also exported to a txt file in your working directory
##called "tidy_dataset.txt"


## load dataframe of variable names.
var_names <- read.table("features.txt")

## Use grep to create an index of variables containing either "mean"
## or "std".
mean_index <- grep("mean", var_names$V2, ignore.case=TRUE)
std_index <- grep("std", var_names$V2, ignore.case=TRUE)

##sort the index of interesting variable names and create a vector
##which is basically an index of columns with mean or standard deviation
##variables
var_index <- sort(c(mean_index, std_index))
interesting_vars <- var_names[var_index,]

##load X_test dataframe, reshape it so it only includes the columns
##specified in my var_index, and name its variables accordingly
X_test <- read.table("X_test.txt")
X_test <- X_test[,var_index]
colnames(X_test) <- as.character(interesting_vars$V2)

##load X_train dataframe, reshape it so it only includes the columns
##specified in my var_index, and name its variables accordingly
X_train <- read.table("X_train.txt")
X_train <- X_train[,var_index]
colnames(X_train) <- as.character(interesting_vars$V2)

##combine X_test and X_train into a single dataframe with rbind
combined_frame <- rbind(X_test, X_train)

##read in activity codes for y_test
y_test <- read.table("y_test.txt")

##name the activity column "activity"
colnames(y_test) <- c("activity")

##go through the "activity" column for y_test, substituting the activity codes
##for the corresponding names of the activities
y_test$activity <- gsub("1", "Walking", y_test$activity)
y_test$activity <- gsub("2", "Walking Upstairs", y_test$activity)
y_test$activity <- gsub("3", "Walking Downstairs", y_test$activity)
y_test$activity <- gsub("4", "Sitting", y_test$activity)
y_test$activity <- gsub("5", "Standing", y_test$activity)
y_test$activity <- gsub("6", "Laying", y_test$activity)

##read in activity codes for y_train
y_train <- read.table("y_train.txt")

##name the activity column "activity"
colnames(y_train) <- c("activity")

##go through the "activity" column for y_train, substituting the activity codes
##for the corresponding names of the activities
y_train$activity <- gsub("1", "Walking", y_train$activity)
y_train$activity <- gsub("2", "Walking Upstairs", y_train$activity)
y_train$activity <- gsub("3", "Walking Downstairs", y_train$activity)
y_train$activity <- gsub("4", "Sitting", y_train$activity)
y_train$activity <- gsub("5", "Standing", y_train$activity)
y_train$activity <- gsub("6", "Laying", y_train$activity)

##combine activity columns for y_test and y_train with rbind
Activity_var <- rbind(y_test, y_train)

##Add activity column to the combined dataframe with cbind
combined_frame <- cbind(combined_frame, Activity_var)

##Load subject test data
subject_test <- read.table("subject_test.txt")

##Name the subject_test column "subject"
colnames(subject_test) <- c("subject")

#Load subject train data
subject_train <- read.table("subject_train.txt")

##Name the subject_train column "subject
colnames(subject_train) <- c("subject")

## combine subject frames with rbind
Subject_var <- rbind(subject_test, subject_train)

##Add subject column to combined data frame with cbind
combined_frame <- cbind(combined_frame, Subject_var)

##Reformat variable names to conform with prescribed course style.
##i.e. make all letters lowercase, remove commas, dashes, and parentheses
for (letter in letters) {
        colnames(combined_frame) <- gsub(toupper(letter), letter, colnames(combined_frame))
}

colnames(combined_frame) <- gsub("-", "", colnames(combined_frame))
colnames(combined_frame) <- gsub("\\(", "", colnames(combined_frame))
colnames(combined_frame) <- gsub("\\)", "", colnames(combined_frame))
colnames(combined_frame) <- gsub(",", "", colnames(combined_frame))

##Use ddply to create a new data frame with the mean of each variable
##for each subject and each activity
library(plyr)
tidy_dataset <- ddply(combined_frame, .(subject, activity), numcolwise(mean))

##Export tidy_dataset to a txt file
write.table(tidy_dataset, file="tidy_dataset.txt")