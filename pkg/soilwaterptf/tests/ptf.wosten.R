require( "soilwaterptf" ) 



# Create a (big) dummy dataset of soil properties
dtf <- expand.grid( 
    "clay"    = seq(33,66,1), 
    "bulkD"   = seq(1,1.8,.2), 
    "silt"    = seq(33,66,1), 
    "om"      = seq(1,3,.2), 
    "topSoil" = 0:1   
)   #
dim( dtf ) 
head( dtf ) 
tail( dtf ) 



# Compute soil hydraulic parameters with Wosten PTFs:
#   NB: system.time() is used here to time the calculations
system.time( 
    res <- ptf.wosten( soilprop = dtf ) 
)   #

dim(res) 
head( res ) 



# Same, but with the pure R implementation
system.time( 
    res2 <- ptf.wosten( soilprop = dtf, fortran.c = FALSE ) 
)   # 

dim(res2) 
head( res2 ) 



# The result is not perfectly identical (numerical differences)
unlist( lapply( 
    X   = 1:ncol(res), 
    FUN = function(X){ 
        max( abs( res[,X] - res2[,X] ) ) 
    }   #
) ) #
