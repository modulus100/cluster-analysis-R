plotKmeansData <- function(kmeansData) {
  getFormattedMatrixPoint <- function(v) {
    len <- length(v)
    matrix(v[1:len-1], nrow = 1, ncol = len - 1)
  }
  
  # all points
  samples <- dim(kmeansData$dataset)[1]
  dimension <- dim(kmeansData$dataset)[2]
  
  for (sampleIndex in 1:samples) {
    point <- getFormattedMatrixPoint(kmeansData$dataset[sampleIndex,])
    colour <- switch(kmeansData$dataset[sampleIndex,][dimension],"red","green","blue")
    plot(point, col=colour, type="p", xlim=c(-10,20), ylim=c(-10,20))
    par(new=TRUE)
  }
  
  # last centroids
  samples <- dim(kmeansData$centoids)[1]
  dimension <- dim(kmeansData$centoids)[2]
  
  for (cnetroidIndex in 1: samples) {
    point <- getFormattedMatrixPoint(kmeansData$centoids[cnetroidIndex,])
    colour <- "black"
    plot(point, col=colour, type="p", xlim=c(-10,20), ylim=c(-10,20), pch = 17, cex = 1.5)
    par(new=TRUE)
  }
}