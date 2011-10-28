c:
cd \
cd "_R_PACKAGES\soilwater\pkg" 
R CMD check --no-tests --no-examples soilwaterptf
REM --no-examples --no-vignettes
pause
