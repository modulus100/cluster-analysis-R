# Cluster analysis with R

This project is intended for learning a fundamentals of machine learning and data mining
algorithms. All the code is written using a pure R programming language. 
The project contains an implementation of the following algorithms.

* Mahalanobis distance
* Minkowski distance
* Canberra distances
* k-means algorithm
* k nearest neighbor’s algorithm

The **kNN_data1.RData** file contains all the required data to run algorithms.
Please specify your path for **kNN_data1.RData** in
**Exercise1.R** before you run the project.

```
load(file="/yourPath/kNN_data1.Rdata")
```

**Distances**
```
mahalDist <- mahalanobisDistance(x[2,][1:2],x[4,][1:2], x[,-dimension])
minkovskiDist <- minkovskiDistance(x[2,],x[4,], 5)
canderraDist <- canderraDistance(x[2,],x[4,])
```

**Kmeans, x - matrix with the data, k - number of clusters, 
distance method - name of a distance method ( Minkovski is default)**
```
kmeansData <- kmeansAdvanced(x, k, distanceMethod)
plotKmeansData(kmeansData)
```

**kNN classification, x - matrix with the data, kmeansData$dataset should be used, 
x[100,] - vector or a point, 
k - number of nearest points, distance method - name of a distance method ( Minkovski is default)**
```
nearestVectors <- kNNClassificationAdvanced(x, x[100,], k, distanceMethod)
classificator <- fetchClassificator(nearestVectors, k)
```

### kMeans example using Minkovski distance, centroids are solid triangles
![alt text](https://github.com/modulus100/cluster-analysis-R/blob/master/Images/clusters.png "kMeans")

### Functions overview

**computeNewCentroids** - recalculates and returns new centroids whithin each iteration during 
 the kmeans computing
 
**covarMatrix** - computes a covariation matrix
 
**plotKmeansData** - plots the kmeans data

**kNNClassificationAdvanced** - return kNN k vectors or points

**fetchClassificator** - return a classificator according to kNNClassificationAdvanced vectors 
 