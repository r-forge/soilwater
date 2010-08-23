# source( "C:\_MACRO_SE\pedometrics\soilwaterfun\trunk\soilwaterfun\R\soilwaterfun.R" ) 
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

# Language & Software environment: R. 
# See ..\DESCRIPTION for more details

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #






fun.pF2h <- function(# Converts pF to h
### Function that converts pF values into a matrix poential (in 
### meters [m]).

 pF
### Vector of numericals. pF values to be converted.

){  #
    return( (-10^pF)/100 ) 
### Returns a vector of matrix potential value [m] (numericals), 
### negative (succion).
}   #






fun.h2pF <- function(# Converts h to pF
### Function that converts matrix potential values [m] into pF values

 h
### Vector of numericals. Matrix potential values to be converted [m]
### (negative values. Succion).

){  #
    return( log10(-h*100) ) 
### Returns a vector of pF values (numericals) 
}   #
