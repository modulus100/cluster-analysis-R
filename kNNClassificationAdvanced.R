kNNClassificationAdvanced <- function(dataset, pVector, k, distanceMethod) {
  source("mahalanobisDistance.R")
  source("minkovskiDistance.R")
  source("canderraDistance.R")
  
  dataDimension <- dim(dataset)[2]
  numSamples <- dim(dataset)[1]
  # stores kNN points (vectors)
  minDistanceMatrix <- matrix(0, numSamples, dataDimension + 1)
  # last element shows a cluster number
  lastElementPos <- dataDimension - 1
  # default value
  minDistance <- Inf
  
  for (indexSamples in 1:dim(dataset)[1]) {
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

    # if dataset sample and pVector are the same, then a sample should be ignored
    minDistanceMatrix[indexSamples,][1:dataDimension] <- sample
    
    if (distance == 0) { 
      minDistanceMatrix[indexSamples,][dataDimension + 1] <- Inf
    } else {
      minDistanceMatrix[indexSamples,][dataDimension + 1] <- distance
    }
  }
  # sort by distance
  sortedMatrix <- minDistanceMatrix[order(minDistanceMatrix[,dataDimension + 1]),]
  # return k closest distances according to pVector
  head(sortedMatrix, k)
}