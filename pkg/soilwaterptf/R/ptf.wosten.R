# source( "C:/_MACRO_SE/pedometrics/soilwaterptf/trunk/soilwaterptf/R/soilwaterptf.R" ) 
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

# Language & Software environment: R. 
# See ..\DESCRIPTION for more details

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #






ptf.wosten.theta.s <- function(# Wosten et al. 1999 PTF for soil's saturated water content.
### Continuous pedotransfer functions to predict the saturated 
### water content (THETA_S) of a soil after its clay and silt 
### content, bulk density, organic matter content and topsoil or 
### subsoil qualifier. 
##references<< Wosten J.H.M., Lilly A., Nemes A., 
## Le Bas C., 1999. Development and use of a database of hydraulic 
## properties of European soils. Geoderma 90:169-185.

 clay,
### Vector of numericals. Clay content [%] of each soil layer / 
### horizon. 0-2 micrometers. 

 bulkD,
### Vector of numericals. Bulk density [kg.dm-3] of each soil 
### layer / horizon (unit not given in the article!). 

 silt,
### Vector of numericals. Silt content [%] of each soil layer / 
### horizon. 2-50 micrometers. 

 om,
### Vector of numericals. Organic matter content [%] of each soil layer / 
### horizon. 

 topSoil 
### Vector of 0 or 1 integers. Set to 1 if the layer is a topsoil, 
### and to 0 if it is a subsoil, for each layer / horizon.

){  #
    theta.s <- 0.7919 + 0.001691 * clay - 0.29619 * bulkD - 
               0.000001491 * (silt^2) + 0.0000821 * (om^2) + 
               0.02427 * (clay^-1) + 0.01113 * (silt^-1) + 
               0.01472 * logb(silt, base = exp(1)) - 
               0.0000733 * om * clay - 0.000619 * bulkD * clay - 
               0.001183 * bulkD * om - 0.0001664 * topSoil * silt 
    #
    return( theta.s ) 
### The function returns a vector of theta_s values of the same 
### length as the vector of value provided to each parameter. 
### Unit of theta_s is [-] or [m3 of water.m-3 of bulk soil].
}   #






ptf.wosten.alpha <- function(# Wosten et al. 1999 PTF for van Genuchten 1980 alpha parameter.
### Continuous pedotransfer functions to predict the alpha parameter 
### of the Van Genuchten water retention function 
### of a soil after its clay and silt content, bulk density, 
### organic matter content and topsoil or subsoil qualifier. 
##references<< Wosten J.H.M., Lilly A., Nemes A., 
## Le Bas C., 1999. Development and use of a database of hydraulic 
## properties of European soils. Geoderma 90:169-185.

 clay,
### Vector of numericals. Clay content [%] of each soil layer / 
### horizon. 0-2 micrometers.

 bulkD,
### Vector of numericals. Bulk density [kg.dm-3] of each soil 
### layer / horizon (unit not given in the article!). 

 silt,
### Vector of numericals. Silt content [%] of each soil layer / 
### horizon. 2-50 micrometers. 

 om,
### Vector of numericals. Organic matter content [%] of each soil layer / 
### horizon. 

 topSoil 
### Vector of 0 or 1 integers. Set to 1 if the layer is a topsoil, 
### and to 0 if it is a subsoil, for each layer / horizon.

){  #
    alpha.star <- 
        -14.96 + 0.03135 * clay + 0.0351 * silt + 0.646 * om + 
        15.29 * bulkD - 0.192 * topSoil - 4.671 * (bulkD^2) - 
        0.000781 * (clay^2) - 0.00687 * (om^2) + 0.0449 * (om^-1) + 
        0.0663 * log( silt, base = exp(1) ) + 0.1482 * log( om, base = exp(1) ) - 
        0.04546 * bulkD * silt - 0.4852 * bulkD * om + 
        0.00673 * topSoil * clay 
    #
    alpha <- exp( alpha.star ) 
    #
    return( alpha * 100 ) 
### The function returns a vector of alpha values of the same 
### length as the vector of value provided to each parameter. 
### Unit of alpha is [Length-1] (here [m-1])
}   #






ptf.wosten.n <- function(# Wosten et al. 1999 PTF for van Genuchten 1980 n parameter.
### Continuous pedotransfer functions to predict the n parameter 
### of the Van Genuchten water retention function 
### of a soil after its clay and silt content, bulk density, 
### organic matter content and topsoil or subsoil qualifier. 
##references<< Wosten J.H.M., Lilly A., Nemes A., 
## Le Bas C., 1999. Development and use of a database of hydraulic 
## properties of European soils. Geoderma 90:169-185.

 clay,
### Vector of numericals. Clay content [%] of each soil layer / 
### horizon. 0-2 micrometers.

 bulkD,
### Vector of numericals. Bulk density [kg.dm-3] of each soil 
### layer / horizon (unit not given in the article!). 

 silt,
### Vector of numericals. Silt content [%] of each soil layer / 
### horizon. 2-50 micrometers. 

 om,
### Vector of numericals. Organic matter content [%] of each soil layer / 
### horizon. 

 topSoil 
### Vector of 0 or 1 integers. Set to 1 if the layer is a topsoil, 
### and to 0 if it is a subsoil, for each layer / horizon.

){  #
    n.star <- 
        -25.23 - 0.02195 * clay + 0.0074 * silt - 0.1940 * om + 45.5 * bulkD - 
        7.24 * (bulkD^2) + 0.0003658 * (clay^2) + 0.002885 * (om^2) - 12.81 * (bulkD^-1) - 
        0.1524 * (silt^-1) - 0.01958 * (om^-1) - 0.2876 * log( silt, base = exp(1) ) - 
        0.0709 * log( om, base = exp(1) ) - 44.6 * log( bulkD, base = exp(1) ) - 
        0.02264 * bulkD * clay + 0.0896 * bulkD * om + 0.00718 * topSoil * clay  
    #
    n <- exp( n.star ) + 1 
    #
    return( n ) 
### The function returns a vector of n values of the same 
### length as the vector of value provided to each parameter. 
### Unit of n is [-] dimensionless. 
}   #






ptf.wosten.l <- function(# Wosten et al. 1999 PTF for van Genuchten 1980 l parameter.
### Continuous pedotransfer functions to predict the l parameter 
### of the Van Genuchten water retention function 
### of a soil after its clay and silt content, bulk density and 
### organic matter content.
##references<< Wosten J.H.M., Lilly A., Nemes A., 
## Le Bas C., 1999. Development and use of a database of hydraulic 
## properties of European soils. Geoderma 90:169-185.

 clay,
### Vector of numericals. Clay content [%] of each soil layer / 
### horizon. 0-2 micrometers.

 bulkD,
### Vector of numericals. Bulk density [kg.dm-3] of each soil 
### layer / horizon (unit not given in the article!). 

 silt,
### Vector of numericals. Silt content [%] of each soil layer / 
### horizon. 2-50 micrometers. 

 om
### Vector of numericals. Organic matter content [%] of each soil layer / 
### horizon. 

){  #
    l.star <- 
        0.0202 + 0.0006193 * (clay^2) - 0.001136 * (om^2) - 
        0.2316 * log( om, base = exp(1) ) - 0.03544 * bulkD * clay + 
        0.00283 * bulkD * silt + 0.0488 * bulkD * om 
    #
    l <- ( 10*( exp(l.star) - 1 ) )/( 1 + exp(l.star) ) 
    #
    return( l ) 
### The function returns a vector of l values of the same 
### length as the vector of value provided to each parameter. 
### Unit of l is ... 
}   #






ptf.wosten.ksat <- function(# Wosten et al. 1999 PTF for soil's saturated hydraulic conductivity.
### Continuous pedotransfer functions to predict the saturated 
### hydraulic conductivity, K sat, of the Mualem (1976) & van 
### Genuchten (1980) water retention function of a soil after its 
### clay and silt content, bulk density, organic matter content 
### and topsoil or subsoil qualifier. 
##references<< Wosten J.H.M., Lilly A., Nemes A., 
## Le Bas C., 1999. Development and use of a database of hydraulic 
## properties of European soils. Geoderma 90:169-185.

 clay,
### Vector of numericals. Clay content [%] of each soil layer / 
### horizon. 0-2 micrometers.

 bulkD,
### Vector of numericals. Bulk density [kg.dm-3] of each soil 
### layer / horizon (unit not given in the article!). 

 silt,
### Vector of numericals. Silt content [%] of each soil layer / 
### horizon. 2-50 micrometers. 

 om,
### Vector of numericals. Organic matter content [%] of each soil layer / 
### horizon. 

 topSoil 
### Vector of 0 or 1 integers. Set to 1 if the layer is a topsoil, 
### and to 0 if it is a subsoil, for each layer / horizon.

){  #
    k.sat.star <- 
        7.755 + 0.0352 * silt + 0.93 * topSoil - 0.967 * (bulkD^2) - 
        0.000484 * (clay^2) - 0.000322 * (silt^2) + 0.001 * (silt^-1) - 
        0.0748 * (om^-1) - 0.643 * log( silt, base = exp(1) ) - 
        0.01398 * bulkD * clay - 0.1673 * bulkD * om + 
        0.02986 * topSoil * clay - 0.03305 * topSoil * silt 
    #
    k.sat <- exp( k.sat.star ) 
    #
    return( k.sat ) 
### The function returns a vector of K sat values of the same 
### length as the vector of value provided to each parameter. 
### Unit of K sat is [mm.h-1] [Length.Time-1] 
}   #