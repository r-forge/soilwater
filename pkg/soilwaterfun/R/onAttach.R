.onAttach <- function(# Internal. Message displayed when loading the package.
 libname, 
 pkgname  
){  #
    packageStartupMessage( 
        c(  paste( "'", pkgname, "' package loaded.\n", sep="" ), 
            paste( "\tType help( package='", pkgname, "') to get started\n", sep="" ), 
            "\tPlease notice that fun.pF2h() and fun.h2pF() now works\n\t with pressure head (h, positive), not matrix potential (negative)." 
        )   #
    )   #
}   #
