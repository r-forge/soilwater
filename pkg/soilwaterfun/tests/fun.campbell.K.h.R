require("soilwaterfun") 

fun.campbell.K.h( 
    h       = c(0,0.01,0.1,1,10,100,158),  # [m] 
    hA      = 0.01,                        # [m]
    Ks      = 0.10,                        # [m.d-1]
    bPar    = 1/3 
)   #

curve( 
    fun.campbell.K.h( 
        h       = x, 
        hA      = 0.01, 
        Ks      = 0.10, 
        bPar    = 1/3 
    ),  #
    xlim = c(0.001,158), 
    col  = "red", 
    log  = "xy", 
    xlab = "h, pressure head", 
    ylab = "K, hydraulic conductivity"
)   #
abline( v = 0.01 ) 
