load(file="/Users/aleksandrmadisson/Repository/DataMining/kNN_data1.Rdata")
#dependecies
#library(HSAUR)
#library(cluster)
#library(mvtnorm)

source("mahalanobisDistance.R")
source("minkovskiDistance.R")
source("canderraDistance.R")
source("kmeansAdvanced.R")
source("kNNClassificationAdvanced.R")

# distances
# x - generated matrix
# mahalDist <- mahalanobisDistance(x[2,],x[4,], x)
# minkovskiDist <- minkovskiDistance(x[2,],x[4,], 5)
# canderraDist <- canderraDistance(x[2,],x[4,])

# kmeans
# default is minkovski distance
distanceMethod <- "minkovski"
k <- 3
updatedDataset <- kmeansAdvanced(x, k)

# kNN classification
# https://www.youtube.com/watch?v=4HKqjENq9OU
k <- 3

classificator <- kNNClassificationAdvanced(dataset, dataset[100,], k)

