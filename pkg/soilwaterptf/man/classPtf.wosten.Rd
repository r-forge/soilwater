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
\usage{
classPtf.wosten(soilprop, dat.css.ps.lim = NULL, css.transf = FALSE, text.transf.fun = NULL, trsf.add.opt1 = NULL, trsf.add.opt2 = NULL, text.tol = NULL, tri.sum.tst = NULL, tri.pos.tst = NULL, texture2xy = FALSE)
}
\arguments{
  \item{soilprop}{matrix or data.frame, with 2 to 5 columns: 
\enumerate{ 
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
}

\value{Returns a matrix with estimated soil physical properties, 
"thetaS", "alpha", "n", "l" and "kSat", espressed in [m3.m-3], 
[m-1], [-], [-] and [mm.h-1] respectively. thetaS, alpha, n, 
l and ksat.}
\references{Wosten J.H.M., Lilly A., Nemes A., 
Le Bas C., 1999. Development and use of a database of hydraulic 
properties of European soils. Geoderma 90:169-185.}
\author{Julien MOEYS <jules_m78-soiltexture@yahoo.fr>}



\seealso{The Mualem - van Genuchten functions functions are 
implemented in the package \pkg{soilwaterfun}, 
\url{https://r-forge.r-project.org/R/?group_id=863}. }

