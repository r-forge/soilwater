.onAttach <- function(# Internal. Message displayed when loading the package.
 libname, 
 pkgname  
){  
    # Welcome message
    if( interactive() ){ 
        msg <- sprintf( 
            "%s %s  For help type: help(pack='%s')", 
            pkgname, 
            as.character( packageVersion( pkgname ) ), 
            pkgname ) 
        
        packageStartupMessage( msg ) 
    }   
    
}   


