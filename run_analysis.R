# 0. loading data into variables and libraries.
library(data.table)

test <- read.table("test/X_test.txt",header=FALSE)
test_activities <- read.table("test/y_test.txt",header=FALSE)
test_subjects <- read.table("test/subject_test.txt",header=FALSE)

train <- read.table("train/X_train.txt",header=FALSE)
train_activities <- read.table("train/y_train.txt",header=FALSE)
train_subjects <- read.table("train/subject_train.txt",header=FALSE)

activities <- read.table("activity_labels.txt",header=FALSE,colClasses="character")

# 1. Uses descriptive activity names to name the activities in the data set
test_activities$V1 <- factor(test_activities$V1,levels=activities$V1,
                             labels=activities$V2)
train_activities$V1 <- factor(train_activities$V1,levels=activities$V1,
                              labels=activities$V2)

features <- read.table("features.txt",header=FALSE,colClasses="character")

# 2. Appropriately labels the data set with descriptive activity names
colnames(test)<-features$V2
colnames(train)<-features$V2

colnames(test_activities)<-c("ACTIVITY")
colnames(train_activities)<-c("ACTIVITY")

colnames(test_subjects)<-c("SUBJECT")
colnames(train_subjects)<-c("SUBJECT")

# 3. Merges the training and the test sets to create one data set
test<-cbind(test,test_activities)
test<-cbind(test,test_subjects)

train<-cbind(train,train_activities)
train<-cbind(train,train_subjects)

result_data<-rbind(test,train)

# 4. Extract only the measurements on the mean and standard deviation for each measurement
result_data_mean<-sapply(result_data,mean,na.rm=TRUE)
result_data_sd<-sapply(result_data,sd,na.rm=TRUE)

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject
dataTable <- data.table(result_data)
tidyData<-dataTable[,lapply(.SD,mean),by="ACTIVITY,SUBJECT"]

# Step 6: Export the new data into a new csv file and txt file
write.csv(tidyData, "tidyData.csv")
write.table(tidyData, "tidyData.txt", col.names = FALSE)