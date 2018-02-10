# CODEBOOK

## Dataset
data was obtained from: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Abstract: Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

Data Set Characteristics:  
Multivariate, Time-Series
Number of Instances:10299
Area: Computer
Attribute Characteristics: N/A
Number of Attributes: 561
Date Donated: 2012-12-10
Associated Tasks: Classification, Clustering
Missing Values? N/A
Number of Web Hits: 596587

## Variables
Initial variables were created to capture all data before merge.  These include:
* xte: xtest data
* yte: ytest data
* subte: subject test data
* xtr: xtraining data
* ytr: ytraining data
* subtr: subject training data
* feat: features
* label: activity labels

Once read into memory, the following variables were merged into the *all* variable
* train: all training data
* test: all testing data

*mstd* contains the true/false results of a grepl search to extract the mean and standard deviations from the all of the column names (*colnames*)

*mstdev* is a subset using *mstd*, then labels are added to the *mstdev* creating *mstdev_wlabel*.

The second tidy data set is the created using the aggregate function from the **plyr** package.

## Transformations
Transformations included merging the data into one dataset using **cbind** and **rbind**, filtering the dataset with **grepl**, subsetting using index functions, merging in **plyr** using **merge**, and creating a new *mean* variable using **plyr**.











##Explanation of Variables


