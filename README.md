## 1. Download data

The script will download the data and unzip them all to the basename of
the folder "project2017". After that, the working directory will be set
to "project2017" folder to prepare for cleaning. (line 1-4)

## 2. Reading data

All file names, except for "README.txt" and "features_info.txt" in the
working directory, are retrieved to perform fast reading on all of the
datasets, attach them to a list, and convert them into tibbles before
detaching all to the global environment.
Before freeing tibbles to the global environment, the vector of file names
is modified to remove the ".txt" and assign to the name of the list.
(line 8-15)

## 3. Cleaning

### Merging
Dataset "X_test", "subject_test", and "y_test" are columned-bound together,
dataset "X_train", "subject_train", and "y_train" are columned-bound together.
Those 2 tibbles that are just created will be row-bound to become "data"
dataset with 563 variables and 10,299 observations. (line 16-17)

### Naming
The "data" dataset is named. (line 18)

### Label activities
Numbers in the "activity" variable in the "data" dataset will be searched and
replaced by the corresponding activities labels found in "activity_labels"
dataset. (line 19-23)

### Extracting mean and standard deviation variables
The dataset is subset with all variables providing "mean" or "std"
information, plus the "activity" and "subject" variables. (line 24)

## 4. Final dataset
The cleaned dataset is grouped by subjects and activities and then applied
summarized_all to calculate the average for each variable for each activity
group with 6 activities in each group. (line 25-27)