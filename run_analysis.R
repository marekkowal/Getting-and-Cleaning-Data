# 1. Merge the training and the test sets to create one data set.
# Start by reading column names into a vector - read.table reads a table, but we only need the second column
columnnamesvector <- read.table("features.txt", header = FALSE)[,2]

# for test data - read and merge into one data frame: subject IDs, their data readings, and activity lavels
# before merging - extract only mean and standard deviation columns from data readings
testsubjectsdf <- read.table("test/subject_test.txt", header = FALSE, col.names = c("subject"))
testdatasetdf <- read.table("test/X_test.txt", header = FALSE, dec = ".", col.names = columnnamesvector)
testdatasetdf <- testdatasetdf[,grepl("mean...|std...", names(testdatasetdf))]
testdatalabelsdf <- read.table("test/y_test.txt", header = FALSE, col.names = c("activitylabel"))
testdatadf <- cbind(testsubjectsdf, testdatasetdf, testdatalabelsdf)

# for training data - read and merge into one data frame: subject IDs, their data readings, and activity lavels
# before merging - extract only mean and standard deviation columns from data readings
trainsubjectsdf <- read.table("train/subject_train.txt", header = FALSE, col.names = c("subject"))
traindatasetdf <- read.table("train/X_train.txt", header = FALSE, dec = ".", col.names = columnnamesvector)
traindatasetdf <- traindatasetdf[,grepl("mean...|std...", names(traindatasetdf))]
traindatalabelsdf <- read.table("train/y_train.txt", header = FALSE, col.names = c("activitylabel"))
traindatadf <- cbind(trainsubjectsdf, traindatasetdf, traindatalabelsdf)

# merge test and training data into one data frame
completedatasetdf <- rbind(testdatadf, traindatadf)

# free up memory - remove all intermediate data frames and vectors
rm(columnnamesvector, testsubjectsdf, testdatasetdf, testdatalabelsdf, testdatadf, trainsubjectsdf, traindatasetdf, traindatalabelsdf, traindatadf)

# load activity names
activitynames <- read.table("activity_labels.txt", header = FALSE, col.names = c("id", "label"))

# merge two data frames (complete data set and activity names)
completedatasetdf <- merge(completedatasetdf, activitynames, by.x = "activitylabel", by.y = "id")

# remove non descriptive column
completedatasetdf <- completedatasetdf[,-1]

# clean names of variables
# remove dots
names(completedatasetdf) <- gsub("\\.", "", names(completedatasetdf))
# lowercase names
names(completedatasetdf) <- tolower(names(completedatasetdf))


# melt dataset
melted <- melt(completedatasetdf, id.vars=c("subject","label"))

# group it: first by subject and label, and then by each variable
grouped <- group_by(melted, subject, label)
grouped2 <- group_by(grouped, subject, label, variable)

# summarise grouped2, so that means are shown
datameansdf <- summarise(grouped2, average=mean(value))

write.csv(completedatasetdf, file = "full_data_set.csv")
write.csv(datameansdf, file = "tidy_averages.csv")