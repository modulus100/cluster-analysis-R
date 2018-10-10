minkovskiDistance <- function(v1, v2, p) {
  #https://math.stackexchange.com/questions/128255/what-is-the-correct-definition-of-minkowski-distance
  sum <- 0
  
  for (i in 1:length(v1)) {
    tempVal <- abs(v1[i] - v2[i])^p
    sum <- sum + tempVal
  }
  
  distance <- sum^(1/p)
}