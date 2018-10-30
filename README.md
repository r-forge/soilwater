Linux: [![Linux Build Status (Travis CI)](https://travis-ci.org/julienmoeys/soilwater.svg?branch=master)](https://travis-ci.org/julienmoeys/soilwater). 



soilwater
============================================================

Homepage of the `soilwaterfun` and `soilwaterptf` R packages.

The package repositry was recently moved from rforge to 
GitHub . Original pages:  
https://r-forge.r-project.org/projects/soilwater/
http://soilwater.r-forge.r-project.org/

This page is under construction.

Please refer to the old homepage for more information.



Installation:
------------------------------------------------------------

**Development version from [Github](https://github.com/julienmoeys/soilwater)**

Please make sure that the package can be installed on your 
version of R (type `R.Version()[["version.string"]]`) by 
checking the minimum version of R indicated in the package 
DESCRIPTION on Github ([here](https://github.com/julienmoeys/soilwater/blob/master/pkg/soilwaterfun/DESCRIPTION) 
and [here](https://github.com/julienmoeys/soilwater/blob/master/pkg/soilwaterptf/DESCRIPTION)).

To install the latest development version of the package 
from GitHub, you need to install the package 
[devtools](https://cran.r-project.org/web/packages/devtools/index.html)
and the software bundle 
[Rtools](https://cran.r-project.org/bin/windows/Rtools/). 
Please refer to `devtools` 
[README](https://cran.r-project.org/web/packages/devtools/readme/README.html). 

To install devtools, type in R command prompt:

```
install.packages("devtools")
```

Then, to install `soilwaterfun` from GitHub, type:

```
devtools::install_github("julienmoeys/soilwater/pkg/soilwaterfun")
```

To install `soilwaterptf` from GitHub, type:

```
devtools::install_github("julienmoeys/soilwater/pkg/soilwaterfun")
devtools::install_github("julienmoeys/soilwater/pkg/soilwaterptf")
```



User support:
------------------------------------------------------------

My current work and personal situation unfortunately does not 
leave me much time to provide support to and answer questions 
from users of the soilwaterfun and soilwaterptf package. 
Answer to questions is likely to be erratic or very delayed.
