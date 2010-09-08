# source( "C:\_MACRO_SE\pedometrics\soilwaterfun\trunk\soilwaterfun\R\brooks.corey.R" ) 
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

# Language & Software environment: R. 
# See ..\DESCRIPTION for more details

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #






fun.brooks.corey.theta.h <- function(# Brooks & Corey 1964 function for water retension, theta(h) 
### Brooks and Corey 1964 model for soil water retension. 
### The model is: theta.e = (h/hA)^-lambda with 
### theta.e = (theta - thetaR) / (thetaS - thetaR) when h < hA 
### and theta = thetaS when hA <= h < 0
##references<<Brooks & Corey, 1964. Hydraulic properties of porous 
## media. Colorado State University, Fort Collins, USA. Hydrology 
## paper, 3; 
## Kutilek M. & Nielsen D.R., 1994. Soil hydrology. Catena-Verlag, 
## GeoEcology textbook, Germany. ISBN : 9-923381-26-3., 370 p.

 h,
### Vector of numerical. Matrix potential of the soil, in [m]. 
### Values should be negative (suction).

 hA,
### Single numerical. Matrix potential at the air entry point [m], 
### negative.

 thetaS,
### Single numerical. Soil saturated water content [m3.m-3].

 thetaR,
### Single numerical. Soil residual water content [m3.m-3].

 lambda
### Single numerical. Brook & Corey lambda (shape) parameter [-] 
### (pore size distribution index, approx. from 2 to 5). 

){  #
    theta.e <- ( h / hA )^-lambda 
    #
    theta <- theta.e * (thetaS - thetaR) + thetaR 
    #
    theta[ h >= hA ] <- thetaS 
    #
    return( theta ) 
### Returns a vector of numericals, theta [m3.m-3] for each h 
### values provided.
}   #






fun.brooks.corey.K.h <- function(# Brooks & Corey 1964 function for hydraulic conductivity, K(h) 
### Brooks and Corey 1964 model for soil hydraulic conductivity. 
### The model is: K / Ks = (h/hA)^-m when h < hA 
### and K = Ks when hA <= h < 0
##references<<Brooks & Corey, 1964. Hydraulic properties of porous 
## media. Colorado State University, Fort Collins, USA. Hydrology 
## paper, 3; 
## Kutilek M. & Nielsen D.R., 1994. Soil hydrology. Catena-Verlag, 
## GeoEcology textbook, Germany. ISBN : 9-923381-26-3., 370 p.

 h,
### Vector of numerical. Matrix potential of the soil, in [m]. 
### Values should be negative (suction).

 hA,
### Single numerical. Matrix potential at the air entry point [m3.m-3]

 Ks,
### Single numerical. Soil saturated hydraulic conductivity. In 
### length unit per unit of time [L.T-1] (the unit in which K is 
### resturned is the same as the unit in which Ks is given). 

 m
### Single numerical. Brook & Corey m (shape) parameter [-] 
### (depend on the pore size distribution. approx. from 3 to 11). 

){  #
    K <- Ks * (( h / hA )^-m) 
    #
    K[ h >= hA ] <- Ks 
    #
    return( K ) 
### Returns a vector of numericals, K values [L.T-1] (same unit as 
### Ks) for each h values provided.
}   #
