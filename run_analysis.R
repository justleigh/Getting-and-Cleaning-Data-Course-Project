install.packages(c("dplyr", "tidyr"))
library(dplyr)
library(tidyr)
getwd()
[1] "/Users/leighpearson/Downloads"
setwd("/Users/leighpearson/Downloads/UCI HAR Dataset")

# I loaded the activity and feature information
activity_labels <- read.table("activity_labels.txt", col.names = c("id", "activity"))
features <- read.table("features.txt", col.names = c("id", "feature"))

# I loaded the training and test datasets
X_train <- read.table("train/X_train.txt", col.names = features$feature)
y_train <- read.table("train/y_train.txt", col.names = "activity_id")
subject_train <- read.table("train/subject_train.txt", col.names = "subject")
X_test <- read.table("test/X_test.txt", col.names = features$feature)
y_test <- read.table("test/y_test.txt", col.names = "activity_id")
subject_test <- read.table("test/subject_test.txt", col.names = "subject")

# I merged the training and test datasets
X_data <- rbind(X_train, X_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

# I extracted measurements on the mean and standard deviation
selected_features <- grep("(mean\\()|(std\\())", features$feature)
X_data <- X_data[, selected_features]

# I named activities in the y_data dataset
y_data <- merge(y_data, activity_labels, by.x = "activity_id", by.y = "id")[, "activity"]

# I combined subject, activity, and measurements data
clean_data <- cbind(subject_data, y_data, X_data)

# I renamed the dataset with appropriate variable names
names(clean_data)[2] <- "activity"
names(clean_data)[3:ncol(clean_data)] <- gsub("[()]", "", names(clean_data)[3:ncol(clean_data)])
names(clean_data) <- gsub("-", "_", names(clean_data))
names(clean_data) <- tolower(names(clean_data))

# I created a tidy dataset with the average of each variable for each activity and subject
tidy_data <- clean_data %>%
  group_by(subject, activity) %>%
  summarise(across(everything(), mean))

# Given the complexities of the original dataset's column names, decided to make all column names more descriptive, consistent snake_case, unique, and shorter where possible
names(tidy_data) <- gsub("^t", "time_", names(tidy_data))
names(tidy_data) <- gsub("^f", "freq_", names(tidy_data))
names(tidy_data) <- gsub("bodybody", "body", names(tidy_data))
names(tidy_data) <- gsub("\\.\\.$", "", names(tidy_data))
names(tidy_data) <- gsub("\\.\\.\\.x", "_x", names(tidy_data))
names(tidy_data) <- gsub("\\.\\.\\.y", "_y", names(tidy_data))
names(tidy_data) <- gsub("\\.\\.\\.z", "_z", names(tidy_data))
colnames(tidy_data) <- names(tidy_data)
View(tidy_data)

