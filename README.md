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

**kNNClassificationAdvanced** - returns kNN k vectors

**fetchClassificator** - returns a classificator according to kNNClassificationAdvanced vectors

### Used information

https://www.youtube.com/watch?v=4HKqjENq9OU  
https://stackoverflow.com/questions/38173136/euclidean-distance-for-three-or-more-vectors  
https://stackoverflow.com/questions/30195806/k-means-stopping-criteria-in-matlab  
https://nlp.stanford.edu/IR-book/html/htmledition/k-means-1.html  
https://kevinzakka.github.io/2016/07/13/k-nearest-neighbor/  
https://habr.com/post/199060/  
https://habr.com/post/101338/  

Contact: aleksandr.madisson@linnworks.com