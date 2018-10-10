mahalanobisDistance <- function(v1, v2, rawMatrix) {
  #http://www.jennessent.com/arcview/mahalanobis_description.htm
  source("covarMatrix.R")
  #covariance matrix
  covMatrix <- covarMatrix(rawMatrix)
  #solve - matrix inverse
  invCovMatrix <-solve(covMatrix)
  vecDiff <- v1-v2
  #matrix transpose, difMatrix - new transpose matrix
  difMatrix <- matrix(vecDiff)
  #compute distance in square
  distanceSquare <- vecDiff %*% invCovMatrix %*% difMatrix
  # actual distance
  distance <- sqrt(distanceSquare)
}