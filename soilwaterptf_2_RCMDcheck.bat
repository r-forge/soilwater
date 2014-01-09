set pkgname=soilwaterptf

cd /D "%rPackagesDir%\soilwater\pkg" 

R CMD check --no-examples %pkgname%_1.0.6.tar.gz

@REM --as-cran

pause
