## Description

This is a Project for "Getting and Cleaning Data" course on Coursera. The objective is to get and clean publicly available activity recognition data set from UCI machine learning repository [1]

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The project requirements are the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


## Analysis Script
The *run_analysis.R* script perform all the above 5 requirements.

### Run the script
To run the script, first download and extract the below data set, then download the *run_analysis.R* file to the same folder and set that folder as your R working directory

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

After executing the script in R, the tidy data set, as per the project requirements, will be written to *activity-clean.txt* 

### Script Walkthrough 

1. Read the features from *features.txt* which is used as column names for the data set
2. Merge training and testing data into one data set and add to it the subject and activity
3. Filter columns to include only those that has mean() or std() in the column name
4. Using the *activity_labels.txt* map the activity code (e.g. 1,2 and 3) to activity name (e.g. WALKING, WALKING_UPSTAIRS and WALKING_DOWNSTAIRS)
5. Prepare the tidy data set by cleaning the column names then use *aggregate* to group the data by the subject and activity then calculate the mean

The file *activity-clean.txt* is example of the script output, also the file *CodeBook.md* provides more details on the feature description

## More Details 
(quoted from the original expirement description)

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

----
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
