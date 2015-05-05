set pkgname=soilwaterptf
set version=1.1.2

cd /D "%rPackagesDir%\soilwater\pkg" 

R CMD INSTALL --build --compile-both --compact-docs --byte-compile %pkgname%_%version%.tar.gz

pause
