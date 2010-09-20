\name{fun.brooks.corey.theta.h}
\alias{fun.brooks.corey.theta.h}
\title{Brooks & Corey 1964 function for water retension, theta(h) }
\description{Brooks and Corey 1964 model for soil water retension. 
The model is: theta.e = (h/hA)^-lambda with 
theta.e = (theta - thetaR) / (thetaS - thetaR) when h < hA 
and theta = thetaS when hA <= h < 0}
\usage{
fun.brooks.corey.theta.h(h, hA, thetaS, thetaR, lambda)
}
\arguments{
  \item{h}{Vector of numerical. Matrix potential of the soil, in [m]. 
Values should be negative (suction).}
  \item{hA}{Single numerical. Matrix potential at the air entry point [m], 
negative.}
  \item{thetaS}{Single numerical. Soil saturated water content [m3.m-3].}
  \item{thetaR}{Single numerical. Soil residual water content [m3.m-3].}
  \item{lambda}{Single numerical. Brook & Corey lambda (shape) parameter [-] 
(pore size distribution index, approx. from 2 to 5). }
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
    h       = seq( from = 0, to = -10, by = -0.1 ), 
    hA      = -0.01, 
    thetaS  = 0.5, 
    thetaR  = 0.1, 
    lambda  = 3 
)   #

curve( 
    fun.brooks.corey.theta.h( 
        h       = -x, 
        hA      = -0.01, 
        thetaS  = 0.5, 
        thetaR  = 0.1, 
        lambda  = 3 
    ), 
    xlim = c(0.001,10), 
    col  = "red", 
    log  = "x", 
    xlab = "-h", 
    ylab = expression( theta )
)   #
abline( v = 0.01 )}
