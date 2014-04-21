## Merge the training and the test.

# Read the data, explicitly set the sep and header even it is the default values
# to protect the code from a "possible" future change in read.table's default values

# Read features' name 

features <- read.table("features.txt",col.names=c("id","feature"), sep = "", header=FALSE)
nfeature = nrow(features)
feature.names <- as.character(features[,"feature"])

# Read, merge the data and set the proper col.names
data.x <- read.table("train/X_train.txt", colClasses=rep("numeric",nfeature), sep = "", header=FALSE)
data.x <- rbind(data.x, read.table("test/X_test.txt",colClasses=rep("numeric",nfeature), sep = "", header=FALSE))
names(data.x) <- feature.names

data.y <- read.table("train/y_train.txt",col.names=c("activity"),colClasses=c("factor"), sep = "", header=FALSE)
data.y <- rbind(data.y, read.table("test/y_test.txt",col.names=c("activity"), colClasses=c("factor"), sep = "", header=FALSE))

data.subject <- read.table("train/subject_train.txt",col.names=c("subject"),colClasses=c("numeric"), sep = "", header=FALSE)
data.subject <- rbind(data.subject, read.table("test/subject_test.txt",col.names=c("subject"), colClasses=c("numeric"), sep = "", header=FALSE))

data <- cbind(data.subject, data.y, data.x)


# Extract only the measurements on the mean and standard deviation while keeping
# subject and activity columns
data <- data[,grepl("^subject$|^activity$|mean\\(\\)|std\\(\\)",names(data))]

# It was possible to include other measurements such as meanFreq using the below regex
# data <- data[,grepl("^subject$|^activity$|mean\\w*\\(\\)|std\\w*\\(\\)",names(data))]


## Use descriptive activity names

tmp <- read.table("activity_labels.txt",colClasses=c("factor","character"),col.names=c("id","activity"), sep = "", header=FALSE)
# Create a named vector with the activity name as values and activity code as name
activities <- as.character(tmp$activity)
names(activities) <-  tmp$id
rm(tmp) # free memory


## Label the data set with descriptive activity names. 

# replace the activity code with the associated name
library(plyr)
data$activity <- revalue(data$activity, activities)


## Create a second, independent tidy data set with the average of each variable for each activity and each subject. 


# Clean the feature names by removing all special characters and only use "." and "_" as separators
feature.names <- names(data)

feature.names <- gsub("\\(*\\)+","",feature.names)
feature.names <- gsub("\\(","\\.",feature.names)
feature.names <- gsub("\\-+","\\.",feature.names)
feature.names <- gsub("(\\d)\\,(\\d)","\\1\\_\\2",feature.names) # "," surrounded by digits indicates "range"
feature.names <- gsub("\\,","\\.",feature.names)
feature.names <- gsub("^[\\w|\\.|\\_]","",feature.names)

names(data) <- feature.names

# Group records by subject and activity then calculate the measurements' mean per group
data.clean <- aggregate(.  ~  subject + activity ,data=data, mean)

write.table(data.clean,"activity-clean.txt",row.names=FALSE,quote=FALSE)
