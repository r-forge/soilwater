require( "soilwaterfun" ) 

# Example with the properties of the Footprint soil type P22i, 
# 3rd layer:
tmp <- fun.vangenuchten.h.theta( 
    theta   = c(0.4162380,0.4149725,0.3983120,0.3073250,0.1946693,0.1197170,0.1086555), 
    alpha   = 3.561099,  # theta is [-], alpha in [m-1]
    n       = 1.212074,  # [-]
    thetaS  = 0.4162380, # [-]
    thetaR  = 0          # [-]
)   #

round( tmp, 2 ) 

curve( 
    fun.vangenuchten.h.theta( 
        theta   = x, 
        alpha   = 3.561099, 
        n       = 1.212074, 
        thetaS  = 0.4162380, 
        thetaR  = 0  
    ),  #
    xlim = c(0,0.5), 
    col  = "red", 
    log  = "y", 
    xlab = expression( theta ), 
    ylab = "h, pressure head" 
)   #

