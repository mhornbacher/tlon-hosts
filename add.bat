@echo off

REM check for administrator permission: https://stackoverflow.com/a/11995662/1890717
net session >nul 2>&1
if not %errorLevel% == 0 (
    echo Fatal Error: This script requires administrator access
    goto end
)

REM check that the hosts file is present
if not exist hosts.txt (
    echo Fatal Error: No hosts.txt file in this directory to copy
    goto end
)

REM check to make sure that we can make a backup
if exist %WINDIR%\system32\drivers\etc\hosts.backup (
    echo Fatal Error: Backup file already exists
    goto end
)

REM Make a backup
copy %WINDIR%\system32\drivers\etc\hosts %WINDIR%\system32\drivers\etc\hosts.backup

REM add the hosts file
type hosts.txt >> %WINDIR%\system32\drivers\etc\hosts

REM let the user see what happend if run from the GUI
:end
echo.
pause
