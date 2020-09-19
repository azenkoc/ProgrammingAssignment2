## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix<-function(x=matrix()){
     #creating null special matrix object with null inverse As A default
     inverse<-NULL
     set<-function(y){
          #assigning new matrix and cleaning previous cache inverse
          x<<-y
          inverse<<-NULL
     }
     #functions to get,set inverse and original input matrix
     get<-function() x
     setInverse<- function(inverse) i<<-inverse #caching new inverse value, which will be provided by cacheSolve
     getInverse<-function() i
     #returning special matrix in list object
     list(set = set, get = get,
          setInverse = setInverse,
          getInverse = getInverse)
}

## Write a short comment describing this function

cacheSolve<-function(matrix, ...){ #constructing function and ... given for further arguments for solve()
     inverse<-matrix$getInverse()#getting cached inverse
     if(!is.null(inverse)){#if inverse previously calculated send message to user and return cached
          message("getting cached data")
          return(inverse)
     }
     data<-matrix$get()#get matrix data in list
     inverse<-solve(matrix, ...)#calculating inverse matrix assuming it is invertable
     matrix$setInverse(inverse)#caching calculated inverse to our "special" matrix which is a list
     inverse#returning inverse
} 