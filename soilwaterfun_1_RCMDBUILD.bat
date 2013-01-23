set pkgname=soilwaterfun
cd /D "%rPackagesDir%\soilwater\pkg" 

R CMD build --no-vignettes --md5 %pkgname% 
@REM --compact-vignette="gs"
pause
