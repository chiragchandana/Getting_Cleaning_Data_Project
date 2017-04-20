# Code Book

## Overview
This document describes the variables of the analysis and the extract, transform and load steps to produce the tidy and aggregated dataset.

## Dataset
The UCI HAR Dataset includes the following files:
 - 'features.txt' : List of all features.
 - 'activity_labels.txt' : Links the class labels with their activity name.
 Training dataset
 - 'train/X_train.txt' : Training set.
 - 'train/y_train.txt' : Training activity id.
 - 'train/subject_train.txt' : Each row identifies the subject who performed the activity for each window sample.
 Test dataset
 - 'test/X_test.txt' : Test set.
 - 'test/y_test.txt' : Test activity id.
 - 'test/subject_test.txt' : Each row identifies the subject who performed the activity for each window sample.

## Transformaton
The purpose of the transformation is to clean and merge the training and test data and create one dataset.  Below are the transformations of the raw data set:

1. The training and test sets ('train/X_train.txt' and 'test/X_test.txt') do not contain feature header names.
2. Feature header names can be obtained from 'features.txt'.
3. The training and test activity id ('train/y_train.txt' and 'test/y_test.txt') can be linked to 'activity_labels.txt' to obtain the    activity name.
4. 'train/X_train.txt', 'train/subject_train.txt' and 'train/y_train.txt' required to merge as one train data set.
5. 'test/X_test.txt', 'test/subject_test.txt' and 'test/y_test.txt' required to merge as one test data set.  
6. Both train and test datasets rows are to be merged as one tidy dataset
7. Finally, aggregate the tidy dataset using mean function by the subject and acitivity to create an average datasets.

## run_analysis.R
The run_analysis.R script performs the following steps:
1. Load the activity label and feature into datasets respectively.
2. Load and merge the training, activity and subject into dataset, by filtering the features with mean and standard deviation only.
3. Load and merge the testing, activity and subject into dataset, by filtering the features with mean and standard deviation only.
4. Merge the training and testing, assign to descriptive column names.
5. Use descriptive activity names to name the activities in the merged set.
6. Write the average of each variable for each activity and each subject into 'tidydata.txt'

## Output tidydata.txt 
Identifiers
* `activity` - The type of activity performed when the corresponding measurements were taken
* `subject` - The ID of the subject

Measurements
* tBodyAcc-mean-X
* tBodyAcc-mean-Y
* tBodyAcc-mean-Z
* tBodyAcc-std-X
* tBodyAcc-std-Y
* tBodyAcc-std-Z
* tGravityAcc-mean-X
* tGravityAcc-mean-Y
* tGravityAcc-mean-Z
* tGravityAcc-std-X
* tGravityAcc-std-Y
* tGravityAcc-std-Z
* tBodyAccJerk-mean-X
* tBodyAccJerk-mean-Y
* tBodyAccJerk-mean-Z
* tBodyAccJerk-std-X
* tBodyAccJerk-std-Y
* tBodyAccJerk-std-Z
* tBodyGyro-mean-X
* tBodyGyro-mean-Y
* tBodyGyro-mean-Z
* tBodyGyro-std-X
* tBodyGyro-std-Y
* tBodyGyro-std-Z
* tBodyGyroJerk-mean-X
* tBodyGyroJerk-mean-Y
* tBodyGyroJerk-mean-Z
* tBodyGyroJerk-std-X
* tBodyGyroJerk-std-Y
* tBodyGyroJerk-std-Z
* tBodyAccMag-mean
* tBodyAccMag-std
* tGravityAccMag-mean
* tGravityAccMag-std
* tBodyAccJerkMag-mean
* tBodyAccJerkMag-std
* tBodyGyroMag-mean
* tBodyGyroMag-std
* tBodyGyroJerkMag-mean
* tBodyGyroJerkMag-std
* fBodyAcc-mean-X
* fBodyAcc-mean-Y
* fBodyAcc-mean-Z
* fBodyAcc-std-X
* fBodyAcc-std-Y
* fBodyAcc-std-Z
* fBodyAcc-meanFreq-X
* fBodyAcc-meanFreq-Y
* fBodyAcc-meanFreq-Z
* fBodyAccJerk-mean-X
* fBodyAccJerk-mean-Y
* fBodyAccJerk-mean-Z
* fBodyAccJerk-std-X
* fBodyAccJerk-std-Y
* fBodyAccJerk-std-`Z
* fBodyAccJerk-meanFreq-X
* fBodyAccJerk-meanFreq-Y
* fBodyAccJerk-meanFreq-Z
* fBodyGyro-mean-X
* fBodyGyro-mean-Y
* fBodyGyro-mean-Z
* fBodyGyro-std-X
* fBodyGyro-std-Y
* fBodyGyro-std-Z
* fBodyGyro-meanFreq-X
* fBodyGyro-meanFreq-Y
* fBodyGyro-meanFreq-Z
* fBodyAccMag-mean
* fBodyAccMag-std
* fBodyAccMag-meanFreq
* fBodyBodyAccJerkMag-mean
* fBodyBodyAccJerkMag-std
* fBodyBodyAccJerkMag-meanFreq
* fBodyBodyGyroMag-mean
* fBodyBodyGyroMag-std
* fBodyBodyGyroMag-meanFreq
* fBodyBodyGyroJerkMag-mean
* fBodyBodyGyroJerkMag-std
* fBodyBodyGyroJerkMag-meanFreq

## Activity Labels
* 1 = `WALKING`
* 2 = `WALKING_UPSTAIRS`
* 3 = `WALKING_DOWNSTAIRS`
* 4 = `SITTING`
* 5 = `STANDING`
