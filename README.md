Getting and Cleaning Data Project 1
==================================


### Data 
In this project, we work with the *Human Activity Recognition Using Smartphones* dataset made available [here](
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). A full description of the experiment and dataset is provided in [this site](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

### Project Objectives

1.   Merge the training and the test sets to create one data set.
2.   Extract only the measurements on the mean and standard deviation for each measurement. 
3.   Use descriptive activity names to name the activities in the data set.
4.   Appropriately label the data set with descriptive variable names. 
5.   From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.


### R-Script

The R-script for this project is `run_analysis.R`. The code utilizes two packages: `dplyr` and `reshape2`. 

### Running the Script

1. Download the dataset by [clicking on this link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).  
2. Unzip the downloaded file. This will then give you a folder named `UCI HAR Dataset`.
3. The file `run_analysis.R` must be located one directory level higher than the `UCI HAR Dataset` folder such that running the following line of code ```X.Train <- read.table("./UCI HAR Dataset/train/X_train.txt")``` inside the script will successfully give you a data frame called `X.Train` with 7,352 observations of 561 variables.

4. The output of the script is a file called `tidy_data_averages.txt` which gives you a tidy dataset containing the average of each of the selected mean and standard deviation (std) variables for each of the six activities and each of the 30 subjects.  The final data set has 180 observations and 68 variables-- 66 mean and std variables and the two (2) are the `Subject.ID` and `Activity.Label` variables.
5. For more information, kindly refer to the [CodeBook](https://github.com/PilotGtec/Getting-and-Cleaning-Data-Project-1/blob/master/CodeBook.md) provided in this repository.
