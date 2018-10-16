load(file="/Users/aleksandrmadisson/Repository/DataMining/kNN_data1.Rdata")
#dependecies
#library(HSAUR)
#library(cluster)

source("mahalanobisDistance.R")
source("minkovskiDistance.R")
source("canderraDistance.R")
source("kmeansAdvanced.R")

#distances
#x - generated matrix
# mahalDist <- mahalanobisDistance(x[2,],x[4,], x)
# minkovskiDist <- minkovskiDistance(x[2,],x[4,], 5)
# canderraDist <- canderraDistance(x[2,],x[4,])

#kmeans
kmeansTest <- kmeansAdvanced(x, 3)

print(kmeansTest)
