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

 CLAY,
### Vector of numericals. Clay content [%] of each soil layer / 
### horizon. 0-2 micrometers. 

 BULKD,
### Vector of numericals. Bulk density [kg.dm-3] of each soil 
### layer / horizon (unit not given in the article!). 

 SILT,
### Vector of numericals. Silt content [%] of each soil layer / 
### horizon. 2-50 micrometers. 

 OM,
### Vector of numericals. Organic matter content [%] of each soil layer / 
### horizon. 

 topsoil 
### Vector of 0 or 1 integers. Set to 1 if the layer is a topsoil, 
### and to 0 if it is a subsoil, for each layer / horizon.

){  #
    theta.s <- 0.7919 + 0.001691 * CLAY - 0.29619 * BULKD - 
               0.000001491 * (SILT^2) + 0.0000821 * (OM^2) + 
               0.02427 * (CLAY^-1) + 0.01113 * (SILT^-1) + 
               0.01472 * logb(SILT, base = exp(1)) - 
               0.0000733 * OM * CLAY - 0.000619 * BULKD * CLAY - 
               0.001183 * BULKD * OM - 0.0001664 * topsoil * SILT 
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

 CLAY,
### Vector of numericals. Clay content [%] of each soil layer / 
### horizon. 0-2 micrometers.

 BULKD,
### Vector of numericals. Bulk density [kg.dm-3] of each soil 
### layer / horizon (unit not given in the article!). 

 SILT,
### Vector of numericals. Silt content [%] of each soil layer / 
### horizon. 2-50 micrometers. 

 OM,
### Vector of numericals. Organic matter content [%] of each soil layer / 
### horizon. 

 topsoil 
### Vector of 0 or 1 integers. Set to 1 if the layer is a topsoil, 
### and to 0 if it is a subsoil, for each layer / horizon.

){  #
    alpha.star <- 
        -14.96 + 0.03135 * CLAY + 0.0351 * SILT + 0.646 * OM + 
        15.29 * BULKD - 0.192 * topsoil - 4.671 * (BULKD^2) - 
        0.000781 * (CLAY^2) - 0.00687 * (OM^2) + 0.0449 * (OM^-1) + 
        0.0663 * log( SILT, base = exp(1) ) + 0.1482 * log( OM, base = exp(1) ) - 
        0.04546 * BULKD * SILT - 0.4852 * BULKD * OM + 
        0.00673 * topsoil * CLAY 
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

 CLAY,
### Vector of numericals. Clay content [%] of each soil layer / 
### horizon. 0-2 micrometers.

 BULKD,
### Vector of numericals. Bulk density [kg.dm-3] of each soil 
### layer / horizon (unit not given in the article!). 

 SILT,
### Vector of numericals. Silt content [%] of each soil layer / 
### horizon. 2-50 micrometers. 

 OM,
### Vector of numericals. Organic matter content [%] of each soil layer / 
### horizon. 

 topsoil 
### Vector of 0 or 1 integers. Set to 1 if the layer is a topsoil, 
### and to 0 if it is a subsoil, for each layer / horizon.

){  #
    n.star <- 
        -25.23 - 0.02195 * CLAY + 0.0074 * SILT - 0.1940 * OM + 45.5 * BULKD - 
        7.24 * (BULKD^2) + 0.0003658 * (CLAY^2) + 0.002885 * (OM^2) - 12.81 * (BULKD^-1) - 
        0.1524 * (SILT^-1) - 0.01958 * (OM^-1) - 0.2876 * log( SILT, base = exp(1) ) - 
        0.0709 * log( OM, base = exp(1) ) - 44.6 * log( BULKD, base = exp(1) ) - 
        0.02264 * BULKD * CLAY + 0.0896 * BULKD * OM + 0.00718 * topsoil * CLAY  
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

 CLAY,
### Vector of numericals. Clay content [%] of each soil layer / 
### horizon. 0-2 micrometers.

 BULKD,
### Vector of numericals. Bulk density [kg.dm-3] of each soil 
### layer / horizon (unit not given in the article!). 

 SILT,
### Vector of numericals. Silt content [%] of each soil layer / 
### horizon. 2-50 micrometers. 

 OM
### Vector of numericals. Organic matter content [%] of each soil layer / 
### horizon. 

){  #
    l.star <- 
        0.0202 + 0.0006193 * (CLAY^2) - 0.001136 * (OM^2) - 
        0.2316 * log( OM, base = exp(1) ) - 0.03544 * BULKD * CLAY + 
        0.00283 * BULKD * SILT + 0.0488 * BULKD * OM 
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

 CLAY,
### Vector of numericals. Clay content [%] of each soil layer / 
### horizon. 0-2 micrometers.

 BULKD,
### Vector of numericals. Bulk density [kg.dm-3] of each soil 
### layer / horizon (unit not given in the article!). 

 SILT,
### Vector of numericals. Silt content [%] of each soil layer / 
### horizon. 2-50 micrometers. 

 OM,
### Vector of numericals. Organic matter content [%] of each soil layer / 
### horizon. 

 topsoil 
### Vector of 0 or 1 integers. Set to 1 if the layer is a topsoil, 
### and to 0 if it is a subsoil, for each layer / horizon.

){  #
    k.sat.star <- 
        7.755 + 0.0352 * SILT + 0.93 * topsoil - 0.967 * (BULKD^2) - 
        0.000484 * (CLAY^2) - 0.000322 * (SILT^2) + 0.001 * (SILT^-1) - 
        0.0748 * (OM^-1) - 0.643 * log( SILT, base = exp(1) ) - 
        0.01398 * BULKD * CLAY - 0.1673 * BULKD * OM + 
        0.02986 * topsoil * CLAY - 0.03305 * topsoil * SILT 
    #
    k.sat <- exp( k.sat.star ) 
    #
    return( k.sat ) 
### The function returns a vector of K sat values of the same 
### length as the vector of value provided to each parameter. 
### Unit of K sat is [mm.h-1] [Length.Time-1] 
}   #
