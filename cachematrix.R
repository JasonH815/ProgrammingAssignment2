## The functions below are used to create a matrix that can hold a
## reference to it's inverse.  Solving the inverse only needs to be
## done once to set the reference to the inverse. Afterwards the
## reference can be used in place of computing the inverse.


## This function will return a list containing methods for
## getting a matrix and getting and setting it's inverse

makeCacheMatrix <- function(x = matrix()) {
  ## variable holding the inverse of the matrix
  inv <- NULL
  
  ## invserse getters and setters
  inverse <- function() inv
  setInverse <- function(newInverse) inv <<- newInverse
  
  ## matrix getter
  get <- function() x
  
  ## return value
  list(get = get, inverse = inverse, setInverse = setInverse)
}


## This function returns the inverse of a CacheMatrix 
## and set's the value of the inverse if it is not already set

cacheSolve <- function(x, ...) {
  
  ## Initialize the inverse if it is NULL
  if(is.null(x$inverse())) {
    x$setInverse(solve(x$get(), ...))
  }
  
  ## Return a matrix that is the inverse of 'x'
  x$inverse()
}
