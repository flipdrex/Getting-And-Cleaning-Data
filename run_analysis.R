xtest<-read.table("UCI HAR Dataset/test/X_test.txt",sep = "")
features<-read.table("UCI HAR Dataset/features.txt",sep = "")

meancols<-grep("-mean()",features$V2,fixed = T)
stdcols<-grep("-std()",features$V2,fixed = T)

takecols<-rbind(meancols,stdcols)
takecols<-takecols[order(takecols)]

xtest<-xtest[,takecols]

colnames(xtest)<-tolower(gsub("[[:punct:]]","",features$V2[takecols]))

testdata<-cbind(read.table("UCI HAR Dataset/test/subject_test.txt",sep = "",col.names = "subjectnumber"),
                read.table("UCI HAR Dataset/test/y_test.txt",sep = "",col.names = "activity"),
                xtest)
xtrain<-read.table("UCI HAR Dataset/train/X_train.txt",sep = "")

xtrain<-xtrain[,takecols]

colnames(xtrain)<-tolower(gsub("[[:punct:]]","",features$V2[takecols]))

traindata<-cbind(read.table("UCI HAR Dataset/train/subject_train.txt",sep = "",col.names = "subjectnumber"),
                    read.table("UCI HAR Dataset/train/y_train.txt",sep = "",col.names = "activity"),
                    xtrain)

fulldata<-rbind(testdata,traindata)

activities<-read.table("UCI HAR Dataset/activity_labels.txt",sep = "")

active<-as.factor(fulldata$activity)
levels(active)<-tolower(gsub("_","",activities$V2))
fulldata$activity<-active



