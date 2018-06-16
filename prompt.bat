@echo off
echo ICL Prompt
echo.
echo Connecting to main server...
echo title>input.icl
call :wait
echo Connection established!
echo Server is running from %output%
:loop
set /p input=ICL^>
echo %input%>input.icl
call :wait
if %failed%==yes goto loop
echo %output%
goto loop

:wait
set failed=no
set output=
set counter=0
:_wait
set /a counter=%counter% + 1
if %counter%==1000 goto wait2
if not exist output.icl goto _wait
set /p output=<output.icl
if "%output%"=="" goto _wait
del output.icl
goto :EOF

:wait2
echo Connection lost/Unknown input
set failed=yes
goto :EOF