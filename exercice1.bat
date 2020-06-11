@echo off
title exercice1
:: Size
mode con cols=80 lines=16
:: Color
color 90

:: CODE

:: Choose a random number
:random_number
    set randomNbr=%RANDOM%
    :: If the number is greater than 1000, it starts again
    if %randomNbr% GTR 1000 goto random_number
    :: If the number is less than 1, it starts again
    if %randomNbr% LSS 1 goto random_number

:: The user chooses a number
:start
    set /p userNbr=Choose a number : 
    :: If the chosen number is < than the random number, we launch greater
    if %userNbr% LSS %randomNbr% goto greater
    :: If the chosen number is > than the random number, we launch lower
    if %userNbr% GTR %randomNbr% goto lower
    :: To finish, we launch end
    goto end

:greater
    echo The mystery number is greater than %userNbr%
    goto start

:lower
    echo The mystery number is less than %userNbr%
    goto start

:end
    echo Good game !


pause > nul
