computeNewCentroids <- function(dataset, k) {
  cnt <- 1
  numSamples <- dim(dataset)[1]
  dataDimension <- dim(dataset)[2]
  newCentroids <- matrix(0, k, dataDimension)
  
  while(cnt < k + 1) {
    sumVector <- numeric(dataDimension - 1)
    indexSamples <- 1
    dataCount <- 0
    
    while (indexSamples < numSamples + 1) {
      if (dataset[indexSamples,][dataDimension] == cnt) {
        dataCount <- dataCount + 1
        indexDimension <- 1
        
        while(indexDimension < dataDimension) {
          sumVector[indexDimension] = sumVector[indexDimension] + dataset[indexSamples,][indexDimension]
          indexDimension <- indexDimension + 1
        }
      }
      
      indexSamples <- indexSamples + 1
    }
    
    indexDimension <- 1
    
    while(indexDimension < dataDimension) {
      # means, last columns is ignored
      newCentroids[cnt,][indexDimension] <- sumVector[indexDimension] / dataCount
      indexDimension <- indexDimension + 1
    }
    
    cnt <- cnt + 1
  }
  
  return(dataset)
}