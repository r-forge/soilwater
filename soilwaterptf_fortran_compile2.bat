c:
cd \
cd "_SOILWATER\pkg\soilwaterptf\src"
pause 

R CMD SHLIB -O3  -c  soilwaterptf.f90 -o soilwaterptf.o

pause
