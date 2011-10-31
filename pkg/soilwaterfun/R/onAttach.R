.onAttach <- function(# Internal. Message displayed when loading the package.
 libname, 
 pkgname  
){  #
    cat("'", pkgname, "' package loaded.\n") 
    cat("type help( package='", pkgname, "') to get started\n") 
    cat("\tPlease notice that fun.pF2h() and fun.h2pF() now works\n\t with pressure head (h, positive), not matrix potential (negative).\n")
}   #
