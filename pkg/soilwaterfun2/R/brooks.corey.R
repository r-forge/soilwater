# source( "C:\_MACRO_SE\pedometrics\soilwaterfun\trunk\soilwaterfun\R\brooks.corey.R" ) 
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

# Language & Software environment: R. 
# See ..\DESCRIPTION for more details

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #








#' Brooks & Corey 1964 function for water retension, theta(h)
#' 
#' Brooks and Corey 1964 model for soil water retension.  The model is: theta.e
#' = (h/hA)^-lambda with theta.e = (theta - thetaR) / (thetaS - thetaR) when h
#' < hA and theta = thetaS when hA <= h < 0
#' 
#' 
#' @param h Vector of numerical. Pressure head of the soil, in [m]. Matrix
#' potential values will also work, as in practice abs(h) is used.
#' @param hA Single numerical. Pressure head at the air entry point [m],
#' negative.
#' @param thetaS Single numerical. Soil saturated water content [m3.m-3].
#' @param thetaR Single numerical. Soil residual water content [m3.m-3].
#' @param lambda Single numerical. Brook & Corey lambda (shape) parameter [-]
#' (pore size distribution index, approx. from 2 to 5, after Kutilek & Nielsen
#' 1994, p. 77). Values reported by Rawls 2004 (Dev in Soil Sci. 30, chap 23)
#' are somewhat different, ranging between 0.127 and 0.694...
#' @return Returns a vector of numericals, theta [m3.m-3] for each h values
#' provided.
#' @author Julien MOEYS <jules_m78-soiltexture@@yahoo.fr>
#' @references Brooks & Corey, 1964. Hydraulic properties of porous media.
#' Colorado State University, Fort Collins, USA. Hydrology paper, 3;
#' 
#' Kutilek M. & Nielsen D.R., 1994. Soil hydrology. Catena-Verlag, GeoEcology
#' textbook, Germany. ISBN : 9-923381-26-3., 370 p.
#' @examples
#' require( "soilwaterfun" ) 
#' 
#' fun.brooks.corey.theta.h( 
#'     h       = c(0,0.01,0.1,1,10,100,158),  # [m] 
#'     hA      = 0.01,                        # [m]
#'     thetaS  = 0.5,                         # [-]
#'     thetaR  = 0.1,                         # [-]
#'     lambda  = 3                            # [-]
#' )   #
#' 
#' curve( 
#'     fun.brooks.corey.theta.h( 
#'         h       = x, 
#'         hA      = 0.01, 
#'         thetaS  = 0.5, 
#'         thetaR  = 0.1, 
#'         lambda  = 3 
#'     ), 
#'     xlim = c(0.001,158), 
#'     col  = "red", 
#'     log  = "x", 
#'     xlab = "h, pressure head", 
#'     ylab = expression( theta )
#' )   #
#' abline( v = 0.01 )
fun.brooks.corey.theta.h <- function(# Brooks & Corey 1964 function for water retension, theta(h) 
### Brooks and Corey 1964 model for soil water retension. 
### The model is: theta.e = (h/hA)^-lambda with 
### theta.e = (theta - thetaR) / (thetaS - thetaR) when h < hA 
### and theta = thetaS when hA <= h < 0
##references<<Brooks & Corey, 1964. Hydraulic properties of porous 
## media. Colorado State University, Fort Collins, USA. Hydrology 
## paper, 3; 
##references<<Kutilek M. & Nielsen D.R., 1994. Soil hydrology. Catena-Verlag, 
## GeoEcology textbook, Germany. ISBN : 9-923381-26-3., 370 p.

 h,
### Vector of numerical. Pressure head of the soil, in [m]. Matrix 
### potential values will also work, as in practice abs(h) is used.

 hA,
### Single numerical. Pressure head at the air entry point [m], 
### negative.

 thetaS,
### Single numerical. Soil saturated water content [m3.m-3].

 thetaR,
### Single numerical. Soil residual water content [m3.m-3].

 lambda
### Single numerical. Brook & Corey lambda (shape) parameter [-] 
### (pore size distribution index, approx. from 2 to 5, after 
### Kutilek & Nielsen 1994, p. 77). Values reported by Rawls 2004 
### (Dev in Soil Sci. 30, chap 23) are somewhat different, ranging 
### between 0.127 and 0.694... 

){  #
    theta.e <- ( abs(h) / abs(hA) )^-lambda 
    #
    theta <- theta.e * (thetaS - thetaR) + thetaR 
    #
    theta[ abs(h) <= abs(hA) ] <- thetaS 
    #
    return( theta ) 
### Returns a vector of numericals, theta [m3.m-3] for each h 
### values provided.
}   #








#' Brooks & Corey 1964 function for hydraulic conductivity, K(h)
#' 
#' Brooks and Corey 1964 model for soil hydraulic conductivity.  The model is:
#' K / Ks = (h/hA)^-m when h < hA and K = Ks when hA <= h < 0
#' 
#' 
#' @param h Vector of numerical. Pressure head of the soil, in [m]. Matrix
#' potential values will also work, as in practice abs(h) is used.
#' @param hA Single numerical. Pressure head at the air entry point [m3.m-3]
#' @param Ks Single numerical. Soil saturated hydraulic conductivity. In length
#' unit per unit of time [L.T-1] (the unit in which K is resturned is the same
#' as the unit in which Ks is given).
#' @param m Single numerical. Brook & Corey m (shape) parameter [-] (depend on
#' the pore size distribution. approx. from 3 to 11).
#' @return Returns a vector of numericals, K values [L.T-1] (same unit as Ks)
#' for each h values provided.
#' @author Julien MOEYS <jules_m78-soiltexture@@yahoo.fr>
#' @references Brooks & Corey, 1964. Hydraulic properties of porous media.
#' Colorado State University, Fort Collins, USA. Hydrology paper, 3;
#' 
#' Kutilek M. & Nielsen D.R., 1994. Soil hydrology. Catena-Verlag, GeoEcology
#' textbook, Germany. ISBN : 9-923381-26-3., 370 p.
#' @examples
#' require("soilwaterfun") 
#' 
#' fun.brooks.corey.K.h( 
#'     h       = c(0,0.01,0.1,1,10,100,158),  # [m] 
#'     hA      = 0.01,                        # [m]
#'     Ks      = 0.10,                        # [m.d-1]
#'     m       = 6                            # [-]
#' )   #
#' 
#' curve( 
#'     fun.brooks.corey.K.h( 
#'         h       = x, 
#'         hA      = 0.01, 
#'         Ks      = 0.10, 
#'         m       = 6 
#'     ),  #
#'     xlim = c(0.001,158), 
#'     col  = "red", 
#'     log  = "xy", 
#'     xlab = "h, pressure head", 
#'     ylab = "K"
#' )   #
#' abline( v = 0.01 )
fun.brooks.corey.K.h <- function(# Brooks & Corey 1964 function for hydraulic conductivity, K(h) 
### Brooks and Corey 1964 model for soil hydraulic conductivity. 
### The model is: K / Ks = (h/hA)^-m when h < hA 
### and K = Ks when hA <= h < 0
##references<<Brooks & Corey, 1964. Hydraulic properties of porous 
## media. Colorado State University, Fort Collins, USA. Hydrology 
## paper, 3; 
##references<<Kutilek M. & Nielsen D.R., 1994. Soil hydrology. Catena-Verlag, 
## GeoEcology textbook, Germany. ISBN : 9-923381-26-3., 370 p.

 h,
### Vector of numerical. Pressure head of the soil, in [m]. Matrix 
### potential values will also work, as in practice abs(h) is used.

 hA,
### Single numerical. Pressure head at the air entry point [m3.m-3]

 Ks,
### Single numerical. Soil saturated hydraulic conductivity. In 
### length unit per unit of time [L.T-1] (the unit in which K is 
### resturned is the same as the unit in which Ks is given). 

 m
### Single numerical. Brook & Corey m (shape) parameter [-] 
### (depend on the pore size distribution. approx. from 3 to 11). 

){  #
    K <- Ks * (( abs(h) / abs(hA) )^-m) 
    #
    K[ abs(h) <= abs(hA) ] <- Ks 
    #
    return( K ) 
### Returns a vector of numericals, K values [L.T-1] (same unit as 
### Ks) for each h values provided.
}   #


