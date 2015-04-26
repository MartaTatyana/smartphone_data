## Samrtphone Data Clean up Code Book
This is a code book that describes the variables, the data, and any transformations or work that was performed to clean up the smartphone activity data.

###The data sets used
* Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

###Dataset Description
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

###Data Used

Only subset of the tables was used in the dataset. The following tables were used:
* "./UCI HAR Dataset/test/X_test.txt" -- provides measurements for the test subset of data. 2947 observations of the 561 features, for 9 of the 30 volunteers.
* "./UCI HAR Dataset/test/y_test.txt" -- provides details of the activities that corresponds to the measurements Xtest. A vector of 2947 integers, denoting the ID of the activity.
* "./UCI HAR Dataset/test/subject_test.txt" -- provides subjects associated with the given activity and measurements. A vector of 2947 integers, denoting the ID of the volunteer.
* "./UCI HAR Dataset/train/X_train.txt" -- provides measurements for the train subset of data. 7352 observations of the 561 features, for 21 of the 30 volunteers.
* "./UCI HAR Dataset/train/y_train.txt" -- provides details of the activities that corresponds to the measurements in Xtrain. A vector of 7352 integers, denoting the ID of the activity.
* "./UCI HAR Dataset/train/subject_train.txt" -- provides subjects associated with the given activity and measurememnts. A vector of 7352 integers, denoting the ID of the volunteer related to the measurements.
* "./UCI HAR Dataset/features.txt" -- provides information on what measurements were taken. Names of the 561 measurements.
* "./UCI HAR Dataset/activity_labels.txt" -- provides the list of activityes with their keys in the dataset. Names and IDs for each of the 6 activities.

The rest of the tables were deemed unnessessary for the required analysis.

###Transofmraions Performed
* The original .zip file was downloaded from the network.
* THe file was unzipped in R working directory.
* All datasets described in the section "Data Used" were read into the tables.
* Training dataset was merged with the subects and activities that correspond to teh measurements.
* Test dataset was merged with the subects and activities that correspond to teh measurements.
* Two datasets were combined together.
* The newly created dataset was given headers of "Subject", "Activity", and the list of the headers in the features dataset that corresponds to teh names of the variables.
* The columns of the newly created dataset were evaluated to see which columns correspond to Subject, Activity, or any variable that contain mean or std in it's name.
* The merged dataset was subsetted using the vector from the prior step.
* Descriptive names were given to the activities in the subsetted dataset.
* The dataset was melted to have one variable measurememnt for each of the rows corresponding to the Subject/Activity combination.
* The dataset was summarise to calculate Averages for all variables for each of the Subject/Activity combination.
* Finally the tidy dataset was saved into "tidy.txt" file.

