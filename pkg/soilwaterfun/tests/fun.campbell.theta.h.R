require("soilwaterfun") 

fun.campbell.theta.h( 
    h       = seq(from=0,to=-10,by=-0.1), 
    h.a     = -0.01, 
    theta.s = 0.5, 
    b.par   = 1/3 
)   #

curve( 
    fun.campbell.theta.h( 
        h       = -x, 
        h.a     = -0.01, 
        theta.s = 0.5, 
        b.par   = 1/3 
    ), 
    xlim = c(0.001,10), 
    col  = "red", 
    log  = "x", 
    xlab = "-h", 
    ylab = expression( theta )
)   #
abline( v = 0.01 )
