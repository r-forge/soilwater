require( "soilwaterptf" ) 

# Example with the properties of the Footprint soil type P22i:
ptf.wosten.theta.s( 
    # layer no:     1    2    3    4    5    6    7    7    8 
    CLAY    = c(   15,  15,  16,  16,  20,  20,  25,  25,  14), 
    BULKD   = c(1.296,1.44,1.48,1.48,1.51,1.51,1.55,1.55,1.56), 
    SILT    = c(   43,  43,  40,  40,  39,  39,  38,  38,  33), 
    OM      = c(    2,1.23, 0.7, 0.7, 0.5, 0.5, 0.4, 0.4, 0.3) * 1.724, 
    topsoil = c(    1,   1,   0,   0,   0,   0,   0,   0,   0)  
)   #
