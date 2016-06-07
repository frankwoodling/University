add <- function(a,b)
  {
  result <- a+b
  result
  }


randomwalk<-function(sigsq,T)
{
  x<-rep(0,T)
  w<-rnorm(T,sd=sqrt(sigsq))

for ( i in 2:T)
{
  x[i]<-x[i-1]+w[i]
}
  x
}

acf(randomwalk(5,20))

arsim <- function(phis, sigsq, T){
  #find the number of lags in our AR
  p<-length(phis)
  
  #generate the white noise plus a few to get started
  noise<-rnorm(T+p, sd=sqrt(sigsq))
  
  #put the initial noise terms in and set the rest to zero
  x<-c(noise[1:p],rep(0,T))
  
  #this loop generates the AR series with the recursive formula
  for (i in (p+1):(T+p))
  {
    x[i]<-phis %*% x[i-(1:p)] +noise[i]
  }
  
  #throw away those initial starting points
  x<-x[(p+1):(T+p)] 
  
  #return the time series
  x 
}

x1<-arsim(1.01, 5,200)
acf(x1)
plot.ts(x1)

x2 <- arsim(c(0.5, 2), 50, 10)
plot.ts(x2)
acf(x2)

############################################
### 1. ###

masim <- function(phis, sigsq, T)
{

}
  
masim=function(thetas, sigsq, T)
{ 
  # find the number of lags
  q <- length(thetas)
  
  # generate the white noise plus a few to get started
  noise <- rnorm(T+q, sd=sqrt(sigsq))
  
  # put the initial noise terms in and set the rest to zero
  x <- c(noise[1:q], rep(0,T))
  
  # this loop generates the MA series with the recursive formula
  for (i in (q+1):(T+q))
  { 
    x[i] <- thetas %*% noise[i-(1:q)] +noise[i] 
  }
  
  # throw away those initial starting points
  x <- x[(q+1):(T+q)]
  
  # return the time series
  x 
}
  
############################################
### 2. ###
ma1 <- masim(c(0.5, 2), 1, 10000)
plot.ts(ma1)
acf(ma1)

ma2 <- masim(c(0.5, 2), 1, 200)
acf(ma2)

# As T decreases the blue lines in the ACF increase in size.  Both models
# decay towards 0 quickly, and are stationary.
