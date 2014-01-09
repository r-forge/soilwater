.onAttach <- function(# Internal. Message displayed when loading the package.
 libname, 
 pkgname  
){  #
    packageStartupMessage( 
        c(  paste( "'", pkgname, "' package loaded. ", sep = "" ), 
            paste( "Type help( package='", pkgname, "') to get started.", sep = "" ) 
        )   #
    )   #
}   #


