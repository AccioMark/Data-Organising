# Codebook
The run_analysis.R script performs a the cleaning and organising data as intended.
## Download The Dataset
Dataset downloaded and stored in  ```UCI HAR Dataset```.  
**Assign Data to Variables**  
* features <- ```feature.txt```.  
   The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.  
* activity <- ```activity_label.txt```.  
* subject_test <- ```subject_test.txt```.  
* x_test <- ```X_test.txt```.  
* y_test <- ```y_test.txt```.  
* subject_train <- ```subject_train.txt```.  
* x_train <- ```X_train.txt```.  
* y_train <- ```y_train.txt```.     

**Merging Train and Test Data into dataset**   
* ```X``` created by row binding ```x_test``` and ```x_train```.  
* ```Y``` created by row binding ```y_test``` and ```y_train```.  
* ```subject``` created by row binding ```subject_test``` and ```subject_train```.  
* ```dataset``` is created by column binding ```subject```,```X```,```Y```.  

**Extracting the ```MEAN``` and ```STANDARD DEVIATION``` Data.**   
* ```cleanData``` is created by selecting the required columns.  

**Uses descriptive activity names to name the activities in the data set**  
* ```code``` column of ```cleanData``` is substituted with ```activity```.  

**Appropriately labels the data set with descriptive variable names**  
* ```code``` column in ```cleanData``` renamed into ```activity```.
* All ```Acc``` in column’s name replaced by ```Accelerometer```.  
* All ```Gyro``` in column’s name replaced by ```Gyroscope```.  
* All ```BodyBody``` in column’s name replaced by ```Body```.  
* All ```Mag``` in column’s name replaced by ```Magnitude```.  
* All ```start with character f``` in column’s name replaced by ```Frequency```.
* All ```start with character t``` in column’s name replaced by ```Time```.  

**From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject**  
* ```FinalData``` (```180``` rows, ```88``` columns) is created by summarizing ```cleanData``` taking the means of each variable for each ```activity``` and each ```subject```, after grouped by ```activity``` and ```subject```.  
* Export ```FinalData``` into ```TidyData.txt``` file.

