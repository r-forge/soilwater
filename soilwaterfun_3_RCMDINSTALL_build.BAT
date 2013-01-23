set pkgname=soilwaterfun
cd /D "%rPackagesDir%\soilwater\pkg" 

R CMD INSTALL --build --compile-both --compact-docs --byte-compile %pkgname%
pause
