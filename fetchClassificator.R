fetchClassificator <- function(nearestVectors, k) {
  # nearestVectors - matrix of vectors
  classificatorCounter <- numeric(k)
  numSamples <- dim(nearestVectors)[1]
  classificationColumn <- dim(nearestVectors)[2] - 1
  
  # count classificators
  for (i in 1:k) {
    for (indexSamples in 1:numSamples) {
      if (nearestVectors[indexSamples,][classificationColumn] == i) {
        classificatorCounter[i] <- classificatorCounter[i] + 1
      }
    }
  }
  
  # find classificator
  classificator <- 1
  maxCount <- 0
  
  for (i in 1:length(classificatorCounter)) {
    if (classificatorCounter[i] > maxCount) {
      maxCount <- classificatorCounter[i]
      classificator <- i
    }
  }
  # return classificator
  classificator
}