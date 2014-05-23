##Description of run_analysis.R

My script draws from the Human Activity Recognition Using Smartphones Data Set. It uses the following
files from the data set:

"X_train.txt", "X_test.txt", "y_train.txt", "y_test.txt", "features.txt", "subject_train.txt", "subject_test.txt".

My script reads these files into R, selects variables which relate to mean and standard deviation and combines
them into a master dataframe with 10299 observations of 88 variables. It then edits the variable names,
converting all letters to lower case and removing parentheses, dashes, and commas as per the course style
guide. It then uses the plyr package to create a new dataframe with the means of each variable for each
subject and each activity. Finally, this new dataframe is exported into a new file called "tidy_dataset.txt"