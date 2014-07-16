set pkgname=soilwaterptf

cd /D "%rPackagesDir%\soilwater\pkg" 

svnversion > %pkgname%\inst\SVN_VERSION

R CMD build --compact-vignettes="gs" --md5 %pkgname% 

pause
