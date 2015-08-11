# util method to read and return the csv file data
getfileData <- function(fname){
    fdata = read.csv(fname)
    return(fdata)
}

corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    ## NOTE: Do not round the result!
    
    # get the complete table
    complete_table <- complete("specdata", 1:332)
    nobs <- complete_table$nobs
    # find the valid ids
    ids <- complete_table$id[nobs > threshold]
    
    fprefix <- formatC(ids, width=3, flag="0")      # format the file name prefix base on id
    fname <- paste(fprefix,"csv", sep = ".")        # create .csv file name
    fnamewdir <- paste(directory,fname, sep = "/")  # create absolute file path
    
    idlen <- length(ids)
    corrvector <- c(idlen)
    j <- 1
    
    if(idlen > 0){
    for(fn in fnamewdir){       # loop over files
        fnameabspath <- file_path_as_absolute(fn) #library(tools)
        # print(fnameabspath)
        fdata = getfileData(fnameabspath)    # read data from file
        corrvector[j] <- cor(fdata$sulfate, fdata$nitrate, use="complete.obs")
        j <- j + 1
    }
    result <- corrvector
    print(result)
    }
}