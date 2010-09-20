# source( "C:\_MACRO_SE\pedometrics\soilwaterfun\trunk\soilwaterfun\R\mualem.vangenuchten.R" ) 
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

# Language & Software environment: R. 
# See ..\DESCRIPTION for more details

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #






fun.vangenuchten.se.h <- function(# van Genuchten 1980's function for soil relative saturation.
### Calculate the relative saturation Se of a soil at a given 
### tension h with the Van Genuchten water retention function.
##references<< van Genuchten M. Th., 1980. A closed form equation 
## for predicting the hydraulic conductivity of unsaturated soils. 
## Soil Science Society of America Journal, 44:892-898.
## Kutilek M. & Nielsen D.R., 1994. Soil hydrology. 
## Catena-Verlag, GeoEcology textbook, Germany. ISBN: 
## 9-923381-26-3., 370 p.

 h,
### Vector of numerical. Matrix potential of the soil, in [m]. 
### Values should be negative (suction).

 alpha,
### Single numerical. alpha (shape) parameter of the Van Genuchten 
### water retention function, in [m-1] (inverse length unit of h).

 n,
### Single numerical. n shape parameter of the Van Genuchten water 
### retention function, dimensionless [-]. See also the 'cPar' 
### parameter that, along with 'n', is used to calculate van Genuchten's 
### m parameter.

 cPar=1
### Single numerical. Value of the c parameter of the Van Genuchten 
### water retention function, that allows to calculate the m parameter 
### so m = (1 - cPar/n). Dimensionless [-]. Usually fixed / constant.

){  #
    m <- (1 - (cPar / n)) 
    #
    return( 1 / ( ( 1 + ( alpha * -h )^n )^m ) ) 
### The function returns the relative water content (degree of 
### saturation, Se, [-]).
}   #






fun.vangenuchten.theta.h <- function(# van Genuchten 1980's function theta(h) (water retension). 
### Calculate the water content theta at a given tension h with 
### the Van Genuchten water retention function.
##references<< van Genuchten M. Th., 1980. A closed form equation 
## for predicting the hydraulic conductivity of unsaturated soils. 
## Soil Science Society of America Journal, 44:892-898.
## Kutilek M. & Nielsen D.R., 1994. Soil hydrology. 
## Catena-Verlag, GeoEcology textbook, Germany. ISBN: 
## 9-923381-26-3., 370 p.

 h,
### Vector of numerical. Matrix potential of the soil, in [m]. 
### Values should be negative (suction).

 alpha,
### Single numerical. alpha (shape) parameter of the Van Genuchten 
### water retention function, in [m-1] (inverse length unit of h).

 n,
### Single numerical. n shape parameter of the Van Genuchten water 
### retention function, dimensionless [-]. See also the 'cPar' 
### parameter that, along with 'n', is used to calculate van Genuchten's 
### m parameter.

 cPar=1, 
### Single numerical. Value of the c parameter of the Van Genuchten 
### water retention function, that allows to calculate the m parameter 
### so m = (1 - cPar/n). Dimensionless [-].

 thetaS, 
### Single numerical. Saturated water content of the soil, in [-] 
### or [m3 of water.m-3 of bulk soil].

 thetaR
### Single numerical. Residual water content of the soil, in [-] 
### or [m3 of water.m-3 of bulk soil].

){  #
    Se <- fun.vangenuchten.se.h( 
        h     = h, 
        alpha = alpha, 
        n     = n,
        cPar  = cPar  
    )   #
    #
    return( Se * ( thetaS - thetaR ) + thetaR ) 
### The function returns the water content [m3.m-3] at the given 
### tension h.
}   #






fun.vangenuchten.se.theta <- function(# van Genuchten 1980's function for soil relative saturation (Se=f(theta)). 
### Calculate the relative saturation Se of a soil at a given 
### water content theta with the Van Genuchten water retention 
### function.
##references<< van Genuchten M. Th., 1980. A closed form equation 
## for predicting the hydraulic conductivity of unsaturated soils. 
## Soil Science Society of America Journal, 44:892-898.
## Kutilek M. & Nielsen D.R., 1994. Soil hydrology. 
## Catena-Verlag, GeoEcology textbook, Germany. ISBN: 
## 9-923381-26-3., 370 p.

 theta,
### Vector of numerical. Water of the soil, in [m3.m-3]. 

 thetaR,
### Vector of numerical. Residual water content of the soil for 
### the Van Genuchten water retension function, in [m3.m-3]. 

 thetaS 
### Vector of numerical. Saturated water content of the soil for 
### the Van Genuchten water retension function, in [m3.m-3]. 

){  #
    return( (theta - thetaR)/(thetaS - thetaR) ) 
### The function returns the relative water content (degree of 
### saturation, Se, [-]).
}   #






fun.vangenuchten.h.theta <- function(# van Genuchten 1980's function h(theta) (water retension). 
### Calculate the soilwater tension h at a given water content theta 
### with the Van Genuchten water retention function.
##references<< van Genuchten M. Th., 1980. A closed form equation 
## for predicting the hydraulic conductivity of unsaturated soils. 
## Soil Science Society of America Journal, 44:892-898.
## Kutilek M. & Nielsen D.R., 1994. Soil hydrology. 
## Catena-Verlag, GeoEcology textbook, Germany. ISBN: 
## 9-923381-26-3., 370 p.

 theta,
### Vector of numerical. Water of the soil, in [m3.m-3]. 

 alpha,
### Single numerical. alpha (shape) parameter of the Van Genuchten 
### water retention function, in [m-1] (inverse length unit of h).

 n,
### Single numerical. n shape parameter of the Van Genuchten water 
### retention function, dimensionless [-]. See also the 'cPar' 
### parameter that, along with 'n', is used to calculate van Genuchten's 
### m parameter.

 cPar=1, 
### Single numerical. Value of the c parameter of the Van Genuchten 
### water retention function, that allows to calculate the m parameter 
### so m = (1 - cPar/n). Dimensionless [-].

 thetaS, 
### Single numerical. Saturated water content of the soil, in [-] 
### or [m3 of water.m-3 of bulk soil].

 thetaR
### Single numerical. Residual water content of the soil, in [-] 
### or [m3 of water.m-3 of bulk soil].

){  #
    Se <- fun.vangenuchten.se.theta( 
        theta   = theta, 
        thetaS  = thetaS, 
        thetaR  = thetaR  
    )   #
    #
    m <- (1 - (cPar / n)) 
    #
    return( (1/alpha) * ( ( Se^(-1/m) - 1 )^(1/n) ) ) 
### Returns a vector of soil water tension h, negative values 
### (one value per theta value provided), in the inverse unit 
### of alpha (i.e. in [m] if alpha is in [m-1]).
}   #






fun.mualem.vangenuchten.K.h <- function(# Mualem (1976) & van Genuchten (1980)'s function K(h) (hydraulic conductivity). 
### Calculate soil hydraulic conductivity at a given tension h 
### with the Mualem - Van Genuchten function.
##references<< van Genuchten M. Th., 1980. A closed form equation 
## for predicting the hydraulic conductivity of unsaturated soils. 
## Soil Science Society of America Journal, 44:892-898. 
## Mualem Y., 1976. A new model for predicting the hydraulic 
## conductivity of unsaturated porous media. Water Resources 
## Research, 12:513-522. 
## Kutilek M. & Nielsen D.R., 1994. Soil hydrology. 
## Catena-Verlag, GeoEcology textbook, Germany. ISBN: 
## 9-923381-26-3., 370 p.

 h,
### Vector of numerical. Matrix potential of the soil, in [m]. 
### Values should be negative (suction).

 Ks, 
### Single numerical. Saturated hydraulic conductivity of the soil 
### in [L.T-1] (unit of length per unit of time). The K result is 
### outputed in the same unit as Ks. Notice that in some case a 
### distinction is made between K(h=0) and K(saturation), and 'Ks' 
### should / may be considered as K(h=0).

 alpha,
### Single numerical. alpha (shape) parameter of the Van Genuchten 
### water retention function, in [m-1] (inverse length unit of h).

 n,
### Single numerical. n shape parameter of the Van Genuchten water 
### retention function, dimensionless [-]. See also the 'cPar' 
### parameter that, along with 'n', is used to calculate van Genuchten's 
### m parameter.

 a=2,
### Single numerical. Value of the a parameter of the Mualem - Van 
### Genuchten hydraulic conductivity function. Dimensionless [-]??. 
### a = 2 in the Mualem formulation, and 1 in the Burdine formulation.

 b=0.5,
### Single numerical. Value of the b parameter of the Mualem - Van 
### Genuchten hydraulic conductivity function. Dimensionless [-]??. 
### b = 0.5 in the Mualem formulation, and 2 in the Burdine formulation.
### Notice that Schaaps et al.'s Rosetta 1.2 and Wosten et al. 1999 
### are using the symbol 'L' (or 'l') instead of 'b'. 'b' is a 
### tortuosity or connectivity parameter (Rosetta 1.2). 

 cPar=1
### Single numerical. Value of the c parameter of the Van Genuchten 
### water retention function, that allows to calculate the m parameter 
### so that m = (1 - cPar/n). Dimensionless [-]. cPar = 1 in the 
### Mualem formulation, and 2 in the Burdine formulation.

){  #
    Se <- fun.vangenuchten.se.h( 
        h     = h, 
        alpha = alpha, 
        n     = n,
        cPar = cPar  
    )   #
    #
    m  <- (1 - (cPar / n)) 
    #
    Kr <- (Se^b) * ( ( 1 - ( 1 - Se^(1/m) )^m )^a )
    #
    return( Kr * Ks ) 
### Returns K, the hydraulic conductivity (in [L.T-1], same unit 
### as Ks), for each h value provided.
}   #
