\name{ptf.wosten.alpha}
\alias{ptf.wosten.alpha}
\title{Wosten et al. 1999 PTF for van Genuchten 1980 alpha parameter.}
\description{Continuous pedotransfer functions to predict the alpha parameter 
of the Van Genuchten water retention function 
of a soil after its clay and silt content, bulk density, 
organic matter content and topsoil or subsoil qualifier. }
\usage{
ptf.wosten.alpha(clay, bulkD, silt, om, topSoil)
}
\arguments{
  \item{clay}{Vector of numericals. Clay content [\%] of each soil layer / 
horizon. 0-2 micrometers.}
  \item{bulkD}{Vector of numericals. Bulk density [kg.dm-3] of each soil 
layer / horizon (unit not given in the article!). }
  \item{silt}{Vector of numericals. Silt content [\%] of each soil layer / 
horizon. 2-50 micrometers. }
  \item{om}{Vector of numericals. Organic matter content [\%] of each soil layer / 
horizon. }
  \item{topSoil}{Vector of 0 or 1 integers. Set to 1 if the layer is a topsoil, 
and to 0 if it is a subsoil, for each layer / horizon.}
}

\value{The function returns a vector of alpha values of the same 
length as the vector of value provided to each parameter. 
Unit of alpha is [Length-1] (here [m-1])
alpha (validation / calibration?) R2 is 20\%.}
\references{Wosten J.H.M., Lilly A., Nemes A., 
Le Bas C., 1999. Development and use of a database of hydraulic 
properties of European soils. Geoderma 90:169-185.}
\author{Julien MOEYS <jules_m78-soiltexture@yahoo.fr>}



\seealso{\code{\link{ptf.wosten}}, }
\examples{require( "soilwaterptf" ) 

# Example with the properties of the Footprint soil type P22i:
ptf.wosten.alpha( 
    # layer no:     1    2    3    4    5    6    7    7    8 
    clay    = c(   15,  15,  16,  16,  20,  20,  25,  25,  14), 
    bulkD   = c(1.296,1.44,1.48,1.48,1.51,1.51,1.55,1.55,1.56), 
    silt    = c(   43,  43,  40,  40,  39,  39,  38,  38,  33), 
    om      = c(    2,1.23, 0.7, 0.7, 0.5, 0.5, 0.4, 0.4, 0.3) * 1.724, 
    topSoil = c(    1,   1,   0,   0,   0,   0,   0,   0,   0)  
)   #
}
