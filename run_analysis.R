library(dplyr)

file <- "./UCI HAR Dataset/train/X_train.txt" # observations (train)
x_train <- read.table(file)
file <- "./UCI HAR Dataset/train/y_train.txt" # activity id
y_train <- read.table(file)
file <- "./UCI HAR Dataset/train/subject_train.txt" # subject id
subject_train <- read.table(file)

file <- "./UCI HAR Dataset/test/X_test.txt" # observations (test)
x_test <- read.table(file)
file <- "./UCI HAR Dataset/test/y_test.txt"  # activity id
y_test <- read.table(file)
file <- "./UCI HAR Dataset/test/subject_test.txt" # subject id
subject_test <- read.table(file)

file <- "./UCI HAR Dataset/activity_labels.txt" # activity names
activity_labels <- read.table(file)
file <- "./UCI HAR Dataset/features.txt" # column names (variables) of observations
features <- read.table(file)

# attach column names to both sets of observations
colnames(x_train) <- features$V2
colnames(x_test) <- features$V2

# add activity names to both sets of activity id sets and name columns
y_train2 <- inner_join(y_train, activity_labels, by="V1")
y_test2 <- inner_join(y_test, activity_labels, by="V1")
colnames(y_train2) <- c("activity_id", "activity_name")
colnames(y_test2) <- c("activity_id", "activity_name")

# name columns
colnames(subject_train) <- "subject_id"
colnames(subject_test) <- "subject_id"

# take standard deviation and mean columns only
x_train2 <- x_train[,grep("std\\(|mean\\(", features$V2)]
x_test2 <- x_test[,grep("std\\(|mean\\(", features$V2)]

# combine train data and combine test data
train <- cbind(subject_train, y_train2, x_train2)
test <- cbind(subject_test, y_test2, x_test2)

# combine train and test data together
har_data <- rbind(train, test)

# remove all objects from environment except for final data set
rm(list=setdiff(ls(), "har_data"))

# group by activity and subject then average measurement variables
har_data_avg <- har_data %>% group_by(activity_id, activity_name, subject_id) %>% summarise_each(funs(mean))

# write file
write.table(har_data_avg, file="har_data_avg.txt", row.names=FALSE)
