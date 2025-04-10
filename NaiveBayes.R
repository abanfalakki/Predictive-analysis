library(caret) 
library(e1071)
set.seed(123)
data(iris)
trainIndex <- createDataPartition(iris$Species, p = 0.8, list = FALSE)
trainData <- iris[trainIndex, ]
testData <- iris[-trainIndex, ]
nb_model <- naiveBayes(Species ~ ., data = trainData)
nb_pred <- predict(nb_model, testData)
nb_accuracy <- mean(nb_pred == testData$Species)
cat("Naive Bayes Accuracy:", nb_accuracy, "\n")
