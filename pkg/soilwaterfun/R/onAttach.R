
.onAttach <- function(# Internal. Message displayed when loading the package.
 libname, 
 pkgname  
){      
    # Welcome message
    if( interactive() ){ 
        svnVersion <- system.file( "SVN_VERSION", package = pkgname ) 
        
        if( svnVersion != "" ){ 
            svnVersion <- readLines( con = svnVersion )[ 1L ] 
            svnVersion <- sprintf( "(svn revision: %s)", svnVersion ) 
        }else{ 
            svnVersion <- "(svn revision: ?)" 
        }   
        
        msg <- sprintf( 
            "%s %s %s. For help type: help(pack='%s')", 
            pkgname, 
            as.character( packageVersion( pkgname ) ), 
            svnVersion, 
            pkgname ) 
        
        packageStartupMessage( msg ) 
    }   
}   


