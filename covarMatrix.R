covarMatrix <- function(rawMatrix) {
  #https://stats.seandolinar.com/making-a-covariance-matrix-in-r/
  n <- nrow(rawMatrix)
  #colMeans - computes mean value for each column of a given matrix
  initValues <- 1
  xMeans <- matrix(data=initValues, nrow=n) %*% colMeans(rawMatrix)
  #creates a difference matrix
  diffMatrix <- rawMatrix - xMeans
  #creates the covariance matrix
  #t - transpose matrix
  C <- (n-1)^-1 * t(diffMatrix) %*% diffMatrix
}