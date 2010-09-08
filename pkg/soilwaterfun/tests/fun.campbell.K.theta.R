require("soilwaterfun") 

fun.campbell.K.theta( 
    theta   = seq(from=0,to=0.5,by=0.1), 
    thetaS  = 0.5, 
    Ks      = 10, 
    bPar    = 1/3 
)   #

curve( 
    fun.campbell.K.theta( 
        theta   = x, 
        thetaS  = 0.5, 
        Ks      = 10, 
        bPar    = 1/3 
    ),  #
    xlim = c(0.01,0.5), 
    col  = "red", 
    log  = "y", 
    xlab = expression( theta ), 
    ylab = "K"
)   #
