require("soilwaterfun") 

fun.brooks.corey.K.h( 
    h       = c(0,0.01,0.1,1,10,100,158),  # [m] 
    hA      = 0.01,                        # [m]
    Ks      = 0.10,                        # [m.d-1]
    m       = 6                            # [-]
)   #

curve( 
    fun.brooks.corey.K.h( 
        h       = x, 
        hA      = 0.01, 
        Ks      = 0.10, 
        m       = 6 
    ),  #
    xlim = c(0.001,158), 
    col  = "red", 
    log  = "xy", 
    xlab = "h, pressure head", 
    ylab = "K"
)   #
abline( v = 0.01 )
