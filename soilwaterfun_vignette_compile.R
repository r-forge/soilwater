
detach( package:soilwaterfun ) 
rm(list=ls(all=TRUE)) 



setwd( sprintf( 
    "%s/soilwater/pkg/soilwaterfun/vignettes", 
    Sys.getenv("rPackagesDir") ) ) 

Stangle( "soilwaterfun_vignette.Rnw" ) 

Sweave( "soilwaterfun_vignette.Rnw" ) 

for( clean in c(FALSE,FALSE,TRUE) ){ 
    msg <- tools::texi2dvi( 
        file        = "soilwaterfun_vignette.tex", 
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
    from      = "soilwaterfun_vignette.pdf", 
    to        = "../inst/doc/soilwaterfun_vignette.pdf", 
    overwrite = TRUE )    

# file.remove( "soilwaterfun_vignette.pdf" ) 



for( ext in c( "\\.tex$", "\\.bib.bak$", "\\.R$", "\\.aux$", 
    "\\.bbl$", "\\.blg$", "\\.log$", "\\.out$", "\\.toc$", "\\.pdf$" ) ){ 
    
    file.remove( list.files( getwd(), ext, full.names = TRUE ) ) 
}   


