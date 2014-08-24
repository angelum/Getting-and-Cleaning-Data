## 1. Study Design ##

(This section was extracted from the [Data set description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) of the "Human Activity Recognition Using Smartphones Data Set" repository, which is part of the University of California Irvine [datasets on machine learning](http://archive.ics.uci.edu/ml/datasets.html?format=&task=&att=&area=&numAtt=&numIns=&type=&sort=nameUp&view=list). Its purpose is to briefly describe the basic criteria on how the information was initially collected for this experiment).

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

## 2. Summary Choices ##

The summary choices made in order to obtain the final tidy set are associated with the extraction of mean and standard deviation related variables.  

In this way, from the original data set composed of 561 variables the procedure was to subset only those variables that refer to the mean and the standard deviation on each measurement.

Hence, the final tidy set comprises: 2 identifier variables (Activity and Subject_ID) and 86 variables estimated from signals, from which 53 variables correspond to mean values and 33 to standard deviation values (See the code book section for more details). 

## 3. Code Book ##

The final tidy data set is composed of 88 variables which can be grouped in two: a) Identifier variables and b) Variables estimated from signals.

### a) Identifier variables. ###

These are two variables used to identify the subject and/or the activity to which the observed value belongs.

#### 1. Activity. ####
Refers to the activity that was performed by the subject and was determined by the signals captured from the accelerometer and/or the gyroscope on the smart phone.

Type: Categorical

Possible values:

1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING 

#### 2. Subject_ID. ####

Refers to the identification of the subject who participated in the experiment.

Type: Integer

Possible values: Integer values from 1 to 30

### b) Variables estimated from signals. ###

There are 86 variables of this type and they are estimated through the signals collected from the accelerometer and/or the gyroscope on the smart phone. All of them present the same type and possible values as described below.

Type: Numerical

Possible values: Between -1 and 1

Codification: Variables names' and meaning can be clearly identified through the following notation:

- t -> Refers to time domain signals.
- f -> Refers to frecuency domain signals.
- BodyAcc -> Refers to body linear acceleration.
- GravityAcc -> Refers to gravity acceleration.
- BodyGyro -> Refers to body angular velocity.
- Jerk -> Refers to Jerk signals.
- Mag -> Refers to magnitude.
- XYZ -> Refers to 3-axial signals in the X, Y and Z directions.
- mean -> Refers to the mean value.
- std -> Refers to the standard deviation.
- Gravity and angle are self-described.

**Example 1:** Variable "tBodyAcc.mean...X" represents the mean value of body linear acceleration on the X direction for time domain signals.

**Example 2:** Variable "fBodyAccJerk.std...Z" represents the standard deviation of body linear acceleration Jerk signal on the Z direction for frecuency domain signals.

**Example 3:** Variable "tBodyGyroJerkMag.mean.." would be the mean value of the body angular velocity Jerk signal magnitude for  time domain signals.

***Kind of confused with "time domain signals" and "frequency domain signals"?***

 I was, maybe [this will help](https://6002x.mitx.mit.edu/wiki/view/TimeDomainVersusFrequencyDomainAnalysis).

For a complete list of the variables estimated from signals use the following code on R once the tidy.txt file has been read:

    > names(tidy[,3:88])
>
 [1] "tBodyAcc.mean...X"                   
 [2] "tBodyAcc.mean...Y"                   
 [3] "tBodyAcc.mean...Z"                   
 [4] "tBodyAcc.std...X"                    
 [5] "tBodyAcc.std...Y"                    
 [6] "tBodyAcc.std...Z"                    
 [7] "tGravityAcc.mean...X"                
 [8] "tGravityAcc.mean...Y"                
 [9] "tGravityAcc.mean...Z"                
[10] "tGravityAcc.std...X"                 
[11] "tGravityAcc.std...Y"                 
[12] "tGravityAcc.std...Z"                 
[13] "tBodyAccJerk.mean...X"               
[14] "tBodyAccJerk.mean...Y"               
[15] "tBodyAccJerk.mean...Z"               
[16] "tBodyAccJerk.std...X"                
[17] "tBodyAccJerk.std...Y"                
[18] "tBodyAccJerk.std...Z"                
[19] "tBodyGyro.mean...X"                  
[20] "tBodyGyro.mean...Y"                  
[21] "tBodyGyro.mean...Z"                  
[22] "tBodyGyro.std...X"                   
[23] "tBodyGyro.std...Y"                   
[24] "tBodyGyro.std...Z"                   
[25] "tBodyGyroJerk.mean...X"              
[26] "tBodyGyroJerk.mean...Y"              
[27] "tBodyGyroJerk.mean...Z"              
[28] "tBodyGyroJerk.std...X"               
[29] "tBodyGyroJerk.std...Y"               
[30] "tBodyGyroJerk.std...Z"               
[31] "tBodyAccMag.mean.."                  
[32] "tBodyAccMag.std.."                   
[33] "tGravityAccMag.mean.."               
[34] "tGravityAccMag.std.."                
[35] "tBodyAccJerkMag.mean.."              
[36] "tBodyAccJerkMag.std.."               
[37] "tBodyGyroMag.mean.."                 
[38] "tBodyGyroMag.std.."                  
[39] "tBodyGyroJerkMag.mean.."             
[40] "tBodyGyroJerkMag.std.."              
[41] "fBodyAcc.mean...X"                   
[42] "fBodyAcc.mean...Y"                   
[43] "fBodyAcc.mean...Z"                   
[44] "fBodyAcc.std...X"                    
[45] "fBodyAcc.std...Y"                    
[46] "fBodyAcc.std...Z"                    
[47] "fBodyAcc.meanFreq...X"               
[48] "fBodyAcc.meanFreq...Y"               
[49] "fBodyAcc.meanFreq...Z"               
[50] "fBodyAccJerk.mean...X"               
[51] "fBodyAccJerk.mean...Y"               
[52] "fBodyAccJerk.mean...Z"               
[53] "fBodyAccJerk.std...X"                
[54] "fBodyAccJerk.std...Y"                
[55] "fBodyAccJerk.std...Z"                
[56] "fBodyAccJerk.meanFreq...X"           
[57] "fBodyAccJerk.meanFreq...Y"           
[58] "fBodyAccJerk.meanFreq...Z"           
[59] "fBodyGyro.mean...X"                  
[60] "fBodyGyro.mean...Y"                  
[61] "fBodyGyro.mean...Z"                  
[62] "fBodyGyro.std...X"                   
[63] "fBodyGyro.std...Y"                   
[64] "fBodyGyro.std...Z"                   
[65] "fBodyGyro.meanFreq...X"              
[66] "fBodyGyro.meanFreq...Y"              
[67] "fBodyGyro.meanFreq...Z"              
[68] "fBodyAccMag.mean.."                  
[69] "fBodyAccMag.std.."                   
[70] "fBodyAccMag.meanFreq.."              
[71] "fBodyBodyAccJerkMag.mean.."          
[72] "fBodyBodyAccJerkMag.std.."           
[73] "fBodyBodyAccJerkMag.meanFreq.."      
[74] "fBodyBodyGyroMag.mean.."             
[75] "fBodyBodyGyroMag.std.."              
[76] "fBodyBodyGyroMag.meanFreq.."         
[77] "fBodyBodyGyroJerkMag.mean.."         
[78] "fBodyBodyGyroJerkMag.std.."          
[79] "fBodyBodyGyroJerkMag.meanFreq.."     
[80] "angle.tBodyAccMean.gravity."         
[81] "angle.tBodyAccJerkMean..gravityMean."  
[82] "angle.tBodyGyroMean.gravityMean."    
[83] "angle.tBodyGyroJerkMean.gravityMean."  
[84] "angle.X.gravityMean."                
[85] "angle.Y.gravityMean."                
[86] "angle.Z.gravityMean." 