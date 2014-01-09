set pkgname=soilwaterptf

cd /D "%rPackagesDir%\soilwater\pkg" 

R CMD INSTALL --build --compact-docs --byte-compile %pkgname%_1.0.6.tar.gz

pause
