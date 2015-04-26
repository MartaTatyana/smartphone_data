##Introduction
The class project for Getting and Cleaning Data was to read in the "Human Activity Recognition Using Smartphones" data set, perform an analysis on the data set, and output a tidy data set.

This repository sontains the CodeBook.md describiing what data was used and how the data was manipulated as well as run_analysis.r code file that was used to perform manipulations.The file "tidy.csv" contains cleaned dataset.

###Data Set
The data set "Human Activity Recognition Using Smartphones" has been downloaded.

###Steps
The R code file requires two packages "data.tables" and "reshape2". The code file checks for presense of both required packages and loads tehm if required.

The code then performs manipulateions with data described in the CodeBook.md file.

Finally the output file is saved in the working directory as .csv file.