\name{ptf.wosten}
\alias{ptf.wosten}
\title{Wosten et al. 1999 PTF for all Mualem - van Genuchten functions' parameters.}
\description{Function that calculates all the parameters of the van Genuchten 
and Mualem - van Genuchten water retention and hydraulic 
conductivity functions using the complete set of PTFs created 
by Woesten et al. 1999. The code uses either R code or Fortran 
code to do the calculations, and is vectorised (works on several 
soil samples at a time) }
\usage{
ptf.wosten(soilprop, units, fortran.c = TRUE, fortran.lib = "soilwaterptf.dll", package = "soilwaterptf")
}
\arguments{
  \item{soilprop}{matrix or data.frame, with 5 columns: 
\itemize{ 
  \item "clay", Clay content [\%] of each soil layer / horizon. 
        0-2 micrometers.; 
  \item "bulkD", Bulk density [kg.dm-3] of each soil layer / 
        horizon;  
  \item "silt", Silt content [\%] of each soil layer / horizon. 
        2-50 micrometers; 
  \item "om", Organic matter content [\%] of each soil layer / 
        horizon; 
  \item "topSoil", Set to 1 if the layer is a topsoil, and to 
        0 if it is a subsoil, for each layer / horizon.
} }
  \item{units}{Vector of 3 character strings. [Volumic water content], [length] 
and [time] units in which the calculated parameters must be 
outputed. 
\itemize{ 
  \item The fist item is the [Volumic water content] unit, 
        and its possible values are "-" (m3 of water . m-3 of 
        bulk soil, between 0 and 1) or "\%" (percent of water, 
        between 0 and 100). It is used for the thetaS parameter. 
  \item The second item is the [time] unit, and its possible 
        values are "mm", "cm" or "m". It is used for the alpha 
        and kSat parameters. 
  \item The third item is the [time] unit, and its possible 
        values are "sec", "min", "hour", "day".
}
At the moment, \code{units} must be provided by the user. In 
the near future, its default value should be set to 
\code{c("-","cm","day")}, as in Wosten et al. 1999 article.
Warning: A bug in the code erroneously reported a default kSat 
unit output in [mm.h-1], while its real unit is [cm.day-1].}
  \item{fortran.c}{Single logical. If TRUE uses fortran code instead od R code 
(presumably faster).}
  \item{fortran.lib}{Single character string. Internal. Name of the dll that contains 
the .Fortran sub-routine.}
  \item{package}{Single character string. Internal. Name of the package that 
contains the dll.}
}

\value{Returns a matrix with estimated soil physical properties, 
"thetaS", "alpha", "n", "l" and "kSat", expressed in [Volumic 
water content], [length-1], [-], [-] and [length.time-1] 
respectively, and where [Volumic water content], [length] and 
[time] are units chosen with the option \code{units}. 
Warning: A bug in the code erroneously reported a default kSat 
unit output in [mm.h-1], while its real unit is [cm.day-1]. 
thetaS, alpha, n, l and ksat (validation / calibration?) R2 
are 76\%, 20\%, 54\%, 12\% and 19\% respectively.}
\references{Wosten J.H.M., Lilly A., Nemes A., 
Le Bas C., 1999. Development and use of a database of hydraulic 
properties of European soils. Geoderma 90:169-185.}
\author{Julien MOEYS <jules_m78-soiltexture@yahoo.fr>}



\seealso{The Mualem - van Genuchten functions functions are 
implemented in the package \pkg{soilwaterfun}, 
\url{https://r-forge.r-project.org/R/?group_id=863}. }
\examples{require( "soilwaterptf" ) 



# Create a (big) dummy dataset of soil properties
dtf <- expand.grid( 
    "clay"    = seq(5,50,1), 
    "bulkD"   = seq(1,1.8,.2), 
    "silt"    = seq(5,50,1), 
    "om"      = seq(1,3,.2), 
    "topSoil" = 0:1   
)   #
dim( dtf ) 
head( dtf ) 
tail( dtf ) 



# Compute soil hydraulic parameters with Wosten PTFs:
#   NB: system.time() is used here to time the calculations
system.time( 
    res <- ptf.wosten( soilprop = dtf, units = c("-","cm","day") ) 
)   #

dim(res) 
head( res ) 



# Same, but with the pure R implementation
system.time( 
    res2 <- ptf.wosten( 
        soilprop  = dtf, 
        fortran.c = FALSE, 
        units     = c("-","cm","day")
    )   #
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
