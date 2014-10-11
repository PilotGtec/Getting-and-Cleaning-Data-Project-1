library (dplyr)
### Loading data with fixed column/header names-- this addresses
### item (4) Appropriately labels the data set with descriptive variable names
features <- read.table("./UCI HAR Dataset/features.txt")

Subject.Train <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names=c("Subject.ID"))
X.Train <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = features$V2)
Y.Train <- read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE, col.names=c("Activity.ID"))

Subject.Test <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names=c("Subject.ID"))
X.Test <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = features$V2)
Y.Test <- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE, col.names=c("Activity.ID"))


### (1) Merge training and test sets to create one data set
Merged.X <- rbind(X.Train, X.Test)
Merged.Y <- rbind(Y.Train, Y.Test)
Merged.Subject <- rbind(Subject.Train, Subject.Test)
Final.Merged.Set <- cbind(Merged.Subject, Merged.Y, Merged.X)

### (2) Extracts measurements on the mean and standard deviation for each measurement
### Note that the selection is case sensitive. If we initially set the header names
### to lower case, we will also be including the following variables, which are NOT
### necessarily measures of mean. These are

# [1] "angle.tBodyAccMean.gravity."          "angle.tBodyAccJerkMean..gravityMean."
# [3] "angle.tBodyGyroMean.gravityMean."     "angle.tBodyGyroJerkMean.gravityMean."
# [5] "angle.X.gravityMean."                 "angle.Y.gravityMean."                
# [7] "angle.Z.gravityMean."    

Mean.Std.Merged.X <- select(Merged.X, grep("mean|std", names(Merged.X)))
Final.Merged.Set <- cbind(Merged.Subject, Merged.Y, Mean.Std.Merged.X)

### (3) Uses descriptive activity names to name the activities in the data set
### Here, I name this new variable Activity.Label
activity.labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
Final.Merged.Set <- transform(Final.Merged.Set, Activity.ID = factor(Activity.ID))
Final.Merged.Set$Activity.Label <- factor(Final.Merged.Set$Activity.ID,
                                          levels = activity.labels$V1,
                                          labels = activity.labels$V2)

### Here I drop the column Activity.ID since we already have the Activity.Name
Final.Merged.Set <- select(Final.Merged.Set, -Activity.ID)

### (5) From the data set in step 4, create a second, 
### independent tidy data set with the average of each variable for each 
### activity and each subject.
library(reshape2)
molten <- melt(Final.Merged.Set, id = c("Activity.Label", "Subject.ID"))
Tidy.Data.Averages <- dcast(molten, Subject.ID + Activity.Label ~ variable, mean)

write.table(Tidy.Data.Averages, "tidy_data_averages.csv", 
            quote=FALSE, sep=",", row.names = FALSE)
  