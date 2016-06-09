\name{classPtf.wosten}
\alias{classPtf.wosten}
\title{Wosten et al. 1999 class PTF for all Mualem - van Genuchten functions' parameters.}
\description{Function that calculates all the parameters of the van Genuchten 
and Mualem - van Genuchten water retention and hydraulic 
conductivity functions using the complete set of _class_ PTFs 
created by Woesten et al. 1999. This version of the PTFs uses 
lookup values calculated for different texture classes of the 
FAO texture triangle. Texture classes abbreviation can either 
be provided directly by the user or calculated from the clay, 
silt and sand content. The code is vectorised (works on several 
soil samples at a time).}
\usage{classPtf.wosten(soilprop, units, dat.css.ps.lim = NULL, 
    css.transf = FALSE, text.transf.fun = NULL, trsf.add.opt1 = NULL, 
    trsf.add.opt2 = NULL, text.tol = NULL, tri.sum.tst = NULL, 
    tri.pos.tst = NULL, texture2xy = FALSE, package = "soilwaterptf")}
\arguments{
  \item{soilprop}{matrix or data.frame, with 2 to 5 columns: 
\itemize{ 
\item "textureClass", abbreviation of the texture class according 
to the FAO texture triangle (with silt-sand limit at 50
micrometers). These abbreviations must be chosen according 
to those used in the package \pkg{soiltexture}: "VF" 
for very fine, "F" for fine, "MF" for medium fine, "M" 
for medium and "C" for coarse. If _any_ of the "textureClass" 
value is NA, then the function looks for columns "clay", 
"silt" and "sand" in soilProp and calculates the textureClass 
from them using the package \pkg{soiltexture}.
\item "isOrganic", set to 1 if the layer is an organic layer, 
like FAO "O" and "H" Master horizon designations, and 0 
otherwise; 
\item "clay", Clay content [\%] of each soil layer / horizon. 
0-2 micrometers. Not needed if the "textureClass" is 
not NA; 
\item "silt", Silt content [\%] of each soil layer / horizon. 
2-50 micrometersNot needed if the "textureClass" is 
not NA; 
\item "sand", Sand content [\%] of each soil layer / horizon. 
50-2000 micrometersNot needed if the "textureClass" is 
not NA.
} 
Notice that if clay silt sand texture data are used to define 
textureClass and if a given sample lies precisely on the edge 
or on a vertice between 2 or more texture classes, then only 
one texture class will be chosen, according to the priority 
"VF" > "F" > "M" > "MF" > "C" (which is the order of the classes 
given by 
\code{names( soiltexture:::TT.get("FAO50.TT")[["tt.polygons"]] )}). }
  \item{units}{Vector of 3 character strings. [Volumic water content], [length] 
and [time] units in which the calculated parameters must be 
outputed. 
\itemize{ 
\item The fist item is the [Volumic water content] unit, 
and its possible values are "-" (m3 of water . m-3 of 
bulk soil, between 0 and 1) or "\%" (percent of water, 
between 0 and 100). It is used for the thetaS parameter. 
\item The second item is the [time] unit, and its possible 
values are "mm", "cm" or "m". It is used for the alpha 
and kSat parameters. 
\item The third item is the [time] unit, and its possible 
values are "sec", "min", "hour", "day".
}
At the moment, \code{units} must be provided by the user. In 
the near future, its default value should be set to 
\code{c("-","cm","day")}, as in Wosten et al. 1999 article.}
  \item{dat.css.ps.lim}{Vector of 4 numericals. Set this and \code{css.transf} if 
your texture data are not in a particle size classes system with 
a silt-sand limit at 50 micrometers. See 
\code{\link[soiltexture]{TT.points.in.classes}} for details.}
  \item{css.transf}{Single logical. Set to TRUE of you want to transform the soil 
texture data into a system with a 50 micrometers limit between 
silt and sand. See \code{\link[soiltexture]{TT.points.in.classes}} 
for details.}
  \item{text.transf.fun}{See \code{\link[soiltexture]{TT.points.in.classes}} for details.}
  \item{trsf.add.opt1}{Non pre-defined format. See \code{\link[soiltexture]{TT.points.in.classes}} 
for details.}
  \item{trsf.add.opt2}{Non pre-defined format. See \code{\link[soiltexture]{TT.points.in.classes}} 
for details.}
  \item{text.tol}{Single numerical. See \code{\link[soiltexture]{TT.points.in.classes}} 
for details.}
  \item{tri.sum.tst}{Single logical. See \code{\link[soiltexture]{TT.points.in.classes}} 
for details.}
  \item{tri.pos.tst}{Single logical. See \code{\link[soiltexture]{TT.points.in.classes}} 
for details.}
  \item{texture2xy}{Single logical. See \code{\link[soiltexture]{TT.points.in.classes}} 
for details.}
  \item{package}{Single character string. Package in which the lookup table 
containing the correspondamce between soil texture classes 
and Mualem - van Genuchten parameters will be found.}
}

\value{Returns a matrix with estimated soil physical properties, 
"thetaS", "alpha", "n", "l" and "kSat", expressed in [Volumic 
water content], [length-1], [-], [-] and [length.time-1] 
respectively, and where [Volumic water content], [length] and 
[time] are units chosen with the option \code{units}. }
\references{Wosten J.H.M., Lilly A., Nemes A., 
Le Bas C., 1999. Development and use of a database of hydraulic 
properties of European soils. Geoderma 90:169-185.}
\author{Julien Moeys [aut, cre], Till Francke [ctb]}



\seealso{The Mualem - van Genuchten functions functions are 
implemented in the package \pkg{soilwaterfun}, 
\url{https://r-forge.r-project.org/R/?group_id=863}. }
\examples{require( "soilwaterptf" ) 



### Create a (big) dummy dataset of soil properties
dtf <- expand.grid( 
    "clay"         = seq(0,50,5), 
    "silt"         = seq(0,50,5), 
    "topSoil"      = 0:1, 
    "textureClass" = as.character( NA ), 
    "isOrganic"    = 0, 
    stringsAsFactors = FALSE 
)   #

dtf <- rbind( # Add an organic layer
    dtf, 
    data.frame( 
        "clay"         = as.numeric(NA), 
        "silt"         = as.numeric(NA), 
        "topSoil"      = as.numeric(NA), 
        "textureClass" = as.character( NA ), 
        "isOrganic"    = 1, 
        stringsAsFactors = FALSE 
    )   #
)   #

dtf <- data.frame( # Add the sand column
    dtf, 
    "sand" = 100 - dtf[,"clay"] - dtf[,"silt"], 
    stringsAsFactors = FALSE 
)   #

dim( dtf ) 
head( dtf ) 
tail( dtf ) 



### Compute soil hydraulic parameters with Wosten classes PTFs:
res <- classPtf.wosten( soilprop = dtf, units = c("-","cm","day") ) 

dim(res) 
colnames( res ) 
head( res ) 
tail( res ) 

res2 <- classPtf.wosten( soilprop = dtf, units = c("\%","m","sec") ) 

dim(res2) 
colnames( res2 ) 
head( res2 ) 
tail( res2 ) 
}
