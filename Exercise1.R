load(file="/Users/aleksandrmadisson/Repository/DataMining/kNN_data1.Rdata")

source("mahalanobisDistance.R")
source("minkovskiDistance.R")

#x - generated matrix
distance <- mahalanobisDistance(x[2,],x[4,], x)

v1 <- c(0, 3, 4, 5)
v2 <- c(7, 6, 3, -1)

distance2 <- minkovskiDistance(x[2,],x[4,], 5)
