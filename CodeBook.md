## Cleaned data

This repository containes files from Human Activity Recognition Using Smartphones Dataset as well as cleaned dataset files, as required by the Coursera assignment.

Specifically, the following files are new:
- CodeBook.md - this file, describing the variables, the data, and any transformations or work performed to clean up the data
- README.md - explains how all of the scripts work and how they are connected
- run_analysis.R - the main script, performing all of the data cleaning tasks
- full_data_set.csv - exported cleaned full data set
- tidy_averages.csv - tidy dataset, as required by the assignment

The full_data_set.csv contains mainly the same variables as the original data set (see http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones for details). Two new variables are
- subject: id of an individual subject of the experiment
- label: a descriptive name of activity performed (WALKING, RUNNING etc.)

The tidy_averages.csv contains the following variables:
- subject - identifier of each subject of the experiment
- label - descriptive name of activity performed
- variable - name of each mean and std variables from the original data set
- average - average value of each of the variables per subject per activity

Steps performed to prepare the tidy data set:
- Merge the training and the test sets to create one data set.
- Start by reading column names into a vector - read.table reads a table, but we only need the second column
- for test data - read and merge into one data frame: subject IDs, their data readings, and activity labels; before merging - extract only mean and standard deviation columns from data readings
- for training data - read and merge into one data frame: subject IDs, their data readings, and activity labels; before merging - extract only mean and standard deviation columns from data readings
- merge test and training data into one complete data data frame
- free up memory - remove all intermediate data frames and vectors
- load activity names
- merge two data frames (complete data set and activity names)
- remove non descriptive column (activity ids)
- clean names of variables: remove dots, change to lower case
- melt dataset (by subject and activity label)
- group the dataset: first by subject and label, and then by each variable
- summarise grouped dataset, so that means are shown
- write two files: full_data_set.csv with complete data set, tidy_averages.csv with tidy data set
