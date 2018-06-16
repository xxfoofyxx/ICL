@echo off
set ver=1.0

set /p data=Data File^>
if not exist %data% echo. >>%data%
cls
echo Now serving requests.
:loop
:i_wait
timeout /t 1 >nul
if not exist input.icl goto i_wait
set /p text=<input.icl
del input.icl
if "%text%"=="--!shutdown" echo ICL is shutting down. >output.icl & exit
if "%text%"=="--!pause" timeout /t 5 >nul
if "%text%"=="title" echo %data%>output.icl & echo [%date%, %time%] Request for title received. (might be a new connection). & goto i_wait
echo [%date%, %time%] Request received. Data File: %data%, Searching for: "%text%".
for /f "tokens=1,* delims=:" %%i in (%data%) do (
  if /i "%text%"=="%%i" ( 
  echo %%j>output.icl
  )
)
goto loop