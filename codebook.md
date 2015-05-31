Variables cookbook
==================


The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals **tAcc-XYZ** and **tGyro-XYZ**. 
Each signal recorded in time domain (prefix 't') captured at a constant rate of 50 Hz or frequency domain (prefix 'f')
Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
The acceleration signal was then separated into body and gravity acceleration signals (**tBodyAcc-XYZ** and **tGravityAcc-XYZ**) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

### basic data

- **labels**. Labels represent one of five types of activities
- **subject**. Subject is the index for each person acting

## Sensor data I

Each of those parameter is represented in three coordinates (XYZ) and two calculations - mean (mean) and standart deviation (std)

- **tBodyAcc**
- **tGravityAcc**
- **tBodyAccJerk**
- **tBodyGyro**
- **tBodyGyroJerk**
- **fBodyAcc**
- **fBodyAccJerk**
- **fBodyGyro**

## Sensor data II

- **tBodyAccMag**
- **tGravityAccMag**
- **tBodyAccJerkMag**
- **tBodyGyroMag**
- **tBodyGyroJerkMag**
- **fBodyAccMag**
- **fBodyBodyAccJerkMag**
- **fBodyBodyGyroMag**
- **fBodyBodyGyroJerkMag**

Each of those parameter is represented in two calculations - mean (mean) and standart deviation (std)

The complete list of variables of each feature vector is available in 'features.txt'