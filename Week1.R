myfunction <- function(){
  x <- rnorm(100)
  mean(x)
}


second <- function(x){
  x + rnorm(length(x))
}

readURL <- function(strurl){
  con<- url(strurl, "r")
  x <- readLines(con)
  head(x)
}

readSubset <- function(x){
  print(x[1])
  print(x[4])
  print(x[3:5])
  print(x[x>"b"])
  u<- x>"d"
  print(u)
  print(x[u])
}

playlist <- function(){
  lst <- list(foo = 1:4, bar = 0.5, baz = "hello")
  e1 <- lst[c(1)]
  print(e1)
  e2 <- lst[c(3)]
  print(e2)
  name <- "foo"
  e3 <- lst[[name]]
  print(e3)
  print(lst$bar)
  print(lst$name)
  print(lst$foo)
  
  lst2 <- list(l1 = list(10, 12, 14), l2 = c(3.14, 2.81))
  print(lst2[[c(1,3)]])
  print(lst2[[c(2,2)]])
  print(lst2[[2]])
  print(lst2[[2]][[1]])
}

mymatrix <- function(){
  m <- matrix(1:6, 2,3)
  print(m)
  print(m[1,2])
  print(m[1])
  print(m[3])
  print(m[1,])
  print(m[1,,drop= T])
  print(m[2,,drop= F])
}

partialmatch <- function(){
  lst3 <- list(aardvark = 1:5)
  print(lst3$a)
  print(lst3[["a"]])
  print(lst3[["a", exact = F]])
}

missingvals <- function(){
  mis = c(1,2,4,NA,5,NA,9)
  print(mis)
  bad = is.na(mis)
  print(bad)
  print(mis[!bad])
  m1 = c(1,2,NA,4,NA,5)
  m2 = c("a","b",NA,"d",NA,"f")
  good = complete.cases(m1,m2)
  print(good)
  print(m1[good])
  print(m2[good])
}

vops = function(){
  o1 = 1:4; o2 = 6:9
  print(o1+o2)
  print(o1-o2)
  print(o1*o2)
  print(o1/o2)
  print(o2/o1)
  mt1 = matrix(1:4,2,2);mt2 = matrix(rep(10,4),2,2)
  print(mt1*mt2)
  print(mt1/mt2)
  print(mt1 %*% mt2)
}