\name{ptf.wosten.theta.s}
\alias{ptf.wosten.theta.s}
\title{Wosten et al. 1999 PTF for soil's saturated water content.}
\description{Continuous pedotransfer functions to predict the saturated 
water content (THETA_S) of a soil after its clay and silt 
content, bulk density, organic matter content and topsoil or 
subsoil qualifier. }
\usage{
ptf.wosten.theta.s(CLAY, BULKD, SILT, OM, topsoil)
}
\arguments{
  \item{CLAY}{Vector of numericals. Clay content [\%] of each soil layer / 
horizon. 0-2 micrometers. }
  \item{BULKD}{Vector of numericals. Bulk density [kg.dm-3] of each soil 
layer / horizon (unit not given in the article!). }
  \item{SILT}{Vector of numericals. Silt content [\%] of each soil layer / 
horizon. 2-50 micrometers. }
  \item{OM}{Vector of numericals. Organic matter content [\%] of each soil layer / 
horizon. }
  \item{topsoil}{Vector of 0 or 1 integers. Set to 1 if the layer is a topsoil, 
and to 0 if it is a subsoil, for each layer / horizon.}
}

\value{The function returns a vector of theta_s values of the same 
length as the vector of value provided to each parameter. 
Unit of theta_s is [-] or [m3 of water.m-3 of bulk soil].}
\references{Wosten J.H.M., Lilly A., Nemes A., 
Le Bas C., 1999. Development and use of a database of hydraulic 
properties of European soils. Geoderma 90:169-185.}
\author{Julien MOEYS <jules_m78-soiltexture@yahoo.fr>}




\examples{require( "soilwaterptf" ) 

# Example with the properties of the Footprint soil type P22i:
ptf.wosten.theta.s( 
    # layer no:     1    2    3    4    5    6    7    7    8 
    CLAY    = c(   15,  15,  16,  16,  20,  20,  25,  25,  14), 
    BULKD   = c(1.296,1.44,1.48,1.48,1.51,1.51,1.55,1.55,1.56), 
    SILT    = c(   43,  43,  40,  40,  39,  39,  38,  38,  33), 
    OM      = c(    2,1.23, 0.7, 0.7, 0.5, 0.5, 0.4, 0.4, 0.3) * 1.724, 
    topsoil = c(    1,   1,   0,   0,   0,   0,   0,   0,   0)  
)   #}
