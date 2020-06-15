#Merges the training and the test sets to create one data set.
X <- rbind(x_train,x_test)
Y <- rbind(y_train,y_test)
subject <- rbind(subject_train,subject_test)
dataset <- cbind(subject,X,Y)

#Extracts only the MEAN and STANDARD DEVIATION variables.
cleanData <- select(dataset,code,subject,contains("mean"),contains("std"))

#Uses descriptive activity names to name the activities in the data set
cleanData$code <- activity[cleanData$code,2]

#Format dataset with descriptive variable names.
colnames(cleanData)[1] = "activity"
colnames(cleanData) <- gsub("^t","Time",colnames(cleanData))
colnames(cleanData) <- gsub("Freq","Frequency",colnames(cleanData))
colnames(cleanData) <- gsub("^f","Frequency",colnames(cleanData))
colnames(cleanData) <- gsub("Acc","Accelerometer",colnames(cleanData))
colnames(cleanData) <- gsub("Gyro","Gyroscope",colnames(cleanData))
colnames(cleanData) <- gsub("Mag","Magnitude",colnames(cleanData))
colnames(cleanData) <- gsub("std","StandardDeviation",colnames(cleanData))
colnames(cleanData) <- gsub("angle","Angle",colnames(cleanData))
colnames(cleanData) <- gsub("BodyBody","Body",colnames(cleanData))
colnames(cleanData) <- gsub("mean","Mean",colnames(cleanData))
colnames(cleanData) <- gsub("gravity","Gravity",colnames(cleanData))

#Second dataset with average of all variables, ordered by activity and then subject.
FinalData <- cleanData %>% group_by(activity,subject) %>% summarise_all(funs(mean))

#Writing table data into a txt file.
write.table(FinalData,"TidyData.txt",row.names = FALSE)