
rm(list=ls(all=TRUE)) 

pkgName     <- "soilwaterfun"
pkgDir      <- file.path( sprintf( 
    "%s/soilwater/pkg", 
    Sys.getenv("rPackagesDir") ) ) 


library( "inlinedocs" )


# Source some utility functions
source( file.path( pkgDir, "..", "packageUtilities.R" ) ) 


# Change the description file:
pkgDescription( 
    pkgName     = pkgName, 
    pkgDir      = pkgDir, 
    pkgVersion  = "1.0.9", 
    pkgDepends  = NULL, 
    pkgSuggests = NULL, 
    RVersion    = NULL   
)   



package.skeleton.dx( 
    pkgdir      = file.path( pkgDir, pkgName ), 
    namespace   = TRUE  
)   


pkgRemove( pkgName = pkgName ) 


