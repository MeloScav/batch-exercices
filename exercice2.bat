@echo off
title exercice2
:: Size
mode con cols=80 lines=16
:: Color
color 90

:: CODE

:: VARIABLES
set minNbr=1
set maxNbr=10
set nbrOfTries=0

:: The user chooses a difficulty level
:difficulty
    set /p level=Choose a difficulty level between 1 and 10 : 
    :: The maximum number changes depending on the level chosen
    if %level% == 1 set maxNbr=10
    if %level% == 2 set maxNbr=100
    if %level% == 3 set maxNbr=500
    if %level% == 4 set maxNbr=1000
    if %level% == 5 set maxNbr=2000
    if %level% == 6 set maxNbr=3000
    if %level% == 7 set maxNbr=4000
    if %level% == 8 set maxNbr=5000
    if %level% == 9 set maxNbr=6000
    if %level% == 10 set maxNbr=7000

:: The computer choose a random number
:random_number
    set randomNbr=%RANDOM%
    :: If the number is greater than maxNbr, it starts again
    if %randomNbr% GTR %maxNbr% goto random_number
    :: If the number is less than minNbr, it starts again
    if %randomNbr% LSS %minNbr% goto random_number

:: The user choose a number
:start
    set /p userNbr=Choose a number : 
    :: Increasement number of trials by 1
    set /a nbrOfTries=%nbrOfTries% + 1 
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
    echo Good game ! You succeeded in %nbrOfTries% tries 
    :: If the file doesn't exist, we create it
    If not exist scores.txt ( echo Difficulty level : %level% > scores.txt )
    :: Add in the file end
    echo Number of tries : %nbrOfTries% >> scores.txt

    set /p finalDecision=What do you want to do ? 1. Restart 2. Exit 
    echo.
    if %finalDecision%==1 ( goto difficulty ) else ( exit )

pause > nul
