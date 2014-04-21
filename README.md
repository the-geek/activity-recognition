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



----
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
