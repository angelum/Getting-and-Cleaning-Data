# The files needed for this assignment are: 
# 1) features.txt 
# 2) X_train.txt
# 3) X_test.txt 
# 4) subject_train.txt
# 5) subject_test.txt
# 6) y_train.txt
# 7) y_test.txt,
# all of them must be in the working directory before running the code.

# The code is divided in 4 parts that are more extensively
# described in the Readme.md file that is within this repository

### PART 1: Merging the train and test sets in 1 data set
### assigning descriptive variable names for each measurement

## Creating variable names as characters in a data frame
varnames <- read.table("features.txt", row.names=1, stringsAsFactors = FALSE)

## Training set
# Creating a data frame from X_train.txt for the 561 variables from which
# data was collected and adding variable names from varnames vector
train <- read.table("X_train.txt", col.names=varnames[,1])

## Testing set
# Creating a data frame from X_test.txt for the 561 variables from which
# data was collected and adding variable names from varnames vector
test <- read.table("X_test.txt", col.names=varnames[,1])

## Creating a merged data frame by joining train and test data frames
merged <- rbind(train,test)

### PART 2: Extracting values from mean and standard deviation for each
### measurement on merged data set 

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

### PART 3: Adding subject and activity variables to selected data frame
### using descriptive names for activities

## Training set
# Creating a data frame with variable "subject" from subject_train.txt
dftrain <- read.table("subject_train.txt",col.names=c("subject"))
# Adding variable "activity" to dftrain
activity.train <- read.table("y_train.txt",col.names=c("activity"))
dftrain$activity <- activity.train[,1]

## Testing set
# Creating a data frame with variable "subject" from subject_test.txt
dftest <- read.table("subject_test.txt",col.names=c("subject"))
# Adding variable "activity" to dftest
activity.test <- read.table("y_test.txt",col.names=c("activity"))
dftest$activity <- activity.test[,1]

## Joining dftrain and dftest
joined <- rbind(dftrain,dftest)

## In "joined" data frame replace numbers associated with activities with
## descriptive activity names 
joined$activity[joined$activity==1] <- "WALKING"
joined$activity[joined$activity==2] <- "WALKING_UPSTAIRS"
joined$activity[joined$activity==3] <- "WALKING_DOWNSTAIRS"
joined$activity[joined$activity==4] <- "SITTING"
joined$activity[joined$activity==5] <- "STANDING"
joined$activity[joined$activity==6] <- "LAYING"

##  Combining "joined" and "selected" data frames
final <- cbind(joined,selected)

### PART 4: Creating tidy data set with the average of each variable for
### each activity and each subject

tidy = aggregate(final, by=list(Activity=final$activity, Subject_ID=final$subject), mean)

## Removing columns "subject" and "activity" since their mean has 
## no meaningful interpretation
tidy["subject"] <- NULL
tidy["activity"] <- NULL

## Writing the final tidy data set in a txt file called tidy.txt
write.table(tidy, "tidy.txt", sep="\t", row.names=FALSE)

## To properly read the tidy.txt file use:
## tidy <- read.table("tidy.txt")
## However, if column names are labeled V1,V2,V3,etc use:
## tidy <- read.table("tidy.txt", header=TRUE)
## This will depend on the version of R that is used
