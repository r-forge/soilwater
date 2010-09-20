\name{fun.campbell.K.theta}
\alias{fun.campbell.K.theta}
\title{Campbell 1974 function for hydraulic conductivity, K(theta) }
\description{Function that calculates soil hydraulic conductivity K after 
Campbell 1974 equation, as a function of theta.
The model is: K = Ks * ((theta/thetaS)^(2*bPar + 3)) 
The advantage of Campbell's model is that it uses the same 
bPar parameter for both the water retention curve and 
the hydraulic conductivity.}
\usage{
fun.campbell.K.theta(theta, thetaS, Ks, bPar)
}
\arguments{
  \item{theta}{Vector of numerical. Soil water content(s) in [m3.m-3].}
  \item{thetaS}{Single numerical. Soil saturated water content [m3.m-3].}
  \item{Ks}{Single numerical. Soil saturated hydraulic conductivity. In 
length unit per unit of time [L.T-1] (the unit in which K is 
resturned is the same as the unit in which Ks is given). }
  \item{bPar}{Single numerical. Campbell 'b' (shape) parameter, same as in 
fun.campbell.theta.h().}
}

\value{Returns a vector of numericals, K [L.T-1] for each theta 
values provided.}
\references{Brooks & Corey, 1964. Hydraulic properties of porous 
media. Colorado State University, Fort Collins, USA. Hydrology 
paper, 3; 
Kutilek M. & Nielsen D.R., 1994. Soil hydrology. Catena-Verlag, 
GeoEcology textbook, Germany. ISBN : 9-923381-26-3., 370 p.
Campbell, 1974. A simple-method for determining 
unsaturated conductivity from moisture retention data. 
Soil Science 117:6. pp. 311-314 }
\author{Julien MOEYS <jules_m78-soiltexture@yahoo.fr>}




\examples{require("soilwaterfun") 

fun.campbell.K.theta( 
    theta   = seq(from=0,to=0.5,by=0.1), 
    thetaS  = 0.5, 
    Ks      = 10, 
    bPar    = 1/3 
)   #

curve( 
    fun.campbell.K.theta( 
        theta   = x, 
        thetaS  = 0.5, 
        Ks      = 10, 
        bPar    = 1/3 
    ),  #
    xlim = c(0.01,0.5), 
    col  = "red", 
    log  = "y", 
    xlab = expression( theta ), 
    ylab = "K"
)   #}
