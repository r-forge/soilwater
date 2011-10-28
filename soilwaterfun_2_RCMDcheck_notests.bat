c:
cd \
cd "_R_PACKAGES\soilwater\pkg" 
R CMD check --no-tests --no-examples soilwaterfun
REM --no-examples --no-vignettes
pause
