set pkgname=soilwaterptf

cd /D "%rPackagesDir%\soilwater\pkg" 

R CMD INSTALL --build --compact-docs --byte-compile %pkgname%

pause
