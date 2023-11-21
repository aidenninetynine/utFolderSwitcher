@echo off
title utFolderSwitcher - Aiden99 Software
if NOT EXIST "%localappdata%\Aiden99 Software\utFolderSwitcher\vRecord" goto setup
:main
cls
echo --Main Menu--


:setup
cls
echo --Setup--
echo Welcome to utFolderSwitcher. This program lets you manage your save data for the game "UNDERTALE".
echo The Steam version of the game is required for this program to work properly.
pause
cls
echo --Setup--
