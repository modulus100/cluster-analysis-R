load(file="/Users/aleksandrmadisson/Repository/DataMining/kNN_data1.Rdata")
# dependecies
#library(HSAUR)
#library(cluster)
#library(mvtnorm)

source("mahalanobisDistance.R")
source("minkovskiDistance.R")
source("canderraDistance.R")
source("kmeansAdvanced.R")
source("kNNClassificationAdvanced.R")
source("fetchClassificator.R")
source("plotKmeansData.R")
source("silhouetteRatio.R")

# ex 1
# distances
dimension <- dim(x)[2]
mahalDist <- mahalanobisDistance(x[2,][1:2],x[4,][1:2], x[,-dimension])
minkovskiDist <- minkovskiDistance(x[2,],x[4,], 5)
canderraDist <- canderraDistance(x[2,],x[4,])

# ex 2
# kmeans
# default is minkovski distance
k <- 3
distanceMethod <- "minkovski"
#distanceMethod <- "mahal"
#distanceMethod <- "canderra"

kmeansData <- kmeansAdvanced(x, k, distanceMethod)
#plotKmeansData(kmeansData)
# silhouette ratio
ratio <- silhouetteRatio(x, k, distanceMethod)
#print(ratio)

# ex 3
# kNN classification
# https://www.youtube.com/watch?v=4HKqjENq9OU
k <- 3
nearestVectors <- kNNClassificationAdvanced(x, x[100,], k, distanceMethod)
# k - classification number
classificator <- fetchClassificator(nearestVectors, k)

#ex 4
#
computeEntireSetMean <- function(featureData) {
  count = 0;
  sum = 0
  
  for (point in featureData) {
    sum = sum + point
    count = count + 1
  }
  
  sum / count
}

computeClassMean <- function(dataset, classValue, featureIndex) {
  numOfRows = dim(dataset)[1]
  classIndex = dim(dataset)[2]
  dataCount = 0
  classCount = 0
  sum = 0
  
  while (dataCount < numOfRows) {
    if (dataset[dataCount + 1, classIndex] == classValue) {
      sum = sum + dataset[dataCount + 1, featureIndex]
      classCount = classCount + 1
    }
    dataCount = dataCount + 1
  }
  
  sum / classCount
}

computeClassStandardDeviation <- function(dataset, classValue, featureIndex, classMean) {
  numOfRows = dim(dataset)[1]
  classIndex = dim(dataset)[2]
  dataCount = 0
  classCount = 0
  sum = 0
  
  while (dataCount < numOfRows) {
    if (dataset[dataCount + 1, classIndex] == classValue) {
      sum = sum + '^'((dataset[dataCount + 1, featureIndex] - classMean), 2)
      classCount = classCount + 1
    }
    
    dataCount = dataCount + 1
  }
  
  sqrt(sum / dataCount)
}

computeFractionOfPoints <- function(dataset, classValue) {
  numOfRows = dim(dataset)[1]
  classIndex = dim(dataset)[2]
  dataCount = 0
  classCount = 0
  
  while (dataCount < numOfRows) {
    if (dataset[dataCount + 1, classIndex] == classValue) {
      classCount = classCount + 1
    }
    
    dataCount = dataCount + 1
  }
  
  dataCount / classCount
}

fihserScore <- function(dataset, featureIndex) {
  possibleClassValues <- c(1, 2, 3)
  classValue <- 1
  firstSum <- 0
  secondSum <- 0
  
  entireSetMean <- computeEntireSetMean(dataset[,featureIndex])
  
  for (currentClassValue in possibleClassValues) {
    classMean = computeClassMean(dataset, classValue, featureIndex)
    classDeviation = computeClassStandardDeviation(dataset, classValue, featureIndex, classMean)
    classFraction = computeFractionOfPoints(dataset, classValue)
    
    firstSum = firstSum + (classFraction * ('^'((classMean - entireSetMean), 2)))
    secondSum = secondSum + (classFraction * ('^'(classDeviation, 2)))
  }
  
  firstSum / secondSum
}

# for this exampel we've given two featues only
firstFeatureFisherScore = fihserScore(x, 1)
secondFeatureFisherScore = fihserScore(x, 2)

print("Fisher score for first feature")
print(firstFeatureFisherScore)
cat("\n")
print("Fisher score for second feature")
print(secondFeatureFisherScore)
cat("\n")

#Todo use better quality better quality function
possibleKvalues <- c(2:3)

for (k in possibleKvalues) {
  distanceMethod <- "minkovski"
  #distanceMethod <- "mahal"
  #distanceMethod <- "canderra"
  
  kmeansData <- kmeansAdvanced(x, k, distanceMethod)
  #plotKmeansData(kmeansData)
  # silhouette ratio
  ratio <- silhouetteRatio(x, k, distanceMethod)
  
  print("silhouette ratio")
  print(ratio)
  cat("\n")
}
