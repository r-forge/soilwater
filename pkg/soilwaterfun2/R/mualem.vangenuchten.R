
#'Calculates relative saturation as a function of water tension head (van Genuchten 1980)
#' 
#'Calculates relative saturation as a function of water tension head, 
#'  \code{h}, with the van Genuchten (1980) water retention function. 
#'  Also called relative saturation.
#' 
#'
#'@param p 
#'  A \code{\link[base]{data.frame}} containing the parameters of the 
#'  van Genuchten water retention function. The following columns 
#'  (parameters) are needed: \code{alpha}, numerical values, (shape) 
#'  parameter of the van Genuchten water retention function, 
#'  in [L-1] (Unit of height, for example [meters], same unit as 
#'  \code{h}); \code{n}, numerical values, dimensionless [-] shape 
#'  parameter of the van Genuchten water retention function. The 
#'  column (parameter) \code{m}, numerical value, can be provided 
#'  too. If missing, it will be estimated using the function 
#'  passed to the argument \code{mFun} (see below).
#'
#'@param h 
#'  Vector of numerical. Water tension head in the soil, 
#'  in [L] (Unit of height, for example [meters]). Water tension 
#'  head is positive if the soil is unsaturated, zero if the soil 
#'  is saturated. Values above zero (in the case of ponding for 
#'  instance) will be set to zero \textit{silently}.
#'
#'@param mFun 
#'  A \code{\link[base]{function}}, with arguments \code{p}, 
#'  \code{cp}, and \code{\dots}, used to estimate the parameter 
#'  \code{m} when it is missing in \code{p} (see above). 
#'
#'@param \dots
#'  More arguments passed to \code{mFun} and specific methods.
#'
#'
#'@return \code{\link[base]{data.frame}} of relative water contents 
#'  ([-] dimensionless), where each row corresponds to a row in 
#'  \code{p} and each column corresponds to a water tension head 
#'  in \code{h}.
#'
#'@references van Genuchten M. Th., 1980. A closed form equation for
#'  predicting the hydraulic conductivity of unsaturated soils.  Soil Science
#'  Society of America Journal, 44:892-898. Kutilek M. & Nielsen D.R., 1994.
#'  Soil hydrology.  Catena-Verlag, GeoEcology textbook, Germany. ISBN:
#'  9-923381-26-3., 370 p.
#'
#'
relativeSaturationVGTension <- function( 
# relativeSaturationVGTension 
 p, 
 ...
){  
    UseMethod( "relativeSaturationVGTension" ) 
}   



relativeSaturationVGTension.matrix <- function( 
# relativeSaturationVGTension 
 p, 
 ...
){  
    p <- as.data.frame( p ) 
    
    relativeSaturationVGTension( p = p, ... )
}   



.relativeSaturationVGTension <- function(p,h,...){ 
    do.call( what = "rbind", args = lapply( 
        X   = 1:nrow(p), 
        FUN = function(i){ 
            1 / ( ( 1 + ( p[ i, "alpha" ] * h )^p[ i, "n" ] )^p[ i, "m" ] )
        }   
    ) ) 
}   



relativeSaturationVGTension.data.frame <- function( 
# relativeSaturationVGTension 
 p, 
 h, 
 mFun=function(p,cp=1,...){1-(cp/p[,"n"])}, 
 ...
){  
    expectCol <- c( "n", "alpha", "m" )
    testCol   <- expectCol %in% colnames( p ) 
    
    if( !all( testCol[1:2] ) ){ 
        stop( sprintf( 
            "Some required columns are missing in 'p': %s", 
            paste( (expectCol[1:2])[ testCol[1:2] ], collapse = ", " ) 
        ) ) 
    }   
    
    #   Set the parameter m
    if( !testCol[3] ){ p[, "m" ] <- mFun( p = p, ... ) }
    
    #   Set negative tensions (positive pressure, over-saturation) to 0
    h[ h < 0 ] <- 0
    
    Se <- .relativeSaturationVGTension( p = p, h = h, ... )
    
    Se <- as.data.frame( Se ) 
    colnames( Se ) <- paste0( "h", 1:length(h) )
    
    #   Set tensions as attribute
    attr( Se, "h" ) <- h 
    
    #   Set the object class
    class( Se ) <- c( "relativeSaturation", "data.frame" )
    
    #   Set row names
    rownames( Se ) <- rownames( p )
    
    return( Se ) 
}   



plot.relativeSaturation <- function(
 x,
 y,
 col,
 #ylim = 0:1, 
 xlab = "Matric tension head [height]",
 ylab = "Relative saturation [-]", 
 type = "l", 
 log  = "x", 
 leg  = TRUE, 
 ... 
){   
    h <- attr( x, "h" )  
    
    x <- as.matrix( x )
    
    seRange <- range( x ) 
    
    if( missing( col ) ){ 
        col <- rainbow( n = nrow(x) ) 
    }   
    
    plot( x = h, y = x[ 1, ], xlab = xlab, ylab = ylab, 
        col = col[1], ylim = seRange, type = type, log = log, 
        ... ) 
    
    if( nrow( x ) > 1 ){ 
        for( i in 2:nrow(x) ){ 
            lines( x = h, y = x[ i, ], col = col[i], ... )
        }   
        
        if( leg ){ 
            legend( 
                x      = "topright", 
                legend = rownames( x ), 
                col    = col, 
                lty    = par( "lty" ) 
            )   
        }   
    }   
    
    
    
}   

    # Se <- relativeSaturationVGTension( 
        # p = data.frame( "alpha" = 3.6, "n" = 1.2 ), 
        # h = c( 0, 0.01, 0.1, 1, 10, 100, 158 ) ) # h in [m]
    # Se 
    
    # # More info
    # attributes( Se ) 
    
    # Se2 <- relativeSaturationVGTension( 
        # p = data.frame( "alpha" = c( 3.6, 2.0 ), "n" = 1.2, row.names = c( "A", "B" ) ), 
        # h = seq( 0.1, 158, by = 0.1 ) ) # h in [m]
    
    # plot( Se2 ) 




#'Calculates water content as a function of water tension head (van Genuchten 1980)
#' 
#'Calculates water content as a function of water tension head, 
#'  \code{h}, with the van Genuchten (1980) water retention function.
#' 
#'
#'@param p 
#'  A \code{\link[base]{data.frame}} containing the parameters of the 
#'  van Genuchten water retention function. The following columns 
#'  (parameters) are needed: \code{alpha}, numerical values, (shape) 
#'  parameter of the van Genuchten water retention function, 
#'  in [L-1] (Unit of height, for example [meters], same unit as 
#'  \code{h}); \code{n}, numerical values, dimensionless [-] shape 
#'  parameter of the van Genuchten water retention function. The 
#'  column (parameter) \code{m}, numerical values, can be provided 
#'  too. If missing, it will be estimated using the function 
#'  passed to the argument \code{mFun} (see below); \code{thetaS}, 
#'  numerical values, saturated volumetric water content ([-] or 
#'  [Volume of water / Volume of bulk soil]); \code{thetaR}, 
#'  numerical values, residual volumetric saturated water content 
#'  ([-] or [Volume of water / Volume of bulk soil]).
#'
#'@param h 
#'  Vector of numerical. Water tension head in the soil, 
#'  in [L] (Unit of height, for example [meters]). Water tension 
#'  head is positive if the soil is unsaturated, zero if the soil 
#'  is saturated. Values above zero (in the case of ponding for 
#'  instance) will be set to zero \textit{silently}.
#'
#'@param mFun 
#'  A \code{\link[base]{function}}, with arguments \code{p}, 
#'  \code{cp}, and \code{\dots}, used to estimate the parameter 
#'  \code{m} when it is missing in \code{p} (see above). 
#'
#'@param \dots
#'  More arguments passed to \code{mFun} and specific methods.
#'
#'
#'@return \code{\link[base]{data.frame}} of water contents 
#'  ([-] dimensionless), where each row corresponds to a row in 
#'  \code{p} and each column corresponds to a water tension head 
#'  in \code{h}.
#'
#'@references van Genuchten M. Th., 1980. A closed form equation for
#' predicting the hydraulic conductivity of unsaturated soils.  Soil Science
#' Society of America Journal, 44:892-898. Kutilek M. & Nielsen D.R., 1994.
#' Soil hydrology.  Catena-Verlag, GeoEcology textbook, Germany. ISBN:
#' 9-923381-26-3., 370 p.
#'
#'
waterContentVGTension <- function( 
# fun.vangenuchten.theta.h
 p, 
 ...
){  
    UseMethod( "waterContentVGTension" ) 
}   



waterContentVGTension.default <- function( 
# relativeSaturationVGTension 
 p, 
 h, 
 mFun=function(p,cp=1,...){1-(cp/p[,"n"])}, 
 ...
){  
    Se <- relativeSaturationVGTension( # matrix conversion internal
        p = p, 
        h = h, 
        ...
    )   
    
    wc <- do.call( what = "rbind", args = lapply( 
        X   = 1:nrow(Se), 
        FUN = function(i){ 
            Se[ i, ] * ( p[ i, "thetaS" ] - p[ i, "thetaR" ] ) + p[ i, "thetaR" ]
        }   
    ) ) 
    
    wc <- as.data.frame( wc ) 
    
    colnames( wc ) <- paste0( "h", 1:length(h) )
    
    #   Set tensions as attribute
    attr( wc, "h" ) <- h 
    
    #   Set the object class
    class( wc ) <- c( "waterContent", "data.frame" )
    
    #   Set row names
    rownames( wc ) <- rownames( p )
    
    return( wc ) 
}   



plot.waterContent <- function(
 x,
 y,
 col,
 #ylim = 0:1, 
 xlab = "Matric tension head [height]",
 ylab = "Water content [m3/m3]", 
 type = "l", 
 log  = "x", 
 leg  = TRUE, 
 ... 
){   
    h <- attr( x, "h" )  
    
    x <- as.matrix( x )
    
    seRange <- range( x ) 
    
    if( missing( col ) ){ 
        col <- rainbow( n = nrow(x) ) 
    }   
    
    plot( x = h, y = x[ 1, ], xlab = xlab, ylab = ylab, 
        col = col[1], ylim = seRange, type = type, log = log, 
        ... ) 
    
    if( nrow( x ) > 1 ){ 
        for( i in 2:nrow(x) ){ 
            lines( x = h, y = x[ i, ], col = col[i], ... )
        }   
        
        if( leg ){ 
            legend( 
                x      = "topright", 
                legend = rownames( x ), 
                col    = col, 
                lty    = par( "lty" ) 
            )   
        }   
    }   
    
    
    
}   

    # wc <- waterContentVGTension( 
        # p = data.frame( "alpha" = 3.6, "n" = 1.2, "thetaS" = 0.5, 
            # "thetaR" = 0.1 ), 
        # h = c( 0, 0.01, 0.1, 1, 10, 100, 158 ) ) # h in [m]
    # wc 
    
    # # More info
    # attributes( wc ) 
    
    # wc2 <- waterContentVGTension( 
        # p = data.frame( "alpha" = c( 3.6, 2.0 ), "n" = 1.2, 
            # "thetaS" = 0.5, "thetaR" = 0.1, 
            # row.names = c( "A", "B" ) ), 
        # h = seq( 0.1, 158, by = 0.1 ) ) # h in [m]
    
    # plot( wc2 ) 




#'Calculates relative saturation as a function of water content.
#' 
#'Calculates relative saturation Se as a function of water content.
#' 
#' 
#'@param theta Vector of numerical. Water of the soil, in [m3.m-3].
#'@param thetaR Vector of numerical. Residual water content of the soil for
#' the Van Genuchten water retension function, in [m3.m-3].
#'@param thetaS Vector of numerical. Saturated water content of the soil for
#' the Van Genuchten water retension function, in [m3.m-3].
#'
#'
#'@return The function returns the relative water content (degree of
#' saturation, Se, [-]).
#'
#'
#'@references van Genuchten M. Th., 1980. A closed form equation for
#' predicting the hydraulic conductivity of unsaturated soils.  Soil Science
#' Society of America Journal, 44:892-898. Kutilek M. & Nielsen D.R., 1994.
#' Soil hydrology.  Catena-Verlag, GeoEcology textbook, Germany. ISBN:
#' 9-923381-26-3., 370 p.
#'@examples
#' require( "soilwaterfun" ) 
#' 
#' # Example with the properties of the Footprint soil type P22i, 
#' # 3rd layer:
#' fun.vangenuchten.se.theta( 
#'     theta   = c(0.4162380,0.4149725,0.3983120,0.3073250,0.1946693,0.1197170,0.1086555), 
#'     thetaS  = 0.4162380, 
#'     thetaR  = 0 
#' )   #
relativeSaturationTheta <- function(
 theta,
 thetaR,
 thetaS 
){  #
    return( (theta - thetaR)/(thetaS - thetaR) ) 
}   #



#' van Genuchten 1980's function h(theta) (water retension).
#' 
#' Calculate the soilwater tension h at a given water content theta with the
#' Van Genuchten water retention function.
#' 
#' 
#'@param theta Vector of numerical. Water of the soil, in [m3.m-3].
#'@param alpha Single numerical. alpha (shape) parameter of the Van Genuchten
#' water retention function, in [m-1] (inverse length unit of h).
#'@param n Single numerical. n shape parameter of the Van Genuchten water
#' retention function, dimensionless [-]. See also the 'cPar' parameter that,
#' along with 'n', is used to calculate van Genuchten's m parameter.
#'@param cPar Single numerical. Value of the c parameter of the Van Genuchten
#' water retention function, that allows to calculate the m parameter so m = (1
#' - cPar/n). Dimensionless [-].
#'@param thetaS Single numerical. Saturated water content of the soil, in [-]
#' or [m3 of water.m-3 of bulk soil].
#'@param thetaR Single numerical. Residual water content of the soil, in [-]
#' or [m3 of water.m-3 of bulk soil].
#'@return Returns a vector of soil water tension h, negative values (one value
#' per theta value provided), in the inverse unit of alpha (i.e. in [m] if
#' alpha is in [m-1]).
#'@author Julien MOEYS <jules_m78-soiltexture@@yahoo.fr>
#'@references van Genuchten M. Th., 1980. A closed form equation for
#' predicting the hydraulic conductivity of unsaturated soils.  Soil Science
#' Society of America Journal, 44:892-898. Kutilek M. & Nielsen D.R., 1994.
#' Soil hydrology.  Catena-Verlag, GeoEcology textbook, Germany. ISBN:
#' 9-923381-26-3., 370 p.
#'@examples
#' require( "soilwaterfun" ) 
#' 
#' # Example with the properties of the Footprint soil type P22i, 
#' # 3rd layer:
#' tmp <- tensionVGTheta( 
#'     theta   = c(0.4162380,0.4149725,0.3983120,0.3073250,0.1946693,0.1197170,0.1086555), 
#'     alpha   = 3.561099,  # theta is [-], alpha in [m-1]
#'     n       = 1.212074,  # [-]
#'     thetaS  = 0.4162380, # [-]
#'     thetaR  = 0          # [-]
#' )   #
#' 
#' round( tmp, 2 ) 
#' 
#' curve( 
#'     tensionVGTheta( 
#'         theta   = x, 
#'         alpha   = 3.561099, 
#'         n       = 1.212074, 
#'         thetaS  = 0.4162380, 
#'         thetaR  = 0  
#'     ),  #
#'     xlim = c(0,0.5), 
#'     col  = "red", 
#'     log  = "y", 
#'     xlab = expression( theta ), 
#'     ylab = "h, pressure head" 
#' )   #
#' 
tensionVGTheta <- function(# van Genuchten 1980's function h(theta) (water retension). 
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
    Se <- relativeSaturationTheta( 
        theta   = theta, 
        thetaS  = thetaS, 
        thetaR  = thetaR  
    )   
    
    m <- (1 - (cPar / n)) 
    
    return( (1/alpha) * ( ( Se^(-1/m) - 1 )^(1/n) ) ) 
### Returns a vector of soil water tension h, negative values 
### (one value per theta value provided), in the inverse unit 
### of alpha (i.e. in [m] if alpha is in [m-1]).
}   #








#' Mualem (1976) & van Genuchten (1980)'s function K(h) (hydraulic
#' conductivity).
#' 
#' Calculate soil hydraulic conductivity at a given tension h with the Mualem -
#' Van Genuchten function.
#' 
#' 
#'@param h Vector of numerical. Pressure head of the soil, in [m]. Matrix
#' potential values will also work, as in practice abs(h) is used.
#'@param Ks Single numerical. Saturated hydraulic conductivity of the soil in
#' [L.T-1] (unit of length per unit of time). The K result is outputed in the
#' same unit as Ks. Notice that in some case a distinction is made between
#' K(h=0) and K(saturation), and 'Ks' should / may be considered as K(h=0).
#'@param alpha Single numerical. alpha (shape) parameter of the Van Genuchten
#' water retention function, in [m-1] (inverse length unit of h).
#'@param n Single numerical. n shape parameter of the Van Genuchten water
#' retention function, dimensionless [-]. See also the 'cPar' parameter that,
#' along with 'n', is used to calculate van Genuchten's m parameter.
#'@param a Single numerical. Value of the a parameter of the Mualem - Van
#' Genuchten hydraulic conductivity function. Dimensionless [-]??.  a = 2 in
#' the Mualem formulation, and 1 in the Burdine formulation.
#'@param b Single numerical. Value of the b parameter of the Mualem - Van
#' Genuchten hydraulic conductivity function. Dimensionless [-]??.  b = 0.5 in
#' the Mualem formulation, and 2 in the Burdine formulation. Notice that
#' Schaaps et al.'s Rosetta 1.2 and Wosten et al. 1999 are using the symbol 'L'
#' (or 'l') instead of 'b'. 'b' is a tortuosity or connectivity parameter
#' (Rosetta 1.2).
#'@param cPar Single numerical. Value of the c parameter of the Van Genuchten
#' water retention function, that allows to calculate the m parameter so that m
#' = (1 - cPar/n). Dimensionless [-]. cPar = 1 in the Mualem formulation, and 2
#' in the Burdine formulation.
#'@return Returns K, the hydraulic conductivity (in [L.T-1], same unit as Ks),
#' for each h value provided.
#'@author Julien MOEYS <jules_m78-soiltexture@@yahoo.fr>
#'@references van Genuchten M. Th., 1980. A closed form equation for
#' predicting the hydraulic conductivity of unsaturated soils.  Soil Science
#' Society of America Journal, 44:892-898.  Mualem Y., 1976. A new model for
#' predicting the hydraulic conductivity of unsaturated porous media. Water
#' Resources Research, 12:513-522.  Kutilek M. & Nielsen D.R., 1994. Soil
#' hydrology.  Catena-Verlag, GeoEcology textbook, Germany. ISBN:
#' 9-923381-26-3., 370 p.
#'@examples
#' require( "soilwaterfun" ) 
#' 
#' # Example with the properties of the Footprint soil type P22i, 
#' # 3rd layer:
#' conductivityVGTension( 
#'     h       = c(0,0.01,0.1,1,10,100,158),  # [m] 
#'     Ks      = 0.2827612,                   # [m.day-1] 
#'     alpha   = 3.561099,                    # [m-1] 
#'     n       = 1.212074                     # [-] 
#' )   #
#' 
#' curve( 
#'     conductivityVGTension( 
#'         h       = x, 
#'         Ks      = 28.27612, 
#'         alpha   = 3.561099, 
#'         n       = 1.212074  
#'     ),  #
#'     xlim = c(0.001,158), 
#'     col  = "red", 
#'     log  = "xy", 
#'     xlab = "h, pressure head [m]", 
#'     ylab = "K [m.day-1]" 
#' )   #
#' 
conductivityVGTension <- function(# Mualem (1976) & van Genuchten (1980)'s function K(h) (hydraulic conductivity). 
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
### Vector of numerical. Pressure head of the soil, in [m]. Matrix 
### potential values will also work, as in practice abs(h) is used.

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
    Se <- relativeSaturationVGTension( 
        h     = h, 
        alpha = alpha, 
        n     = n,
        cPar  = cPar  
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


