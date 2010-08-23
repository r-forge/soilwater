\name{fun.pF2h}
\alias{fun.pF2h}
\title{Converts pF to h}
\description{Function that converts pF values into a matrix poential (in 
meters [m]).}
\usage{
fun.pF2h(pF)
}
\arguments{
  \item{pF}{Vector of numericals. pF values to be converted.}
}

\value{Returns a vector of matrix potential value [m] (numericals), 
negative (succion).}

\author{Julien MOEYS <jules_m78-soiltexture@yahoo.fr>}




\examples{require( "soilwaterfun" )

fun.pF2h( pF = c(0,2,4.2) ) }
