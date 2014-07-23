######################################################################################
##                                                                                  ##
##  This script does the following:                                                 ##
##  1.  merges the training and the test sets to create one data set;               ##
##  2.  extracts the measurements on the mean and standard deviation for each       ##
##      measurement;                                                                ##
##  3.  assigns descriptive activity names to name the activities in the data set;  ##
##  4.  labels the data set with descriptive variable names;                        ##
##  5.  creates a second, independent tidy data set with the average of each        ##
##      variable for each activity and each subject;                                ##
##  6.  writes the tidy data to a file "tidyData.txt".                              ##
##                                                                                  ##
######################################################################################

##  Get necessary libraries:
##  (The melt function comes from the reshape2 package
##  and the summarize function comes from the dplry package.)

require(reshape2)
require(dplyr)

##  Read in necessary data files
##  (Note that not all the files in the UCI HAR Dataset directory are
##  necessary to address the requirements of the course project.)

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

##  Change uninformative variable names to informative feature names

names(X_test) <- features[,2]
names(X_train) <- features[,2]
names(y_test) <- "activity"
names(y_train) <- "activity"
names(subject_test) <- "subject"
names(subject_train) <- "subject"

##  Adjoin data on activities and subjects.

X_test <- cbind(X_test, activity = y_test, subject = subject_test)
X_train <- cbind(X_train, activity = y_train, subject = subject_train)

##  Merge files to create one data frame with all the test and training data.

X <- rbind(X_test, X_train)

##  Translate numeric activity levels into descriptive labels.

X <- transform(X, activity = factor(activity, 
    levels = activity_labels[,1], labels = activity_labels[,2]))

##  Subset data:
##  we only want columns that are means and standard deviations of measurements,
##  and we also still need the columns "activity" and "subject".
##  Since variables names cannot contain the characters "-", "(", or ")",
##  these are converted to "." So, to search for "mean()" or "std()", 
##  we need to search for "mean.." or "std.."
##  (Note: we are NOT interested in any instance of the string "mean".
##  This process excludes variables like "fBodyBodyGyroJerkMag-meanFreq()"
##  which is not a measurement for which we have a mean and standard deviation.)

X <- X[, grep("mean\\.\\.|std\\.\\.|activity|subject", names(X))]

##  Melt data.
##  After melting, each row will represent every measurement on every 
##  possible combination of activity, subject, and measurement type.
##  66 features X 10299 observations = 679734 rows

X <- melt(X, id.vars = c("activity", "subject"), variable.name = "feature")

##  Summarize the means.
##  We regroup to look at every possible combination of activity, subject,
##  and feature. Then we take the mean value for each group.
##  6 activities x 30 subjects x 66 features = 11880 rows.

tidyData <- summarize(regroup(X, list("activity", "subject", "feature")),
    mean(value))

write.table(tidyData, file = "tidyData.txt", row.names = FALSE)