## A Special Matrix function with subfunctions set,get for setting & getting Matix 
## and also getInverse and setInverse functions which used Cached Inverse matrices


makeCacheMatrix <- function(x = matrix()) {
  mat <<-x
  set <- function(y) {
    if(!identical(mat,y))  ## to check if newly set matrix is similar to existing cached matrix or not. if not identical then only assign the new matrix
      mat <<- y
    inv <<- NULL
  }
  get <- function() mat   
  setInverse<-function(i) inv<<-i
  getInverse<-function() inv
  
  list(get=get, set=set, getInverse= getInverse,setInverse=setInverse)
}

## Function to calculate the Inverse if not exists otherwise return cached Inverse

cacheSolve <- function(x, ...) {   ## takes a Matrix as a parameter
  i <- x$getInverse()  ## If i is not null then we have cached inverse matrix available
  if(!is.null(i)) {   
    message("getting cached Inverse")
    return(m)  ## return the cached Inverse Matrix
  }
  data <- x$get()
  m <<- solve(data, ...)
  x$setInverse(m)
  x$getInverse()
  m     ## return the newly created Inverse matrix
}


