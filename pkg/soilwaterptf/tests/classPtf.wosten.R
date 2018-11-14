require( "soilwaterptf" ) 



### Create a (big) dummy dataset of soil properties
dtf <- expand.grid( 
    "clay"         = seq(0,50,5), 
    "silt"         = seq(0,50,5), 
    "topSoil"      = 0:1, 
    "textureClass" = as.character( NA ), 
    "isOrganic"    = 0, 
    stringsAsFactors = FALSE 
)   #

dtf <- rbind( # Add an organic layer
    dtf, 
    data.frame( 
        "clay"         = as.numeric(NA), 
        "silt"         = as.numeric(NA), 
        "topSoil"      = as.numeric(NA), 
        "textureClass" = as.character( NA ), 
        "isOrganic"    = 1, 
        stringsAsFactors = FALSE 
    )   #
)   #

dtf <- data.frame( # Add the sand column
    dtf, 
    "sand" = 100 - dtf[,"clay"] - dtf[,"silt"], 
    stringsAsFactors = FALSE 
)   #

dim( dtf ) 
head( dtf ) 
tail( dtf ) 



### Compute soil hydraulic parameters with Wosten classes PTFs:
res <- classPtf.wosten( soilprop = dtf, units = c("-","cm","day") ) 

dim(res) 
colnames( res ) 
head( res ) 
tail( res ) 

res2 <- classPtf.wosten( soilprop = dtf, units = c("%","m","sec") ) 

dim(res2) 
colnames( res2 ) 
head( res2 ) 
tail( res2 ) 

