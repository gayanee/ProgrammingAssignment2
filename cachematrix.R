## The two functions that are used to create a special object that stores a matrix and cache's its inverse
 ##Firstit creates a special matrix and checks to see if the inverse has already been calculated
##If so, it gets the inverse from the cache and skips the computation
## Otherwise, it calculates the inverse of the data and sets the inverse in the cache via the setinv function

##function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
        s <- NULL
        set <- function(y) {
                x <<- y
                s <<- NULL
        }
        get <- function() {x}
        setinv <- function(slove) {s <<- solve}
        getinv <- function() {s}
        list(set = set, get = get,setinv = setinv,getinv = geinv)
}


##function calculates the inverse of the special "matrix" created with the above function

cacheSolve <- function(x, ...) {
         s <- x$inv()
        if(!is.null(s)) {
                message("getting cached data")
                return(s)
        }
        data <- x$get()
        s <- solve(data, ...)
        x$setinv(s)
        s
}
