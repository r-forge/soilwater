\name{fun.mualem.vangenuchten.K.h}
\alias{fun.mualem.vangenuchten.K.h}
\title{Mualem (1976) & van Genuchten (1980)'s function K(h) (hydraulic conductivity). }
\description{Calculate soil hydraulic conductivity at a given tension h 
with the Mualem - Van Genuchten function.}
\usage{
fun.mualem.vangenuchten.K.h(h, Ks, alpha, n, a = 2, b = 0.5, cPar = 1)
}
\arguments{
  \item{h}{Vector of numerical. Pressure head of the soil, in [m]. Matrix 
potential values will also work, as in practice abs(h) is used.}
  \item{Ks}{Single numerical. Saturated hydraulic conductivity of the soil 
in [L.T-1] (unit of length per unit of time). The K result is 
outputed in the same unit as Ks. Notice that in some case a 
distinction is made between K(h=0) and K(saturation), and 'Ks' 
should / may be considered as K(h=0).}
  \item{alpha}{Single numerical. alpha (shape) parameter of the Van Genuchten 
water retention function, in [m-1] (inverse length unit of h).}
  \item{n}{Single numerical. n shape parameter of the Van Genuchten water 
retention function, dimensionless [-]. See also the 'cPar' 
parameter that, along with 'n', is used to calculate van Genuchten's 
m parameter.}
  \item{a}{Single numerical. Value of the a parameter of the Mualem - Van 
Genuchten hydraulic conductivity function. Dimensionless [-]??. 
a = 2 in the Mualem formulation, and 1 in the Burdine formulation.}
  \item{b}{Single numerical. Value of the b parameter of the Mualem - Van 
Genuchten hydraulic conductivity function. Dimensionless [-]??. 
b = 0.5 in the Mualem formulation, and 2 in the Burdine formulation.
Notice that Schaaps et al.'s Rosetta 1.2 and Wosten et al. 1999 
are using the symbol 'L' (or 'l') instead of 'b'. 'b' is a 
tortuosity or connectivity parameter (Rosetta 1.2). }
  \item{cPar}{Single numerical. Value of the c parameter of the Van Genuchten 
water retention function, that allows to calculate the m parameter 
so that m = (1 - cPar/n). Dimensionless [-]. cPar = 1 in the 
Mualem formulation, and 2 in the Burdine formulation.}
}

\value{Returns K, the hydraulic conductivity (in [L.T-1], same unit 
as Ks), for each h value provided.}
\references{van Genuchten M. Th., 1980. A closed form equation 
for predicting the hydraulic conductivity of unsaturated soils. 
Soil Science Society of America Journal, 44:892-898. 
Mualem Y., 1976. A new model for predicting the hydraulic 
conductivity of unsaturated porous media. Water Resources 
Research, 12:513-522. 
Kutilek M. & Nielsen D.R., 1994. Soil hydrology. 
Catena-Verlag, GeoEcology textbook, Germany. ISBN: 
9-923381-26-3., 370 p.}
\author{Julien MOEYS <jules_m78-soiltexture@yahoo.fr>}




\examples{require( "soilwaterfun" ) 

# Example with the properties of the Footprint soil type P22i, 
# 3rd layer:
fun.mualem.vangenuchten.K.h( 
    h       = c(0,0.01,0.1,1,10,100,158),  # [m] 
    Ks      = 0.2827612,                   # [m.day-1] 
    alpha   = 3.561099,                    # [m-1] 
    n       = 1.212074                     # [-] 
)   #

curve( 
    fun.mualem.vangenuchten.K.h( 
        h       = x, 
        Ks      = 28.27612, 
        alpha   = 3.561099, 
        n       = 1.212074  
    ),  #
    xlim = c(0.001,158), 
    col  = "red", 
    log  = "xy", 
    xlab = "h, pressure head [m]", 
    ylab = "K [m.day-1]" 
)   #
}
