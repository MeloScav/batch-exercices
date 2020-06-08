REM The program : 
REM    1. The computer choose a random number
REM    2. We ask the user to choose a number
REM    3. The computer compares the two numbers and indicates whether
REM       the number is larger or smaller
REM    4. Repeat the last two steps until the user secceds


@echo off
title exercice1
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


pause > nul
