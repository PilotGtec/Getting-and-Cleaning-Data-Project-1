### Data 
In this project, we work with the *Human Activity Recognition Using Smartphones* dataset made available [here](
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

The data were collected from experiments that were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

A full description of the experiment and dataset is provided in [this site](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
 
### Data Files and Structure
Here, we work with the following files located inside the `UCI HAR Dataset` folder.
- `features.txt`: List of all (561) features. These features correspond to the variables in the `X` test and train sets.
- `activity_labels.txt`: Links the activity i.d. with their names (labels).
- `train/subject_train.txt`: List of all subjects in the train set.
- `test/subject_test.txt`: List of all subjects in the test set.
- `train/X_train.txt`: Training set containing 7,352 observations of 561 variables.
- `train/y_train.txt`: Training activity list.
- `test/X_test.txt`: Test set containing 2,947 observations of 561 variables.
- `test/y_test.txt`: Test activity list.

Note that for the information on the activity desriptions, the script utilizes the following variables: `Activity.ID` (numeric) and `Activity.Label` (string).

### Analysis

As stated in [README.md](https://github.com/PilotGtec/Getting-and-Cleaning-Data-Project-1/blob/master/README.md), we have been trasked to implement the following.

1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement.
3. Use descriptive activity names to name the activities in the data set.
4. Appropriately label the data set with descriptive variable names.
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

In the `run_analysis.R` script, **Item 4** is implemented prior to the rest of the items. The author finds that this is more systematic as this can be carried out in the initial reading of the raw data-- by just adding the argument `col.names` in the `read.table` function.

**Item 2** is a bit tricky as some variable names have the term "*mean*" in them, but not necessarily referring to the mean of a specific measurement. The author is referring to the following variables:

- `angle.tBodyAccMean.gravity.`        
- `angle.tBodyAccJerkMean..gravityMean.`
- `angle.tBodyGyroMean.gravityMean.` 
- `angle.tBodyGyroJerkMean.gravityMean.`
- `angle.X.gravityMean.` 
- `angle.Y.gravityMean.`                
- `angle.Z.gravityMean.`    

Nevertheless, this problem only arises if we change all variable names to lowercase. If we do not perform any change in case (upper- or lower-) in the names, the function `grep("mean\\.|std\\.", names(Merged.X))` does the trick for **Item 2**. The `|` symbol in the `grep()` function indicates an *or* condition. The `\\.` allows us to exclude all the `meanFreq()` variables of the signals.

- `fBodyAcc.meanFreq...X`           
- `fBodyAcc.meanFreq...Y`           
- `fBodyAcc.meanFreq...Z`          
- `fBodyAccJerk.meanFreq...X`      
- `fBodyAccJerk.meanFreq...Y`       
- `fBodyAccJerk.meanFreq...Z`      
- `fBodyGyro.meanFreq...X`          
- `fBodyGyro.meanFreq...Y`          
- `fBodyGyro.meanFreq...Z`         
- `fBodyAccMag.meanFreq..`          
- `fBodyBodyAccJerkMag.meanFreq..`  
- `fBodyBodyGyroMag.meanFreq..`    
- `fBodyBodyGyroJerkMag.meanFreq..`
