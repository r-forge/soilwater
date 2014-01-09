set pkgname=soilwaterfun

cd /D "%rPackagesDir%\soilwater\pkg" 

R CMD check --no-examples %pkgname%_1.0.5.tar.gz

@REM --as-cran

pause
