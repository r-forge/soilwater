
library( "soilwaterptf" )

# Create a (big) dummy dataset of soil properties
dtf <- expand.grid( 
  "clay"    = seq(5,50,1), 
  "bulkD"   = seq(1,1.8,.2), 
  "silt"    = seq(5,50,1), 
  "om"      = seq(1,3,.2), 
  "topSoil" = 0:1   #ignored
)   #

res <- ptf.rawls( soilprop = dtf, parameter = c( "theta_r", "theta" ), 
    h = 200 ) 
