set pkgname=soilwaterfun
cd /D "%rPackagesDir%\soilwater\pkg" 

R CMD check --no-tests %pkgname%
@REM --no-examples --no-vignettes
pause
