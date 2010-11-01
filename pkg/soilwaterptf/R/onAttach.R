.onAttach <- function(# Internal. Message displayed when loading the package.
 libname, 
 pkgname  
){  #
    cat("'soilwaterptf' has been loaded.\n")
    cat("Please notice that a bug has been found in Wosten kSat calculations:\n")
    cat("\tkSat was reported to be calculated in [mm.h-1], while it was [cm.day-1].\n")
    cat("\tSorry for the inconvenience.\n")
}   #
