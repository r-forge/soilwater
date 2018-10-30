# Code by Till Francke <francke AT uni-potsdam.de>



ptf.rawls <- function(# Rawls and Brakensiek (1985) PTFs for water content at specified suction, the suction at wetting front or Green-Ampt-parameters
### estimate soil hydraulic properties (water content for different 
### heads, Brooks-Corey parameters) using pedo-transfer functions 
### of Rawls et al (multiple publications)

##details<< The second order PTFs are applied to produce the requested 
##  output. In case of "theta", values between those given in the 
##  literature are interpolated. In this case, both [1] (40-100 cm) 
##  and [2] (200 - 15000 cm) are used because [2] does not contain 
##  low water contents, whereas [2] includes bulk density, which 
##  is not the case for [1]

##references<< Rawls WJ, Brakensiek DL (1985) Prediction of Soil 
##  Water Properties for Hydrologic Modeling. Watershed Management 
##  in the Eighties, ASCE, pp. 293-299. Taken from: Rawls WJ et. al 
##  (1993) Infiltration and Soil Water movement. In: Maidment DR(ed): 
##  Handbook of Hydrology, pp. 5.1-5.51. McGraw-Hill, New York, USA.
##
## Rawls, WJ, Brakensiek, DL, Soni, B  (1983) Agricultural management 
##  effects on soil water processes. Part I. Soil water retention 
##  and Green-Ampt parameters. Trans. ASAE 26:1747-1752. Taken from 
##  Guber, AK et al (2010) Multimodeling with Pedotransfer Functions. 
##  Documentation and User Manual for PTF Calculator (CalcPTF) 
##  Version 2.0. Table 5, URL: http://ars.usda.gov/SP2UserFiles/ad_hoc/12655300EnvironmentalTransport/CalcPTFFiles/PTF_Manual.version_2.0.pdf, 
##  retrieved July, 2014
##
## Rawls WJ et. al (1993) Infiltration and Soil Water movement. 
##  In: Maidment DR(ed): Handbook of Hydrology, pp. 5.1-5.51. 
##  McGraw-Hill, New York, USA.

##author<< Till Francke <francke AT uni-potsdam.de>

##seealso<< \code{\link[soilwaterptf]{ptf.wosten}}.

 soilprop, 
### matrix or data.frame, with 5 columns: 
### \itemize{ 
###     \item "clay", Clay content [\%] of each soil layer / horizon 
###         (clay: 0-2 micrometers); 
###     \item "bulkD", Bulk density [kg.dm-3] of each soil layer / 
###         horizon;  
### \item "silt", Silt content [\%] of each soil layer / horizon. 
###     (silt: 2-50 micrometers); 
### \item "om", Organic matter content [\%] of each soil layer / 
###     horizon
### }
 
 parameters=NULL, 
### Vector of up to character strings "theta", "S_f", "theta_r", 
### "h_b", "lambda", determining if the water content at 
### specified suction \code{h}, the suction at wetting front or 
### the Green-Ampt-parameters are to be returned.

 h=NULL
### Vector of suction heads to compute corresponding water content. 
### Use positive value in cm.

){  
  ret_val=NULL #return value
  
  sa = 100 - soilprop$silt - soilprop$clay #sand content
  p = 1-soilprop$bulkD / 2.65 #porosity [-], Maidment, eq. 5.1.1
  
  
  if ("theta" %in% parameters || !is.null(h))
  {#coefficients for predicting water content at specific suctions,
    # rows 1-3: [1] because [2] does not contain these lo water contents
    # rows 4-12: [2] because it includes bulk density, which is not the case for [1]
    rawls_coefs= 
      rbind(
        cbind( 40, 0.7899, -0.0037,       0, 0.010, -0.1315 ),
        cbind( 70, 0.7135, -0.0030,  0.0017,     0, -0.1693),
        cbind(100, 0.4118, -0.0030, 0.0023, 0.0317, 0),
        cbind(200, 0.4180, -0.0021, 0.0035, 0.0232, -0.0859),
        cbind(330, 0.3486, -0.0018, 0.0039, 0.0228, -0.0738),
        cbind(600, 0.2819, -0.0014, 0.0042, 0.0216, -0.0612),
        cbind(1000, 0.2352, -0.0012, 0.0043, 0.0202, -0.0517),
        cbind(2000, 0.1837, -0.0009, 0.0044, 0.0181, -0.0407),
        cbind(4000, 0.1426, -0.0007, 0.0045, 0.0160, -0.0315),
        cbind(7000, 0.1155, -0.0005, 0.0045, 0.0143, -0.0253),
        cbind(10000, 0.1005, -0.0004, 0.0045, 0.0133, -0.0218),
        cbind(15000, 0.0854, -0.0004, 0.0044, 0.0122, -0.0182)
      )
    dimnames(rawls_coefs)[[2]]=c("head_cm",letters[1:5])
    
    #interpolate coefficients for intermediate heads  
    coefs=apply(rawls_coefs[,-1], MARGIN=2, FUN=stats::approx, x=rawls_coefs[,"head_cm"], xout=h)
    coefs=unlist(coefs)[(1:5)*2] #reshape output
    names(coefs)=letters[1:5]
    theta = coefs["a"] + coefs["b"]*sa + coefs["c"]* soilprop$clay + 
      coefs["d"] * soilprop$om/1.74 + coefs["e"]*soilprop$bulkD
    ret_val=cbind(ret_val, theta=theta)
    rm(theta)
  }
  
  
  if ("theta_r" %in% parameters)
  {
    #Brooks-Corey residual water content  [-] [1] Rawls & Brakensiek (1985) in Maidment. Table 5.3.3
    ret_val=cbind(ret_val, theta_r=rep(NA, nrow(soilprop)))
    ret_val[,"theta_r"] = -0.0182482 + 0.00087269*sa + 0.00513488*soilprop$clay + 0.02939286*p - 
      0.00015395*soilprop$clay^2 - 0.0010827*sa*p - 0.00018233*soilprop$clay^2*p^2 +
      0.00030703*soilprop$clay^2*p - 0.0023584*p^2*soilprop$clay 
  }
  
  if ("S_f" %in% parameters)
  {
    #Green-Ampt suction at wetting front [cm], Rawls & Brakensiek (1993), eq. 5.5.16
    ret_val=cbind(ret_val, S_f=rep(NA, nrow(soilprop)))
    ret_val[,"S_f"] = exp(6.53 - 7.326*p + 0.00158*soilprop$clay^2 + 3.809*p^2 +  
                            0.000344*sa*soilprop$clay - 0.04989*sa*p + 0.0016*sa^2*p^2 +
                            0.0016*soilprop$clay^2*p^2 -0.0000136 * sa^2*soilprop$clay - 0.00348*soilprop$clay^2*p +
                            0.000799*sa^2*p)
    ret_val[,"S_f"] =  ret_val[,"S_f"] *10 #convert to mm
  }
  
  if ("h_b" %in% parameters)
  {
    #Brooks-Corey bubbling pressure h_b [cm] [1] Rawls & Brakensiek (1985) in Maidment. Table 5.3.3
    ret_val=cbind(ret_val, h_b=rep(NA, nrow(soilprop)))
    ret_val[,"h_b"]= exp(5.3396738 +0.1845038*soilprop$clay-2.48394546*p-0.00213853*soilprop$clay^2
                         -0.04356349*sa*p-0.61745089*soilprop$clay*p+0.00143589*sa^2*p^2
                         -0.00855375*soilprop$clay^2*p^2 - 0.00001282*sa^2*soilprop$clay +0.00895359*soilprop$clay^2*p
                         -0.0007247*sa^2*p +0.0000054*soilprop$clay^2*sa +0.50028060*p^2*soilprop$clay
    )
    
    
  }
  
  if ("lambda" %in% parameters)
  {
    #Brooks-Corey pore-size distribution index lambda [-] [1] Rawls & Brakensiek (1985) in Maidment. Table 5.3.3
    
    ret_val=cbind(ret_val, lambda=rep(NA, nrow(soilprop)))
    ret_val[,"lambda"]= exp(-0.7842831 +0.0177544*sa -1.062498*p -0.00005304*sa^2
                            -0.00273493*soilprop$clay^2 +1.11134946*p^2 -0.03088295*sa*p
                            +0.00026587*sa^2*p^2 -0.00610522*soilprop$clay^2*p^2
                            -0.00000235*sa^2*soilprop$clay +0.00798746*soilprop$clay^2*p -0.00674497*p^2*soilprop$clay
    )
    
    
  }
  
  return(ret_val)
### data frame containing the columns "theta" [-], "S_f" [cm], 
### "theta_r" [-], "h_b" [cm], "lambda" [-], depending on value of 
### \code{parameter}.
}
