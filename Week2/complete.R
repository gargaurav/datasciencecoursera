# util method to read and return the csv file data
getfileData <- function(fname){
    fdata = read.csv(fname)
    return(fdata)
}

complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    
    fprefix <- formatC(id, width=3, flag="0")       # format the file name prefix base on id
    fname <- paste(fprefix,"csv", sep = ".")        # create .csv file name
    fnamewdir <- paste(directory,fname, sep = "/")  # create absolute file path
    
    idlen <- length(id)
    completecases <- c(idlen)
    j <- 1
    for(fn in fnamewdir){       # loop over files
        fnameabspath <- file_path_as_absolute(fn)
        # print(fnameabspath)
        fdata = getfileData(fnameabspath)    # read data from file
        completecases[j] <- sum(complete.cases(fdata))
        j <- j + 1
    }
    result <- data.frame(id=id, nobs = completecases)
    print(result)
    
}