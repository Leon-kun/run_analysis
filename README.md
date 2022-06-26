This repository contains the R Script, "run_analysis.R", for the course project. Information on the tidydata file can be found in the code book.
run_analysis.R does the following in the given order (the steps are also outlined by the comments in the actual R Script):
1. Loads the train and test data.
2. Loads the rest of the data from the files into the function. 
3. Saves the second column of the features file (the first column is unecessary)
4. Saves only the mean "mean()" and standard deviation "std()" from the second column of the features file in a variable "FMSD".
5. Using FMSD, subsets the test and train data and creates two new variables with this data, "test" and "train".
6. Merges all the data related to test into one dataframe, "test_All".
Note: run_analysis specifies equal lengths for all parameters because an error appears if this isn't done.
7. Merges all the data related to train into one dataframe, "train_All".
Note: run_analysis specifies equal lengths for all parameters because an error appears if this isn't done.
8. Sets the column names of train_All equal to the column names of test_All.
Note: R kept throwing out errors unless this was done.
9. Merges the test and train data into one data frame "TestAndTrain".
10. Sets the correct column names for TestAndTrain.
11. Sets first two columns of TestAndTrainMeans to unique versions of TestAndTrain.
12. Runs through each data column in TestandTrain with tapply to get the average of each column based on the subject factor.
13. Sets correct column names for TestAndTrainMeans.
13. Creates the "tidydata" data table from TestAndTrainMeans.
Done!