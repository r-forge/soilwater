set project=soilwater
set pkgname=soilwaterptf
set version=1.1.1

cd /D "%rPackagesDir%\%project%\pkg" 

R CMD Rd2pdf %pkgname% --output=%pkgname%.%version%.pdf

pause
