          #  run_analysis.R

#Set the directory  with setwd("./UCI HAR Dataset/")


#Reading Training & Testing Sets 
Xtr <- read.table("train/X_train.txt",header=F)
Xts <- read.table("test/X_test.txt",header=F)

X <- rbind(Xtr, Xts)             #Data Merge     

rm(list=c("Xtr","Xts"))          #Data Cleaning

#Reading Training & Testing Labels
Ytr <- read.table("train/y_train.txt",header=F)
Yts <- read.table("test/y_test.txt",header=F)

Y <- rbind(Ytr, Yts)             #Data Merge   

rm(list=c("Ytr","Yts"))          #Data Cleaning

#Reading Training & Testing Subject Data
St <- read.table("train/subject_train.txt",header=F)
Sts <- read.table("test/subject_test.txt",header=F)

S <- rbind(St, Sts)              #Data Merge
colnames(S) <- "subject"         #Assign subject as name to column
rm(list=c("St","Sts"))           #Data Cleaning


#Reading Activity
act <- read.table("activity_labels.txt",stringsAsFactors=F,header=F)

#Reading Feature Names
feat <- read.table("features.txt",header=F)

y_fact <- NULL                   #Creating an empty list

#Assigning activity names 
y_fact$activity <- factor(Y$V1, labels=act[,2]) 

#Data Cleaning for better extracting
feat <- sapply(feat[,2], function(x) gsub("[()]", "", x))
feat <- sapply(feat, function(x) gsub("[-,]", "_", x))

colnames(X) <- feat              #Assigns names to columns

#Extracting Mean & STD 
X_sub <- X[,grep("_mean_|Mean|mean|_std_|std", feat, value=T)]

#Data Merge
MeasurementData <- cbind(S, y_fact, X_sub)


#Write tidy data to an independent file
if (!file.exists("Tidy Data")){
    dir.create("Tidy Data")
} 

#write.csv(MeasurementData, "Tidy Data/MeasurementData.csv")
# Create a Text File for uploading:-
write.table(MeasurementData, file="Tidy Data/MeasurementData.txt", sep="\t", row.names=FALSE)


#Independent tidy data set with the average of each variable for each activity and each subject
library(data.table)
dt<- data.table(MeasurementData)
avg<- dt[, lapply(.SD, mean), by=c("subject", "activity")]
avg<- avg[order(avg$subject),]


#Write tidy data of average to an independent file
write.csv(avg, "Tidy Data/AvgData.csv", )
#Create a Text File :-
#write.table(avg, file="Tidy Data/AvgData.txt", sep="\t", row.names=FALSE)
