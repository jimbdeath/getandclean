library(plyr) #for transformations
#Set working directory
wd<-"C:/Users/jimbd/Documents/Coursera Projects/cleaningdata/"
setwd(wd)

#Read in data
xte<-read.table("UCI HAR Dataset/test/X_test.txt")
yte<-read.table("UCI HAR Dataset/test/Y_test.txt")
subte<-read.table("UCI HAR Dataset/test/subject_test.txt")
xtr<-read.table("UCI HAR Dataset/train/X_train.txt")
ytr<-read.table("UCI HAR Dataset/train/Y_train.txt")
subtr<-read.table("UCI HAR Dataset/train/subject_train.txt")
feat<-read.table("UCI HAR Dataset/features.txt")
label<-read.table("UCI HAR Dataset/activity_labels.txt")


#Assign column names
colnames(xte)<-feat[,2]
colnames(xtr)<-feat[,2]
colnames(ytr)<-"activityid"
colnames(yte)<-"activityid"
colnames(subtr)<-"subjectid"
colnames(subte)<-"subjectid"
colnames(label)<-c("activityid","activitytype")

#merge into one
train<-cbind(xte,yte,subte)
test<-cbind(xtr,ytr,subtr)
all<-rbind(train,test)

#extract the mean and standard deviations
colnames <-colnames(all)
mstd<- (grepl("activityid",colnames) |
          grepl("subjectid",colnames)|
          grepl("mean..",colnames)|
          grepl("std..",colnames))
#subset
mstdev <- all[,mstd==TRUE]

#add descriptive labels
mstdev_wlabel<-merge(mstdev,label,by="activityid",all.x=TRUE)

#make a second tidy data set with average of each variable
#for each activity and each subject

tidy2<-aggregate(.~subjectid + activityid,mstdev_wlabel,mean)

#output
write.table(tidy2,"tidy2.txt",row.name=FALSE)
