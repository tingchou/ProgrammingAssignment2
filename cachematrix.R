
##Brian Chou's comment: This makeCacheMatrix function create a special matrix object can cache its inverse. makeCacheMatrix a list containing a funciton to
##  1. set the value of the matrix
##  2. get the value of the matrix
##  3. set the value of the inverse matrix
##  4. get the vaule of the inverse matrix

## The main pupose of following pair funcitons are used to cache the inverse of the matrix


## Assign the matrix as arguement in funciton
makeCacheMatrix <- function(x = matrix()) {     

## matinv is the matrix inverse value. 
matinv<-NULL

##set funciton for using new matrix y to replace the previous matrix--X
  set<-function(y){
  x<<-y
  matinv<<-NULL
}
##get funciton to verif the the matrix user currently using 
   get<-function() { x}
     
setmatrix<-function(solve)
{matinv<<- solve}



##the matinv been caculated by the other function and pass the vaule into this subfunction
getmatrix<-function()  matinv

##making objects list, so users can access the subset 
list(set=set, get=get,
   setmatrix=setmatrix,
   getmatrix=getmatrix)
}



##  The cacheSolve function is used to calculate the inverse of matrix and check if such inverse value had been computed earlier  

cacheSolve <- function(x=matrix(), ...) {
## evaluate whether the matinv had been caculated prevously        
 matinv<-x$getmatrix()
    if(!is.null(matinv)){
      message("getting cached data")
      return(matinv)
    }
## the matrix that been input at makeCacheMatrix funciton had been paased to this subfunciton
## solve function compute the inverse value of new set matrix 
    newmatrix<-x$get()
    matinv<-solve(newmatrix, ...)
    x$setmatrix(matinv)
    matinv

}

