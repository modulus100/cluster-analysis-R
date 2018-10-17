load(file="/Users/aleksandrmadisson/Repository/DataMining/kNN_data1.Rdata")
#dependecies
#library(HSAUR)
#library(cluster)
#library(mvtnorm)

source("mahalanobisDistance.R")
source("minkovskiDistance.R")
source("canderraDistance.R")
source("kmeansAdvanced.R")

# distances
# x - generated matrix
# mahalDist <- mahalanobisDistance(x[2,],x[4,], x)
# minkovskiDist <- minkovskiDistance(x[2,],x[4,], 5)
# canderraDist <- canderraDistance(x[2,],x[4,])

# kmeans
# km    <- kmeans(x,3)
# dissE <- daisy(x) 
# dE2   <- dissE^2
# sk2   <- silhouette(km$cl, dE2)
# plot(sk2)

# i <- 1
# while (i < 6) {
#   print(i)
#   i = i+1
# }

# cl <- kmeans(x, 3)
# 
# ## what `kmeans` returns
# cl$centers
# # 
# colMeans(x[cl$cluster == 1, ])
# 
# colMeans(x[cl$cluster == 2, ])
# 
# colMeans(x[cl$cluster == 3, ])
# 
# plot(x, col = cl$cluster)
# points(cl$centers, col = 1:3, pch = 8, cex = 3)
# plot(x, col = cl$cluster)
# plot(cl$centers,col=1:3,pch = 8, cex = 3)

kmeansTest <- kmeansAdvanced(x, 3)

print(kmeansTest)
