### Data Set Code Book: Human Activity Recognition Using Smartphones Data Set

##### SUMMARY
The purpose of this project prepare tidy data that can be used for later analysis.
Data were taken from the accelerometers from the Samsung Galaxy S smartphone.
For each record in the dataset it is provided: 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

#### Data Set Information:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 
A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

#### Variables
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag.
These signals were used to estimate variables of the feature vector for each pattern.

#### The original dataset includes the following files:
File name | short description | rows | columns
--------- | ----------------- | ---- | -------
subject_test.txt | Contains the Volunteer id. The file contains 30 unique ids. | 10299 | 1
X_test.txt / X_train.txt | A 561-feature vector with time and frequency domain variables | 10299 | 561
Y_test.txt / Y_train.txt | The file contains 6 unique activity ids. (1,2,3,4,5,6). Each activity id corresponds to an activity name. | 10299 | 1
activity_labels.txt | descriptive names for activity ids | 6 | 2
	| 1 -> WALKING | | 
	| 2 -> WALKING_UPSTAIRS | | 
	| 3 -> WALKING_DOWNSTAIRS | | 
	| 4 -> SITTING | | 
	| 5 -> STANDING |  |
	| 6 -> LAYING | | 
features.txt | The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. | 561 | 2
	| Abbreviations and their meanings: | |
	| prefix 't' to denote time (Time domain signals)| |
	| prefix 'f' to denote frequency (Frequency domain signals)| |
	| -XYZ' is used to denote 3-axial signals in the X, Y and Z directions| |
	| Acc = accelometer| |
	| Gyro = gyroscope| |
	| BodyAcc=body accelaration signal| |
	| GravityAcc=gravity acceleration signal| |
	| mean(): Mean value| |
	| std(): Standard deviation| |
	| mad(): Median absolute deviation | |
	| max(): Largest value in array| |
	| min(): Smallest value in array| |
	| sma(): Signal magnitude area| |
	| energy(): Energy measure. Sum of the squares divided by the number of values.| |
	| iqr(): Interquartile range| |
	| entropy(): Signal entropy| |
	| arCoeff(): Autorregresion coefficients with Burg order equal to 4| |
	| correlation(): correlation coefficient between two signals| |
	| maxInds(): index of the frequency component with largest magnitude| |
	| meanFreq(): Weighted average of the frequency components to obtain a mean frequency| |
	| skewness(): skewness of the frequency domain signal | |
	| kurtosis(): kurtosis of the frequency domain signal | |
	| bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.| |
	| angle(): Angle between to vectors.| |

#### Transformations

Data is separated into training and testing sets

###### Section1 
Merged the training and the test sets to create one data set.
Since the files do not have a header line, R will use the default variable names V1, V2, ..., etc. I have changed the default variable names using the `names()` function.

###### Section2
Assigned descriptive names to the columns of `X_train_test`.
A new data set `X_train_test_mean_std` is created with 10299 rows and 66 columns.
The new data set contains variables whose names contain the string `mean()` or `std()`

###### Section3
Used descriptive activity names to name the activities in the `Y_train_test`.
Column `id` contains the numbers that represent the activity ids while column activity contains the descriptive name of the activity id.

###### Section 4
Merged the `S_train_test`, `Y_train_test` and `X_train_test_mean_std` data sets to create one data set `dataset1`. `dataset1` was created by binding together dataframes horizontally.
`dataset1` is 2-dimensional with 10299 rows and 69 columns.

###### Section 5
Created a new data set `dataset2` with the average of each variable for each activity and each subject. The new object is 2-dimensional with 180 rows and 563 columns.
The number of rows is the product of the number of volunteers, and the number of activities (so, 30 × 6  180 rows). 

**Check the `README.md` file for further details about dataset1 and dataset2**
