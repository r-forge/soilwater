\name{fun.brooks.corey.K.h}
\alias{fun.brooks.corey.K.h}
\title{Brooks & Corey 1964 function for hydraulic conductivity, K(h) }
\description{Brooks and Corey 1964 model for soil hydraulic conductivity. 
The model is: K / Ks = (h/hA)^-m when h < hA 
and K = Ks when hA <= h < 0}
\usage{fun.brooks.corey.K.h(h, hA, Ks, m)}
\arguments{
  \item{h}{Vector of numerical. Pressure head of the soil, in [m]. Matrix 
potential values will also work, as in practice abs(h) is used.}
  \item{hA}{Single numerical. Pressure head at the air entry point [m3.m-3]}
  \item{Ks}{Single numerical. Soil saturated hydraulic conductivity. In 
length unit per unit of time [L.T-1] (the unit in which K is 
resturned is the same as the unit in which Ks is given). }
  \item{m}{Single numerical. Brook & Corey m (shape) parameter [-] 
(depend on the pore size distribution. approx. from 3 to 11). }
}

\value{Returns a vector of numericals, K values [L.T-1] (same unit as 
Ks) for each h values provided.}
\references{Brooks & Corey, 1964. Hydraulic properties of porous 
media. Colorado State University, Fort Collins, USA. Hydrology 
paper, 3; 

Kutilek M. & Nielsen D.R., 1994. Soil hydrology. Catena-Verlag, 
GeoEcology textbook, Germany. ISBN : 9-923381-26-3., 370 p.}
\author{Julien Moeys <jules_m78-soiltexture@yahoo.fr> [aut, cre]}




\examples{require("soilwaterfun") 

fun.brooks.corey.K.h( 
    h       = c(0,0.01,0.1,1,10,100,158),  # [m] 
    hA      = 0.01,                        # [m]
    Ks      = 0.10,                        # [m.d-1]
    m       = 6                            # [-]
)   #

curve( 
    fun.brooks.corey.K.h( 
        h       = x, 
        hA      = 0.01, 
        Ks      = 0.10, 
        m       = 6 
    ),  #
    xlim = c(0.001,158), 
    col  = "red", 
    log  = "xy", 
    xlab = "h, pressure head", 
    ylab = "K"
)   #
abline( v = 0.01 )}
