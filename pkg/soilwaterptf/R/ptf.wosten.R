# source( "C:/_SOILWATER/pkg/soilwaterptf/R/ptf.wosten.R" ) 
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

# Language & Software environment: R. 
# See ..\DESCRIPTION for more details

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #






ptf.wosten.theta.s <- function(# Wosten et al. 1999 PTF for soil's saturated water content.
### Continuous pedotransfer functions to predict the saturated 
### water content (THETA_S) of a soil after its clay and silt 
### content, bulk density, organic matter content and topsoil or 
### subsoil qualifier. 

##seealso<<\code{\link{ptf.wosten}}, 

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
    if( any( silt == 0 ) )
    {   #
        stop( "Some 'silt' values are 0. The PTF does not handle 0% silt content (ln(silt))." ) 
    }   #
    #
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
### thetaS (validation / calibration?) R2 is 76%.
}   #






ptf.wosten.alpha <- function(# Wosten et al. 1999 PTF for van Genuchten 1980 alpha parameter.
### Continuous pedotransfer functions to predict the alpha parameter 
### of the Van Genuchten water retention function 
### of a soil after its clay and silt content, bulk density, 
### organic matter content and topsoil or subsoil qualifier. 

##seealso<<\code{\link{ptf.wosten}}, 

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
    if( any( silt == 0 ) )
    {   #
        stop( "Some 'silt' values are 0. The PTF does not handle 0% silt content (ln(silt))." ) 
    }   #
    #
    if( any( om == 0 ) )
    {   #
        stop( "Some 'om' values are 0. The PTF does not handle 0% organic matter content (ln(om))." ) 
    }   #
    #
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
### alpha (validation / calibration?) R2 is 20%.
}   #






ptf.wosten.n <- function(# Wosten et al. 1999 PTF for van Genuchten 1980 n parameter.
### Continuous pedotransfer functions to predict the n parameter 
### of the Van Genuchten water retention function 
### of a soil after its clay and silt content, bulk density, 
### organic matter content and topsoil or subsoil qualifier. 

##seealso<<\code{\link{ptf.wosten}}, 

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
    if( any( silt == 0 ) )
    {   #
        stop( "Some 'silt' values are 0. The PTF does not handle 0% silt content (ln(silt))." ) 
    }   #
    #
    if( any( om == 0 ) )
    {   #
        stop( "Some 'om' values are 0. The PTF does not handle 0% om (ln(om))." ) 
    }   #
    #
    if( any( bulkD == 0 ) )
    {   #
        stop( "Some 'bulkD' values are 0. The PTF does not handle zero bulkD content (ln(bulkD))." ) 
    }   #
    #
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
### n (validation / calibration?) R2 is 54%.
}   #






ptf.wosten.l <- function(# Wosten et al. 1999 PTF for van Genuchten 1980 l parameter.
### Continuous pedotransfer functions to predict the l parameter 
### of the Van Genuchten water retention function 
### of a soil after its clay and silt content, bulk density and 
### organic matter content.

##seealso<<\code{\link{ptf.wosten}}, 

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
    if( any( om == 0 ) )
    {   #
        stop( "Some 'om' values are 0. The PTF does not handle 0% om (ln(om))." ) 
    }   #
    #
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
### Unit of l is [-].
### l (validation / calibration?) R2 is 12%.
}   #






ptf.wosten.ksat <- function(# Wosten et al. 1999 PTF for soil's saturated hydraulic conductivity.
### Continuous pedotransfer functions to predict the saturated 
### hydraulic conductivity, K sat, of the Mualem (1976) & van 
### Genuchten (1980) water retention function of a soil after its 
### clay and silt content, bulk density, organic matter content 
### and topsoil or subsoil qualifier. 

##seealso<<\code{\link{ptf.wosten}}, 

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

 topSoil, 
### Vector of 0 or 1 integers. Set to 1 if the layer is a topsoil, 
### and to 0 if it is a subsoil, for each layer / horizon.

 units 
### Vector of 2 character strings. [length] and [time] units in 
### which the calculated parameters must be outputed. 
### \itemize{ 
###   \item The second item is the [time] unit, and its possible 
###         values are "mm", "cm" or "m". It is used for the alpha 
###         and kSat parameters. 
###   \item The third item is the [time] unit, and its possible 
###         values are "sec", "min", "hour", "day".
### }
### At the moment, \code{units} must be provided by the user. In 
### the near future, its default value should be set to 
### \code{c("cm","day")}, as in Wosten et al. 1999 article.
### Warning: A bug in the code erroneously reported a default kSat 
### unit output in [mm.h-1], while its real unit is [cm.day-1].

){  #
    if( any( silt == 0 ) )
    {   #
        stop( "Some 'silt' values are 0. The PTF does not handle 0% silt content (ln(silt))." ) 
    }   #
    #
    k.sat.star <- 
        7.755 + 0.0352 * silt + 0.93 * topSoil - 0.967 * (bulkD^2) - 
        0.000484 * (clay^2) - 0.000322 * (silt^2) + 0.001 * (silt^-1) - 
        0.0748 * (om^-1) - 0.643 * log( silt, base = exp(1) ) - 
        0.01398 * bulkD * clay - 0.1673 * bulkD * om + 
        0.02986 * topSoil * clay - 0.03305 * topSoil * silt 
    #
    k.sat <- exp( k.sat.star ) 
    #
    if( !(units[1] %in% c("mm","cm","m")) )
    {   #
        stop( "units[2] can only be 'mm', 'cm' or 'm'" )
    }   # 
    #
    if( !(units[2] %in% c("sec","min","hour","day")) )
    {   #
        stop( "units[3] can only be 'sec', 'min', 'hour' or 'day'" )
    }   # 
    #
    length.fact <- c("m"=1,"cm"=100,"mm"=1000) 
    length.fact <- as.numeric( length.fact[ units[1] ] ) 
    #
    time.fact <- c("sec"=24*60*60,"min"=24*60,"hour"=24,"day"=1) 
    time.fact <- as.numeric( time.fact[ units[2] ] ) 
    #
    # kSat is outputed in cm.day-1
    k.sat <- (k.sat / 100) * length.fact 
    k.sat <- k.sat / time.fact 
    #
    return( k.sat ) 
### The function returns a vector of K sat values of the same 
### length as the vector of value provided to each parameter. 
### Unit of K sat is [length.time-1], where length and time are 
### taken from the option \code{units}. ksat (validation / 
### calibration?) R2 is 19%.
### Warning: A bug in the code erroneously reported a default kSat 
### unit output in [mm.h-1], while its real unit is [cm.day-1].

}   #






ptf.wosten <- function(# Wosten et al. 1999 PTF for all Mualem - van Genuchten functions' parameters.
### Function that calculates all the parameters of the van Genuchten 
### and Mualem - van Genuchten water retention and hydraulic 
### conductivity functions using the complete set of PTFs created 
### by Woesten et al. 1999. The code uses either R code or Fortran 
### code to do the calculations, and is vectorised (works on several 
### soil samples at a time) 

##seealso<<The Mualem - van Genuchten functions functions are 
## implemented in the package \pkg{soilwaterfun}, 
## \url{https://r-forge.r-project.org/R/?group_id=863}. 

##references<< Wosten J.H.M., Lilly A., Nemes A., 
## Le Bas C., 1999. Development and use of a database of hydraulic 
## properties of European soils. Geoderma 90:169-185.

 soilprop,
### matrix or data.frame, with 5 columns: 
### \itemize{ 
###   \item "clay", Clay content [%] of each soil layer / horizon. 
###         0-2 micrometers.; 
###   \item "bulkD", Bulk density [kg.dm-3] of each soil layer / 
###         horizon;  
###   \item "silt", Silt content [%] of each soil layer / horizon. 
###         2-50 micrometers; 
###   \item "om", Organic matter content [%] of each soil layer / 
###         horizon; 
###   \item "topSoil", Set to 1 if the layer is a topsoil, and to 
###         0 if it is a subsoil, for each layer / horizon.
### } 

 units,
### Vector of 3 character strings. [Volumic water content], [length] 
### and [time] units in which the calculated parameters must be 
### outputed. 
### \itemize{ 
###   \item The fist item is the [Volumic water content] unit, 
###         and its possible values are "-" (m3 of water . m-3 of 
###         bulk soil, between 0 and 1) or "%" (percent of water, 
###         between 0 and 100). It is used for the thetaS parameter. 
###   \item The second item is the [time] unit, and its possible 
###         values are "mm", "cm" or "m". It is used for the alpha 
###         and kSat parameters. 
###   \item The third item is the [time] unit, and its possible 
###         values are "sec", "min", "hour", "day".
### }
### At the moment, \code{units} must be provided by the user. In 
### the near future, its default value should be set to 
### \code{c("-","cm","day")}, as in Wosten et al. 1999 article.
### Warning: A bug in the code erroneously reported a default kSat 
### unit output in [mm.h-1], while its real unit is [cm.day-1].

 fortran.c=TRUE,
### Single logical. If TRUE uses fortran code instead od R code 
### (presumably faster).

 fortran.lib="soilwaterptf",
### Single character string. Internal. Name of the dll that contains 
### the .Fortran sub-routine.

 package="soilwaterptf", 
### Single character string. Internal. Name of the package that 
### contains the dll.

 lib.loc=installed.packages()["soilwaterptf","LibPath"] 
### Single character string. Internal. Location of the package that 
### contains the dll.

){  #
    cnm <- c("clay", "bulkD", "silt", "om", "topSoil") 
    #
    if( !all(colnames( soilprop ) %in% cnm) )
    {   #
        stop( 
            paste( 
                sep = "", 
                "colnames( soilprop ) must contain: ", 
                paste( cnm, collapse = "," ), 
                ". Now contains: ", 
                paste( colnames( soilprop ), collapse = "," )  
            )   #
        )   #
    }   #
    #
    soilprop <- soilprop[,cnm] 
    #
    soilprop <- as.matrix( soilprop ) 
    storage.mode( soilprop ) <- "double" 
    #
    #Store the number of rows
    nr <- as.integer( nrow( soilprop ) ) 
    #
    # Make a "returned" matrix of doubles
    soilphy <- matrix( 
        data = 0, 
        nrow = nr, 
        ncol = 5
    )   #
    #
    storage.mode( soilphy ) <- "double" 
    #
    if( fortran.c )
    {   #
        if( any( soilprop[,"silt"] == 0 ) )
        {   #
            stop( "Some soilprop[,'silt'] values are 0. The PTF does not handle 0% silt content (ln(silt))." ) 
        }   #
        #
        if( any( soilprop[,"om"] == 0 ) )
        {   #
            stop( "Some soilprop[,'om'] values are 0. The PTF does not handle 0% om (ln(om))." ) 
        }   #
        #
        if( any( soilprop[,"bulkD"] == 0 ) )
        {   #
            stop( "Some soilprop[,'bulkD'] values are 0. The PTF does not handle zero bulkD content (ln(bulkD))." ) 
        }   #
        #
        # # If the library hasn't been loaded yet, load it 
        # if( !is.loaded( fortran.lib ) ) 
        # {   #
        #     lib.path <- file.path( 
        #         .Library, 
        #         package, 
        #         "libs", 
        #         fortran.lib 
        #     )   #
        #     #
        #     dyn.load( lib.path) # , PACKAGE = package 
        # }   #
        #
        tmp <- library.dynam( 
            chname  = fortran.lib, 
            package = package, 
            lib.loc = lib.loc  
        )   #
        # tmp <- tmp[["path"]] 
        #
        # empt <- as.double(0)
        #
        #Call Fortran
        res = .Fortran( 
            name      = "ptfWosten", 
            nbrow     = nr, 
            soilprop  = soilprop, 
            soilphy   = soilphy, 
            PACKAGE   = package  
        )   #
        #
        ## Unload dll
        # dyn.unload( lib.path ) 
        #
        # Does not work for some reasons (only when compiling):
        # pos <- which( # Copied / modified from library.dynam() code.
        #     sapply( 
        #         X   = .dynLibs(), 
        #         FUN = function(X){
        #             X[["path"]] == tmp 
        #         }   #
        #     )   #
        # )   #
        # #
        # if( length(pos) != 0 )
        # {   #
        #     library.dynam.unload( 
        #         chname  = fortran.lib,
        #         libpath = file.path(
        #             .Library, 
        #             package 
        #         )   #
        #     )   #
        # }   #
        #
        #Return the resulting matrix
        soilphy <- res[["soilphy"]] 
    }else{ 
        soilphy[,1] <- ptf.wosten.theta.s( 
            clay    = soilprop[,"clay"],  # using index insteda of name
            bulkD   = soilprop[,"bulkD"], #   only marginally improve 
            silt    = soilprop[,"silt"],  #   the speed
            om      = soilprop[,"om"], 
            topSoil = soilprop[,"topSoil"]  
        )   #
        #
        soilphy[,2] <- ptf.wosten.alpha( 
            clay    = soilprop[,"clay"], 
            bulkD   = soilprop[,"bulkD"], 
            silt    = soilprop[,"silt"], 
            om      = soilprop[,"om"], 
            topSoil = soilprop[,"topSoil"]  
        )   #
        #
        soilphy[,3] <- ptf.wosten.n( 
            clay    = soilprop[,"clay"], 
            bulkD   = soilprop[,"bulkD"], 
            silt    = soilprop[,"silt"], 
            om      = soilprop[,"om"], 
            topSoil = soilprop[,"topSoil"]  
        )   #
        #
        soilphy[,4] <- ptf.wosten.l( 
            clay    = soilprop[,"clay"], 
            bulkD   = soilprop[,"bulkD"], 
            silt    = soilprop[,"silt"], 
            om      = soilprop[,"om"]  
        )   #
        #
        soilphy[,5] <- ptf.wosten.ksat( 
            clay    = soilprop[,"clay"], 
            bulkD   = soilprop[,"bulkD"], 
            silt    = soilprop[,"silt"], 
            om      = soilprop[,"om"], 
            topSoil = soilprop[,"topSoil"], 
            units   = c("cm","day")  #  As before
        )   #
    }   #
    #
    colnames( soilphy ) <- c( "thetaS", "alpha", "n", "l", "kSat" ) 
    #
    if( !(units[1] %in% c("-","%")) )
    {   #
        stop( "units[1] can only be '-' or '%'" )
    }   # 
    #
    if( !(units[2] %in% c("mm","cm","m")) )
    {   #
        stop( "units[2] can only be 'mm', 'cm' or 'm'" )
    }   # 
    #
    if( !(units[3] %in% c("sec","min","hour","day")) )
    {   #
        stop( "units[3] can only be 'sec', 'min', 'hour' or 'day'" )
    }   # 
    #
    wc.fact <- c("-"=1,"%"=100) 
    wc.fact <- as.numeric( wc.fact[ units[1] ] ) 
    #
    length.fact <- c("m"=1,"cm"=100,"mm"=1000) 
    length.fact <- as.numeric( length.fact[ units[2] ] ) 
    #
    time.fact <- c("sec"=24*60*60,"min"=24*60,"hour"=24,"day"=1) 
    time.fact <- as.numeric( time.fact[ units[3] ] ) 
    #
    # alpha is outputed in m-1
    soilphy[,"alpha"] <- soilphy[,"alpha"] / length.fact 
    #
    # kSat is outputed in cm.day-1
    soilphy[,"kSat"] <- (soilphy[,"kSat"] / 100) * length.fact 
    soilphy[,"kSat"] <- soilphy[,"kSat"] / time.fact 
    #
    # alpha is outputed in m-1
    soilphy[,"thetaS"] <- soilphy[,"thetaS"] * wc.fact 
    #
    return( soilphy ) 
### Returns a matrix with estimated soil physical properties, 
### "thetaS", "alpha", "n", "l" and "kSat", expressed in [Volumic 
### water content], [length-1], [-], [-] and [length.time-1] 
### respectively, and where [Volumic water content], [length] and 
### [time] are units chosen with the option \code{units}. 
### Warning: A bug in the code erroneously reported a default kSat 
### unit output in [mm.h-1], while its real unit is [cm.day-1]. 
### thetaS, alpha, n, l and ksat (validation / calibration?) R2 
### are 76%, 20%, 54%, 12% and 19% respectively.
}   #






classPtf.wosten <- function(# Wosten et al. 1999 class PTF for all Mualem - van Genuchten functions' parameters.
### Function that calculates all the parameters of the van Genuchten 
### and Mualem - van Genuchten water retention and hydraulic 
### conductivity functions using the complete set of _class_ PTFs 
### created by Woesten et al. 1999. This version of the PTFs uses 
### lookup values calculated for different texture classes of the 
### FAO texture triangle. Texture classes abbreviation can either 
### be provided directly by the user or calculated from the clay, 
### silt and sand content. The code is vectorised (works on several 
### soil samples at a time).

##seealso<<The Mualem - van Genuchten functions functions are 
## implemented in the package \pkg{soilwaterfun}, 
## \url{https://r-forge.r-project.org/R/?group_id=863}. 

##references<< Wosten J.H.M., Lilly A., Nemes A., 
## Le Bas C., 1999. Development and use of a database of hydraulic 
## properties of European soils. Geoderma 90:169-185.

 soilprop,
### matrix or data.frame, with 2 to 5 columns: 
### \itemize{ 
###   \item "textureClass", abbreviation of the texture class according 
###         to the FAO texture triangle (with silt-sand limit at 50
###         micrometers). These abbreviations must be chosen according 
###         to those used in the package \pkg{soiltexture}: "VF" 
###         for very fine, "F" for fine, "MF" for medium fine, "M" 
###         for medium and "C" for coarse. If _any_ of the "textureClass" 
###         value is NA, then the function looks for columns "clay", 
###         "silt" and "sand" in soilProp and calculates the textureClass 
###         from them using the package \pkg{soiltexture}.
###   \item "isOrganic", set to 1 if the layer is an organic layer, 
###         like FAO "O" and "H" Master horizon designations, and 0 
###         otherwise; 
###   \item "clay", Clay content [%] of each soil layer / horizon. 
###         0-2 micrometers. Not needed if the "textureClass" is 
###         not NA; 
###   \item "silt", Silt content [%] of each soil layer / horizon. 
###         2-50 micrometersNot needed if the "textureClass" is 
###         not NA; 
###   \item "sand", Sand content [%] of each soil layer / horizon. 
###         50-2000 micrometersNot needed if the "textureClass" is 
###         not NA.
### } 
### Notice that if clay silt sand texture data are used to define 
### textureClass and if a given sample lies precisely on the edge 
### or on a vertice between 2 or more texture classes, then only 
### one texture class will be chosen, according to the priority 
### "VF" > "F" > "M" > "MF" > "C" (which is the order of the classes 
### given by 
### \code{names( soiltexture:::TT.get("FAO50.TT")[["tt.polygons"]] )}). 

 units,
### Vector of 3 character strings. [Volumic water content], [length] 
### and [time] units in which the calculated parameters must be 
### outputed. 
### \itemize{ 
###   \item The fist item is the [Volumic water content] unit, 
###         and its possible values are "-" (m3 of water . m-3 of 
###         bulk soil, between 0 and 1) or "%" (percent of water, 
###         between 0 and 100). It is used for the thetaS parameter. 
###   \item The second item is the [time] unit, and its possible 
###         values are "mm", "cm" or "m". It is used for the alpha 
###         and kSat parameters. 
###   \item The third item is the [time] unit, and its possible 
###         values are "sec", "min", "hour", "day".
### }
### At the moment, \code{units} must be provided by the user. In 
### the near future, its default value should be set to 
### \code{c("-","cm","day")}, as in Wosten et al. 1999 article.

 dat.css.ps.lim=NULL,
### Vector of 4 numericals. Set this and \code{css.transf} if 
### your texture data are not in a particle size classes system with 
### a silt-sand limit at 50 micrometers. See 
### \code{\link[soiltexture]{TT.points.in.classes}} for details.

 css.transf=FALSE,
### Single logical. Set to TRUE of you want to transform the soil 
### texture data into a system with a 50 micrometers limit between 
### silt and sand. See \code{\link[soiltexture]{TT.points.in.classes}} 
### for details.

 text.transf.fun=NULL,
### See \code{\link[soiltexture]{TT.points.in.classes}} for details.

 trsf.add.opt1=NULL,
### Non pre-defined format. See \code{\link[soiltexture]{TT.points.in.classes}} 
### for details.

 trsf.add.opt2=NULL,
### Non pre-defined format. See \code{\link[soiltexture]{TT.points.in.classes}} 
### for details.

 text.tol=NULL,
### Single numerical. See \code{\link[soiltexture]{TT.points.in.classes}} 
### for details.

 tri.sum.tst=NULL,
### Single logical. See \code{\link[soiltexture]{TT.points.in.classes}} 
### for details.

 tri.pos.tst=NULL,
### Single logical. See \code{\link[soiltexture]{TT.points.in.classes}} 
### for details.

 texture2xy=FALSE,
### Single logical. See \code{\link[soiltexture]{TT.points.in.classes}} 
### for details.

 package="soilwaterptf"
### Single character string. Package in which the lookup table 
### containing the correspondamce between soil texture classes 
### and Mualem - van Genuchten parameters will be found.

){  #
    cnm <- c("textureClass", "isOrganic") 
    #
    if( !all(cnm %in% colnames( soilprop )) )
    {   #
        stop( 
            paste( 
                sep = "", 
                "colnames( soilprop ) must contain: ", 
                paste( cnm, collapse = "; " ), 
                ". Now contains: ", 
                paste( colnames( soilprop ), collapse = "; " )  
            )   #
        )   #
    }   #
    #
    require( "soiltexture" ) 
    #
    testClass <- is.na( soilprop[,"textureClass"] ) & 
                 soilprop[,"isOrganic"] == 0 
    #
    if( any( testClass ) ) 
    {   #
        cnm <- c(cnm,"clay", "silt","sand") 
        #
        if( !all(cnm %in% colnames( soilprop )) )
        {   #
            stop( 
                paste( 
                    sep = "", 
                    "colnames( soilprop ) must contain: ", 
                    paste( cnm, collapse = "; " ), 
                    ". Now contains: ", 
                    paste( colnames( soilprop ), collapse = "; " )  
                )   #
            )   #
        }   #
        #
        textureClass <- TT.points.in.classes(
            tri.data        = soilprop[ testClass, ], 
            class.sys       = "FAO50.TT", 
            PiC.type        = "l", 
            css.names       = c("clay","silt","sand"), 
            text.sum        = 100, 
            base.css.ps.lim = NULL, 
            tri.css.ps.lim  = NULL, 
            dat.css.ps.lim  = dat.css.ps.lim, 
            css.transf      = css.transf, 
            text.transf.fun = text.transf.fun, 
            trsf.add.opt1   = trsf.add.opt1, 
            trsf.add.opt2   = trsf.add.opt2, 
            text.tol        = text.tol, 
            tri.sum.tst     = tri.sum.tst, 
            tri.pos.tst     = tri.pos.tst, 
            texture2xy      = texture2xy  
        )   #
        #
        textureClass <- unlist( apply( 
            X      = textureClass, 
            MARGIN = 1, 
            FUN    = function(X)
            {   #
                nm <- (names(X)[ X != 0 ])[ 1 ] 
            }   #
        ) ) #
        #
        soilprop[ testClass, "textureClass" ] <- textureClass 
    }   #
    #
    FAO.textureClass <- names( 
        TT.get("FAO50.TT")[["tt.polygons"]] 
    )   #
    #
    FAO.textureClass <- c(FAO.textureClass,NA)
    #
    if( !all( soilprop[,"textureClass"] %in% FAO.textureClass ) ) 
    {   #
        stop( 
            paste( 
                sep = "", 
                "soilprop[,'textureClass'] must take values in: ", 
                paste( FAO.textureClass, collapse = "; " ), 
                ". Now contains: ", 
                paste( soilprop[,"textureClass"], collapse = "; " )  
            )   #
        )   #
    }   #
    #
    # Prepare lookup index in the soil properties:
    soilprop2 <- soilprop[,c("topSoil","textureClass","isOrganic")]
    #
    test.organic <- soilprop2[,"isOrganic"] == 1 
    #
    soilprop2[,"topSoil"] <- as.character( soilprop2[,"topSoil"] ) 
    soilprop2[ 
        is.na( soilprop2[,"topSoil"] ),
        "topSoil"
    ] <- "" 
    #
    soilprop2[ 
        is.na( soilprop2[,"textureClass"] ),
        "textureClass"
    ] <- "" 
    #
    rowName1 <- paste( 
        soilprop2[,"topSoil"], 
        soilprop2[,"textureClass"], 
        sep = "" 
    )   #
    #
    rowName1[ test.organic ] <- "O"
    #
    rm( soilprop2 ) 
    #
    # Load the lookup table:
    data("classPtfWosten",package=package,envir=environment()) 
    #
    # Prepare lookup index in the physical properties:
    classPtfWosten2 <- classPtfWosten[, c("topSoil","textureClass","isOrganic") ] 
    #
    test.organic2 <- classPtfWosten2[,"isOrganic"] == 1 
    #
    classPtfWosten2[,"topSoil"] <- as.character( classPtfWosten2[,"topSoil"] ) 
    classPtfWosten2[ 
        is.na( classPtfWosten2[,"topSoil"] ),
        "topSoil"
    ] <- "" 
    #
    classPtfWosten2[ 
        is.na( classPtfWosten2[,"textureClass"] ),
        "textureClass"
    ] <- "" 
    #
    rowName2 <- paste( 
        classPtfWosten2[,"topSoil"], 
        classPtfWosten2[,"textureClass"], 
        sep = "" 
    )   #
    #
    rowName2[ test.organic2 ] <- "O"
    # 
    rownames( classPtfWosten ) <- rowName2 ; rm( classPtfWosten2 ) 
    #
    # Get the physical properties values:
    soilphy <- classPtfWosten[ rowName1, ]
    #
    soilphy <- data.frame( 
        soilprop, 
        soilphy[, !(colnames(soilphy) %in% c("textureClass","topSoil","isOrganic")) ], 
        stringsAsFactors = FALSE 
    )   #
    #
    if( !(units[1] %in% c("-","%")) )
    {   #
        stop( "units[1] can only be '-' or '%'" )
    }   # 
    #
    if( !(units[2] %in% c("mm","cm","m")) )
    {   #
        stop( "units[2] can only be 'mm', 'cm' or 'm'" )
    }   # 
    #
    if( !(units[3] %in% c("sec","min","hour","day")) )
    {   #
        stop( "units[3] can only be 'sec', 'min', 'hour' or 'day'" )
    }   # 
    #
    wc.fact <- c("-"=1,"%"=100) 
    wc.fact <- as.numeric( wc.fact[ units[1] ] ) 
    #
    length.fact <- c("m"=1/100,"cm"=1,"mm"=10) 
    length.fact <- as.numeric( length.fact[ units[2] ] ) 
    #
    time.fact <- c("sec"=24*60*60,"min"=24*60,"hour"=24,"day"=1) 
    time.fact <- as.numeric( time.fact[ units[3] ] ) 
    #
    # alpha is outputed in m-1
    soilphy[,"alpha"] <- soilphy[,"alpha"] / length.fact 
    #
    # kSat is outputed in cm.day-1
    soilphy[,"kSat"] <- soilphy[,"kSat"] * length.fact 
    soilphy[,"kSat"] <- soilphy[,"kSat"] / time.fact 
    #
    # alpha is outputed in m-1
    soilphy[,"thetaS"] <- soilphy[,"thetaS"] * wc.fact 
    soilphy[,"thetaR"] <- soilphy[,"thetaR"] * wc.fact 
    #
    return( soilphy )
### Returns a matrix with estimated soil physical properties, 
### "thetaS", "alpha", "n", "l" and "kSat", expressed in [Volumic 
### water content], [length-1], [-], [-] and [length.time-1] 
### respectively, and where [Volumic water content], [length] and 
### [time] are units chosen with the option \code{units}. 
}   #
