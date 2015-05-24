## Caching is done analogous to the example. But in example there is no inspecting for NAs and also in this function it could cause problems. Additionaly, some matrices don-t have inverse:
## TODO: Inspect if matrix has inverse by finding det(x) != 0
## TODO: And yeah, only square matrices :)

## Analogous to the example with mean we have:

makeCacheMatrix <- function(x = matrix()) {
	m <- NULL
	set <- function(y) {
		x <<- y
		m <<- NULL
	}
	get <- function() x
	setinverse <- function(inverse) m <<- inverse
	getinverse <- function() m
	list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}

## Caching the inverse: inspecting first to see if cached value exist

cacheSolve <- function(x, ...) {
	m <- x$getinverse()
	if(!is.null(m)) {
		message("getting cached data")
		return(m)
	}
	data <- x$get()
	m <- solve(data, ...)
	x$setinverse(m)
	m
}
