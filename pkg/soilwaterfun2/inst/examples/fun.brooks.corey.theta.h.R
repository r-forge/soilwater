require( "soilwaterfun" ) 

fun.brooks.corey.theta.h( 
    h       = c(0,0.01,0.1,1,10,100,158),  # [m] 
    hA      = 0.01,                        # [m]
    thetaS  = 0.5,                         # [-]
    thetaR  = 0.1,                         # [-]
    lambda  = 3                            # [-]
)   #

curve( 
    fun.brooks.corey.theta.h( 
        h       = x, 
        hA      = 0.01, 
        thetaS  = 0.5, 
        thetaR  = 0.1, 
        lambda  = 3 
    ), 
    xlim = c(0.001,158), 
    col  = "red", 
    log  = "x", 
    xlab = "h, pressure head", 
    ylab = expression( theta )
)   #
abline( v = 0.01 )
