setwd("C:/_SOILWATER/pkg/prepare/data") 

# See http://139.191.1.96/ESDB_Archive/ESDBv2/fr_intro.htm
classPtfWosten <- read.csv( 
    file   = "classPtfWosten.csv", 
    header = TRUE, 
    stringsAsFactors = FALSE 
)   #

save(
    list     = c("classPtfWosten"), 
    file     = "classPtfWosten.RData", 
    ascii    = FALSE, 
    compress = TRUE  
)   #
