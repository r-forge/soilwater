
setwd( wd <- sprintf( "%s/soilwater/pkg/soilwaterfun2", Sys.getenv("rPackagesDir") ) ) 

library( "Rd2roxygen" )

Rd2roxygen( pkg = wd ) 

