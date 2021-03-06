<h1>CODE BOOK</h1>
<h2>Input Data</h2>
Input data for this project has been acquired from <strong>UCI Machine Learning Repository - Human Activity Recognition Using Smartphones Data Set</strong>.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
<h2>Variables</h2>
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
<ul>
<li>tBodyAcc-XYZ</li>
<li>tGravityAcc-XYZ</li>
<li>tBodyAccJerk-XYZ</li>
<li>tBodyGyro-XYZ</li>
<li>tBodyGyroJerk-XYZ</li>
<li>tBodyAccMag</li>
<li>tGravityAccMag</li>
<li>tBodyAccJerkMag</li>
<li>tBodyGyroMag</li>
<li>tBodyGyroJerkMag</li>
<li>fBodyAcc-XYZ</li>
<li>fBodyAccJerk-XYZ</li>
<li>fBodyGyro-XYZ</li>
<li>fBodyAccMag</li>
<li>fBodyAccJerkMag</li>
<li>fBodyGyroMag</li>
<li>fBodyGyroJerkMag</li>
</ul>
The set of variables that were estimated from these signals are: 
<ul>
<li>mean(): Mean value</li>
<li>std(): Standard deviation</li>
<li>mad(): Median absolute deviation </li>
<li>max(): Largest value in array</li>
<li>min(): Smallest value in array</li>
<li>sma(): Signal magnitude area</li>
<li>energy(): Energy measure. Sum of the squares divided by the number of values. </li>
<li>iqr(): Interquartile range </li>
<li>entropy(): Signal entropy</li>
<li>arCoeff(): Autorregresion coefficients with Burg order equal to 4</li>
<li>correlation(): correlation coefficient between two signals</li>
<li>maxInds(): index of the frequency component with largest magnitude</li>
<li>meanFreq(): Weighted average of the frequency components to obtain a mean frequency</li></li>
<li>skewness(): skewness of the frequency domain signal </li>
<li>kurtosis(): kurtosis of the frequency domain signal </li>
<li>bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.</li>
<li>angle(): Angle between to vectors.</li>
</ul>
Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
</ul>
<li>gravityMean</li>
<li>tBodyAccMean</li>
<li>tBodyAccJerkMean</li>
<li>tBodyGyroMean</li>
<li>tBodyGyroJerkMean</li>
<h2>Transformation</h2>
1. Names of columns stored in <strong>feature.txt</strong> file has been simplified by eliminating "()" and "-" symbols.
2. <strong>"Test"</strong> data frame has been created be combining data from:
<ul>
<li>'train/X_train.txt': Training set.</li>
<li>'train/y_train.txt': Training labels.</li>
<li>'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.</li>
</ul>
3. Corresponding data frame has been created for <strong>"Train"</strong> sample, by combining data from:
<ul>
<li>'test/X_test.txt': Test set.</li>
<li>'test/y_test.txt': Test labels.</li>
<li>'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.</li>
</ul>
4. Both "Train" and "Test" samples have been merged together to create one frame named <strong>"TestTrain"</strong>.
5. Activity lables has been acquired from <strong>"activity_labels.txt"</strong>, and assigned to appropriate activity in "TestTrain" set.
6. Finally, independent tidy data set with the average of each variable for each activity and each subject has been created and saved as <strong>TidyData.txt</strong>.

R code performing above mentioned steps can be found in <strong>run_analysis.R</strong> file.
<h2>How to use run_analysis.R</h2>
1. Download <strong>Human Activity Recognition Using Smartphones Data Set</strong> (you can find it here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
2. Unpack it to your working directory.
3. Run the code.

Please note that this R script uses <strong>dplyr</strong> library so be sure to have it installed before runing the code.
<h2>What TidyData.txt cotain?</h2> 
TidyData.txt contains result of above mentioned transformation. Data frame contains <strong>180 observations of 81 variables</strong>. Variables include:<br/><br/>
[1] "ActivityName"                 "Subject"                      "tBodyAccmeanX"                "tBodyAccmeanY"               
 [5] "tBodyAccmeanZ"                "tGravityAccmeanX"             "tGravityAccmeanY"             "tGravityAccmeanZ"            
 [9] "tBodyAccJerkmeanX"            "tBodyAccJerkmeanY"            "tBodyAccJerkmeanZ"            "tBodyGyromeanX"              
[13] "tBodyGyromeanY"               "tBodyGyromeanZ"               "tBodyGyroJerkmeanX"           "tBodyGyroJerkmeanY"          
[17] "tBodyGyroJerkmeanZ"           "tBodyAccMagmean"              "tGravityAccMagmean"           "tBodyAccJerkMagmean"         
[21] "tBodyGyroMagmean"             "tBodyGyroJerkMagmean"         "fBodyAccmeanX"                "fBodyAccmeanY"               
[25] "fBodyAccmeanZ"                "fBodyAccmeanFreqX"            "fBodyAccmeanFreqY"            "fBodyAccmeanFreqZ"           
[29] "fBodyAccJerkmeanX"            "fBodyAccJerkmeanY"            "fBodyAccJerkmeanZ"            "fBodyAccJerkmeanFreqX"       
[33] "fBodyAccJerkmeanFreqY"        "fBodyAccJerkmeanFreqZ"        "fBodyGyromeanX"               "fBodyGyromeanY"              
[37] "fBodyGyromeanZ"               "fBodyGyromeanFreqX"           "fBodyGyromeanFreqY"           "fBodyGyromeanFreqZ"          
[41] "fBodyAccMagmean"              "fBodyAccMagmeanFreq"          "fBodyBodyAccJerkMagmean"      "fBodyBodyAccJerkMagmeanFreq" 
[45] "fBodyBodyGyroMagmean"         "fBodyBodyGyroMagmeanFreq"     "fBodyBodyGyroJerkMagmean"     "fBodyBodyGyroJerkMagmeanFreq"
[49] "tBodyAccstdX"                 "tBodyAccstdY"                 "tBodyAccstdZ"                 "tGravityAccstdX"             
[53] "tGravityAccstdY"              "tGravityAccstdZ"              "tBodyAccJerkstdX"             "tBodyAccJerkstdY"            
[57] "tBodyAccJerkstdZ"             "tBodyGyrostdX"                "tBodyGyrostdY"                "tBodyGyrostdZ"               
[61] "tBodyGyroJerkstdX"            "tBodyGyroJerkstdY"            "tBodyGyroJerkstdZ"            "tBodyAccMagstd"              
[65] "tGravityAccMagstd"            "tBodyAccJerkMagstd"           "tBodyGyroMagstd"              "tBodyGyroJerkMagstd"         
[69] "fBodyAccstdX"                 "fBodyAccstdY"                 "fBodyAccstdZ"                 "fBodyAccJerkstdX"            
[73] "fBodyAccJerkstdY"             "fBodyAccJerkstdZ"             "fBodyGyrostdX"                "fBodyGyrostdY"               
[77] "fBodyGyrostdZ"                "fBodyAccMagstd"               "fBodyBodyAccJerkMagstd"       "fBodyBodyGyroMagstd"         
[81] "fBodyBodyGyroJerkMagstd"
<br /><br/>
Observations has been <strong>sorted by activity </strong> (LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS) <strong>and by subject</strong>  described by number from 1 to 30.
