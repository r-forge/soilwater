# source( "C:/_MACRO_SE/pedometrics/soilwaterptf/trunk/soilwaterptf/R/soilwaterptf.R" ) 
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

# Language & Software environment: R. 
# See ..\DESCRIPTION for more details

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #






# class.ptf.rosetta.mualem.vg.txt <- function(# Internal function. 
# ### The function estimates the value of parameters of the van 
# ### Genuchten water retention function and of the Mualem-van Genuchten 
# ### hydraulic conductivity function. Estimation is based on Schaap 
# ### MG et al. (2001, Journal of Hydrology, 251:163-176) classes 
# ### pedotransfer function (model H1), which returns an average 
# ### value of the parameter for each texture class of the USDA 
# ### texture triangle. Please notice that this PTF is the most simple 
# ### and the less accurate of the 5 models presented in the article.
# ### If you want a better accuracy, and / or have more soil properties 
# ### (bulk density and maybe the water content at 33 and 1500 kPa), 
# ### consider using the software Rosetta (stand alone program, allowing 
# ### batch calculation of retention and hydraulic parameters).
# ##references<< Schaap MG, Leij FJ, van Genuchten MT, 2001. ROSETTA: 
# ## a computer program for estimating soil hydraulic parameters 
# ## with hierarchical pedotransfer functions. Journal of Hydrology, 
# ## 251:163-176 (issue 3-4).

#  text.cl
# ### To be written. 

#  log.val = FALSE 
# ### To be written. 

# ){  #
#     rosetta.tbl <- data.frame( 
#         "ABBR"      = c( "Cl",   "ClLo", "Lo",   "LoSa", "Sa",   "SaCl", "SaClLo", "SaLo", "Si",   "SiCl", "SiClLo", "SiLo" ),  
#         "N"         = c(  84,    140,     242,    201,    308,    11,     87,       476,    6,      28,     172,      330   ),  
#         "theta.r"   = c(  0.098, 0.079,   0.061,  0.049,  0.053,  0.117,  0.063,    0.039,  0.05,   0.111,  0.09,     0.065 ),  
#         "theta.s"   = c(  0.459, 0.442,   0.399,  0.390,  0.375,  0.385,  0.384,    0.387,  0.489,  0.481,  0.482,    0.439 ),  
#         "log.alpha" = c( -1.825, -1.801, -1.954, -1.459, -1.453, -1.476, -1.676,   -1.574, -2.182, -1.79,  -2.076,   -2.296 ),  
#         "log.n"     = c(  0.098, 0.151,   0.168,  0.242,  0.502,  0.082,  0.124,    0.161,  0.225,  0.121,  0.182,    0.221 ),  
#         "log.Ks"    = c(  1.169, 0.913,   1.081,  2.022,  2.808,  1.055,  1.120,    1.583,  1.641,  0.983,  1.046,    1.261 ),  
#         "log.Ko"    = c(  0.472, 0.699,   0.568,  1.386,  1.389,  0.637,  0.841,    1.19,   0.524,  0.501,  0.349,    0.243 ),  
#         "L"         = c( -1.561, -0.763, -0.371, -0.874, -0.930, -3.665, -1.280,   -0.861,  0.624, -1.287, -0.156,    0.365 )   
#     )   #
#     #
#     test.text.cl <- text.cl %in% rosetta.tbl[,"ABBR"] 
#     #
#     if( any( !test.text.cl ) ) 
#     {   #
#         stop( 
#             paste( 
#                 sep = "", 
#                 "Some texture classes in 'text.cl' (", 
#                 paste( text.cl[!test.text.cl], collapse = ", " ), 
#                 ") do not belong to the list of possible values (", 
#                 paste( rosetta.tbl[,"ABBR"], collapse = ", " ), 
#                 "). Please revise." 
#             )   #
#         )   #
#     }   #
#     #
#     
# }   #



