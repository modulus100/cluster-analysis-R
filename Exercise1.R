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
plotKmeansData(kmeansData)

# ex 3
# kNN classification
# https://www.youtube.com/watch?v=4HKqjENq9OU
k <- 3
nearestVectors <- kNNClassificationAdvanced(x, x[100,], k, distanceMethod)
# k - classification number
classificator <- fetchClassificator(nearestVectors, k)

