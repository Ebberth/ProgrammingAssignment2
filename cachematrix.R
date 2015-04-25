# Creates a 'special' cache matrix.
# Initialize it with a normal matrix(m <- makeCacheMatrix(matrix(c(-1,-2,1,1), 2, 2))) 
# It returns a list with two functions only (It's not necessary four functions to Assignment ).
# The two functions can be used as follows: 
# m$get() retrieves the matrix 
# m$getinv() retrieves the inverse matrix


makeCacheMatrix <- function(x = matrix()) {
  # The inverse is not yet calculated when creating the 'special' cache matrix, so initialize it to NULL.
  inv <<- NULL
  # Define the two functions and return the list containing them.
  get <- function() x
  getinv <- function () solve(x)
  list (get = get, getinv=getinv)
}


# Pass a 'special' cache matrix to cacheSolve to either retrieve the inversed
# matrix from its cache or, if there is no cached matrix, calculate the inverse, cache it and return it.

cacheSolve <- function(x, ...) {
  
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  # If the program reaches this point then 
  # there was no cached inverse of the matrix available 
  # so the inverse needs to be calculated and set.
  i <- x$getinv()
  inv <<- i
  i
}