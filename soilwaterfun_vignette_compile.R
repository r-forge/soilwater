rm(list=ls(all=TRUE)) 

setwd( "C:/_R_PACKAGES/soilwater/pkg/soilwaterfun/inst/doc" ) 

Stangle( "soilwaterfun_vignette.Rnw" ) 

Sweave( "soilwaterfun_vignette.Rnw" ) 

msg <- tools::texi2dvi( 
    file        = "soilwaterfun_vignette.tex", 
    pdf         = TRUE, 
    clean       = TRUE, 
    texinputs   = getwd() 
)   # 

