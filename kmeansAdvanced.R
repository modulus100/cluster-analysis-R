kmeansAdvanced <- function(dataset, k, distanceMethod="minkovski") {
  # https://stackoverflow.com/questions/38173136/euclidean-distance-for-three-or-more-vectors
  # https://stackoverflow.com/questions/30195806/k-means-stopping-criteria-in-matlab
  # https://nlp.stanford.edu/IR-book/html/htmledition/k-means-1.html
  source("mahalanobisDistance.R")
  source("minkovskiDistance.R")
  source("canderraDistance.R")
  source("closestClusterNumber.R")
  source("computeNewCentroids.R")
  
  # max number of iterations
  limit <- 100
  cnt <- 0
  numSamples <- dim(dataset)[1]
  dataDimension <- dim(dataset)[2]
  classificationMatrix = matrix(0, nrow = numSamples, ncol = 1)
  
  # random centroids selection
  # https://stackoverflow.com/questions/7806702/how-do-i-select-a-sample-of-rows-at-random-with-repetition-from-a-matrix-in-r
  centroids <- dataset[sample(numSamples,size=k,replace=FALSE),]
  # last element shows a cluster number
  lastElementPos <- dataDimension - 1
  # shows previous state cluster
  tempClusterSet <- matrix(1, numSamples, 1)
  
  while(cnt < limit || all.equal(dataset[,dataDimension], tempClusterSet) == FALSE) {
    tempClusterSet <- dataset[,dataDimension]
    indexSamples <- 1

    while(indexSamples < numSamples  + 1) { #numSamples
      indexCentroids <- 1
      distanceVector <- numeric(k)
      sample <- dataset[indexSamples,][1:lastElementPos]
      
      while(indexCentroids < k + 1) {
        centroid <- centroids[indexCentroids,][1:lastElementPos]
        
        switch(distanceMethod,
          mahal = {
            distanceVector[indexCentroids] <- mahalanobisDistance(centroid, sample, dataset[,-dataDimension])
          },
          minkovski = {
            p <- 3
            distanceVector[indexCentroids] <- minkovskiDistance(centroid, sample, p)
          },
          canderra = {
            distanceVector[indexCentroids] <- canderraDistance(centroid, sample)
          },
          {
            # default
            distanceVector[indexCentroids] <- canderraDistance(centroid, sample)
          })
        
        indexCentroids <- indexCentroids + 1
      }
      
      dataset[indexSamples,][dataDimension] <- closestClusterNumber(distanceVector)
      classificationMatrix[indexSamples] <- closestClusterNumber(distanceVector)
      indexSamples <- indexSamples + 1
    }
    
    centroids <- computeNewCentroids(dataset, k)
    cnt <- cnt + 1
  }
  # return updated dataset
  list("dataset" = dataset, "centoids" = centroids, "classificators" = classificationMatrix)
}