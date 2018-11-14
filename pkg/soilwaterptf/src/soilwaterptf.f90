SUBROUTINE ptfWosten ( nbrow, soilprop, soilphy ) !!!, alphaStar, nStar, lStar, kSatStar, i
    IMPLICIT NONE ! meaning no unexpected variables
    INTEGER( kind = 4 ), INTENT( IN ) :: nbrow !Nr of rows in arrays
    REAL( kind = 8 ), DIMENSION( nbrow, 5 ), INTENT( IN )  :: soilprop ! Input
    ! expected columns and order: clay, bulkD, silt, om, topSoil
    !                             c1    c2     c3    c4  c5
    REAL( kind = 8 ), DIMENSION( nbrow, 5 ), INTENT( OUT ) :: soilphy ! Output
    ! expected columns and order: thetaS, alpha, n, l, kSat
    !                             c1      c2     c3 c4 c5 
    
    REAL( kind = 8 ), DIMENSION( nbrow, 1 ) :: alphaStar, nStar, lStar, kSatStar  !Internal
    INTEGER( kind = 4 ) :: i !Counter
    
    !soilphy = 0 
    
    DO i = 1,nbrow
        
        !WARNING: if you change the code below, change accordingly 
        !         the corresponding R code (soilwaterptf, macroptf) 
        
        ! Calculates ThetaS
        soilphy(i,1) = 0.7919 +                         &
            0.001691 * soilprop(i,1) -                  &!clay
            0.29619 * soilprop(i,2) -                   &!bulkD
            0.000001491 * (soilprop(i,3)**2) +          &!silt
            0.0000821 * (soilprop(i,4)**2) +            &!om
            0.02427 * (1/soilprop(i,1)) +               &!clay
            0.01113 * (1/soilprop(i,3)) +               &!silt
            0.01472 * log( soilprop(i,3) ) -            &!silt
            0.0000733 * soilprop(i,4) * soilprop(i,1) - &!om, clay
            0.000619 * soilprop(i,2) * soilprop(i,1) -  &!bulkD, clay
            0.001183 * soilprop(i,2) * soilprop(i,4) -  &!bulkD, om
            0.0001664 * soilprop(i,5) * soilprop(i,3)    !topsoil, silt
        
        ! Calculates alpha
        alphaStar(i,1) = -14.96 +                       &
            0.03135 * soilprop(i,1) +                   &!clay
            0.0351 * soilprop(i,3) +                    &!silt
            0.646 * soilprop(i,4) +                     &!om
            15.29 * soilprop(i,2) -                     &!bulkD
            0.192 * soilprop(i,5) -                     &!topSoil
            4.671 * (soilprop(i,2)**2) -                &!bulkD
            0.000781 * (soilprop(i,1)**2) -             &!clay
            0.00687 * (soilprop(i,4)**2) +              &!om
            0.0449 * (1/soilprop(i,4)) +                &!om
            0.0663 * log( soilprop(i,3) ) +             &!silt
            0.1482 * log( soilprop(i,4) ) -             &!om
            0.04546 * soilprop(i,2) * soilprop(i,3) -   &!bulkD, silt
            0.4852 * soilprop(i,2) * soilprop(i,4) +    &!bulkD, om
            0.00673 * soilprop(i,5) * soilprop(i,1)      !topSoil, clay
        
        soilphy(i,2) = exp( alphaStar(i,1) ) * 100 
        
        !Calculates n
        nStar(i,1) = -25.23 -                           &
            0.02195 * soilprop(i,1) +                   &!clay
            0.0074 * soilprop(i,3) -                    &!silt
            0.1940 * soilprop(i,4) +                    &!om
            45.5 * soilprop(i,2) -                      &!bulkD
            7.24 * (soilprop(i,2)**2) +                 &!bulkD
            0.0003658 * (soilprop(i,1)**2) +            &!clay
            0.002885 * (soilprop(i,4)**2) -             &!om
            12.81 * (1/soilprop(i,2)) -                 &!bulkD
            0.1524 * (1/soilprop(i,3)) -                &!silt
            0.01958 * (1/soilprop(i,4)) -               &!om
            0.2876 * log( soilprop(i,3) ) -             &!silt
            0.0709 * log( soilprop(i,4) ) -             &!om
            44.6 * log( soilprop(i,2) ) -               &!bulkD
            0.02264 * soilprop(i,2) * soilprop(i,1) +   &!bulkD, clay
            0.0896 * soilprop(i,2) * soilprop(i,4) +    &!bulkD, om
            0.00718 * soilprop(i,5) * soilprop(i,1)      !topSoil, clay
        
        soilphy(i,3) = exp( nStar(i,1) ) + 1 
        
        !Calculates l
        lStar(i,1) = 0.0202 +                           &
            0.0006193 * (soilprop(i,1)**2) -            &!clay
            0.001136 * (soilprop(i,4)**2) -             &!om
            0.2316 * log( soilprop(i,4) ) -             &!om
            0.03544 * soilprop(i,2) * soilprop(i,1) +   &!bulkD, clay
            0.00283 * soilprop(i,2) * soilprop(i,3) +   &!bulkD, silt
            0.0488 * soilprop(i,2) * soilprop(i,4)       !bulkD, om
        
        soilphy(i,4) = ( 10*( exp(lStar(i,1)) - 1 ) )/( 1 + exp(lStar(i,1)) ) 
        
        !Calculates Ksat
        kSatStar(i,1) = 7.755 +                         &
            0.0352 * soilprop(i,3) +                    &!silt
            0.93 * soilprop(i,5) -                      &!topSoil
            0.967 * (soilprop(i,2)**2) -                &!bulkD
            0.000484 * (soilprop(i,1)**2) -             &!clay
            0.000322 * (soilprop(i,3)**2) +             &!silt
            0.001 * (1/soilprop(i,3)) -                 &!silt
            0.0748 * (1/soilprop(i,4)) -                &!om
            0.643 * log( soilprop(i,3) ) -              &!silt
            0.01398 * soilprop(i,2) * soilprop(i,1) -   &!bulkD, clay
            0.1673 * soilprop(i,2) * soilprop(i,4) +    &!bulkD, om
            0.02986 * soilprop(i,5) * soilprop(i,1) -   &!topSoil, clay
            0.03305 * soilprop(i,5) * soilprop(i,3)      !topSoil, silt
        
        soilphy(i,5) = exp( kSatStar(i,1) ) 
        
    END DO
    
    !RETURN 
    
END SUBROUTINE ptfWosten
