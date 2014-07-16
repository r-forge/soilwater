# source( "C:\_MACRO_SE\pedometrics\soilwaterfun\trunk\soilwaterfun\R\brooks.corey.R" ) 
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

# Language & Software environment: R. 
# See ..\DESCRIPTION for more details

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #








#' Campbell 1974 function for water retension, theta(h)
#' 
#' Function that calculates soil water content theta after Campbell 1974
#' equation, a simplification of Brooks and Corey 1964 equation used in
#' fun.brooks.corey.theta.h(), with thetaR fixed to 0. The model is: theta /
#' thetaS = (h/hA)^-(1/bPar) when h < hA and theta = thetaS when hA <= h < 0
#' The advantage of Campbell's model is that it uses the same bPar parameter
#' for both the water retention curve and the hydraulic conductivity.
#' 
#' 
#' @param h Vector of numerical. Pressure head of the soil, in [m]. Matrix
#' potential values will also work, as in practice abs(h) is used.
#' @param hA Single numerical. Matrix potential at the air entry point [m3.m-3]
#' @param thetaS Single numerical. Soil saturated water content [m3.m-3].
#' @param bPar Single numerical. Campbell 'b' (shape) parameter (corresponds to
#' 1/lambda, where lambda is Brooks & Corey pore size distribution index).
#' @return Returns a vector of numericals, theta [m3.m-3] for each h values
#' provided.
#' @author Julien MOEYS <jules_m78-soiltexture@@yahoo.fr>
#' @references Brooks & Corey, 1964. Hydraulic properties of porous media.
#' Colorado State University, Fort Collins, USA. Hydrology paper, 3;
#' 
#' Kutilek M. & Nielsen D.R., 1994. Soil hydrology. Catena-Verlag, GeoEcology
#' textbook, Germany. ISBN : 9-923381-26-3., 370 p.
#' 
#' Campbell, 1974. A simple-method for determining unsaturated conductivity
#' from moisture retention data.  Soil Science 117:6. pp. 311-314
#' @examples
#' require("soilwaterfun") 
#' 
#' fun.campbell.theta.h( 
#'     h       = c(0,0.01,0.1,1,10,100,158),  # [m] 
#'     hA      = 0.01,                        # [m]
#'     thetaS  = 0.5,                         # [-]
#'     bPar    = 1/3                          # [-] 
#' )   #
#' 
#' curve( 
#'     fun.campbell.theta.h( 
#'         h       = x, 
#'         hA      = 0.01, 
#'         thetaS  = 0.5, 
#'         bPar    = 1/3 
#'     ), 
#'     xlim = c(0.001,158), 
#'     log  = "x", 
#'     xlab = "h, pressure head", 
#'     ylab = expression( theta )
#' )   #
#' abline( v = 0.01 )
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
##references<<Kutilek M. & Nielsen D.R., 1994. Soil hydrology. Catena-Verlag, 
## GeoEcology textbook, Germany. ISBN : 9-923381-26-3., 370 p.
##references<<Campbell, 1974. A simple-method for determining 
## unsaturated conductivity from moisture retention data. 
## Soil Science 117:6. pp. 311-314 

 h,
### Vector of numerical. Pressure head of the soil, in [m]. Matrix 
### potential values will also work, as in practice abs(h) is used.

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








#' Campbell 1974 function for hydraulic conductivity, K(theta)
#' 
#' Function that calculates soil hydraulic conductivity K after Campbell 1974
#' equation, as a function of theta. The model is: K = Ks *
#' ((theta/thetaS)^(2*bPar + 3)) The advantage of Campbell's model is that it
#' uses the same bPar parameter for both the water retention curve and the
#' hydraulic conductivity.
#' 
#' 
#' @param theta Vector of numerical. Soil water content(s) in [m3.m-3].
#' @param thetaS Single numerical. Soil saturated water content [m3.m-3].
#' @param Ks Single numerical. Soil saturated hydraulic conductivity. In length
#' unit per unit of time [L.T-1] (the unit in which K is resturned is the same
#' as the unit in which Ks is given).
#' @param bPar Single numerical. Campbell 'b' (shape) parameter, same as in
#' fun.campbell.theta.h().
#' @return Returns a vector of numericals, K [L.T-1] for each theta values
#' provided.
#' @author Julien MOEYS <jules_m78-soiltexture@@yahoo.fr>
#' @references Brooks & Corey, 1964. Hydraulic properties of porous media.
#' Colorado State University, Fort Collins, USA. Hydrology paper, 3;
#' 
#' Kutilek M. & Nielsen D.R., 1994. Soil hydrology. Catena-Verlag, GeoEcology
#' textbook, Germany. ISBN : 9-923381-26-3., 370 p.
#' 
#' Campbell, 1974. A simple-method for determining unsaturated conductivity
#' from moisture retention data.  Soil Science 117:6. pp. 311-314
#' @examples
#' require("soilwaterfun") 
#' 
#' fun.campbell.K.theta( 
#'     theta   = seq(from=0,to=0.5,by=0.1),   # [-]
#'     thetaS  = 0.5,                         # [-]
#'     Ks      = 0.10,                        # [m.d-1]
#'     bPar    = 1/3                          # [-]
#' )   #
#' 
#' curve( 
#'     fun.campbell.K.theta( 
#'         theta   = x, 
#'         thetaS  = 0.5, 
#'         Ks      = 10, 
#'         bPar    = 1/3 
#'     ),  #
#'     xlim = c(0.01,0.5), 
#'     col  = "red", 
#'     log  = "y", 
#'     xlab = expression( theta ), 
#'     ylab = "K"
#' )   #
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
##references<<Kutilek M. & Nielsen D.R., 1994. Soil hydrology. Catena-Verlag, 
## GeoEcology textbook, Germany. ISBN : 9-923381-26-3., 370 p.
##references<<Campbell, 1974. A simple-method for determining 
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








#' Campbell 1974 function for hydraulic conductivity, K(h)
#' 
#' Function that calculates soil hydraulic conductivity K after Campbell 1974
#' equation, as a function of h.  This uses Campbell K(theta) equation
#' presented in fun.campbell.K.theta(), but theta is here replaced by h, using
#' Campbell simplification of Brooks & Corey water retention's curve. The model
#' is: K = Ks * ((h/hA)^-(2+3/bPar)) The advantage of Campbell's model is that
#' it uses the same bPar parameter for both the water retention curve and the
#' hydraulic conductivity. 'm' parameter in Brooks & Corey's model is equal to
#' 2+3/bPar.
#' 
#' 
#' @param h Vector of numerical. Pressure head of the soil, in [m]. Matrix
#' potential values will also work, as in practice abs(h) is used.
#' @param hA Single numerical. Pressure head at the air entry point [m3.m-3]
#' @param Ks Single numerical. Soil saturated hydraulic conductivity. In length
#' unit per unit of time [L.T-1] (the unit in which K is resturned is the same
#' as the unit in which Ks is given).
#' @param bPar Single numerical. Campbell 'b' (shape) parameter, same as in
#' fun.campbell.theta.h().
#' @return Returns a vector of numericals, K [L.T-1] for each h values
#' provided.
#' @author Julien MOEYS <jules_m78-soiltexture@@yahoo.fr>
#' @references Brooks & Corey, 1964. Hydraulic properties of porous media.
#' Colorado State University, Fort Collins, USA. Hydrology paper, 3;
#' 
#' Kutilek M. & Nielsen D.R., 1994. Soil hydrology. Catena-Verlag, GeoEcology
#' textbook, Germany. ISBN : 9-923381-26-3., 370 p.
#' 
#' Campbell, 1974. A simple-method for determining unsaturated conductivity
#' from moisture retention data.  Soil Science 117:6. pp. 311-314
#' @examples
#' require("soilwaterfun") 
#' 
#' fun.campbell.K.h( 
#'     h       = c(0,0.01,0.1,1,10,100,158),  # [m] 
#'     hA      = 0.01,                        # [m]
#'     Ks      = 0.10,                        # [m.d-1]
#'     bPar    = 1/3 
#' )   #
#' 
#' curve( 
#'     fun.campbell.K.h( 
#'         h       = x, 
#'         hA      = 0.01, 
#'         Ks      = 0.10, 
#'         bPar    = 1/3 
#'     ),  #
#'     xlim = c(0.001,158), 
#'     col  = "red", 
#'     log  = "xy", 
#'     xlab = "h, pressure head", 
#'     ylab = "K, hydraulic conductivity"
#' )   #
#' abline( v = 0.01 ) 
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
##references<<Kutilek M. & Nielsen D.R., 1994. Soil hydrology. Catena-Verlag, 
## GeoEcology textbook, Germany. ISBN : 9-923381-26-3., 370 p.
##references<<Campbell, 1974. A simple-method for determining 
## unsaturated conductivity from moisture retention data. 
## Soil Science 117:6. pp. 311-314 

 h,
### Vector of numerical. Pressure head of the soil, in [m]. Matrix 
### potential values will also work, as in practice abs(h) is used.

 hA,
### Single numerical. Pressure head at the air entry point [m3.m-3]

 Ks,
### Single numerical. Soil saturated hydraulic conductivity. In 
### length unit per unit of time [L.T-1] (the unit in which K is 
### resturned is the same as the unit in which Ks is given). 

 bPar
### Single numerical. Campbell 'b' (shape) parameter, same as in 
### fun.campbell.theta.h().

){  #
    K <- Ks * ( ( abs(h) / abs(hA) )^-( 2 + 3 / bPar ) ) 
    #
    K[ abs(h) <= abs(hA) ] <- Ks 
    #
    return( K ) 
### Returns a vector of numericals, K [L.T-1] for each h 
### values provided.
}   #



