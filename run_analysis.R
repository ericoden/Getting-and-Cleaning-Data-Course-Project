library(dplyr)

# Get names of each measurement
features <- read.table("./UCI HAR Dataset/features.txt")
features <- features[, 2]

# Get names of each activity
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
activity_labels <- activity_labels[, 2]

# Read and combine test data
dir <- "./UCI HAR Dataset/test/"
y_test <- read.table(paste0(dir, "y_test.txt"))
subject_test <- read.table(paste0(dir, "subject_test.txt"))
X_test <- read.table(paste0(dir, "X_test.txt"))
X_test <- bind_cols(y_test, subject_test, X_test)

# Read and combine training data
dir <- "./UCI HAR Dataset/train/"
y_train <- read.table(paste0(dir, "y_train.txt"))
subject_train <- read.table(paste0(dir, "subject_train.txt"))
X_train <- read.table(paste0(dir, "X_train.txt"))
X_train <- bind_cols(y_train, subject_train, X_train)

# Combine the test and training data
X <- bind_rows(X_test, X_train)
# Assign names to the columns
names(X) <- c("Activity", "Subject", features)

# Extract only the subject, activity, and mean and std for each measurement
# Change numeric activity labels to strings
# Sort rows by subject, then by activity
X %<>% select(contains("Activity") | 
                contains("Subject") | 
                contains("mean()") | 
                contains("std()")) %>% 
       mutate(Activity = activity_labels[Activity]) %>% 
       arrange(Activity, Subject)
# Write to file
write.csv(X, "tidy_data.csv", row.names = FALSE)

# Create separate data.frame with the average for each variable for 
# each subject and for each activity
averages <- X %>% 
    group_by(Activity, Subject) %>% 
    summarize_all(mean)
write.csv(averages, "tidy_averaged_data.csv", row.names = FALSE)


