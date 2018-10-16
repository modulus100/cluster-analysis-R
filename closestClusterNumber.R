closestClusterNumber <- function(distanceVector) {
  min <- Inf
  indexMin <- 1
  
  # find min
  for (i in 1:length(distanceVector)) {
    if (distanceVector[i] < min) {
      min <- distanceVector[i]
      indexMin <- i
    }
  }
  
  indexMin
}