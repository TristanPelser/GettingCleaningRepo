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
  
# merge data and build new data set
  Y_global <- rbind(Y_train, Y_test)
  X_global <- rbind(X_train, X_test)
  subject_global <- rbind(subject_train, subject_test)
  dataset <<- cbind(subject_global, Y_global, X_global)
  }