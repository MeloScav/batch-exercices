REM Improvement of exercice 1
REM     1. Do 10 difficulty levels: the higher the level, the higher 
REM                                 the number chosen by the computer.
REM     2. At the end, the user chooses to start again or to quit.
REM     3. Tell how many tries the user has succeeded.
REM     4. Save score to file.

@echo off
title exercice2
:: Size
mode con cols=80 lines=16
:: Color
color 90

:: CODE

:: The computer choose a random number
:random_number
    set randomNbr=%RANDOM%
    :: If the number is greater than 1000, it starts again
    if %randomNbr% GTR 1000 goto random_number
    :: If the number is less than 1, it starts again
    if %randomNbr% LSS 1 goto random_number

:: The user choose a number
:start
    set /p userNbr=Choose a number : 
    :: If the chosen number is < than the random number, we launch greater
    if %userNbr% LSS %randomNbr% goto greater
    :: If the chosen number is > than the random number, we launch lower
    if %userNbr% GTR %randomNbr% goto lower
    :: To finish, we launch end
    goto end

:greater
    echo The mystery number is higher
    goto start

:lower
    echo The mystery number is lower
    goto start

:end
    echo Good game !


pause > nul
