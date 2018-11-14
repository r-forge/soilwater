require( "soilwaterfun" ) 

# Example with the properties of the Footprint soil type P22i, 
# 3rd layer:
fun.mualem.vangenuchten.K.h( 
    h       = c(0,0.01,0.1,1,10,100,158),  # [m] 
    Ks      = 0.2827612,                   # [m.day-1] 
    alpha   = 3.561099,                    # [m-1] 
    n       = 1.212074                     # [-] 
)   #

curve( 
    fun.mualem.vangenuchten.K.h( 
        h       = x, 
        Ks      = 28.27612, 
        alpha   = 3.561099, 
        n       = 1.212074  
    ),  #
    xlim = c(0.001,158), 
    col  = "red", 
    log  = "xy", 
    xlab = "h, pressure head [m]", 
    ylab = "K [m.day-1]" 
)   #

