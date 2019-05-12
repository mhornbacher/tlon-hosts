# T-LON host file scripts

Scripts to auto add content to the system hosts file.

***Please note that all scripts must be run as `Administrator` (windows) or `sudo` (Unix/Linux)***

## Included Scripts

### `add`

Creates a `hosts.backup` file of the current `hosts` file and adds the contents of `hosts.txt` to the end of the hosts file.

### `undo`

Looks for the `hosts.backup` file that `add` created

## Windows / NIX File system notes

`.bat` and `.ps1` files look for the hosts file in `<SystemRoot>\System32\Drivers\etc\hosts.backup` while `.sh` files look for it in `/etc/hosts`.

As such please see this table for which file to use

OS         | Powershell version | Extension
-------    | ------------------ | ---------
Windows    | less then 4.0      | `.bat`
Windows    | 4.0 or higher      | `.ps1`
Unix/Linux | Not required       | `.sh`

## Contributions

Please share and contribute all changes you make that are not specific to your enviroment with the community via pull requests to this repository.

## LICENSE

See LICENSE file, uses MIT standard licence
