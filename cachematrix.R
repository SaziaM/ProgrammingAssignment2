## The functions will provide a way to cache the already solved inverse of an
## unchanged matrix which will reduce the computation time

## This function creates a matrix object containing a function to 
## set the value of the matrix, get the value of the matrix, 
## set the inverse of the matrix and get the inverse of the matrix 

makeCacheMatrix <- function(x = matrix()) {
m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) m <<- inverse
        getinverse <- function() m
        a<-list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
		data.matrix(a)


}


## This function computes the inverse of the special "matrix" returned 
## by makeCacheMatrix above. If the inverse has already been calculated 
## (and the matrix has not changed), then the cachesolve should retrieve 
## the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
y<-x[,1]

m <- y$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
	
        data <- y$get()
        m <- solve(data)
	
        y$setinverse(m)
        m

}
