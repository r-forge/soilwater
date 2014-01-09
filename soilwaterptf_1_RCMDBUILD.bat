set pkgname=soilwaterptf

cd /D "%rPackagesDir%\soilwater\pkg" 

R CMD build --compact-vignettes="gs" --md5 %pkgname% 

pause
