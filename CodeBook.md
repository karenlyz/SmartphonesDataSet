This code book describes the variables, the data, and any transformations or work performed to clean up the data.

### The data and variables:
The data was collected from the experiments that carried out with a group of 30 volunteers. They were asked to perform 6 activities. A total of 10299 obs. were obtained. Each observation has 561 variables. 
 
- train/X_train.txt:  Training set. 7352 obs. of 561 variables
- train/y_train.txt:  Training activity class labels. 7352 obs. of 1 variables 
- train/subject_train.txt: Identifies the subject who performed the activity. 7352 obs. of 1 variables

- test/X_test.txt:  Test set. 2947 obs. of 561 variables
- test/y_test.txt:  Test activity class labels. 2947 obs. of 1 variables 
- test/subject_test.txt: Identifies the subject who performed the activity. 2947 obs. of 1 variables

- features.txt: List of all features. 561 obs. of 2 variables. 
                561 features matches the 561 variables in the "X_train.txt" and "X_test.txt" dataset. 

- activity_labels.txt: Links the activity class labels with their activity name. 6 obs. of 2 variables.

The 10299 obs. were provides seperately in two files "X_train.txt" and "X_test.txt" in the original dataset.

Each row in the "y_train.txt"/"y_test.txt" dataset labels which activity was done for each observation in the "X_train.txt"/"X_text.txt" dataset.

Each row in the "subject_train.txt"/"subject_test.txt" dataset indicates the subject from which each observation in the "X_train.txt"/"X_text.txt" dataset was taken.

### Transformations or work performed to clean up the data
* All the above dataset are read into R. 
* Attach "y_train.txt" and "subject_train.txt" as two columns to the right of "X_train.txt",  therefore forms "train" dataset which as 7352 obs. of 563 variables.
* Attach "y_test.txt" and "subject_test.txt" as two columns to the right of "X_test.txt",  therefore forms "test" dataset which as 2947 obs. of 563 variables.
* "test" dataset is appended to the "train" dataset to form "dataset" with 10299 obs. of 563 variables.
* "mean_std" contains only the measurements on mean and standard deviation for each measurement. It has 10299 obs. of 68 variables.
* Replace the activity class labels (in column 67 of "mean_std") with activity names using the info provided in the "activity_labels.txt".
* Name each column of "mean_std" using the info in "features.txt".
* "group_var" is the outcome data set with the average of each variable for each activity and each subject. (6 activities* 30 subjects = 180 obs. of 68 variables)
* The "group_var" is written into file "tidydata.txt".



