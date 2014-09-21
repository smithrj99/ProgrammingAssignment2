##########################################################################
## Programming Assignment 2 is to implement functions that will
## maintain a cache, and leverage the cache when called again
## with the same input.
##
## In the example, it keeps track of a vector and its mean. 
## In this implementation, it keeps track of a matrix and its inversion.
##
## makeCacheMatrix:
## This function will create the cache for matrix inversion, including
## methods to get/set the matrix and its inversion.
##
## cacheSolve:
## This function will compute the inversion, either from the cache if
## the inversion has already be determined for a given matrix, or using
## the solve function, and then storing the inverted matrix to the cache
## for subsequent retrieval
##########################################################################


## This function will create the cache for matrix inversion, including
## methods to get/set the matrix and its inversion.

makeCacheMatrix <- function(x = matrix()) {
  
  cachedInversion <- NULL

## Function to set the matrix.  
  set <- function(inputMatrix) {
    x <<- inputMatrix
    cachedInversion <<- NULL
  }

## Function to get the matrix.  
  get <- function() x

## Function to set the matrix's inversion
  setInversion <- function(inversion) cachedInversion <<- inversion

## Function to get the matrix's inversion
  getInversion <- function() cachedInversion


## Return list of the above functions
  list(set = set, get = get,
       setInversion = setInversion,
       getInversion = getInversion)
}

## This function will return the inversion of the cache passed in.
## It will either return the stored inversion of the matrix,
## or calculate the inversion, store it in cache for later use,
## and then return the inversion.

cacheSolve <- function(x, ...) {

## Get the inversion, and return it exists  
  cachedInversion <- x$getInversion()
  if (!is.null(cachedInversion)) {
    message("getting cached inversion")
    return(cachedInversion)
  }

## Only get here if the inversion didn't exist. Get the matrix, get the
## inversion, store it, then return it
  myMatrix <- x$get()
  inversion <- solve(myMatrix, ...)
  x$setInversion(inversion)
  inversion
}
