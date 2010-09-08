require("soilwaterfun") 

fun.campbell.K.h( 
    h       = seq(from=0,to=-10,by=-0.1), 
    hA      = -0.01, 
    Ks      = 10, 
    bPar    = 1/3 
)   #

curve( 
    fun.campbell.K.h( 
        h       = -x, 
        hA      = -0.01, 
        Ks      = 10, 
        bPar    = 1/3 
    ),  #
    xlim = c(0.001,10), 
    col  = "red", 
    log  = "xy", 
    xlab = "-h", 
    ylab = "K"
)   #
abline( v = 0.01 ) 
