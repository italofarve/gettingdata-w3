# Course Project Code Book

Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Original description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The attached R script (run_analysis.R) performs the following to clean up the data:
### Loading data into variables and libraries
It's important load data.table library
### Merges the training and test sets to create one data set.

The result of merging data is a 10299x561 data frame, as in the original description ("Number of Instances: 10299" and "Number of Attributes: 561")
### Appropriately labels the data set with descriptive activity names
Descriptive activity names to name the activities in the data set were: 
1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

### Extract only the measurements on the mean and standard deviation for each measurement and create a second independent tidy data set for each activity and each subject.

The script creates a 2nd, independent tidy data set with the average of each measurement for each activity and each subject. The tidyData is a 180 obs. table and it is exported in txt format.
