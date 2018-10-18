plotKmeansData <- function(kmeansData) {
  getFormattedMatrixPoint <- function(v) {
    len <- length(v)
    matrix(v[1:len-1], nrow = 1, ncol = len - 1)
  }
  
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
  
  # for (cnetroidIndex in 1: samples) {
  #   point <- getFormattedMatrixPoint(kmeansData$centoids[cnetroidIndex,])
  #   colour <- switch(kmeansData$centoids[cnetroidIndex,][dimension],"red","green","blue")
  #   plot(point, col=colour, type="o", xlim=c(-10,20), ylim=c(-10,20))
  #   par(new=TRUE)
  # }
  
  # point <- getFormattedMatrixPoint(x[100,])
  # colour <- switch(x[100,][],"red","green","blue")
  # plot(point, col=colour, type="p", xlim=c(-10,20), ylim=c(-10,20))
  
}