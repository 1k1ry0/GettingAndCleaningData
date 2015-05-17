TidyData<-function()
{
        
        # load dplyr library used later
        library(dplyr)
        
        # get column names from features file, make them more comprehensive by eliminating "()" and "-", and save them in ColNames vector
        ColNames<-read.table("./UCI HAR Dataset/features.txt")
        ColNames<-gsub("()","",ColNames$V2, fixed=TRUE)
        ColNames<-gsub("-","",ColNames, fixed=TRUE)
        
        #feed in test data, renaming column based on ColNames vector. load activity codes and subjects and bind all three together
        TestX<-read.table("./UCI HAR Dataset/test/X_test.txt", col.names=ColNames)
        TestY<-read.table("./UCI HAR Dataset/test/y_test.txt", col.names="ActivityCode")
        TestSubject<-read.table("./UCI HAR Dataset/test/subject_test.txt", col.names="Subject")
        TestData<-cbind(TestX, TestY, TestSubject)
        
        #feed in train data, renaming column based on ColNames vector. load activity codes and subjects and bind all three together
        TrainX<-read.table("./UCI HAR Dataset/train/X_train.txt", col.names=ColNames)
        TrainY<-read.table("./UCI HAR Dataset/train/y_train.txt", col.names="ActivityCode")
        TrainSubject<-read.table("./UCI HAR Dataset/train/subject_train.txt", col.names="Subject")
        TrainData<-cbind(TrainX, TrainY, TrainSubject)
        
        #merge test and train data sets together
        TestTrain<-rbind(TestData, TrainData)
        
        #feed in activity lables from appropriate file; rename columns to make it more readable
        ActivityL<-read.table("./UCI HAR Dataset/activity_labels.txt")
        colnames(ActivityL)<-c("ActivityCode", "ActivityName")
        
        #merge measurments data frame (TestTrain) with activity lables (ActivityL) by common ActivityCode column
        TestTrain<-merge(TestTrain, ActivityL)
        
        #extract mean and standard deviation measurments by finding numbers of columns with "mean" or "std" in column name
        Means<-grep("mean", colnames(TestTrain), ignore.case=FALSE)
        Stds<-grep("std", colnames(TestTrain), ignore.case=FALSE)
        ColSelection<-c(Means, Stds)
        
        #create clean data set with mean and standard deviation measurments, as well as subjet numbers and activity names
        CleanData<-select(TestTrain, ColSelection, Subject, ActivityName)
        
        #create readable summary showing measurment values for each state and subject
        Output<-CleanData %>% group_by(ActivityName,Subject) %>% summarise_each(funs(mean))
        
        #write results to new table
        write.table(Output, file="TidyData.txt", row.name=FALSE)
}
