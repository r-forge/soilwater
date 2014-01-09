set pkgname=soilwaterfun

cd /D "%rPackagesDir%\soilwater\pkg" 

R CMD check --no-examples %pkgname%

@REM --as-cran

pause
