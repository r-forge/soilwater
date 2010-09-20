# source( "C:\_MACRO_SE\pedometrics\soilwaterfun\trunk\soilwaterfun\R\brooks.corey.R" ) 
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

# Language & Software environment: R. 
# See ..\DESCRIPTION for more details

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #






fun.campbell.theta.h <- function(# Campbell 1974 function for water retension, theta(h) 
### Function that calculates soil water content theta after 
### Campbell 1974 equation, a simplification of Brooks and Corey 
### 1964 equation used in fun.brooks.corey.theta.h(), with thetaR 
### fixed to 0.
### The model is: theta / thetaS = (h/hA)^-(1/bPar) when h < hA 
### and theta = thetaS when hA <= h < 0
### The advantage of Campbell's model is that it uses the same 
### bPar parameter for both the water retention curve and 
### the hydraulic conductivity.
##references<<Brooks & Corey, 1964. Hydraulic properties of porous 
## media. Colorado State University, Fort Collins, USA. Hydrology 
## paper, 3; 
## Kutilek M. & Nielsen D.R., 1994. Soil hydrology. Catena-Verlag, 
## GeoEcology textbook, Germany. ISBN : 9-923381-26-3., 370 p.
## Campbell, 1974. A simple-method for determining 
## unsaturated conductivity from moisture retention data. 
## Soil Science 117:6. pp. 311-314 

 h,
### Vector of numerical. Matrix potential of the soil, in [m]. 
### Values should be negative (suction).

 hA,
### Single numerical. Matrix potential at the air entry point [m3.m-3]

 thetaS,
### Single numerical. Soil saturated water content [m3.m-3].

 bPar
### Single numerical. Campbell 'b' (shape) parameter (corresponds 
### to 1/lambda, where lambda is Brooks & Corey pore size 
### distribution index). 

){  #
    theta <- fun.brooks.corey.theta.h( 
        h       = h,
        hA      = hA,
        thetaS  = thetaS,
        thetaR  = 0,
        lambda  = 1/bPar
    )   #
    #
    return( theta ) 
### Returns a vector of numericals, theta [m3.m-3] for each h 
### values provided.
}   #






fun.campbell.K.theta <- function(# Campbell 1974 function for hydraulic conductivity, K(theta) 
### Function that calculates soil hydraulic conductivity K after 
### Campbell 1974 equation, as a function of theta.
### The model is: K = Ks * ((theta/thetaS)^(2*bPar + 3)) 
### The advantage of Campbell's model is that it uses the same 
### bPar parameter for both the water retention curve and 
### the hydraulic conductivity.
##references<<Brooks & Corey, 1964. Hydraulic properties of porous 
## media. Colorado State University, Fort Collins, USA. Hydrology 
## paper, 3; 
## Kutilek M. & Nielsen D.R., 1994. Soil hydrology. Catena-Verlag, 
## GeoEcology textbook, Germany. ISBN : 9-923381-26-3., 370 p.
## Campbell, 1974. A simple-method for determining 
## unsaturated conductivity from moisture retention data. 
## Soil Science 117:6. pp. 311-314 

 theta,
### Vector of numerical. Soil water content(s) in [m3.m-3].

 thetaS,
### Single numerical. Soil saturated water content [m3.m-3].

 Ks,
### Single numerical. Soil saturated hydraulic conductivity. In 
### length unit per unit of time [L.T-1] (the unit in which K is 
### resturned is the same as the unit in which Ks is given). 

 bPar
### Single numerical. Campbell 'b' (shape) parameter, same as in 
### fun.campbell.theta.h().

){  #
    K <- Ks * ( ( theta / thetaS )^( 2 * bPar + 3 ) ) 
    #
    return( K ) 
### Returns a vector of numericals, K [L.T-1] for each theta 
### values provided.
}   #






fun.campbell.K.h <- function(# Campbell 1974 function for hydraulic conductivity, K(h) 
### Function that calculates soil hydraulic conductivity K after 
### Campbell 1974 equation, as a function of h. 
### This uses Campbell K(theta) equation presented in fun.campbell.K.theta(), 
### but theta is here replaced by h, using Campbell simplification 
### of Brooks & Corey water retention's curve.
### The model is: K = Ks * ((h/hA)^-(2+3/bPar)) 
### The advantage of Campbell's model is that it uses the same 
### bPar parameter for both the water retention curve and 
### the hydraulic conductivity. 'm' parameter in Brooks & Corey's 
### model is equal to 2+3/bPar.
##references<<Brooks & Corey, 1964. Hydraulic properties of porous 
## media. Colorado State University, Fort Collins, USA. Hydrology 
## paper, 3; 
## Kutilek M. & Nielsen D.R., 1994. Soil hydrology. Catena-Verlag, 
## GeoEcology textbook, Germany. ISBN : 9-923381-26-3., 370 p.
## Campbell, 1974. A simple-method for determining 
## unsaturated conductivity from moisture retention data. 
## Soil Science 117:6. pp. 311-314 

 h,
### Vector of numerical. Matrix potential of the soil, in [m]. 
### Values should be negative (suction).

 hA,
### Single numerical. Matrix potential at the air entry point [m3.m-3]

 Ks,
### Single numerical. Soil saturated hydraulic conductivity. In 
### length unit per unit of time [L.T-1] (the unit in which K is 
### resturned is the same as the unit in which Ks is given). 

 bPar
### Single numerical. Campbell 'b' (shape) parameter, same as in 
### fun.campbell.theta.h().

){  #
    K <- Ks * ( ( h / hA )^-( 2 + 3 / bPar ) ) 
    #
    K[ h >= hA ] <- Ks 
    #
    return( K ) 
### Returns a vector of numericals, K [L.T-1] for each h 
### values provided.
}   #
