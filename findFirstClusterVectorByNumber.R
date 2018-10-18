findFirstClusterVectorByNumber <- function(dataset, cNumber) {
  numSamples <- dim(dataset)[1]
  dataDimension <- dim(dataset)[2]
  
  for (indexSamples in 1:numSamples) {
    if (dataset[indexSamples,][dataDimension] == cNumber) {
      return(dataset[indexSamples,])
    }
  }
}