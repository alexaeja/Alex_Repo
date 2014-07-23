## Put comments here that give an overall description of what your
## functions do

## makeCacheMatrix takes a square matrix to be inverted. It is a list containing a function to set up the matrix, get the matrix and set and get the inverse of the matrix

makeCacheMatrix <- function(x = numeric()) {
        i <- NULL
        set <- function(y) {
                x <<- y
                i <<- NULL
        }
        get <- function() x
        setinverse <- function(Solve) i <<- Solve
        getinverse <- function() i
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## Function calculates inverse of the matrix, first checking if matrix has previously been inverted and only computing inverse if neccessary

cacheSolve <- function(x, ...) {
        i <- x$getinverse()
        if(!is.null(i)) {
                message("getting cached data")
                return(i)
        }
        data <- x$get()
        i <- solve(data, ...)
        x$setinverse(i)
        i
}
