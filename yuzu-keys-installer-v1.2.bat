@echo off
title Yuzu Keys Installer version 1.2
cls

rem Begin Progam

:yuzu

rem Installer ASCII

echo ##  ##  ##     ## ######## ##     ## 
echo ##  ##  ##     ##      ##  ##     ## 
echo  ####   ##     ##     ##   ##     ## 
echo   ##    ##     ##    ##    ##     ## 
echo   ##    ##     ##   ##     ##     ## 
echo   ##    ##     ##  ##      ##     ## 
echo   ##     #######  ########  #######  
echo.
echo.
echo    ###    ####  #######  
echo  ##   ##   ##  ##     ## 
echo ##     ##  ##  ##     ## 
echo ##     ##  ##  ##     ## 
echo #########  ##  ##     ## 
echo ##     ##  ##  ##     ## 
echo ##     ## ####  #######  
echo.
echo.
echo #### ##    ##  ######  ########    ###    ##       ##       ######## ########  
echo  ##  ###   ## ##    ##    ##      ## ##   ##       ##       ##       ##     ## 
echo  ##  ####  ## ##          ##     ##   ##  ##       ##       ##       ##     ## 
echo  ##  ## ## ##  ######     ##    ##     ## ##       ##       ######   ########  
echo  ##  ##  ####       ##    ##    ######### ##       ##       ##       ##   ##   
echo  ##  ##   ### ##    ##    ##    ##     ## ##       ##       ##       ##    ##  
echo #### ##    ##  ######     ##    ##     ## ######## ######## ######## ##     ## 
echo.
echo.

rem END INSTALLER ASCII


rem BEGIN YUZU DOWNLOAD 

echo This script will now open the default browser and go to Yuzu's website. 
echo Please download the latest mainline release from that website.
pause
start "" https://yuzu-emu.org/downloads/
pause
echo.
echo After downloading, please run the installer and start Yuzu. It will display an error about missing resources, ignore this and close Yuzu.
pause

rem END DOWNLOAD YUZU


rem Check for/Make Keydir and Grab Keys

:keys
echo.
echo Okay, that means it's time to download the keys.
echo.
echo We will now download the keys.
cd %appdata%

if not exist "%appdata%/yuzu" (
    mkdir "%appdata%/yuzu"
    if not errorlevel 1 (
        echo Yuzu Keys Directory Created!
    )
)


IF EXIST "%appdata%\keys\" (
	echo Deleting old keys...
	rmdir /Q /S "%appdata%\keys\"
)
cd "%appdata%/yuzu"
mkdir "%appdata%/yuzu/keys"
cd keys
echo Writing new keys to %appdata%\yuzu\keys
powershell.exe (new-object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/emuworld/aio/master/prod.keys', '%appdata%\yuzu\keys\prod.keys')
if %errorlevel% == 0 (
	echo Successfully downloaded prod.keys
) else (
	echo Error in :keys, %errorlevel%
)
pause

rem END OPCODE


rem Credits

:C
echo.
echo Thanks to all staff for their work on EmuPiracy.  Make sure to join the discord at https://discord.gg/k82nkSf
echo.
echo Ver 1.2 by πrate, Original code by Hipeopeo.
echo.
echo Thanks to the yuzu devs for making Yuzu!
pause
exit

rem END PROGRAM BEGIN CHANGELOG

rem 																							CHANGELOG:

rem 																					   v1.2 (Jan 18 2020)
rem				Changed Git URL - πrate

rem 																					   v1.1 (Nov 22, 2019)

rem				Updated Install Script so that it wouldn't install to Downloads or worse, the System32 Directory in weird circumstances.
rem				Changed URL from Safin's key repository to External Emu's. -πrate
rem				Added ASCII art, comments, and changelog. -πrate

rem																								  v1.0
rem				Release
