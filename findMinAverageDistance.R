findMinAverageDistance <- function(v) {
  min <- Inf
  
  for (i in 1:length(v)) {
    if (v[i] < min) {
      min <- v[i]
    }
  }
  
  min
}