#requires -version 4.0
#requires -runasadministrator

# make sure we have a backup
if (-Not (Test-Path $env:SystemRoot\System32\Drivers\etc\hosts.backup -PathType Leaf )) {
    throw "Fatal Error: cannot find backup file to restore"
}

# delete the backup and override the source
Move-Item -Force $env:SystemRoot\System32\Drivers\etc\hosts.backup -Destination $env:SystemRoot\System32\Drivers\etc\hosts

# press enter to continue
[void](Read-Host 'Press Enter to continue...')
