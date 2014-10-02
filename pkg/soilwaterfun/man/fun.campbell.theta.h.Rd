\name{fun.campbell.theta.h}
\alias{fun.campbell.theta.h}
\title{Campbell 1974 function for water retension, theta(h) }
\description{Function that calculates soil water content theta after 
Campbell 1974 equation, a simplification of Brooks and Corey 
1964 equation used in fun.brooks.corey.theta.h(), with thetaR 
fixed to 0.
The model is: theta / thetaS = (h/hA)^-(1/bPar) when h < hA 
and theta = thetaS when hA <= h < 0
The advantage of Campbell's model is that it uses the same 
bPar parameter for both the water retention curve and 
the hydraulic conductivity.}
\usage{fun.campbell.theta.h(h, hA, thetaS, bPar)}
\arguments{
  \item{h}{Vector of numerical. Pressure head of the soil, in [m]. Matrix 
potential values will also work, as in practice abs(h) is used.}
  \item{hA}{Single numerical. Matrix potential at the air entry point [m3.m-3]}
  \item{thetaS}{Single numerical. Soil saturated water content [m3.m-3].}
  \item{bPar}{Single numerical. Campbell 'b' (shape) parameter (corresponds 
to 1/lambda, where lambda is Brooks & Corey pore size 
distribution index). }
}

\value{Returns a vector of numericals, theta [m3.m-3] for each h 
values provided.}
\references{Brooks & Corey, 1964. Hydraulic properties of porous 
media. Colorado State University, Fort Collins, USA. Hydrology 
paper, 3; 

Kutilek M. & Nielsen D.R., 1994. Soil hydrology. Catena-Verlag, 
GeoEcology textbook, Germany. ISBN : 9-923381-26-3., 370 p.

Campbell, 1974. A simple-method for determining 
unsaturated conductivity from moisture retention data. 
Soil Science 117:6. pp. 311-314 }
\author{Julien Moeys <jules_m78-soiltexture@yahoo.fr> [aut, cre]}




\examples{require("soilwaterfun") 

fun.campbell.theta.h( 
    h       = c(0,0.01,0.1,1,10,100,158),  # [m] 
    hA      = 0.01,                        # [m]
    thetaS  = 0.5,                         # [-]
    bPar    = 1/3                          # [-] 
)   #

curve( 
    fun.campbell.theta.h( 
        h       = x, 
        hA      = 0.01, 
        thetaS  = 0.5, 
        bPar    = 1/3 
    ), 
    xlim = c(0.001,158), 
    log  = "x", 
    xlab = "h, pressure head", 
    ylab = expression( theta )
)   #
abline( v = 0.01 )}
