\name{fun.brooks.corey.theta.h}
\alias{fun.brooks.corey.theta.h}
\title{Brooks & Corey 1964 function for water retension, theta(h) }
\description{Brooks and Corey 1964 model for soil water retension. 
The model is: theta.e = (h/hA)^-lambda with 
theta.e = (theta - thetaR) / (thetaS - thetaR) when h < hA 
and theta = thetaS when hA <= h < 0}
\usage{fun.brooks.corey.theta.h(h, hA, thetaS, thetaR, lambda)}
\arguments{
  \item{h}{Vector of numerical. Pressure head of the soil, in [m]. Matrix 
potential values will also work, as in practice abs(h) is used.}
  \item{hA}{Single numerical. Pressure head at the air entry point [m], 
negative.}
  \item{thetaS}{Single numerical. Soil saturated water content [m3.m-3].}
  \item{thetaR}{Single numerical. Soil residual water content [m3.m-3].}
  \item{lambda}{Single numerical. Brook & Corey lambda (shape) parameter [-] 
(pore size distribution index, approx. from 2 to 5, after 
Kutilek & Nielsen 1994, p. 77). Values reported by Rawls 2004 
(Dev in Soil Sci. 30, chap 23) are somewhat different, ranging 
between 0.127 and 0.694... }
}

\value{Returns a vector of numericals, theta [m3.m-3] for each h 
values provided.}
\references{Brooks & Corey, 1964. Hydraulic properties of porous 
media. Colorado State University, Fort Collins, USA. Hydrology 
paper, 3; 

Kutilek M. & Nielsen D.R., 1994. Soil hydrology. Catena-Verlag, 
GeoEcology textbook, Germany. ISBN : 9-923381-26-3., 370 p.}
\author{Julien MOEYS <jules_m78-soiltexture@yahoo.fr>}




\examples{require( "soilwaterfun" ) 

fun.brooks.corey.theta.h( 
    h       = c(0,0.01,0.1,1,10,100,158),  # [m] 
    hA      = 0.01,                        # [m]
    thetaS  = 0.5,                         # [-]
    thetaR  = 0.1,                         # [-]
    lambda  = 3                            # [-]
)   #

curve( 
    fun.brooks.corey.theta.h( 
        h       = x, 
        hA      = 0.01, 
        thetaS  = 0.5, 
        thetaR  = 0.1, 
        lambda  = 3 
    ), 
    xlim = c(0.001,158), 
    col  = "red", 
    log  = "x", 
    xlab = "h, pressure head", 
    ylab = expression( theta )
)   #
abline( v = 0.01 )}
