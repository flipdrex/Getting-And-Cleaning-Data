# Getting-And-Cleaning-Data

##Process Steps

1. Determined columns in data that contain mean or st. dev. data
2. Extract these columns from the test and training data sets
3. Edit the column names to remove special characters -() and convert all to lowercase (as per class standard of good column names)
4. Merge test and training data sets with their respective activity and subject numbers
5. Merge test and training data sets together using rbind
6. Transform the activity column from numerical to factors and import the activity key to use as the factors
7. Loop over subject number and activity to get mean of each variable and put in a tidy data set


