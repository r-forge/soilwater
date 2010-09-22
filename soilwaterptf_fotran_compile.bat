c:
cd \
cd "_SOILWATER\pkg\soilwaterptf\src"
pause 

@echo gfortran -fno-second-underscore -c -fPIC soilwaterptf.f90
@echo gfortran -fno-second-underscore -shared -o soilwaterptf.dll soilwaterptf.o
gfortran -O3  -c  soilwaterptf.f90 -o soilwaterptf.o
gfortran -shared -s -static-libgcc -o soilwaterptf.dll soilwaterptf.o -LC:/PROGRA~1/_SCIENCE/R_PROJ~1/bin -lR   

pause
