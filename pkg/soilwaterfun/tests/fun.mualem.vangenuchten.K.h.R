require( "soilwaterfun" ) 

# Example with the properties of the Footprint soil type P22i, 
# 3rd layer:
fun.mualem.vangenuchten.K.h( 
    h       = -c(0,0.01,0.1,1,10,100,158), 
    Ks      = 28.27612, 
    alpha   = 3.561099, 
    n       = 1.212074  
)   #

curve( 
    fun.mualem.vangenuchten.K.h( 
        h       = -x, 
        Ks      = 28.27612, 
        alpha   = 3.561099, 
        n       = 1.212074  
    ),  #
    xlim = c(0.001,158), 
    col  = "red", 
    log  = "xy", 
    xlab = "-h", 
    ylab = "K"
)   #

