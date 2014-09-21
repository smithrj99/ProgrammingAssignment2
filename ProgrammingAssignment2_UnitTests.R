## Programming Assignment 2 is to implement functions that will
## maintain a cache of matrix inversions.

## This file contains unit testing code to validate those functions

## Create the matrix, and its inversion, using built-in
myMatrix <- matrix(rnorm(100), nrow = 10)
inv1 <- solve(myMatrix)

## Generate the cache
cache <- makeCacheMatrix(myMatrix)

## Get the inversion using the cache, and verify it works
inv2 <- cacheSolve(cache)
identical(inv1, inv2)

## Now, get the inversion second time. It should already be cached.
inv2 <- cacheSolve(cache) ## Should print message using cache
identical(inv1, inv2)