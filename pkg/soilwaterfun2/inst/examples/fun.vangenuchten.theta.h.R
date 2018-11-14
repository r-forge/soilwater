require( "soilwaterfun" ) 

# Example with the properties of the Footprint soil type P22i, 
# 3rd layer:
fun.vangenuchten.theta.h( 
    h       = c(0,0.01,0.1,1,10,100,158), # [m]
    alpha   = 3.561099,                   # [m-1]
    n       = 1.212074,                   # [-]
    thetaS  = 0.4162380,                  # [-]
    thetaR  = 0                           # [-]
)   #

curve( 
    fun.vangenuchten.theta.h( 
        h       = x, 
        alpha   = 3.561099, 
        n       = 1.212074, 
        thetaS  = 0.4162380, 
        thetaR  = 0  
    ),  #
    xlim = c(0.001,158), 
    col  = "red", 
    log  = "x", 
    xlab = "h, pressure head [m]", 
    ylab = expression( theta ) 
)   #

