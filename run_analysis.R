##loading required packages
if(!require(data.table)){
  install.packages("data.table")
  library(data.table)
}

if(!require(reshape2)){
  install.packages("reshape2")
  library(reshape2)
}

##read required datasets
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE)
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE)
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE)
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE)
features <- read.table("./UCI HAR Dataset/features.txt",header=FALSE,colClasses="character")
activities <- read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE,colClasses="character")

##Question 1 -- create one dataset
##create single Dataset for train and for test including subject, y , and X
test_set<-cbind(subject_test,y_test,X_test)
train_set<-cbind(subject_train,y_train,X_train)

## combine test and train into one set
total_set<-rbind(test_set,train_set)

##Questionss 2 and 4 -- give headers the labels and subset to mean and std
## give discriptive names to the measurements, activity, subject
names(total_set)<-c("Subject","Activity",features$V2)

## select headers that either subject, activity, or contain mean or std
meanstd <- grepl("mean|std|Subject|Activity", names(total_set))
## subset to only required columns
total_set<-total_set[,meanstd]

##Question 3 -- Give discriptive activity names
## give discriptive names to the activities
total_set$Activity<-factor(total_set$Activity, levels=activities$V1, labels=activities$V2)

##Question 5 -- Tidy the data
total_melted<-melt(total_set,id=c("Subject","Activity"))

total_tidy<-dcast(total_melted,Subject+Activity ~ variable, mean)

write.csv(total_tidy, "tidy.txt", row.names=FALSE)
