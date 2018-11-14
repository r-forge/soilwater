# source( "C:\_MACRO_SE\pedometrics\soilwaterfun\trunk\soilwaterfun\R\soilwaterfun.R" ) 
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

# Language & Software environment: R. 
# See ..\DESCRIPTION for more details

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #








#' Converts pF to h
#' 
#' Function that converts pF values into a pressure head (in meters [m]).
#' 
#' 
#' @param pF Vector of numericals. pF values to be converted.
#' @return Returns a vector of pressure head value [m] (numericals), positive.
#' @author Julien MOEYS <jules_m78-soiltexture@@yahoo.fr>
#' @examples
#' require( "soilwaterfun" )
#' 
#' fun.pF2h( pF = c(0,2,4.2) ) 
fun.pF2h <- function(# Converts pF to h
### Function that converts pF values into a pressure head (in 
### meters [m]).

 pF
### Vector of numericals. pF values to be converted.

){  #
    return( (10^pF)/100 ) 
### Returns a vector of pressure head value [m] (numericals), 
### positive.
}   #








#' Converts h to pF
#' 
#' Function that converts pressure head values [m] into pF values
#' 
#' 
#' @param h Vector of numericals. Pressure head to be converted [m]. In
#' practice, matrix potential can also be used, as it abs(h) is used
#' internally.
#' @return Returns a vector of pF values (numericals)
#' @author Julien MOEYS <jules_m78-soiltexture@@yahoo.fr>
#' @examples
#' require( "soilwaterfun" )
#' 
#' fun.h2pF( h = fun.pF2h( pF = c(0,2,4.2) ) )
fun.h2pF <- function(# Converts h to pF
### Function that converts pressure head values [m] into pF values

 h
### Vector of numericals. Pressure head to be converted [m]. In 
### practice, matrix potential can also be used, as it abs(h) is 
### used internally.

){  #
    return( log10(abs(h)*100) ) 
### Returns a vector of pF values (numericals) 
}   #


