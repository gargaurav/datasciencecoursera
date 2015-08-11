# util method to read and return the csv file data
getfileData <- function(fname){
    fdata = read.csv(fname)
    return(fdata)
}

pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    ## NOTE: Do not round the result!
    
    fprefix <- formatC(id, width=3, flag="0")       # format the file name prefix base on id
    fname <- paste(fprefix,"csv", sep = ".")        # create .csv file name
    fnamewdir <- paste(directory,fname, sep = "/")  # create absolute file path
    
    idlen <- length(id)         # get length of id vector
    mean_vector <- c()    # initialize an emnty vector to hold the mean values
    for(fn in fnamewdir){       # loop over files
        fnameabspath <- file_path_as_absolute(fn)
        # print(fnameabspath)
        fdata = getfileData(fnameabspath)    # read data from file
        
        na_removed <- fdata[!is.na(fdata[, pollutant]), pollutant]  # get mean for the data
        mean_vector <- c(mean_vector, na_removed)                   # put mean in result mean vector
    }
    # print(mean_vector)
    fmean <- mean(mean_vector)   # calculate final mean
    print(fmean)
}