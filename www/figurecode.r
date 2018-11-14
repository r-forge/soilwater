require( "soilwaterfun" ) 

png( 
    filename  = "C:/_SOILWATER/www/vg.theta.h.png", 
    height    = 600, 
    width     = 600, 
    pointsize = 16  
)   #

curve( 
    fun.vangenuchten.theta.h( 
        h       = -x, 
        alpha   = 3.561099, 
        n       = 1.212074, 
        thetaS  = 0.4162380, 
        thetaR  = 0  
    ),  #
    xlim = c(0.01,1000), 
    ylim = c(0,0.5), 
    col  = "red", 
    log  = "x", 
    xlab = expression( bold( "-h [m]" ) ), 
    ylab = expression( bold( theta ~ "[m"^3 * ".m"^-3 * "]" ) ), 
    lwd  = 2, 
    bty  = "n", 
    font = 2, 
    main = "van Genuchten (1980) water retention function"
)   #

dev.off() 

# abline( v = -fun.pF2h(c(2,4.2)) ) 

