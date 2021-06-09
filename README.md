# README

This project uses data taken from the [University of California: Irvine Human Activity 
Recognition Using Smartphones (UCI HAR) data set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The zip file for the data can be downloaded from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). The
data can also be downloaded from the repository.

The *run_analysis.R* script reads the data in the folder and creates a clean 
table of the large data set called *tidy_data.csv*, as well as a smaller table of the means of each
observation for each subject and each activity called *tidy_averaged_data.csv*. 

To run *run_analysis.R*, perform the following:

1. Open R and set the project directory as the working directory. Download and
save *run_analysis.R* to this directory.

2. download the data and store it in a folder called *UCI Har Dataset*, 
located in the working directory.

3. Run the code using the command `source("run_analysis.R")`

Additional information about the data, as well as the transformations applied
by *run_analysis.R*, is found in *CodeBook.md*.