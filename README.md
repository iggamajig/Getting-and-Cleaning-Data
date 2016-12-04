# Getting-and-Cleaning-Data
The following was create as a inal project for Coursera Getting and Cleaning Data class.

##Procedure
The data source represents data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The included R script called run_analysis.R that does the following:

###Merges the training and the test sets to create one data set.
###Extracts only the measurements on the mean and standard deviation for each measurement.
This script uses all measurements that include either a mean or standard deviation, including additional vectors from the angle() variable because they consist of mean signals. 
###Uses descriptive activity names to name the activities in the data set
This script uses descriptive activity names place replacing the Activity ID numbers with the names of each activity, drawn from the activity_labels.txt file in the original data set.
###Appropriately labels the data set with descriptive variable names.
This script translates all abbreviations from the data set into full words to make the variables human readable, a requirement for a tidy data set. Names were established by interpretting variables based on features_info.txt in the source files.  This final edit to the data set is saved as TidySet.txt
###From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
This second tidy data set is saved in the working directory as "TidySet2.txt"  It is created by aggregating the mean of each variable for each activity and each subject.

##Tidy Data
The following code produces two tidy data sets.  These are tidy data sets because:
###Each variable measured is in a different column.
###Each different observation of that variable is in a different row.
###There is a row at the top of each file with descriptive variable names
###Variable names are human readable. For example, "standard deviation" is used for names instead of "std". 
