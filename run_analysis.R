##Merge the training and the test sets to create one data set.
###Create test set.
columns<-read.table("features.txt",header=FALSE)

activities.test<-read.table("test/Y_test.txt",header=FALSE)
xtest<-read.table("test/X_test.txt",header=FALSE)
test.subjects<-read.table("test/subject_test.txt",header=FALSE)
test<-cbind(activities.test,test.subjects,xtest)
cols<-as.vector(columns[,2])
colnames(test)<-c("Activity","Subject",cols)


###Create train set.
xtrain<-read.table("train/X_train.txt",header=FALSE)
activities.train<-read.table("train/y_train.txt",header=FALSE)
train.subjects<-read.table("train/subject_train.txt",header=FALSE)
train<-cbind(activities.train,train.subjects,xtrain)
cols<-as.vector(columns[,2])
colnames(train)<-c("Activity","Subject",cols)

###Merge training and test data sets.
all<-rbind(train,test)

##Extract only the measurements on the mean and standard deviation for each measurement.
library(dplyr)
#FILTER ISN'T FILTERING PROPERLY NEED TO FIX
filter<-grep("*mean*|*std*",colnames(all),ignore.case=TRUE)
angle<-grep("angle*",colnames(all),ignore.case=TRUE)
colnames(all)<-c(1:563)
df<-select(all,c(1,2,filter))
head<-colnames(train)
colnames(df)<-head[c(1,2,filter)]
headers<-colnames(df)

##Label the data set with descriptive variable names.
###Descriptive columns
col1<-gsub("^f","frequency ",gsub("^t","time ",headers))
col2<-gsub("\\-","",gsub("\\)","",gsub("\\(","",col1)))
col3<-gsub("Z","Z-axis",gsub("Y","Y-axis",gsub("X","X-axis",col2)))
col4<-gsub("std"," standard deviation ",gsub("mean"," mean ",col3))
col5<-gsub("Freq","Frequency",gsub("Mag","Magnitude",col4))
col6<-gsub("Gyro","Gyroscope",gsub("Acc","Acceleration",col5))
colnames(df)<-col6
###Descriptive Activities
gsub1<-gsub("1","WALKING",df$Activity)
gsub2<-gsub("2","WALKING_UPSTAIRS",gsub1)
gsub3<-gsub("3","WALKING_DOWNSTAIRS",gsub2)
gsub4<-gsub("4","SITTING",gsub3)
gsub5<-gsub("5","STANDING",gsub4)
Activity<-gsub("6","LAYING",gsub5)
tidy<-cbind(Activity,select(df,-1))
write.table(tidy,"TidySet.txt",row.name=FALSE)


##Create a second, independent tidy data set with the average of each variable for each activity and each subject.
avgtidy<-aggregate(.~Subject+Activity,tidy,mean)
write.table(avgtidy,"TidySet2.txt",row.name=FALSE)