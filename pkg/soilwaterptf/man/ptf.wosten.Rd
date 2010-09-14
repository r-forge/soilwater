\name{ptf.wosten}
\alias{ptf.wosten}
\title{ptf wosten}
\description{Function that calculates all the parameters of the van Genuchten 
and Mualem - vam Genuchten water retention and hydraulic 
conductivity functions using the complete set of PTFs created 
by Woesten et al. 1999. The code uses either R code or Fortran 
code to do the calculations, and is vectorised (works on several 
soil samples at a time) }
\usage{
ptf.wosten(soilprop, fortran.c = TRUE, fortran.lib = "soilwaterptf.dll", package = "soilwaterptf")
}
\arguments{
  \item{soilprop}{matrix or data.frame, with 5 columns: "clay", "bulkD", "silt", 
"om" and "topSoil". See soilwaterptf for the units.}
  \item{fortran.c}{Single logical. If TRUE uses fortran code instead od R code 
(presumably faster).}
  \item{fortran.lib}{Single character string. Internal. Name of the dll that contains 
the .Fortran sub-routine.}
  \item{package}{Single character string. Internal. Name of the package that 
contains the dll.}
}

\value{Returns a matrix with estimated soil physical properties.}

\author{Julien MOEYS <jules_m78-soiltexture@yahoo.fr>}




\examples{require( "soilwaterptf" ) 



# Create a (big) dummy dataset of soil properties
dtf <- expand.grid( 
    "clay"    = seq(33,66,1), 
    "bulkD"   = seq(1,1.8,.2), 
    "silt"    = seq(33,66,1), 
    "om"      = seq(1,3,.2), 
    "topSoil" = 0:1   
)   #
dim( dtf ) 
head( dtf ) 
tail( dtf ) 



# Compute soil hydraulic parameters with Wosten PTFs:
#   NB: system.time() is used here to time the calculations
system.time( 
    res <- ptf.wosten( soilprop = dtf ) 
)   #

dim(res) 
head( res ) 



# Same, but with the pure R implementation
system.time( 
    res2 <- ptf.wosten( soilprop = dtf, fortran.c = FALSE ) 
)   # 

dim(res2) 
head( res2 ) 



# The result is not perfectly identical (numerical differences)
unlist( lapply( 
    X   = 1:ncol(res), 
    FUN = function(X){ 
        max( abs( res[,X] - res2[,X] ) ) 
    }   #
) ) #}
