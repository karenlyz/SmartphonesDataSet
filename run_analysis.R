# read the data
xtrain<-read.table("./UCI HAR Dataset/train/X_train.txt")
ytrain<-read.table("./UCI HAR Dataset/train/y_train.txt")
subtrain<-read.table("./UCI HAR Dataset/train/subject_train.txt")

xtest<-read.table("./UCI HAR Dataset/test/X_test.txt")
ytest<-read.table("./UCI HAR Dataset/test/y_test.txt")
subtest<-read.table("./UCI HAR Dataset/test/subject_test.txt")

label<-read.table("./UCI HAR Dataset/activity_labels.txt")
features<-read.table("./UCI HAR Dataset/features.txt")

# 1. Merge the training and the test sets to creat one data set 
# in dataset, col 1:561 are feature variables, col 562 activity, col 563 subject
train<-cbind(xtrain,ytrain,subtrain) 
test<-cbind(xtest,ytest,subtest)
dataset<-rbind(train,test)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement
features[,2]<-as.character(features[,2]) 
mean_index<-grep("mean()",features[,2],fixed=TRUE) #find index that contain mean()
std_index<-grep("std()",features[,2],fixed=TRUE) #find index that contain sd()
index<-sort(c(mean_index,std_index))  
mean_std<-dataset[,c(index,562,563)]

# 3. Uses descriptive activity names to name the activities in the data set
mean_std[,67]<-as.factor(mean_std[,67])
levels(mean_std[,67])<-label[,2]

# 4. Appropriately labels the data set with descriptive activity names.
# label each column of the dataset
# the first 66 columns are feature variables, the last two columns are activity label and subject
names(mean_std)<-c(as.character(features[index,2]), "activity","subject")

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
featurevar<-as.matrix(mean_std[,1:66])
group_var<-aggregate( featurevar ~  activity + subject, data = mean_std, FUN = mean)
write.table(group_var,"tidydata.txt")

