runAnalysis <- function () {
        # load activity labels & features
        activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
        names(activityLabels) <- c("activityId", "activityName")
        
        features <- read.table("UCI HAR Dataset/features.txt")
        
        # extract only the required features (mean & standard deviation)
        featuresExtracted <- grep(".*mean.*|.*std.*", features[,2])
        featuresExtracted_names <- features[featuresExtracted, 2]
        featuresExtracted_names <- gsub('[()]', '', featuresExtracted_names)
        
        
        # load datasets for train, activity & subject
        trainSet <- read.table("UCI HAR Dataset/train/X_train.txt")[featuresExtracted]
        trainActivities <- read.table("UCI HAR Dataset/train/Y_train.txt")
        trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
        train <- cbind(trainSubjects, trainActivities, trainSet)
        
        
        # load datasets for test, activity & subject
        testSet <- read.table("UCI HAR Dataset/test/X_test.txt")[featuresExtracted]
        testActivities <- read.table("UCI HAR Dataset/test/Y_test.txt")
        testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
        test <- cbind(testSubjects, testActivities, testSet)
        
        # merge the train and test dataset, assign the descriptive column names
        mergedData <- rbind(train, test)
        colnames(mergedData) <- c("subject", "activity", featuresExtracted_names)
        
        # use descriptive activity names to name the activities in the merged set
        mergedData[["activity"]] <- activityLabels[ match(mergedData[['activity']], activityLabels[['activityId']] ) , 'activityName']
        
        # create data set with the average of each variable for each activity and each subject.
        meanData <- aggregate(mergedData[, 3:ncol(mergedData)], by = list(activity=mergedData$activity, subject=mergedData$subject), FUN = "mean")
        write.table(meanData, "tidydata.txt", row.names = FALSE)   
}



