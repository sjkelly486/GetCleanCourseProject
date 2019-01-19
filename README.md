==================================================================
#Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
##Original Experimental Team
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

## Original Study Design - Explanation copied from original experimental team.
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. 
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 
The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. 
The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. 
From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 


## Further Data Reduction - Work performed by me on the data set provided by original experimental team.
The data set collected by the researchers listed above has been transformed into a smaller, tidy dataset with fewer variables. 
The original data set contained multiple sets of data for each combination of subject/activity.

All of the operations I performed to generate the new tidy data set are documented in the included script 'run_analysis.R'. The script performs the following actions:
 -Merges the training and the test sets to create one data set.
 -Extracts only the measurements on the mean and standard deviation for each measurement.
 -Uses descriptive activity names to name the activities in the data set
 -Appropriately labels the data set with descriptive variable names.
 -From the data set in previous, creates a second, independent tidy data set with the average of each variable for each activity and each subject. Exports this tidy data set to 'PhoneAccMean.txt'

'PhoneAccMean.txt' could be read back into R using read.table(header=TRUE).




##For each unique combination of Activity/Subject the mean value of the following variables are provided:
======================================

- Triaxial acceleration and jerk from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity and jerk from the gyroscope. 

The data is identified by:
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The data is considered tidy because each variable (listed in CodeBook.md) is contained in a single column
Each unique combination of subject/activity is in a different row. 
All data is stored in one table as it is all the same type of data.
All variable names are readable.



##The dataset includes the following files:
=========================================

- 'README.txt'

- 'CodeBook.md': Shows information about the variables used on the feature vector.

- 'run_analysis.R': R script that performs data reduction beyond what the original researchers contributed. The script outputs the tidy data set in file 'PhoneAccMean.txt'.

- 'PhoneAccMean.txt': Tidy data set that contains the mean of all mean and standard deviation variables in original data set.





For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
