outcomeCol <- function(outcome) {
    
}

rankall <- function(outcome, num="best") {
    ## Read outcome data
    ## Check that state and outcome are valid
    ## For each state, find the hospital of the given rank
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
    
    if (outcome == "heart attack") {
        outcome <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
    } else if (outcome == "heart failure") {
        outcome <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
    } else if (outcome == "pneumonia") {
        outcome <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
    }
    else {
        stop("invalid outcome")
    }
    
    data <- read.csv("C:/Users/coco/Documents/R_work/pa3data/outcome-of-care-measures.csv", colClasses = "character")
    data[,outcome] <- suppressWarnings(as.numeric(data[,outcome]))
    data <- data[order(data$"State", data[outcome], data$"Hospital.Name", na.last=NA),]
    data <- data[!is.na(outcome)]
    
    l <- split(data[,c("Hospital.Name")], data$State)
    
    rankHospitals <- function(x, num) {
        if (num=="best") {
            head(x, 1)
        } else if (num=="worst") {
            tail(x, 1)
        } else {
            x[num]
        }
    }
    
    result <- lapply(l, rankHospitals, num)
    data.frame(hospital = unlist(result), state = names(result), row.names = names(result))
}