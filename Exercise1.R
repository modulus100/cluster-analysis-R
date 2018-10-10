load(file="/Users/aleksandrmadisson/Repository/DataMining/kNN_data1.Rdata")
#Mahalanobis function definition
source("mahalanobisDistance.R")

#x - generated matrix
distance <- mahalanobisDistance(x[2,],x[4,], x)
