# Getting and Cleaning Data Assignment

Only one script here:
* [run_analysis.R](https://github.com/TristanPelser/GettingCleaningRepo/blob/master/run_analysis.R)

  + This script runs analyses on data collected from the accelerometers from the Samsung Galaxy S smartphone. 
  
  + A full description of the data can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
  
  + Required data can be found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  
  + run_analysis.R does two things:
    1. Creates a tidy dataset txt file from the UCI HAR Dataset, with extracted std and mean measurements.
    2. Creates a calculated dataset txt file, with the average of each variable for each activity and each subject.
  
## Instructions for use: 

1. Download [zip file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
2. Unzip data in your directory - should be in a folder called UCI HAR Dataset
3. View the codebook [here](https://github.com/TristanPelser/GettingCleaningRepo/blob/master/Code%20Book.md). 
4. Source and run the R script in R to view the analyses! 