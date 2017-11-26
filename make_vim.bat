@echo off
REM Run this batch file from any directory to build gvim.exe and vim.exe.
REM But first edit the paths and Python version number.

REM --- Specify Vim /src folder ---
set VIMSRC=C:\__work\vim\src
REM --- Add MinGW /bin directory to PATH ---
PATH = C:\Program Files (x86)\mingw-w64\i686-6.2.0-posix-dwarf-rt_v5-rev1\mingw32\bin;%PATH%
REM --- Also make sure that PYTHON, PYTHON_VER below are correct. ---

REM get location of this batch file
set WORKDIR=%~dp0
set LOGFILE=%WORKDIR%log.txt

echo Work directory: %WORKDIR%
echo Vim source directory: %VIMSRC%

REM change to Vim /src folder
cd /d %VIMSRC%

REM --- Build GUI version (gvim.exe) ---
echo Building gvim.exe ...
mingw32-make.exe -f Make_ming.mak ARCH=i386 FEATURES=HUGE GUI=yes gvim.exe > "%LOGFILE%"

REM --- Build console version (vim.exe) ---
echo Building vim.exe ...
mingw32-make.exe -f Make_ming.mak ARCH=i686 FEATURES=HUGE GUI=no vim.exe >> "%LOGFILE%"

echo Moving files ...
move gvim.exe "%WORKDIR%"
move vim.exe "%WORKDIR%"

echo Cleaning Vim source directory ...
REM NOTE: "mingw32-make.exe -f Make_ming.mak clean" does not finish the job
IF NOT %CD%==%VIMSRC% GOTO THEEND
IF NOT EXIST vim.h GOTO THEEND
IF EXIST pathdef.c DEL pathdef.c
IF EXIST obj\NUL      RMDIR /S /Q obj
IF EXIST obji386\NUL  RMDIR /S /Q obji386
IF EXIST gobj\NUL     RMDIR /S /Q gobj
IF EXIST gobji386\NUL RMDIR /S /Q gobji386
IF EXIST gvim.exe DEL gvim.exe
IF EXIST vim.exe  DEL vim.exe
:THEEND

cd /d "%WORKDIR%"

copy /y "C:\Program Files (x86)\Vim\vim80\vim.exe" "C:\Program Files (x86)\Vim\"
copy /y "C:\Program Files (x86)\Vim\vim80\gvim.exe" "C:\Program Files (x86)\Vim\"

copy /y vim.exe "C:\Program Files (x86)\Vim\vim80\"
copy /y gvim.exe "C:\Program Files (x86)\Vim\vim80\"
xcopy /y /e /r vim\runtime\* "C:\Program Files (x86)\Vim\vim80\"

pause
