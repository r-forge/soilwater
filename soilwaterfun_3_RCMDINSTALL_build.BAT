set pkgname=soilwaterfun

cd /D "%rPackagesDir%\soilwater\pkg" 

R CMD INSTALL --build --compact-docs --byte-compile %pkgname%_1.0.5.tar.gz

pause
