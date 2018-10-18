silhouetteRatio <- function(dataset, k, distanceMethod) {
  # https://www.coursera.org/lecture/cluster-analysis/6-2-clustering-evaluation-measuring-clustering-quality-RJJfM
  source("mahalanobisDistance.R")
  source("minkovskiDistance.R")
  source("canderraDistance.R")
  source("findFirstClusterVectorByNumber.R")
  source("findMinAverageDistance.R")
  
  dataDimension <- dim(dataset)[2]
  numSamples <- dim(dataset)[1]
  # stores kNN points (vectors)
  minDistanceMatrix <- matrix(0, numSamples, dataDimension + 1)
  # last element shows a cluster number
  lastElementPos <- dataDimension - 1
  # default value
  minDistance <- Inf
  # cluster number
  cNumber <- 1
  # any point can be taken
  pVector <- findFirstClusterVectorByNumber(dataset, cNumber)
  # mean zeros vector
  meanVector <- numeric(dataDimension - 1)
  # sum zeros vector
  sumVector <- numeric(2 * k)
  
  for (indexCluster in 1:k) {
    dataCounter <- 0
    
    for (indexSamples in 1:dim(dataset)[1]) { # dim(dataset)[1]
      if(dataset[indexSamples,][dataDimension] != indexCluster) { next }
      
      sample <- dataset[indexSamples,]
      
      switch(distanceMethod,
         mahal = {
           distance <- mahalanobisDistance(pVector[1:lastElementPos], sample, dataset[,-dataDimension])
         },
         minkovski = {
           p <- 3
           distance <- minkovskiDistance(pVector[1:lastElementPos], sample[1:lastElementPos], p)
         },
         canderra = {
           distance <- canderraDistance(pVector[1:lastElementPos], sample[1:lastElementPos])
         },
         {
           # default
           distance <- canderraDistance(pVector[1:lastElementPos], sample[1:lastElementPos])
         })
      
      sumVector[indexCluster] <- sumVector[indexCluster] + distance
      dataCounter <- dataCounter + 1
    }
    
    sumVector[indexCluster + k] <- dataCounter
  }
  
  for (indexVector in 1:dataDimension - 1) {
    dataCounter <- sumVector[indexVector + k + 1]
    meanVector[indexVector + 1] <- sumVector[indexVector + 1] / dataCounter
  }
  
  # first goes for the first cluster
  minAverageDistance <- findMinAverageDistance(meanVector[2: k])
  silhouette <- 1 - (meanVector[1] / minAverageDistance)
  silhouette
}