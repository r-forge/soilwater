rm(list=ls(all=TRUE)) 
wrapper.path <- "C:/_SOILWATER/R_CMD_wrapper.R"
pkg.dir      <- "C:/_SOILWATER/pkg" 
pkg.name     <- "soilwaterptf" 
code.files   <- "soilwaterptf.R" 
pkg.version  <- "1.01" 
pkg.depends  <- "MASS" 



source( wrapper.path )  



# Change the description file:
pkg.description( pkg.name = pkg.name, pkg.dir = pkg.dir, 
                 pkg.version = pkg.version, pkg.depends = pkg.depends ) 



package.skeleton.dx( 
    pkgdir      = file.path( pkg.dir, pkg.name ), 
    #code_files  = code.files, 
    namespace   = TRUE  
)   #



pkg.remove.wrapper( pkg.name = pkg.name ) 



# Build the package
pkg.build.wrapper( pkg.name = pkg.name, pkg.dir = pkg.dir ) 



# Install the package:
pkg.install.wrapper( pkg.name = pkg.name, pkg.dir = pkg.dir ) 



# Check the package
date() 
pkg.check.wrapper( pkg.name = pkg.name, pkg.dir = pkg.dir ) 
date() 



# Re-install and load the package from the new zip archive:
install.packages.zip( pkg.name = pkg.name, pkg.dir = pkg.dir, pkg.version = pkg.version ) 
require( package = pkg.name, character.only = TRUE )

