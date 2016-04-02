$packageName = 'grib-tools'
$toolsPath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$unPath = Join-Path $toolsPath 'Uninstall-ChocolateyPath.psm1'
$installPath = "$env:ChocolateyInstall\bin\grib-tools"
# remove from path
Import-Module $unPath
Uninstall-ChocolateyPath $installPath

if (Test-Path $installPath) {
    Remove-Item -Path $installPath -Recurse -Force
}