\name{pft.rawls}
\alias{pft.rawls}
\title{PTFs of Rawls and Brakensiek}
\description{estimate soil hydraulic properties (water content for different 
heads, Brooks-Corey parameters) using pedo-transfer functions 
of Rawls et al (multiple publications)}
\usage{pft.rawls(soilprop, parameters = NULL, h = NULL)}
\arguments{
  \item{soilprop}{matrix or data.frame, with 5 columns: 
\itemize{ 
\item "clay", Clay content [\\%] of each soil layer / horizon. 
0-2 micrometers.; 
\item "bulkD", Bulk density [kg.dm-3] of each soil layer / 
horizon;  
\item "silt", Silt content [\\%] of each soil layer / horizon. 
2-50 micrometers; 
\item "om", Organic matter content [\\%] of each soil layer / 
horizon
}}
  \item{parameters}{Vector of up to character strings "theta", "S_f", "theta_r", 
"h_b", "lambda", determining if the water content at 
specified suction \code{h}, the suction at wetting front or 
the Green-Ampt-parameters are to be returned.}
  \item{h}{Vector of suction heads to compute corresponding water content. 
Use positive value in cm.}
}
\details{The second order PFTs are applied to produce the requested 
output. In case of "theta", values between those given in the 
literature are interpolated. In this case, both [1] (40-100 cm) 
and [2] (200 - 15000 cm) are used because [2] does not contain 
low water contents, whereas [2] includes bulk density, which 
is not the case for [1]}
\value{data frame containing the columns "theta" [-], "S_f" [cm], 
"theta_r" [-], "h_b" [cm], "lambda" [-], depending on value of 
\code{parameter}.}
\references{Rawls WJ, Brakensiek DL (1985) Prediction of Soil 
Water Properties for Hydrologic Modeling. Watershed Management 
in the Eighties, ASCE, pp. 293-299. Taken from: Rawls WJ et. al 
(1993) Infiltration and Soil Water movement. In: Maidment DR(ed): 
Handbook of Hydrology, pp. 5.1-5.51. McGraw-Hill, New York, USA.

Rawls, WJ, Brakensiek, DL, Soni, B  (1983) Agricultural management 
effects on soil water processes. Part I. Soil water retention 
and Green-Ampt parameters. Trans. ASAE 26:1747-1752. Taken from 
Guber, AK et al (2010) Multimodeling with Pedotransfer Functions. 
Documentation and User Manual for PTF Calculator (CalcPTF) 
Version 2.0. Table 5, URL: http://ars.usda.gov/SP2UserFiles/ad_hoc/12655300EnvironmentalTransport/CalcPTFFiles/PTF_Manual.version_2.0.pdf, 
retrieved July, 2014

Rawls WJ et. al (1993) Infiltration and Soil Water movement. 
In: Maidment DR(ed): Handbook of Hydrology, pp. 5.1-5.51. 
McGraw-Hill, New York, USA.}
\author{Till Francke <francke AT uni-potsdam.de>
Julien Moeys [aut, cre], Till Francke [ctb] <francke@uni-potsdam.de>}



\seealso{\code{\link[soilwaterptf]{ptf.wosten}}.}
\examples{
library( "soilwaterptf" )

# Create a (big) dummy dataset of soil properties
dtf <- expand.grid( 
  "clay"    = seq(5,50,1), 
  "bulkD"   = seq(1,1.8,.2), 
  "silt"    = seq(5,50,1), 
  "om"      = seq(1,3,.2), 
  "topSoil" = 0:1   #ignored
)   #

res <- pft.rawls( soilprop = dtf, parameter = c( "theta_r", "theta" ), 
    h = 200 ) }
