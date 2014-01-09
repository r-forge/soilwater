# source( "C:\_MACRO_SE\pedometrics\soilwaterfun\trunk\soilwaterfun\R\soilwaterfun.R" ) 
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

# Language & Software environment: R. 
# See ..\DESCRIPTION for more details

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #






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


