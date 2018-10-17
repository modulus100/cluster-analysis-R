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

# distances
# x - generated matrix
# mahalDist <- mahalanobisDistance(x[2,],x[4,], x)
# minkovskiDist <- minkovskiDistance(x[2,],x[4,], 5)
# canderraDist <- canderraDistance(x[2,],x[4,])

# kmeans
# default is minkovski distance
distanceMethod <- "minkovski"
k <- 3
# updatedDataset <- kmeansAdvanced(x, k, distanceMethod)

# kNN classification
# https://www.youtube.com/watch?v=4HKqjENq9OU
k <- 3

nearestVectors <- kNNClassificationAdvanced(x, x[100,], k, distanceMethod)
classificator <- fetchClassificator(nearestVectors, k)
print(classificator)
