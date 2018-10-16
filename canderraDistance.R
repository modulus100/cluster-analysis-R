canderraDistance <- function(v1, v2) {
  #https://en.wikipedia.org/wiki/Canberra_distance
  sum <- 0
  
  for (i in 1:length(v1)) {
    tempVal <- (abs(v1[i] - v2[i])) / (abs(v1[i]) + abs(v2[i]))
    sum <- sum + tempVal
  }
  #return sum
  sum
}