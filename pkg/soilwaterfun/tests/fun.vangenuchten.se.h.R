require( "soilwaterfun" ) 

# Example with the properties of the Footprint soil type P22i, 
# 3rd layer:
fun.vangenuchten.se.h( 
    h       = -c(0,0.01,0.1,1,10,100,158), 
    alpha   = 3.561099, 
    n       = 1.212074  
)   #
