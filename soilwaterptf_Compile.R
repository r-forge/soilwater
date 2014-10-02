
rm(list=ls(all=TRUE)) 

pkgName     <- "soilwaterptf"
pkgDir      <- file.path( "D:/Users/julienm/Documents/_WORKS/_PROJECTS/r_packages/soilwater/pkg" ) 


library( "inlinedocs" )


# Source some utility functions
source( file.path( pkgDir, "..", "packageUtilities.R" ) ) 


# Change the description file:
pkgDescription( 
    pkgName     = pkgName, 
    pkgDir      = pkgDir, 
    pkgVersion  = "1.1.1", 
    pkgDepends  = "soilwaterfun", 
    pkgSuggests = NULL, 
    pkgImports  = "soiltexture", 
    RVersion    = NULL   
)   



package.skeleton.dx( 
    pkgdir      = file.path( pkgDir, pkgName ), 
    namespace   = FALSE  
)   


pkgRemove( pkgName = pkgName ) 

