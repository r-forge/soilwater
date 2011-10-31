# source( "C:/_R_PACKAGES/easydb/soilwaterfun.R", echo = TRUE, verbose = FALSE ) 
rm(list=ls(all=TRUE)) 
pkg.dir      <- "C:/_R_PACKAGES/soilwater/pkg" 
pkg.name     <- "soilwaterfun" 
pkg.version  <- "1.0.2" 
pkg.depends  <- NULL  
pkg.suggests <- NULL 
RVersion     <- "R (>= 2.4.1)" 
# r.path       <- "C:/Program Files/_SCIENCE/R_PROJECT_2-4-1/bin" 
r.path       <- ""  #  Use curent R version




require( "rcmdwrapper" ) 



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

