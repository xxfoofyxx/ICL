@echo off
if "%1"=="" echo [ERROR] [Updater] Verison number not supplied. Exiting. & exit /b
echo Checking for a new update
set currentVersion=%1
dl https://raw.githubusercontent.com/xxfoofyxx/ICL/master/version version.tmp
set /p version=<version.tmp
del version.tmp
if "%version%"=="%currentVersion%" goto noUpdate
echo An update was found, please wait while it is installed...
dl https://raw.githubusercontent.com/xxfoofyxx/ICL/master/icl.bat icl.bat
echo Update success! Restarting ICL...
timeout /t 3 >nul
start "ICL" icl.bat
exit
:noUpdate
echo No new updates were found.
exit /b