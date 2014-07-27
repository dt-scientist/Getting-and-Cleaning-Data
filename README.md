### Section 1: Merge the training and the test sets to create one data set.
Construct three new data sets. Use `rbind()` to join trained and test data vertically. 
Use `names()` to define the column names

### Section 2: Extracts only the measurements on the mean and standard deviation for each measurement.
Read data from `features.txt` into a data frame: `features`. Convert the one-column data frame to 
a vector and assign names to the columns of the `X_train_test`, so we can access the elements
by names. Use `grep()` to select columns matching `std()` and `mean()`

### Section 3: Uses descriptive activity names to name the activities in the data set
Read data from `activity_labels.txt` into a data frame:`activity_lbls`. Use `tolower()` to convert 
text to lowercase. Use the `join()` function in the `plyr package` to join `Y_train_test` and 
`activity_lbls` together. The above operation will add an extra column `activity` to the `Y_train_test dataset`. 
Column `Activity` contains the descriptive name of the short identifier: `id`. 

### Section 4: Appropriately labels the data set with descriptive variable names.
Create a tidy dataset: `dataset1` from the 3 data frames (`X_train_test`,`S_train_test`,`X_train_test_mean_std`) using cbind.

### Section 5: Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.
Create a new dataset: `dataset2`. Use the `aggregate()` function to aggregate the 561 time and frequency domain variables
by subject and activity.