# Getting and Cleaning Data: Course Project #

----------

## 1. Introduction. ##

This repository comprises my Course Project for Johns Hopkins University course "Getting and Cleaning data" offered through Coursera.

## 2. Raw data and files required. ##

The raw data used for this project is contained in 7 files originally obtained from the ["Human Activity Recognition Using Smartphones Data Set"](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) repository, which is part of the University of California Irvine [datasets on machine learning](http://archive.ics.uci.edu/ml/datasets.html?format=&task=&att=&area=&numAtt=&numIns=&type=&sort=nameUp&view=list).

The files needed for this assignment are: 

1. features.txt
1. X_train.txt
1. X_test.txt 
1. subject_train.txt
1. subject_test.txt
1. y_train.txt
1. y_test.txt

All files must be in the working directory before running the code.

## 3. The code. ##

The code I used to obtain the final tidy.txt file is divided in the following 4 parts:

### PART 1: Merging the train and test sets in 1 data set assigning descriptive variable names for each measurement. ###

The steps I made are:

- Create variable names as characters in a data frame called "varnames".
- Create two data frames called "train" and "test" from X_train.txt and X_test.txt files for the 561 variables from which data was collected, then add  variable names from "varnames".
- Create "merged" data frame by joining "train" and "test" data frames using rbind function.
 
### PART 2: Extracting values from mean and standard deviation for each measurement on "merged" data set.  ###

The best way to describe this part might be to show the code first and analyze it later.  

    x = c("mean","std")
    storage = as.character()
    for (i in colnames(merged)){
      	for (j in x) {
    		if (grepl(j, i, ignore.case = TRUE) == TRUE){
      			storage <- c(storage,i)
    		}
      	}
    }
    selected <- merged[storage]

- x is a character vector containing the abbreviations of mean and standard deviation.
- storage is an accumulator for the column names of "merged" data set that contain "mean" or "std".
- The 1st for loop uses index "i" for column names in "merged" data frame.
- The 2nd for loop is nested and uses index "j" for the content of x vector.
- Then I use the control function "if" which is nested inside the 2nd for loop and then apply grepl function with indexes "j" and "i" as arguments. The  3rd argument is ignore.cases and is set to TRUE because I want the function to ignore case sensitive since there are variables that use "Mean" instead of "mean" like angle.X.gravityMean.
- The final outcome from this part is a data frame called "selected" which contains all the variables with strings "mean" or "std" as part of their column names.

### PART 3: Adding subject and activity variables to "selected" data frame using descriptive names for activities ###

- Create "dftrain" and "dftest" data frames with variable "subject" from subject_train.txt and subject_test.text
- Add variable "activity" to dftrain and dftest
- Join dftrain and dftest using rbind function and call the outcome "joined" which is a data frame.
- In "joined" data frame replace numbers associated with activities with descriptive activity names
- Combine "joined" and "selected" data frames using cbind function.

### PART 4: Creating tidy data set with the average of each variable for each activity and each subject ###

- Use aggregate function for this purpose.
- Remove columns "subject" and "activity" since their mean has no meaningful interpretation
- Write the final tidy data set in a txt file called tidy.txt with row.names=FALSE.


----------

### Note: Reading tidy.txt ###
To properly read the tidy.txt file use:

    tidy <- read.table("tidy.txt")

However, if column names are labeled V1,V2,V3,etc use:

    tidy <- read.table("tidy.txt", header=TRUE)

This will depend on the version of R that is used