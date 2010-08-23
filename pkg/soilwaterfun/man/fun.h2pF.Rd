\name{fun.h2pF}
\alias{fun.h2pF}
\title{Converts h to pF}
\description{Function that converts matrix potential values [m] into pF values}
\usage{
fun.h2pF(h)
}
\arguments{
  \item{h}{Vector of numericals. Matrix potential values to be converted [m]
(negative values. Succion).}
}

\value{Returns a vector of pF values (numericals) }

\author{Julien MOEYS <jules_m78-soiltexture@yahoo.fr>}




\examples{require( "soilwaterfun" )

fun.h2pF( h = fun.pF2h( pF = c(0,2,4.2) ) )}
