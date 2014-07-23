# Course Project
## Coursera Data Science Specialization
## "Getting and Cleaning Data"

___

# README.md

___


This repo is located at <https://github.com/VectorPosse/getdata-005_Project>

___

The data for this project was collected from the accelerometers in the Samsung Galaxy S smartphone.<sup><a href="#fn1" id="ref1">1</a></sup> A full description is available at the site where the data was obtained: 

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

The data is contained in a zip file (located [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)). I extracted the contents of this file to a directory called "UCI HAR Dataset" in my working directory.

See the code book (CodeBook.md) for more information about the files contained in the "UCI HAR Dataset" directory.

### run_analysis.R

This script does the following:

1.  merges the training and the test sets to create one data set;
2.  extracts the measurements on the mean and standard deviation for each
    measurement;
3.  assigns descriptive activity names to name the activities in the data set;
4.  labels the data set with descriptive variable names; 
5.  creates a second, independent tidy data set with the average of each 
    variable for each activity and each subject;
6.  writes the tidy data to a file "tidyData.txt".
    
See the script comments for more details about the execution of these steps. See the codebook (CodeBook.md) for information on the organization of the tidy data set created in Step 5 above.

___

<sup id="fn1">[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012</sup>