$packageName = 'cmder.portable'
$toolsPath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$unPath = Join-Path $toolsPath 'Uninstall-ChocolateyPath.psm1'
$installPath = "$env:ChocolateyInstall\bin\grib-tools"
# remove from path
Import-Module $unPath
Uninstall-ChocolateyPath $installPath 'User'

if (Test-Path $installPath) {
    Remove-Item -Path $installPath -Recurse -Force
}