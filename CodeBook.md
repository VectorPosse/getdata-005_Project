# Course Project
## Coursera Data Science Specialization
## "Getting and Cleaning Data"

___

# CodeBook.md

___


This repo is located at <https://github.com/VectorPosse/getdata-005_Project>

___

The data for this project was collected from the accelerometers in the Samsung Galaxy S smartphone.<sup><a href="#fn1" id="ref1">1</a></sup> A full description is available at the site where the data was obtained: 

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

The data is contained in a zip file (located [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)). I extracted the contents of this file to a directory called "UCI HAR Dataset" in my working directory.

### The UCI HAR Dataset folder

The UCI HAR Dataset folder contains the following items:

*   <pre>README.txt</pre>

    This file contains information about the experiment and the organization of 
    the data.
    
*   <pre>activity_labels.txt</pre>

    This file identifies the six types of activities:
    
    1. WALKING
    2. WALKING_UPSTAIRS
    3. WALKING_DOWNSTAIRS
    4. SITTING
    5. STANDING
    6. LAYING

*   <pre>features.txt</pre>

    This file identifies the 561 features (variables) measured or calculated.
    
*   <pre>feataures_info.txt</pre>

    This file gives more information about how the features identified in the
    features.txt file were measured or calculated.

*   <pre>test</pre>

    This folder contains the test data (2947 observations).
    
*   <pre>train</pre>

    This folder contains the training data (7352 observations).
    
Both the "test" and "train" folders contain a folder called "Intertial Signals" containing data measuring triaxial acceleration from the accelerometer (total acceleration), estimated body acceleration, and triaxial angular velocity from the gyroscope. Additionally, both folders contain data with 561 time and frequency domain variables ("X\_test.txt" and "X\_train.txt" respectively), the activity labels ("y\_test.txt" and "y\_train.txt"), and identifiers of the subjects who carried out the experiment ("subject\_test.txt" and "subject\_train.txt").

### run_analysis.R

The script run_analysis.R takes the data in the "UCI HAR Dataset" directory and does the following:

1.  merges the training and the test sets to create one data set;
2.  extracts the measurements on the mean and standard deviation for each
    measurement;
3.  assigns descriptive activity names to name the activities in the data set;
4.  labels the data set with descriptive variable names; 
5.  creates a second, independent tidy data set with the average of each 
    variable for each activity and each subject;
6.  writes the tidy data to a file "tidyData.txt".
    
See the script comments for more details about the execution of these steps.

### tidyData.txt

The file tidyData.txt contains the following variables:

* <pre>activity</pre>

    This variable represents the activity performed by the subjects as the
    measurements were taken.

    Factor variable: 6 levels:
    
        1. WALKING
        2. WALKING_UPSTAIRS
        3. WALKING_DOWNSTAIRS
        4. SITTING
        5. STANDING
        6. LAYING

* <pre>subject</pre>

    This variable identifies the subject for which measurements were taken.

    Factor variable: 30 levels, numbered 1 through 30
    
* <pre>feature</pre>

    This variable identifies the type of measurement made. In the original 
    dataset, there were 561 features. This data set is a subset, containing only
    those features that are means or standard deviations of measurements.
    
    Factor variable: 66 levels:
    
        [1] "tBodyAcc.mean...X"           "tBodyAcc.mean...Y"           "tBodyAcc.mean...Z"          
        [4] "tBodyAcc.std...X"            "tBodyAcc.std...Y"            "tBodyAcc.std...Z"           
        [7] "tGravityAcc.mean...X"        "tGravityAcc.mean...Y"        "tGravityAcc.mean...Z"       
        [10] "tGravityAcc.std...X"         "tGravityAcc.std...Y"         "tGravityAcc.std...Z"        
        [13] "tBodyAccJerk.mean...X"       "tBodyAccJerk.mean...Y"       "tBodyAccJerk.mean...Z"      
        [16] "tBodyAccJerk.std...X"        "tBodyAccJerk.std...Y"        "tBodyAccJerk.std...Z"       
        [19] "tBodyGyro.mean...X"          "tBodyGyro.mean...Y"          "tBodyGyro.mean...Z"         
        [22] "tBodyGyro.std...X"           "tBodyGyro.std...Y"           "tBodyGyro.std...Z"          
        [25] "tBodyGyroJerk.mean...X"      "tBodyGyroJerk.mean...Y"      "tBodyGyroJerk.mean...Z"     
        [28] "tBodyGyroJerk.std...X"       "tBodyGyroJerk.std...Y"       "tBodyGyroJerk.std...Z"      
        [31] "tBodyAccMag.mean.."          "tBodyAccMag.std.."           "tGravityAccMag.mean.."      
        [34] "tGravityAccMag.std.."        "tBodyAccJerkMag.mean.."      "tBodyAccJerkMag.std.."      
        [37] "tBodyGyroMag.mean.."         "tBodyGyroMag.std.."          "tBodyGyroJerkMag.mean.."    
        [40] "tBodyGyroJerkMag.std.."      "fBodyAcc.mean...X"           "fBodyAcc.mean...Y"          
        [43] "fBodyAcc.mean...Z"           "fBodyAcc.std...X"            "fBodyAcc.std...Y"           
        [46] "fBodyAcc.std...Z"            "fBodyAccJerk.mean...X"       "fBodyAccJerk.mean...Y"      
        [49] "fBodyAccJerk.mean...Z"       "fBodyAccJerk.std...X"        "fBodyAccJerk.std...Y"       
        [52] "fBodyAccJerk.std...Z"        "fBodyGyro.mean...X"          "fBodyGyro    .mean...Y"         
        [55] "fBodyGyro.mean...Z"          "fBodyGyro.std...X"           "fBodyGyro.std...Y"          
        [58] "fBodyGyro.std...Z"           "fBodyAccMag.mean.."          "fBodyAccMag.std.."          
        [61] "fBodyBodyAccJerkMag.mean.."  "fBodyBodyAccJerkMag.std.."   "fBodyBodyGyroMag.mean.."    
        [64] "fBodyBodyGyroMag.std.."      "fBodyBodyGyroJerkMag.mean.." "fBodyBodyGyroJerkMag.std.."

* <pre>mean(value)</pre>

    This variable summarizes the mean measurement value for each combination
    of activity, subject, and feature.
    
    Numeric variable. (Each feature is normalized to lie in the interval [-1, 1].)
    
___

<sup id="fn1">[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012</sup>