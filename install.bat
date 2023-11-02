@echo off
cls
set scriptdir=%~dp0
title Install utFolderSwitcher
:main
cls
echo --Installer--
echo Welcome to the utFolderSwitcher setup wizard! This program (as the name implies) lets you switch Undertale data.
echo Press a key to select the choice you want:
echo I. Install the program
echo U. Update the program
echo R. Remove the program
echo X. Exit Installer
echo.
echo This installer contains shortcutJS.bat, created by GitHub user npocmaka.
echo This installer will disable Windows SmartScreen.
choice /c IURX /n
if %ERRORLEVEL%==1 goto install
if %ERRORLEVEL%==2 goto update
if %ERRORLEVEL%==3 goto remove
if %ERRORLEVEL%==4 exit
goto main

:install
cls
echo --Install--
echo Installing the program...
REG ADD HKLM\Software\Policies\Microsoft\Windows\System /v EnableSmartScreen /t REG_DWORD /d 0 /f
if NOT EXIST C:\"Program Files"\"Aiden99 Software" mkdir C:\"Program Files"\"Aiden99 Software"
if EXIST C:\"Program Files"\"Aiden99 Software"\utFolderSwitcher goto already-installed
mkdir C:\"Program Files"\"Aiden99 Software"\utFolderSwitcher
mkdir C:\"Program Files"\"Aiden99 Software"\utFolderSwitcher\Storage
cd %scriptdir%
copy main.bat C:\"Program Files"\"Aiden99 Software"\utFolderSwitcher\
call shortcutJS.bat -linkfile "%userprofile%\Desktop\utFolderSwitcher.lnk" -target "C:\Program Files\Aiden99 Software\utFolderSwitcher\main.bat" -adminpermissions yes
echo Installed!
pause
goto main

:already-installed
echo The program is already installed!
pause
goto main

:update
cls
echo Function currently not supported. Please uninstall the program and then reinstall it.
pause
goto main

:remove
cls
echo --Remove--
echo Removing the program...
if NOT EXIST C:\"Program Files"\"Aiden99 Software"\utFolderSwitcher goto not-installed
rmdir C:\"Program Files"\"Aiden99 Software"\utFolderSwitcher /s /q
echo Removed!
pause
goto main

:not-installed
echo The program is not installed!
pause
goto main