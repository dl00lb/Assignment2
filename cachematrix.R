## Put comments here that give an overall description of what your
## functions do

## Create cache matrix from input numeric list values

makeCacheMatrix <- function(x) {
    ## Arg x can either be square matrix or randomly generated 
    ## nxn square matrix using the following code:
    ## "x <- matrix((runif(n^2, min=5, max=99), nrow=n))"

        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinv <- function(solve) m <<- solve
        getinv <- function() m
        
        return list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}



## calc inv of the vector 

cacheSolve <- function(x, ...) {

    ## if x matrix is not sq matrix, solve function will give error!!

        m <- x$getinv()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinv(m)
        m
}
