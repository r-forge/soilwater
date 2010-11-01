setwd("C:/_SOILWATER/pkg/prepare/data") 

# See http://139.191.1.96/ESDB_Archive/ESDBv2/popup/hy_param.htm
classPtfWosten <- read.csv( 
    file   = "classPtfWosten.csv", 
    header = TRUE, 
    stringsAsFactors = FALSE 
)   #

classPtfWostenUnits <- read.csv( 
    file   = "classPtfWosten.header.csv", 
    header = TRUE, 
    stringsAsFactors = FALSE 
)   #

save(
    list     = c("classPtfWosten","classPtfWostenUnits"), 
    file     = "classPtfWosten.RData", 
    ascii    = FALSE, 
    compress = TRUE  
)   #

file.copy(
    from = "classPtfWosten.RData", 
    #to   = "C:/_SOILWATER/pkg/soilwaterptf/data/classPtfWosten.RData", 
    to   = "../../soilwaterptf/data/classPtfWosten.RData", 
    overwrite = TRUE 
)   #
