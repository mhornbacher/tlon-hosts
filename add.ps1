#requires -version 4.0
#requires -runasadministrator

# make sure that the hosts.txt file exists
if (-Not (Test-Path hosts.txt) ) {
    throw "Fatal Error: hosts.txt file does not exist to copy over"
}

# make sure that we are not overriding a backup file
if ( Test-Path $env:SystemRoot\System32\Drivers\etc\hosts.backup -PathType Leaf ) {
    throw "Fatal Error: backup file already exists. Script was likely run already"
}

# make a backup
Copy-Item $env:SystemRoot\System32\Drivers\etc\hosts -Destination $env:SystemRoot\System32\Drivers\etc\hosts.backup

# and add the content from hosts.txt to the hosts file
Add-Content -Path $env:SystemRoot\System32\Drivers\etc\hosts -Value (Get-Content -Path .\hosts.txt)

# press enter to continue
[void](Read-Host 'Press Enter to continue...')
