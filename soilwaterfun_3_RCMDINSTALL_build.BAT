set pkgname=soilwaterfun
set version=1.0.7

cd /D "%rPackagesDir%\soilwater\pkg" 

R CMD INSTALL --build --compile-both --compact-docs --byte-compile %pkgname%_%version%.tar.gz

pause
