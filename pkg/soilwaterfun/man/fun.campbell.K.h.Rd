\name{fun.campbell.K.h}
\alias{fun.campbell.K.h}
\title{Campbell 1974 function for hydraulic conductivity, K(h) }
\description{Function that calculates soil hydraulic conductivity K after 
Campbell 1974 equation, as a function of h. 
This uses Campbell K(theta) equation presented in fun.campbell.K.theta(), 
but theta is here replaced by h, using Campbell simplification 
of Brooks & Corey water retention's curve.
The model is: K = Ks * ((h/hA)^-(2+3/bPar)) 
The advantage of Campbell's model is that it uses the same 
bPar parameter for both the water retention curve and 
the hydraulic conductivity. 'm' parameter in Brooks & Corey's 
model is equal to 2+3/bPar.}
\usage{
fun.campbell.K.h(h, hA, Ks, bPar)
}
\arguments{
  \item{h}{Vector of numerical. Matrix potential of the soil, in [m]. 
Values should be negative (suction).}
  \item{hA}{Single numerical. Matrix potential at the air entry point [m3.m-3]}
  \item{Ks}{Single numerical. Soil saturated hydraulic conductivity. In 
length unit per unit of time [L.T-1] (the unit in which K is 
resturned is the same as the unit in which Ks is given). }
  \item{bPar}{Single numerical. Campbell 'b' (shape) parameter, same as in 
fun.campbell.theta.h().}
}

\value{Returns a vector of numericals, K [L.T-1] for each h 
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

fun.campbell.K.h( 
    h       = seq(from=0,to=-10,by=-0.1), 
    hA      = -0.01, 
    Ks      = 10, 
    bPar    = 1/3 
)   #

curve( 
    fun.campbell.K.h( 
        h       = -x, 
        hA      = -0.01, 
        Ks      = 10, 
        bPar    = 1/3 
    ),  #
    xlim = c(0.001,10), 
    col  = "red", 
    log  = "xy", 
    xlab = "-h", 
    ylab = "K"
)   #
abline( v = 0.01 ) }
