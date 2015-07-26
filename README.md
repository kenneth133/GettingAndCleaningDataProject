# GettingAndCleaningDataProject
Repository for Course Project for Getting and Cleaning Data on Coursera

run_analysis.R
1. Script is applied to Human Activity Recognition Using Smartphones Data Set:
	http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
2. Applies descriptive column names to train and test datasets.
3. Combines train datasets together.
4. Combines test datasets together.
5. Take standard deviation and mean variables from train dataset.
6. Take standard deviation and mean variables from test dataset.
7. Combine objects from steps 4 and 5 into tidy dataset object called har_data
8. Group by activity and subject then average measurement variables into object called har_data_avg
9. Write object har_data_avg to file named har_data_avg.txt
