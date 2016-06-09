
detach( package:soilwaterptf ) 
rm(list=ls(all=TRUE)) 



setwd( sprintf( 
    "%s/soilwater/pkg/soilwaterptf/vignettes", 
    Sys.getenv("rPackagesDir") ) ) 

Stangle( "soilwaterptf_vignette.Rnw" ) 

Sweave( "soilwaterptf_vignette.Rnw" ) 

for( clean in c(FALSE,FALSE,TRUE) ){ 
    msg <- tools::texi2dvi( 
        file        = "soilwaterptf_vignette.tex", 
        pdf         = TRUE, 
        clean       = clean, 
        texinputs   = getwd() 
    )   
    
    # if( !clean ){ 
    #     detach( package:soiltexture ) 
    # }   
}   



## Copy the vignette's pdf into the 'doc' folder
file.copy( 
    from      = "soilwaterptf_vignette.pdf", 
    to        = "../inst/doc/soilwaterptf_vignette.pdf", 
    overwrite = TRUE )    

# file.remove( "soilwaterptf_vignette.pdf" ) 



for( ext in c( "\\.tex$", "\\.bib.bak$", "\\.R$", "\\.aux$", 
    "\\.bbl$", "\\.blg$", "\\.log$", "\\.out$", "\\.toc$", "\\.pdf$" ) ){ 
    
    file.remove( list.files( getwd(), ext, full.names = TRUE ) ) 
}   


