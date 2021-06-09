---
title: "Code Book for Getting and Cleaning Data Course Project"
author: "Eric Oden"
date: "6/9/2021"
output: html_document
---

## Data

Data is taken from the [University of California: Irvine Human Activity 
Recognition Using Smartphones (UCI HAR) data set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). 

From the source:

>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The data set includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

## Variables

The variables in the data are the following:

- **Subject**

- **Activity**

- A list of 561 observations enumerated in the *features.txt* file

## Transformations

*run_analysis.R* performs the following:

### 1. Merges the training and the test sets to create one data set.

The names of each of the observations are read from *features.txt* and written to a character vector *features*. The names of each activity is read from *activity_labels.txt* and written to a character vector *activity_labels*. 

The information from *y_test.txt*, *subject_test.txt*, and *X_test.txt* is read into correspondingly named data frames, which are then binded horizontally. The same is done with the training data. Then, the two horizontally-binded data frames are vertically binded into a large data frame called *X*.

### 2. Appropriately labels the data set with descriptive variable names. 

The columns of *X* are given appropriate names (using the information from the *features* character vector, as well as manually naming the **Subject** and **Activity** columns).

### 3. Extracts only the measurements on the mean and standard deviation for each measurement. 

The data frame *X* is subsetted to only contain the columns corresponding to subject, activity, and measurements on the mean and standard deviation by using the **dplyr** `select()` command. *X* is sorted by **Activity** and then by **Subject** using the **dplyr** `arrange()` command. 

### 4. Uses descriptive activity names to name the activities in the data set.

The numeric values in the **Activity** column are replaced with the string names using the **dplyr** mutate() command, and the *activity_labels* vector. 

### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

A smaller data frame called *averages* is created using the **dplyr** `group_by()` and `summarize()` commands, where *X* is grouped by **Activity** and **Subject**, and all other variables (i.e., the measurements) are averaged in the summarization. 

### 6. Writes both data sets to *.csv* files.

*X* is written to the file *tidy_data.csv*.

The smaller data frame with the averages is written to the file *tidy_averaged_data.csv*.





