require( "soilwaterfun" ) 

fun.brooks.corey.theta.h( 
    h       = seq( from = 0, to = -10, by = -0.1 ), 
    hA      = -0.01, 
    thetaS  = 0.5, 
    thetaR  = 0.1, 
    lambda  = 3 
)   #

curve( 
    fun.brooks.corey.theta.h( 
        h       = -x, 
        hA      = -0.01, 
        thetaS  = 0.5, 
        thetaR  = 0.1, 
        lambda  = 3 
    ), 
    xlim = c(0.001,10), 
    col  = "red", 
    log  = "x", 
    xlab = "-h", 
    ylab = expression( theta )
)   #
abline( v = 0.01 )
