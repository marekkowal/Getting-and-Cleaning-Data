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