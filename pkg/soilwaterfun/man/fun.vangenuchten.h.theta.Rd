\name{fun.vangenuchten.h.theta}
\alias{fun.vangenuchten.h.theta}
\title{van Genuchten 1980's function h(theta) (water retension). }
\description{Calculate the soilwater tension h at a given water content theta 
with the Van Genuchten water retention function.}
\usage{fun.vangenuchten.h.theta(theta, alpha, n, cPar = 1, thetaS, thetaR)}
\arguments{
  \item{theta}{Vector of numerical. Water of the soil, in [m3.m-3]. }
  \item{alpha}{Single numerical. alpha (shape) parameter of the Van Genuchten 
water retention function, in [m-1] (inverse length unit of h).}
  \item{n}{Single numerical. n shape parameter of the Van Genuchten water 
retention function, dimensionless [-]. See also the 'cPar' 
parameter that, along with 'n', is used to calculate van Genuchten's 
m parameter.}
  \item{cPar}{Single numerical. Value of the c parameter of the Van Genuchten 
water retention function, that allows to calculate the m parameter 
so m = (1 - cPar/n). Dimensionless [-].}
  \item{thetaS}{Single numerical. Saturated water content of the soil, in [-] 
or [m3 of water.m-3 of bulk soil].}
  \item{thetaR}{Single numerical. Residual water content of the soil, in [-] 
or [m3 of water.m-3 of bulk soil].}
}

\value{Returns a vector of soil water tension h, negative values 
(one value per theta value provided), in the inverse unit 
of alpha (i.e. in [m] if alpha is in [m-1]).}
\references{van Genuchten M. Th., 1980. A closed form equation 
for predicting the hydraulic conductivity of unsaturated soils. 
Soil Science Society of America Journal, 44:892-898.
Kutilek M. & Nielsen D.R., 1994. Soil hydrology. 
Catena-Verlag, GeoEcology textbook, Germany. ISBN: 
9-923381-26-3., 370 p.}
\author{Julien Moeys <jules_m78-soiltexture@yahoo.fr> [aut, cre]}




\examples{require( "soilwaterfun" ) 

# Example with the properties of the Footprint soil type P22i, 
# 3rd layer:
tmp <- fun.vangenuchten.h.theta( 
    theta   = c(0.4162380,0.4149725,0.3983120,0.3073250,0.1946693,0.1197170,0.1086555), 
    alpha   = 3.561099,  # theta is [-], alpha in [m-1]
    n       = 1.212074,  # [-]
    thetaS  = 0.4162380, # [-]
    thetaR  = 0          # [-]
)   #

round( tmp, 2 ) 

curve( 
    fun.vangenuchten.h.theta( 
        theta   = x, 
        alpha   = 3.561099, 
        n       = 1.212074, 
        thetaS  = 0.4162380, 
        thetaR  = 0  
    ),  #
    xlim = c(0,0.5), 
    col  = "red", 
    log  = "y", 
    xlab = expression( theta ), 
    ylab = "h, pressure head" 
)   #
}
