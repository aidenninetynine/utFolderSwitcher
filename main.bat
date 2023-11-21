@echo off
title utFolderSwitcher - Aiden99 Software
if NOT EXIST "%localappdata%\Aiden99 Software\utFolderSwitcher\vRecord" goto setup
:main
cls
echo --Main Menu--
echo Press the key next to the option you would like to select.
echo.
echo R. Record Current data.
echo O. Override Current data with a Record.
echo D. Delete Current data and restore vRecord.
echo E. Erase a Record.
echo V. View all Records.
echo C. Configure the program.
echo X. Exit the program.
choice /c RODEVCX /n
if %ERRORLEVEL%==1 goto r
if %ERRORLEVEL%==2 goto o
if %ERRORLEVEL%==3 goto d
if %ERRORLEVEL%==4 goto e
if %ERRORLEVEL%==5 goto v
if %ERRORLEVEL%==6 goto c
if %ERRORLEVEL%==7 exit

:r
cls
echo --Record--
echo Enter a name for your new Record:
set /p "recordname=> "
if "%recordname%"=="" goto r
cls
echo --Record--
echo Creating empty Record...
cd "%localappdata%"\"Aiden99 Software"\utFolderSwitcher\Storage\
mkdir "%recordname%"
cd "%recordname%"
mkdir SAVE GAME
echo Recording save data...
copy /V /Y "%localappdata%"\UNDERTALE "%localappdata%"\"Aiden99 Software"\utFolderSwitcher\Storage\"%recordname%"\SAVE\
echo Recording game data...
copy /V /Y "%steamlibrarylocation%"\common\UNDERTALE "%localappdata%"\"Aiden99 Software"\utFolderSwitcher\Storage\"%recordname%"\GAME\
echo Record complete!
pause
goto main

:o
cls
echo --Override--
echo Are you sure you want to override your Current data?'
echo Y. Yes
echo N. No
choice /c YN /n
if %ERRORLEVEL%==2 goto main
cls
echo --Override--
echo Enter the name of the Record you want to override with:
set /p "recordname=> "
if "%recordname%"=="" goto o
cls
echo --Override--
echo Erasing Current data...
rmdir "%localappdata%"\UNDERTALE /s /q
rmdir "%steamLibraryLocation%"\common\UNDERTALE /s /q
echo Copying Record data...
copy /V /Y "%localappdata%"\"Aiden99 Software"\utFolderSwitcher\Storage\"%recordname%"\SAVE "%localappdata%"\UNDERTALE
copy /V /Y "%localappdata%"\"Aiden99 Software"\utFolderSwitcher\Storage\"%recordname%"\GAME "%steamLibraryLocation%"\common\UNDERTALE
echo Override complete!
pause
goto main

:d
cls
echo --Delete--
echo Are you sure you want to delete your Current data?
echo Y. Yes
echo N. No
choice /c YN /n
if %ERRORLEVEL%==2 goto main
cls
echo --Delete--
echo Deleting Current data...
rmdir "%localappdata%"\UNDERTALE /s /q
rmdir "%steamLibraryLocation%"\common\UNDERTALE /s /q
echo Restoring vRecord...
copy /V /Y "%localappdata%"\"Aiden99 Software"\utFolderSwitcher\vRecord\SAVE "%localappdata%"\UNDERTALE
copy /V /Y "%localappdata%"\"Aiden99 Software"\utFolderSwitcher\vRecord\"%recordname%"\GAME "%steamLibraryLocation%"\common\UNDERTALE
echo Deleted!
pause
goto main

:e
cls
echo --Erase--
echo Enter the name of the Record you want to erase:
set /p "recordname=> "
if "%recordname%"=="" goto e
cls
echo --Erase--
echo Are you sure you want to erase this Record?
echo Y. Yes
echo N. No
choice /c YN /n
if %ERRORLEVEL%==2 goto main
cls
echo --Erase--
echo Erasing Record...
rmdir "%localappdata%"\"Aiden99 Software"\utFolderSwitcher\Storage\"%recordname%" /s /q
echo Erased!
pause
goto main

:v
cls
echo --View--
echo Your records:
cd "%localappdata%"\"Aiden99 Software"\utFolderSwitcher\Storage\
dir /b

:c
goto main

:setup
cls
echo --Setup--
echo Welcome to utFolderSwitcher. This program lets you manage your save data for the game "UNDERTALE".
echo The Steam version of the game is required for this program to work properly.
pause
cls
echo --Quick Explanation--
echo This program is based around Records. Here's how it works.
echo Your user folder now has a folder titled "Storage". This is where your Records are stored.
echo When you create a new Record, the data you have in Undertale (also known as Current data) is copied to Storage.
echo Overriding your Current data with a Record copies the data from the Record into Current data.
echo Overriding your Current data without Recording first will remove your old Current data.
echo Thanks for reading this explanation.
echo.
pause
cls
echo --Setup--
echo Now it's time to create your first Record.
echo Make sure Undertale is closed.
echo Enter a name for your Record.
set /p "recordname=> "
cls
echo --Setup--
echo utFolderSwitcher will now copy your Current data to Storage.
echo Press any key to start Recording.
pause >nul
cls
echo --Setup--
echo Creating empty Record...
cd "%localappdata%"\"Aiden99 Software"\utFolderSwitcher\Storage\
mkdir "%recordname%"
cd "%recordname%"
mkdir SAVE GAME
echo Recording save data...
copy /V /Y "%localappdata%"\UNDERTALE "%localappdata%"\"Aiden99 Software"\utFolderSwitcher\Storage\"%recordname%"\SAVE\
echo Recording game data...
copy /V /Y "%steamlibrarylocation%"\common\UNDERTALE "%localappdata%"\"Aiden99 Software"\utFolderSwitcher\Storage\"%recordname%"\GAME\
echo Record complete!
echo Erasing old data...
rmdir "%localappdata%"\UNDERTALE /s /q
rmdir "%steamLibraryLocation%"\common\UNDERTALE /s /q
cls
echo --Setup--
echo Your first Record has been created!
echo Now that the old Current data has been moved to Storage, you will need to download UNDERTALE data.
echo (You won't need to do this again!)
echo To do this, go to Steam, go to the Library tab, right-click on UNDERTALE, click Properties, click on the Installed Files section, and finally, click Verify integrity of game files.
echo Launch UNDERTALE to confirm that the files downloaded correctly. DO NOT start playing.
pause
echo --Setup--
echo utFolderSwitcher will now create a "vRecord".
echo This Record will be used so you don't have to reinstall UNDERTALE every time you create a new Record.
echo If you made a save file in UNDERTALE, you're gonna have to delete that data.
echo.
echo D. Delete Current data
echo C. Continue
choice /c DC /n
if %ERRORLEVEL%==1 goto setup-dcd
cls
echo --Setup--
echo Creating empty vRecord...
cd "%localappdata%"\"Aiden99 Software"\utFolderSwitcher\vRecord\
mkdir SAVE GAME
echo Recording save data...
copy /V /Y "%localappdata%"\UNDERTALE "%localappdata%"\"Aiden99 Software"\utFolderSwitcher\vRecord\SAVE\
echo Recording game data...
copy /V /Y "%steamlibrarylocation%"\common\UNDERTALE "%localappdata%"\"Aiden99 Software"\vRecord\GAME\
echo Record complete!
cls
echo --Setup--
echo The vRecord has been created.
echo Setup is now complete!
echo Thanks for installing utFolderSwitcher!
echo Press any key to enter the program...
pause >nul
goto main