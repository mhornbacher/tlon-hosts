@echo off

REM check for administrator permission: https://stackoverflow.com/a/11995662/1890717
net session >nul 2>&1
if not %errorLevel% == 0 (
    echo Fatal Error: This script requires administrator access
    goto end
)

REM check to make sure that we can make a backup
if not exist %WINDIR%\system32\drivers\etc\hosts.backup (
    echo Fatal Error: Backup file does not exist
    goto end
)

move %WINDIR%\system32\drivers\etc\hosts.backup %WINDIR%\system32\drivers\etc\hosts

:end
echo
pause
