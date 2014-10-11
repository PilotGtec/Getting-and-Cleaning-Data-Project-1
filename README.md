Getting and Cleaning Data Project 1
==================================


### Data 
In this project, we work with the *Human Activity Recognition Using Smartphones* dataset made available [here](
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). 

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
3. The file `run_analysis.R` must be located one directory level higher than the `UCI HAR Dataset` folder such that running the following line of code will successfully give you a data frame called `X.Train` with 7,352 observations of 561 variables.
```
X.Train <- read.table("./UCI HAR Dataset/train/X_train.txt")
```
4. The output of the script is a file called `tidy_data_averages.csv` which gives you a tidy dataset with the average of each of the mean and std variables for each of the six activities and each of the 30 subjects.
