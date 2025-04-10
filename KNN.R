library(caret)
library(class)
set.seed(123)
data(iris)
trainIndex <- createDataPartition(iris$Species, p = 0.8, list = FALSE)
trainData <- iris[trainIndex, ]
testData <- iris[-trainIndex, ]
normalize <- function(x) (x - min(x)) / (max(x) - min(x))
iris_norm <- as.data.frame(lapply(iris[1:4], normalize))
iris_norm$Species <- iris$Species

# Split normalized data
trainData <- iris_norm[trainIndex, ]
testData <- iris_norm[-trainIndex, ]
knn_pred <- knn(train = trainData[,1:4], test = testData[,1:4],
                cl = trainData$Species, k = 2)
knn_accuracy <- mean(knn_pred == testData$Species)
cat("KNN Accuracy:", knn_accuracy, "\n")
