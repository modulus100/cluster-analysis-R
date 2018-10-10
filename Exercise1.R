load(file="/Users/aleksandrmadisson/Repository/DataMining/kNN_data1.Rdata")

source("mahalanobisDistance.R")
source("minkovskiDistance.R")

#x - generated matrix
distance <- mahalanobisDistance(x[2,],x[4,], x)

distance2 <- minkovskiDistance(x[2,],x[4,], 5)
