## Code Book for Course Project in Getting and Cleaning Data
## by Dan Schauder

*Abstract
This is a markdown file which describes the work I performed for the course project for the Getting and Cleaning Data course offered through Johns Hopkins University.

*The Data

For this project, I worked with the Human Activity Recognition Using Smartphones data set, available
here (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

Below is a description provided by the authors of the dataset on how the data was gathered:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


*The Variables
The Human Activity Recognition Using Smartphones dataset provided measures for 561 variables. Of these, I was interested
in identifying the variables relating to mean and standard deviation. I focused on these variables by
only working with variables that had the strings "mean" or "std" in their given names. I also included
a variable which identified the subject and a variable that identified the activity being performed (walking,
walking upstairs, walking downstairs, sitting, standing, or laying). After combining datasets and filtering,
I was left with 88 variables.


*Work I Performed
I produced an R script that draws from the Human Activity Recognition Using Smartphones data set.
This script uses the following files in the dataset:
"X_train.txt", "X_test.txt", "y_train.txt", "y_test.txt", "features.txt", "subject_train.txt", "subject_test.txt".

My script takes these files and combines them, producing 2 key outputs: a dataframe called combined_frame which includes
all of the observations relating to mean and standard deviation organized appropriately; and a dataframe called tidy_dataset which 
contains the means of each variable for each subject and each activity. tidy_dataset is also exported to a txt file in your working directory
called "tidy_dataset.txt"