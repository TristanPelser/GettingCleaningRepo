run_analysis <- function() {
# using '<<-' makes variables accessible from outside of the function, so we can call them up in the console
# and check to see that the function is running correctly. 

# read in test data
  X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
  Y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")
  subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
  
# read in train data
  X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
  Y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")
  subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

# read in features and activities
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("featureID", "featureLabel"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("activityID", "activityLabel"))

# make labels a little neater
activities$activityLabel <- gsub("_", " ", as.character(activities$activityLabel))

# extract mean and std from data
includedFeatures <- grep("-mean\\(\\)|-std\\(\\)", features$featureLabel)

# merge data and build new data set
Y_merged <- rbind(Y_train, Y_test)
names(Y_merged) = "activityID" 

X_merged <- rbind(X_train, X_test)
X_merged <- X_merged[, includedFeatures]
names(X_merged) <- gsub("\\(\\)", "", features$featureLabel[includedFeatures])

subject_merged <- rbind(subject_train, subject_test)
names(subject_merged) <- "subjectID"
  
activity <- merge(Y_merged, activities, by="activityID")$activityLabel
dataset <- cbind(subject_merged, X_merged, activity)
write.table(dataset, "tidy_data_set.txt")

#create a second dataset with the average of each variable for each activity and each subject.
library(data.table)
newdata <- data.table(dataset)
data_calculted <- newdata[, lapply(.SD, mean), by=c("subjectID", "activity")]
write.table(data_calculted, "calculated_tidy_dataset.txt", row.name=FALSE)
}

