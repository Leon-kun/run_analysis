run_analysis<- function(){
      ##Loads the main test and train data
      xTest<-read.table("X_test.txt", header = TRUE)
      xTrain<-read.table("X_train.txt", header = TRUE)
      
      ##Loads the rest of the data this function needs
      y_test<-read.table("y_test.txt")
      subjects_test<-read.table("subject_test.txt")
      y_train<-read.table("y_train.txt")
      subjects_train<-read.table("subject_train.txt")
      features<-read.table("features.txt")
      activity_labels<-read.table("activity_labels.txt")
     
      ##Saves the second column of the features data
      features_col2<-features[,2]
      
      ##Filters out only the mean and standard deviation
      FMSD<-grep(pattern = "mean()|std()", x = features_col2)
      ##Subsets the test and train data to include only the mean and SD
      test<-xTest[FMSD]
      train<-xTrain[FMSD]
      
      ##Merges all test data
      test_All<-cbind(subjects_test[1:2946,], y_test[1:2946,],
                      test[1:2946,])
      
      ##Merges all train data
      train_All<-cbind(subjects_train[1:7351,], y_train[1:7351,]
                       ,train[1:7351,])
      
      ##Sets column names equal to each other
      colnames(train_All) <- colnames(test_All)
      
      ##Merges test and train
      TestAndTrain<-rbind(test_All,train_All)
      
      ##Adds the correct column names to the data frame
      colnames(TestAndTrain) <- c("Subject", "Activity Label")
      
      ##Runs through each data column in TestandTrain with tapply-
      ##-to get the mean (average)
      TestAndTrainMeans<-data.frame(matrix(ncol=ncol(TestAndTrain)
                                           ,nrow=30))
      TestAndTrainMeans[,1]<-unique(TestAndTrain[,1])
      TestAndTrainMeans[,2]<-unique(TestAndTrain[,2])
      factors<-as.factor(TestAndTrain$Subject)
      for (i in 3:ncol(TestAndTrain)){
            TestAndTrainMeans[,i]<-tapply(TestAndTrain[,i], factors,
                                          mean)
      }
      colnames(TestAndTrainMeans) <- c("Subject", "Activity Label")
      ##Creates the file tidydata.text
      write.table(TestAndTrainMeans, "tidydata.txt")
}