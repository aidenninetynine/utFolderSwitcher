@echo off
cls
title utFolderSwitcher - Aiden99 Software
:main
cls
echo --utFolderSwitcher v0.1.0_alpha--
echo Hello! This program will switch out the save-data and game folders for Undertale, hence the name ut (Undertale) folderSwitcher.
echo Press the key that is next to the action you want to perform.
echo Currently writing to %localappdata%\UNDERTALE\ and C:\Program Files (x86)\Steam\steamapps\common\UNDERTALE.
echo. 
echo R. Record your current Undertale data to Storage.
echo O. Override your current Undertale data from a record in Storage.
echo D. Delete your current Undertale data.
echo E. Erase a record from Storage.
echo V. View Storage.
echo X. Exit the program.
choice /c RODEVX /n
if %ERRORLEVEL%==1 goto r
if %ERRORLEVEL%==2 goto o
if %ERRORLEVEL%==3 goto d
if %ERRORLEVEL%==4 goto e
if %ERRORLEVEL%==5 goto v
if %ERRORLEVEL%==6 exit
goto main

:r
cls
echo --Record--
set/p "recordname=Enter a record name: "
echo Recording save data...
cd C:\"Program Files"\"Aiden99 Software"\utFolderSwitcher\Storage\
mkdir "%recordname%"
cd "%recordname%"
mkdir SAVE
cd SAVE
copy /Y %localappdata%\UNDERTALE\* .\
echo Recorded save data.
echo Recording game data...
cd ..
mkdir GAME
cd GAME
copy /Y C:\"Program Files (x86)"\Steam\steamapps\common\UNDERTALE\* .\
echo Recorded game data.
echo Record completed!
pause
goto main

:o
cls
echo --Override--
set/p "recordname=Enter a record to override with: "
rmdir %localappdata%\UNDERTALE /s /q
rmdir C:\"Program Files (x86)"\Steam\steamapps\common\UNDERTALE /s /q
echo Previous data erased.
echo Overriding save...
mkdir %localappdata%\UNDERTALE
copy /Y C:\"Program Files"\"Aiden99 Software"\utFolderSwitcher\Storage\"%recordname%"\SAVE\* %localappdata%\UNDERTALE\
echo Overridden save.
echo Overriding game...
mkdir C:\"Program Files (x86)"\Steam\steamapps\common\UNDERTALE
copy /Y C:\"Program Files"\"Aiden99 Software"\utFolderSwitcher\Storage\"%recordname%"\GAME\* C:\"Program Files (x86)"\Steam\steamapps\common\UNDERTALE\
echo Overridden game.
echo Override completed!
pause
goto main

:d
cls
echo --Delete--
echo Are you sure you want to delete current Undertale data?
echo Y. Yes
echo N. No
choice /c YN /n
if %ERRORLEVEL%==1 goto d1
if %ERRORLEVEL%==2 goto main
goto d

:d1
cls
echo --Delete--
echo Deleting current data...
rmdir %localappdata%\UNDERTALE /s /q
rmdir C:\"Program Files (x86)"\Steam\steamapps\common\UNDERTALE /s /q
echo Deleted!
pause
goto main

:e
cls
echo --Erase--
set/p "recordname=Enter the name of the record you want to delete: "
echo Are you sure you want to delete "%recordname%"?
echo Y. Yes
echo N. No
choice /c YN /n
if %ERRORLEVEL%==1 goto e1
if %ERRORLEVEL%==2 goto main
goto e

:e1
cls
echo --Erase--
echo Erasing record...
rmdir C:\"Program Files"\"Aiden99 Software"\utFolderSwitcher\Storage\"%recordname%" /s /q
echo Erased!
pause
goto main

:v
cls
echo --View--
echo Your records:
cd C:\"Program Files"\"Aiden99 Software"\utFolderSwitcher\Storage\
dir/b
pause
goto main