# 1. Merges the training and the test sets to create one data set.

# setwd("C:/Users/geo/Documents/data/UCI HAR Dataset/UCI HAR Dataset")

X_train <- read.table("train/X_train.txt")
X_test <- read.table("test/X_test.txt")
X_train_test <- rbind(X_train, X_test)

S_train <- read.table("train/subject_train.txt")
S_test <- read.table("test/subject_test.txt")
S_train_test <- rbind(S_train, S_test)
names(S_train_test) <- "subject"

Y_train <- read.table("train/y_train.txt")
Y_test <- read.table("test/y_test.txt")
Y_train_test <- rbind(Y_train, Y_test)
names(Y_train_test) <- "id"

# remove temporary variables from memory
rm(X_train,X_test,S_train,S_test,Y_train,Y_test)


# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

features <- read.table("features.txt")
# convert data.frame column [2](feature name) to a vector
a_vector=features[[2]]
# name all columns
names(X_train_test) <-a_vector
# create subset , extract columns whose names contain the word mean() or std()
X_train_test_mean_std <- X_train_test[, grep("([Mm]ean|[Ss]td)\\(\\)", colnames(X_train_test))]

# head(features,1)
# dim(X_train_test_mean_std)
# tail(features)

# 3. Uses descriptive activity names to name the activities in the data set
library("plyr")
activity_lbls <- read.table("activity_labels.txt")
names(activity_lbls) <- c("id","activity")
activity_lbls$activity <- tolower(activity_lbls$activity)
Y_train_test <- join(Y_train_test,activity_lbls,type="inner")

# head(Y_train_test)
# dim(Y_train_test)
# tail(Y_train_test)


# 4. Appropriately labels the data set with descriptive variable names. 

#   all data sets are already labeled (see above). 
#   just merge the three data sets into one

dataset1 <- cbind(S_train_test, Y_train_test , X_train_test_mean_std)
write.csv(dataset1, file='dataset1.CSV', row.names=TRUE)


# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.

dataset2 <- aggregate(X_train_test, by = list(activity = Y_train_test[,2], subject = S_train_test[,1]), mean)

