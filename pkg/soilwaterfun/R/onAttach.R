.onAttach <- function(# Internal. Message displayed when loading the package.
 libname, 
 pkgname  
){  #
    packageStartupMessage( 
        c(  paste( "'", pkgname, "' package loaded. ", sep="" ), 
            paste( "Type help( package='", pkgname, "') to get started. ", sep="" ), 
            "Please notice that fun.pF2h() and fun.h2pF() now works\n\t with pressure head (h, positive), not matrix potential (negative)." 
        )   #
    )   #
}   #
