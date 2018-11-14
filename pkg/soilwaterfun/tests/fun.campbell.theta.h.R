require("soilwaterfun") 

fun.campbell.theta.h( 
    h       = c(0,0.01,0.1,1,10,100,158),  # [m] 
    hA      = 0.01,                        # [m]
    thetaS  = 0.5,                         # [-]
    bPar    = 1/3                          # [-] 
)   #

curve( 
    fun.campbell.theta.h( 
        h       = x, 
        hA      = 0.01, 
        thetaS  = 0.5, 
        bPar    = 1/3 
    ), 
    xlim = c(0.001,158), 
    log  = "x", 
    xlab = "h, pressure head", 
    ylab = expression( theta )
)   #
abline( v = 0.01 )
