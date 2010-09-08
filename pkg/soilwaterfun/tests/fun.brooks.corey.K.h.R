require("soilwaterfun") 

fun.brooks.corey.K.h( 
    h       = seq(from=0,to=-10,by=-0.1), 
    hA      = -0.01, 
    Ks      = 10, 
    m       = 6 
)   #

curve( 
    fun.brooks.corey.K.h( 
        h       = -x, 
        hA      = -0.01, 
        Ks      = 10, 
        m       = 6 
    ),  #
    xlim = c(0.001,10), 
    col  = "red", 
    log  = "xy", 
    xlab = "-h", 
    ylab = "K"
)   #
abline( v = 0.01 )
