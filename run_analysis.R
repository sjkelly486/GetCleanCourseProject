##======================================
#Import Data
##======================================
rm(list = setdiff(ls(), lsf.str())) #remove all variables
library(dplyr)

#Read in test data
xtest <- read.table("./UCIHARDataset/test/X_test.txt") #Contains all data, column descriptions in features.txt
ytest <- read.table("./UCIHARDataset/test/y_test.txt") #Describes Activity (1 WALKING; 2 WALKING_UPSTAIRS; 3 WALKING_DOWNSTAIRS; 4 SITTING; 5 STANDING; 6 LAYING)
subjecttest <- read.table("./UCIHARDataset/test/subject_test.txt")

#Read in training data
subjecttrain <- read.table("./UCIHARDataset/train/subject_train.txt")
xtrain <- read.table("./UCIHARDataset/train/X_train.txt") #Contains all data, column descriptions in features.txt
ytrain <- read.table("./UCIHARDataset/train/y_train.txt") #Describes Activity (1 WALKING; 2 WALKING_UPSTAIRS; 3 WALKING_DOWNSTAIRS; 4 SITTING; 5 STANDING; 6 LAYING)

#Read in Column Labels for x data
xcolumnnames <- read.table("./UCIHARDataset/features.txt",as.is=c(FALSE,TRUE)) #Column Vector Names for xtest & xtrain
colnames(xcolumnnames) <- c("columnnum","name")

#Read in Activity Key
activitykey <- read.table("./UCIHARDataset/activity_labels.txt",as.is=c(FALSE,TRUE)) #(1 WALKING; 2 WALKING_UPSTAIRS; 3 WALKING_DOWNSTAIRS; 4 SITTING; 5 STANDING; 6 LAYING)


##======================================
# 4 - Relabel variable names
##======================================
colnames(xtrain) <- xcolumnnames$name
colnames(xtest) <- xcolumnnames$name
colnames(ytest) <- "Activity"
colnames(ytrain) <- "Activity"
colnames(subjecttest) <- "Subject"
colnames(subjecttrain) <- "Subject"


##======================================
# 1 - Combine Data
##======================================
#Combine x and y data for test and train
alldatatest <- cbind(subjecttest,ytest,xtest)
alldatatrain <- cbind(subjecttrain,ytrain,xtrain)

alldata <- rbind(alldatatest,alldatatrain)

##======================================
# 2 - Extract Only Mean and Standard Deviation Data
##======================================
meanindex<-grep("mean()",colnames(alldata),fixed=TRUE)
stdindex<-grep("std()",colnames(alldata))
keepindex <- sort(c(1,2,meanindex,stdindex))

alldata<-alldata[,keepindex]

##======================================
# 3 - Add descriptive Activity Labels
##======================================
alldata<-mutate(alldata,Activity = activitykey$V2[Activity])


##======================================
# 5 - Create tidy data set with the average of each variable for each activity and each subject
##======================================
alldata_meansummary<- alldata %>% group_by(Activity,Subject) %>% summarise_all("mean")



##======================================
#Write tidy data set to text file
##======================================
write.table(alldata_meansummary,"PhoneAccMean.txt",row.name=FALSE)
