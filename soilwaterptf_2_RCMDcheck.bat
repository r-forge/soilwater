set pkgname=soilwaterptf
cd /D "%rPackagesDir%\soilwater\pkg" 

R CMD check --no-tests %pkgname%
@REM removed: --no-examples --no-vignettes
pause
