sessionInfo()
packages <- c("dplyr", "tidyr", "lubridate", "ggplot2", "lattice", "grid", "gridExtra", "scales")
if (length(setdiff(packages, rownames(installed.packages()))) > 0) {
  install.packages(setdiff(packages, rownames(installed.packages())))  
}
sapply(packages, require, character.only=TRUE, quietly=TRUE)

# custom formatting function for times.
timeD_formatter <- function(x) {
  wd =  wday(x, label = TRUE, abbr=TRUE)
}

DEBUG <- TRUE
DATAFILE <- file.path(getwd(), "household_power_consumption.txt")

loadData <- function(){
  
# check data exists
if (!file.exists(DATAFILE)) {
  cat(paste0(DATAFILE," doesn't exist -- did you unzip the file ?"))
  stopifnot(file.exists(DATAFILE))	  
}

# read in the data
dataCVS <- read.csv(DATAFILE, header=TRUE, sep=";",stringsAsFactors = FALSE)
cols = c(3, 4, 5, 6, 7, 8, 9);    
dataCVS[,cols] = apply(dataCVS[,cols], 2, function(x) as.numeric(x));
dataALL <- tbl_df(na.omit(dataCVS)) 
rm("dataCVS")
PCdata <- 
    dataALL %>% 
              filter(Date=="1/2/2007"| Date=="2/2/2007") %>%
              mutate( mydate = dmy_hms(paste(Date, Time)), 
                      wd =  wday(mydate, label = TRUE, abbr=TRUE) )
rm("dataALL")    
return(PCdata)
}

if (!exists("PCdata")) {
 PCdata<-loadData()
 attach(PCdata)
}

if (DEBUG) {
  str(PCdata); 
  names(PCdata);
  print(object.size(PCdata),units="Mb")
  #check for na's
  all(colSums(is.na(PCdata))==0)
}


## Saving to file
## dev.copy(png, file="plot3.png", height=480, width=480)
## dev.off()
