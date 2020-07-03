## Put comments here that give an overall description of what your
## functions do

## creates functions and objects inside of your bigger object so inverse matrix
## can be stored in cache
makeMatrix <- function(x = matrix()) {
        sol <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setsolve <- function(solve) sol <<- solve
        getsolve <- function() sol
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
}

## if inverse is already cached function gets it
## if it is NULL - function writes it
cacheSolve <- function(x,...) {
        sol <- x$getsolve()
        if(!is.null(sol)) {
                message('getting cached data')
                return(sol)
        }
        data <- x$get()
        sol <- solve(data, ...)
        x$setsolve(sol)
        sol
}