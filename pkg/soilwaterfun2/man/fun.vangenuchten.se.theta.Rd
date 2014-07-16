\name{fun.vangenuchten.se.theta}
\alias{fun.vangenuchten.se.theta}
\title{van Genuchten 1980's function for soil relative saturation (Se=f(theta)). }
\description{Calculate the relative saturation Se of a soil at a given 
water content theta with the Van Genuchten water retention 
function.}
\usage{fun.vangenuchten.se.theta(theta, thetaR, thetaS)}
\arguments{
  \item{theta}{Vector of numerical. Water of the soil, in [m3.m-3]. }
  \item{thetaR}{Vector of numerical. Residual water content of the soil for 
the Van Genuchten water retension function, in [m3.m-3]. }
  \item{thetaS}{Vector of numerical. Saturated water content of the soil for 
the Van Genuchten water retension function, in [m3.m-3]. }
}

\value{The function returns the relative water content (degree of 
saturation, Se, [-]).}
\references{van Genuchten M. Th., 1980. A closed form equation 
for predicting the hydraulic conductivity of unsaturated soils. 
Soil Science Society of America Journal, 44:892-898.
Kutilek M. & Nielsen D.R., 1994. Soil hydrology. 
Catena-Verlag, GeoEcology textbook, Germany. ISBN: 
9-923381-26-3., 370 p.}
\author{Julien MOEYS <jules_m78-soiltexture@yahoo.fr>}




\examples{require( "soilwaterfun" ) 

# Example with the properties of the Footprint soil type P22i, 
# 3rd layer:
fun.vangenuchten.se.theta( 
    theta   = c(0.4162380,0.4149725,0.3983120,0.3073250,0.1946693,0.1197170,0.1086555), 
    thetaS  = 0.4162380, 
    thetaR  = 0 
)   #}
