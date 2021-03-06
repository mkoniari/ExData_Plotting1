sessionInfo()
packages <- c("dplyr", "tidyr", "lubridate", "ggplot2", "lattice", "grid", "gridExtra")
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

# check data exists
if (!file.exists(DATAFILE)) {
  cat(paste0(DATAFILE," doesn't exist -- did you unzip the file ?"))
  stopifnot(file.exists(DATAFILE))	  
}

# read in the data
dataCVS <- read.csv(DATADIR, header=TRUE, sep=";",stringsAsFactors = FALSE)
cols = c(3, 4, 5, 6, 7, 8, 9);    
dataCVS[,cols] = apply(dataCVS[,cols], 2, function(x) as.numeric(x));
na.omit
dataALL <- tbl_df(na.omit(dataCVS)) 
rm("dataCVS")
data <- 
    dataALL %>% 
              filter(Date=="1/2/2007"| Date=="2/2/2007") %>%
              mutate( mydate = dmy_hms(paste(Date, Time)), 
                      wd =  wday(mydate, label = TRUE, abbr=TRUE) )

rm("dataALL")
if (DEBUG) {
  str(data); 
  names(data);
  print(object.size(data),units="Mb")
  #check for na's
  all(colSums(is.na(data))==0)
}
attach(data)


## Saving to file
## dev.copy(png, file="plot3.png", height=480, width=480)
## dev.off()
