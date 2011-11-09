.onAttach <- function(# Internal. Message displayed when loading the package.
 libname, 
 pkgname  
){  #
    packageStartupMessage( 
        c(  paste( "'", pkgname, "' package loaded.\n", sep = "" ), 
            paste( "\tType help( package='", pkgname, "') to get started.", sep = "" ) 
        )   #
    )   #
}   #
