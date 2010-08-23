require("soilwaterfun") 

fun.campbell.K.h( 
    h       = seq(from=0,to=-10,by=-0.1), 
    h.a     = -0.01, 
    Ks      = 10, 
    b.par   = 1/3 
)   #

curve( 
    fun.campbell.K.h( 
        h       = -x, 
        h.a     = -0.01, 
        Ks      = 10, 
        b.par   = 1/3 
    ),  #
    xlim = c(0.001,10), 
    col  = "red", 
    log  = "xy", 
    xlab = "-h", 
    ylab = "K"
)   #
abline( v = 0.01 ) 
