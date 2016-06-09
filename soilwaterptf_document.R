
rm(list=ls(all=TRUE)) 

pkgName     <- "soilwaterptf"
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
    pkgVersion  = "1.1.3", 
    pkgDepends  = "soilwaterfun", 
    pkgSuggests = NULL, 
    pkgImports  = c( "soiltexture", "utils", "stats" ), 
    RVersion    = NULL   
)   



package.skeleton.dx( 
    pkgdir      = file.path( pkgDir, pkgName ), 
    namespace   = FALSE  
)   


pkgRemove( pkgName = pkgName ) 

