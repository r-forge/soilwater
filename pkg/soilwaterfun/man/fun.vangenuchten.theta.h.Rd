\name{fun.vangenuchten.theta.h}
\alias{fun.vangenuchten.theta.h}
\title{van Genuchten 1980's function theta(h) (water retension). }
\description{Calculate the water content theta at a given tension h with 
the Van Genuchten water retention function.}
\usage{fun.vangenuchten.theta.h(h, alpha, n, cPar = 1, thetaS, thetaR)}
\arguments{
  \item{h}{Vector of numerical. Pressure head of the soil, in [m]. Matrix 
potential values will also work, as in practice abs(h) is used.}
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

\value{The function returns the water content [m3.m-3] at the given 
tension h.}
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
fun.vangenuchten.theta.h( 
    h       = c(0,0.01,0.1,1,10,100,158), # [m]
    alpha   = 3.561099,                   # [m-1]
    n       = 1.212074,                   # [-]
    thetaS  = 0.4162380,                  # [-]
    thetaR  = 0                           # [-]
)   #

curve( 
    fun.vangenuchten.theta.h( 
        h       = x, 
        alpha   = 3.561099, 
        n       = 1.212074, 
        thetaS  = 0.4162380, 
        thetaR  = 0  
    ),  #
    xlim = c(0.001,158), 
    col  = "red", 
    log  = "x", 
    xlab = "h, pressure head [m]", 
    ylab = expression( theta ) 
)   #
}
