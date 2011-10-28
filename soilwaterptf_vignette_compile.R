rm(list=ls(all=TRUE)) 

setwd( "C:/_R_PACKAGES/soilwater/pkg/soilwaterptf/inst/doc" ) 

Stangle( "soilwaterptf_vignette.Rnw" ) 

Sweave( "soilwaterptf_vignette.Rnw" ) 

msg <- tools::texi2dvi( 
    file        = "soilwaterptf_vignette.tex", 
    pdf         = TRUE, 
    clean       = TRUE, 
    texinputs   = getwd() 
)   # 

