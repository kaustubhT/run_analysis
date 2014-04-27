Code Book for
==============

Completes the following tasks:
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive activity names. 
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Overview of the Data Flow for the script:

1.Merge Training & Testing Data sets 		(X_train.txt,X_test.txt)              (10299*561)
2.Merge Training & Testing Labels 			(y_train.txt,y_test.txt)              (10299*1)
 - Assign Column Name                                                              
3.Merge Training & Testing Subject Data 	(subject_train.txt,subject_test.txt)  (10299*1)
4.Read activities                           (activity_labels.txt)                 (6)
5.Assigning activity names                                                             
	-walking,walkingupstairs,walkingdownstairs,sitting,standing,laying                
6.Reading Feature names						(features.txt)                             
7.Extracting Mean & STD                                                             
8.Tidy Data Set1 							(MeasurementData.txt)                 (10299*88)
9.Perform Mean                                                                      
10.Tidy Data Set2 							(AvgData.csv)                         (180*88)

