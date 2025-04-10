library(caret)  
library(rpart)
set.seed(123)
data(iris)
trainIndex <- createDataPartition(iris$Species, p = 0.8, list = FALSE)
trainData <- iris[trainIndex, ]
testData <- iris[-trainIndex, ]
dt_model <- rpart(Species ~ ., data = trainData, method = "class")
dt_pred <- predict(dt_model, testData, type = "class")
dt_accuracy <- mean(dt_pred == testData$Species)
cat("Decision Tree Accuracy:", dt_accuracy, "\n")
