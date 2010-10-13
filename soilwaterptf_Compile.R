# source( "C:/_SOILWATER/soilwaterptf_Compile.R", echo = TRUE, verbose = FALSE ) 
rm(list=ls(all=TRUE)) 
pkg.dir      <- "C:/_SOILWATER/pkg" 
pkg.name     <- "soilwaterptf" 
pkg.version  <- "1.01" 
pkg.depends  <- "soiltexture" # or "MASS" or NULL 
pkg.suggests <- NULL 
RVersion     <- "R (>= 2.4.1)" 
# r.path       <- "C:/Program Files/_SCIENCE/R_PROJECT_2-4-1/bin" 
r.path       <- ""  #  Use curent R version




require( "rcmdwrapper" ) # See rcmdwrapper_1.1.zip



# Change the description file:
pkg.description( 
    pkg.name     = pkg.name, 
    pkg.dir      = pkg.dir, 
    pkg.version  = pkg.version, 
    pkg.depends  = pkg.depends, 
    pkg.suggests = pkg.suggests, 
    RVersion     = RVersion  
)   #



package.skeleton.dx( 
    pkgdir      = file.path( pkg.dir, pkg.name ), 
    namespace   = TRUE  
)   #



pkg.remove.wrapper( pkg.name = pkg.name ) 



# Build the package
pkg.build.wrapper( 
    pkg.name = pkg.name, 
    pkg.dir  = pkg.dir, 
    r.path   = r.path
)   #



# Install the package:
pkg.install.wrapper( 
    pkg.name = pkg.name, 
    pkg.dir  = pkg.dir, 
    r.path   = r.path
)   #



# Re-install and load the package from the new zip archive 
# _before_ the tests are conducted
install.packages.zip( 
    pkg.name    = pkg.name, 
    pkg.dir     = pkg.dir, 
    pkg.version = pkg.version
)   #



# Check the package
date() 
pkg.check.wrapper( 
    pkg.name = pkg.name, 
    pkg.dir  = pkg.dir, 
    r.cmd.op = "--no-tests", 
    r.path   = r.path
)   #
date() 



require( package = pkg.name, character.only = TRUE ) 

