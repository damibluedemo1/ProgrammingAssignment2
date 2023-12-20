## Creation of a matrix object that can cache its inverse

makeCacheMatrix <- function(m = matrix()) {
  
  inv <- NULL
  
  set <- function(matrix) {
    
    m <<- matrix
  inv <<- NULL

  }


  get <- function() {

    m
    
  }

  setInverse <- function(inverse) {
  
    inv <<- inverse
    
  }

  getInverse <- function() {
  
    i
    
  }

  list(set = set, get = get,
     setInverse = setInverse,
     getInverse = getInverse)

}



## Computation of inverse of the special matrix returned by makeCacheMatrix

cacheSolve <- function(x, ...) {
  
  ## Return a matrix that is the inverse of 'x'
  m <- x$getInverse()
  
  if( !is.null(m) ) {
    message("getting cached data")
    return(m)
  }
  
  data <- x$get()
  
  m <- solve(data) %*% data
  
  x$setInverse(m)
  
  m
  
}
